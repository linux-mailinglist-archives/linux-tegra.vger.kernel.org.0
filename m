Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38A01CD807
	for <lists+linux-tegra@lfdr.de>; Mon, 11 May 2020 13:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgEKLZH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 May 2020 07:25:07 -0400
Received: from foss.arm.com ([217.140.110.172]:57958 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgEKLZH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 May 2020 07:25:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3D7F101E;
        Mon, 11 May 2020 04:25:06 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 823AC3F305;
        Mon, 11 May 2020 04:25:05 -0700 (PDT)
Subject: Re: arm64: tegra186: bpmp: kernel crash while decompressing initrd
To:     Mian Yousaf Kaukab <ykaukab@suse.de>, talho@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        afaerber@suse.de
References: <20200508084041.23366-1-ykaukab@suse.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e01aba39-1f81-de00-2f7e-dd7295baa7ed@arm.com>
Date:   Mon, 11 May 2020 12:25:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508084041.23366-1-ykaukab@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-05-08 9:40 am, Mian Yousaf Kaukab wrote:
> I am seeing following kernel crash on Jetson TX2. Board is flashed with
> firmware bits from L4T R32.4.2 with upstream u-boot. Crash always
> happens while decompressing initrd. Initrd is approximately 80 MiB in
> size and compressed with xz (xz --check=crc32 --lzma2=dict=32MiB).
> Crash is not observed if the same initrd is compressed with gzip.
> [1] was a previous attempt to workaround the same issue.
> 
> [    0.651168] Trying to unpack rootfs image as initramfs...
> [    2.890171] SError Interrupt on CPU0, code 0xbf40c000 -- SError
> [    2.890174] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G S                5.7.0-rc4-next-20200505 #22
> [    2.890175] Hardware name: nvidia p2771-0000/p2771-0000, BIOS 2020.04-rc3 03/25/2020
> [    2.890176] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
> [    2.890177] pc : lzma_main+0x648/0x908
> [    2.890178] lr : lzma_main+0x330/0x908
> [    2.890179] sp : ffff80001003bb70
> [    2.890180] x29: ffff80001003bb70 x28: 0000000004d794a4
> [    2.890183] x27: 0000000004769941 x26: ffff0001eb064000
> [    2.890185] x25: ffff0001eb060028 x24: 0000000000000002
> [    2.890187] x23: 0000000000000003 x22: 0000000000000007
> [    2.890189] x21: 0000000000611f4b x20: ffff0001eb060000
> [    2.890192] x19: ffff80001003bcb8 x18: 0000000000000068
> [    2.890194] x17: 00000000000000c0 x16: fffffe00076b2108
> [    2.890196] x15: 0000000000000800 x14: 0000000000ffffff
> [    2.890198] x13: 0000000000000001 x12: ffff0001eb060000
> [    2.890200] x11: 0000000000000600 x10: ffff0001eb060028
> [    2.890202] x9 : 00000000ffbb2a08 x8 : 0000000000000ed0
> [    2.890204] x7 : 00000000011553ec x6 : 0000000000000000
> [    2.890206] x5 : 0000000000000000 x4 : 0000000000000006
> [    2.890208] x3 : 00000000015a29e4 x2 : ffff0001eb062d0c
> [    2.890210] x1 : 000000000000000c x0 : 000000000263de44
> 
> With some debugging aid ported from Nvidia downstream kernel [2] the
> actual cause was found:
> 
> [    0.761525] Trying to unpack rootfs image as initramfs...
> [    2.955499] CPU0: SError: mpidr=0x80000100, esr=0xbf40c000
> [    2.955502] CPU1: SError: mpidr=0x80000000, esr=0xbe000000
> [    2.955505] CPU2: SError: mpidr=0x80000001, esr=0xbe000000
> [    2.955506] CPU3: SError: mpidr=0x80000101, esr=0xbf40c000
> [    2.955507] ROC:CCE Machine Check Error:
> [    2.955508] ROC:CCE Registers:
> [    2.955509]  STAT: 0xb400000000400415
> [    2.955510]  ADDR: 0x400c00e7a00c
> [    2.955511]  MSC1: 0x80ffc
> [    2.955512]  MSC2: 0x3900000000800
> [    2.955513] --------------------------------------
> [    2.955514] Decoded ROC:CCE Machine Check:
> [    2.955515]  Uncorrected (this is fatal)
> [    2.955516]  Error reporting enabled when error arrived
> [    2.955517]  Error Code = 0x415
> [    2.955518]  Poison Error
> [    2.955518]  Command = NCRd (0xc)
> [    2.955519]  Address Type = Non-Secure DRAM
> [    2.955521]  Address = 0x30039e80 -- 30000000.sysram + 0x39e80
> [    2.955521]  TLimit = 0x3ff
> [    2.955522]  Poison Error Mask = 0x80
> [    2.955523]  More Info = 0x800
> [    2.955524]  Timeout Info = 0x0
> [    2.955525]          Poison Info = 0x800
> [    2.955526]          Read Request failed GSC checks
> [    2.955527]  Source = L2_1 (A57) (0x1)
> [    2.955528]  TID = 0xe
> 
> IIUC, there was read request for 0x30039e80 from EL1/2 which failed.
> This address falls in the sysram security aperture and hence a read
> from normal mode failed.
> 
> sysram is mapped at 0x3000_0000 to 0x3004_ffff and is managed by the
> sram driver (drivers/misc/sram.c). There are two reserved pools for
> BPMP driver communication at 0x3004_e000 and 0x3004_f000 of 0x1000
> bytes each.
> 
> sram driver maps complete 0x3000_0000 to 0x3004_ffff range as normal
> memory.

That's your problem. It's not really worth attempting to reason about, 
the architecture says that anything mapped as Normal memory may be 
speculatively accessed at any time, so no amount of second-guessing is 
going to save you in general. Don't make stuff accessible to the kernel 
that it doesn't need to access, and especially don't make stuff 
accessible to the kernel if accessing it will kill the system.

> However, only the BPMP reserved pools (0x3004_e000 - 0x3004_ffff)
> are accessible from the kernel. Address 0x3003_9e80 is inaccessible
> from the kernel and a read to it (which I believe is speculative)
> causes the SError. Only driver which uses sysram is not initialized at
> this point (rootfs_initcall level). As since
> commit d70f5e541ab3 ("firmware: tegra: Make BPMP a regular driver")
> bpmp driver is initialized at device_initcall level.
> 
> If none of the drivers on the kernel side using 0x3003_9e80 address
> range. Why a read to it occurs even speculatively? Could it be that
> some EL3 software didn’t cleanup after itself properly? Any
> suggestions on debugging this issue further?
> 
> Another solution suggested in [1] was to add no-memory-wc in sysram
> node in device-tree so that sysram is mapped as device-memory. Thus
> preventing any speculative access. However, it causes another set of
> issues with the bpmp driver. That's may be a discussion for another
> time.

AFAICS the truly correct solution is what Stephen initially suggested 
there - for the boot process to somehow describe which parts of SRAM 
have been reserved by Secure software and/or which parts remain 
Non-Secure, and for the kernel driver to only map and use the latter.

Robin.
