Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681C461F83
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Jul 2019 15:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731262AbfGHNYT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-tegra@lfdr.de>); Mon, 8 Jul 2019 09:24:19 -0400
Received: from lilium.sigma-star.at ([109.75.188.150]:57778 "EHLO
        lilium.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729736AbfGHNYS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Jul 2019 09:24:18 -0400
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Jul 2019 09:24:16 EDT
Received: from localhost (localhost [127.0.0.1])
        by lilium.sigma-star.at (Postfix) with ESMTP id 51EE3181821EF;
        Mon,  8 Jul 2019 15:16:00 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
        by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id z5dXEPBIF_Yx; Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
        by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Cm9L34___Fhf; Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
        by lilium.sigma-star.at (Postfix) with ESMTP id 151D1181821EF;
        Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Date:   Mon, 8 Jul 2019 15:15:58 +0200 (CEST)
From:   Richard Weinberger <richard@sigma-star.at>
To:     Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc:     linux-mtd <linux-mtd@lists.infradead.org>,
        linux-tegra@vger.kernel.org
Message-ID: <146340031.32120.1562591758888.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
References: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
Subject: Re: [REGRESSION] ubifs: Don't leak orphans on memory during commit
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Don't leak orphans on memory during commit
Thread-Index: AQHVNY3F90AlETdzv0al4GI8EIQzeR8Hs1/M
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Marc,

----- Ursprüngliche Mail -----
> Von: "Marcel Ziswiler" <marcel.ziswiler@toradex.com>
> An: "linux-mtd" <linux-mtd@lists.infradead.org>
> CC: "Richard RW. Weinberger" <richard@sigma-star.at>, linux-tegra@vger.kernel.org
> Gesendet: Montag, 8. Juli 2019 15:05:10
> Betreff: [REGRESSION] ubifs: Don't leak orphans on memory during commit

> Hi there
> 
> I'm currently investigating a strange UBIFS rootfs crash issue seen on
> Colibri T20 aka on top of the tegra_nand driver. I bisected it to the
> following commit c16e73587ad6 ("ubifs: Don't leak orphans on memory
> during commit") and indeed just reverting that one even on top of
> today's latest -next makes it work again. The following is what I get
> during boot if that commit is included:
> 
> [   14.443253] 8<--- cut here ---
> [   14.446515] Unable to handle kernel paging request at virtual
> address 6b6b6b6b
> [   14.453779] pgd = 021022d0
> [   14.456535] [6b6b6b6b] *pgd=00000000
> [   14.460131] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [   14.465488] Modules linked in:
> [   14.468612] CPU: 1 PID: 311 Comm: lxdm-binary Not tainted 5.2.0-rc7-
> next-20190704-dirty #24
> [   14.477030] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [   14.483377] PC is at ubifs_delete_orphan+0x7c/0xd4
> [   14.488215] LR is at 0x6b6b6b6b
> [   14.491397] pc : [<c03e26f0>]    lr : [<6b6b6b6b>]    psr: 600f0113
> [   14.497715] sp : d1da1ee8  ip : d1de4ac0  fp : d27b29b8
> [   14.502985] r10: 00000002  r9 : d23396cc  r8 : 00000000
> [   14.508260] r7 : d23390ac  r6 : d2339000  r5 : 000063d8  r4 :
> d1de4a80
> [   14.514841] r3 : 6b6b6b6b  r2 : f344aa0d  r1 : 1213d000  r0 :
> d1de4a80
> [   14.521426] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32
> ISA ARM  Segment none
> [   14.528619] Control: 10c5387d  Table: 11f2404a  DAC: 00000051
> [   14.534421] Process lxdm-binary (pid: 311, stack limit = 0x3e65b56c)
> [   14.540829] Stack: (0xd1da1ee8 to 0xd1da2000)
> [   14.545247] 1ee0:                   d27b29b8 d2339000 00000000
> d23390ac 00000000 ffffff9c
> [   14.553510] 1f00: 00000002 c03ca804 d27b29b8 d2339000 00000000
> 00000000 00000000 c03d1f90
> [   14.561772] 1f20: d27b29b8 d27b2a70 c0b24f68 d1da1f68 00000000
> c028ed8c d27a2648 00000000
> [   14.570036] 1f40: d1f83000 c0283b34 d1da1f68 d1da1f58 600d0013
> c1004c48 00000000 00000000
> [   14.578300] 1f60: d2c86010 d25baaa8 1af1325a 0000000c d1f83019
> d1da1ed4 00000000 f344aa0d
> [   14.586563] 1f80: 0000ecd4 0000ecd4 00000000 0000b1e4 0000000a
> c0101204 d1da0000 0000000a
> [   14.594826] 1fa0: 00000000 c0101000 0000ecd4 00000000 0000f5cc
> bed86e64 bed86e6c 0000ae15
> [   14.603087] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
> 00000000 b6f2efac 00000000
> [   14.611350] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc 600d0010
> 0000f5cc 00000000 00000000
> [   14.619648] [<c03e26f0>] (ubifs_delete_orphan) from [<c03ca804>]
> (ubifs_jnl_delete_inode+0xdc/0xe0)
> [   14.628801] [<c03ca804>] (ubifs_jnl_delete_inode) from [<c03d1f90>]
> (ubifs_evict_inode+0x78/0xf4)
> [   14.637774] [<c03d1f90>] (ubifs_evict_inode) from [<c028ed8c>]
> (evict+0x98/0x168)
> [   14.645350] [<c028ed8c>] (evict) from [<c0283b34>]
> (do_unlinkat+0x228/0x298)
> [   14.652483] [<c0283b34>] (do_unlinkat) from [<c0101000>]
> (ret_fast_syscall+0x0/0x54)
> [   14.660294] Exception stack(0xd1da1fa8 to 0xd1da1ff0)
> [   14.665408] 1fa0:                   0000ecd4 00000000 0000f5cc
> bed86e64 bed86e6c 0000ae15
> [   14.673669] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
> 00000000 b6f2efac 00000000
> [   14.681919] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc
> [   14.687038] Code: e1a01004 e1a00006 ebffff80 e594301c (e413201c)
> [   14.693353] ---[ end trace f81be27f6c9911d4 ]---
> 
> Has anybody any clue what may be going on? If you need any more
> information do let me know.

Damit, I forgot to drop this patch from -next, it is wrong. Thanks for the notify.

Thanks,
//richard
