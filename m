Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F37834C3
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Aug 2019 17:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbfHFPLu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Aug 2019 11:11:50 -0400
Received: from mail1.skidata.com ([91.230.2.99]:21480 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfHFPLu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Aug 2019 11:11:50 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Aug 2019 11:11:49 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1565104308; x=1596640308;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=s/FbWA+ooYGsQ3w5NbQeeiMbBIbhDL6Il1fWC59jSTM=;
  b=HvA2Nd24QLuIzhXxtoSqNIqO7PXJQTnd4j++m5/7T40q3OSNKLjDO04B
   9qzig/v9av6lRo1eQIbboNnNleOqK7Ehy1BUEsrU1MMi7C+nCIoPIXJDj
   ZZX+OrlmGEYdvlo5usM06+Wu7CmT6ODa0bZ0fZrsYq81ruSuXESSPVs9Q
   ZOZ3Q5hBviWEWLEAc8xuDllaY0EBNYi6EVNjBo/BsinksghW0q6XnYwKT
   rE+SQ0PU5gpe3tISacgoC5eKcXvXj/DrmvsAkerLapac259MHOd7w8qNb
   8UGR4xY32ljvrzBF1iXUVCSCvwVR6sHvvDLymWg3Gb2F0UKJbR6HrxGAv
   g==;
IronPort-SDR: 52aej4ShxVOUObQqzPSr8pYsehJGw5exMQh2/BbrWHcalA5jp68UWtEPErII3UJv31E/CuEhas
 kJbMwtLg3p0D9sg1IkB6IyY8/LNybpkgxhmX5LqCEpV+fGh3SHwYb2vum4P0XRqb99jQBgRmqZ
 swL9Xqnrxhs+zM9wwU3VVnofB16gWLGLEsbAXpUHVPG2ZC7WRT8yiW+HHacfLP2zHZj5QuUhBj
 yTqoV7FkOjS4f7qXqJv0ewn4brDibxVhexy1T+55s3tf63Ros2+LIboBlyxjYXRZ18JW5RpkS+
 H8Y=
X-IronPort-AV: E=Sophos;i="5.64,353,1559512800"; 
   d="scan'208";a="18813378"
To:     <linux-tegra@vger.kernel.org>
From:   Richard Leitner <richard.leitner@skidata.com>
Subject: v5.2.6 Kernel panic with tegra_defconfig & tegra20-tec.dtb
Message-ID: <0d130767-13bd-a6bc-5a68-24ddc7ea3935@skidata.com>
Date:   Tue, 6 Aug 2019 17:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,
I've just tried to boot the current stable kernel v5.2.6 (and also the 
latest v5.3-rc3) on my tegra20-tec board with the tegra_defconfig.

Unfortunately I'm getting a "Kernel panic - not syncing: Attempted to 
kill the idle task!"

I'm currently out of ideas on what to look for, so any help would be 
greatly appreciated.

Thanks & regards;
Richard.L


## Booting kernel from FIT Image at 01000000 ...
    Using 'conf@tegra20-tec.dtb' configuration
    Trying 'kernel@1' kernel subimage
      Description:  Linux kernel
      Type:         Kernel Image
      Compression:  uncompressed
      Data Start:   0x010000e0
      Data Size:    6676808 Bytes = 6.4 MiB
      Architecture: ARM
      OS:           Linux
      Load Address: 0x17000000
      Entry Point:  0x17000000
      Hash algo:    sha1
      Hash value:   bec30e474097f767c1def4f82f28eb5549cc9af0
    Verifying Hash Integrity ... sha1+ OK
## Flattened Device Tree from FIT Image at 01000000
    Using 'conf@tegra20-tec.dtb' configuration
    Trying 'fdt@tegra20-tec.dtb' FDT blob subimage
      Description:  Flattened Device Tree blob
      Type:         Flat Device Tree
      Compression:  uncompressed
      Data Start:   0x0165e328
      Data Size:    24624 Bytes = 24 KiB
      Architecture: ARM
      Hash algo:    sha1
      Hash value:   f9fbcb0d4576629bbad851c0ced43685b8dc8577
    Verifying Hash Integrity ... sha1+ OK
    Booting using the fdt blob at 0x0165e328
    Loading Kernel Image ... OK
OK
    Loading Device Tree to 0fff6000, end 0ffff02f ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.2.6-tegra.0000 (oe-user@oe-host) (gcc 
version 8.3.0 (GCC)) #1 SMP PREEMPT Tue Aug 6 14:48:18 UTC 2019
[    0.000000] CPU: ARMv7 Processor [411fc090] revision 0 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] OF: fdt: Machine model: Avionic Design Tamonten 
Evaluation Carrier
[    0.000000] OF: fdt: Ignoring memory range 0x0 - 0x10000000
[    0.000000] Ignoring memory below PHYS_OFFSET: 0x00000000-0x10000000
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 64 MiB at 0x1c000000
[    0.000000] On node 0 totalpages: 65536
[    0.000000]   Normal zone: 512 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 65536 pages, LIFO batch:15
[    0.000000] Unable to handle kernel paging request at virtual address 
bfff6000
[    0.000000] pgd = (ptrval)
[    0.000000] [bfff6000] *pgd=1bfd9811, *pte=00000000, *ppte=00000000
[    0.000000] Internal error: Oops: 7 [#1] PREEMPT SMP ARM
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.6-tegra.0000 #1
[    0.000000] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    0.000000] PC is at fdt_check_header+0x0/0x154
[    0.000000] LR is at __unflatten_device_tree+0x20/0x104
[    0.000000] pc : [<c0a57cf4>]    lr : [<c0768d88>]    psr: a00000d3
[    0.000000] sp : c1001f08  ip : 00000000  fp : fffff000
[    0.000000] r10: 00000000  r9 : c10febd8  r8 : c0f403d8
[    0.000000] r7 : c110f368  r6 : 00000000  r5 : bfff6000  r4 : c0f403d8
[    0.000000] r3 : c0f403d8  r2 : c110f368  r1 : 00000000  r0 : bfff6000
[    0.000000] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM 
Segment none
[    0.000000] Control: 10c5387d  Table: 1000404a  DAC: 00000051
[    0.000000] Process swapper (pid: 0, stack limit = 0x(ptrval))
[    0.000000] Stack: (0xc1001f08 to 0xc1002000)
[    0.000000] 1f00:                   c0f403d8 c10cf880 c1009ba8 
c10083c0 10000000 c10febd8
[    0.000000] 1f20: cbfffe00 c0f41414 00000000 c012b5a0 c0f66900 
c0f03dcc ffffffff 10c5387d
[    0.000000] 1f40: c0ca7fdc c0d630e8 c1004c48 c0ca968c c0b03b9c 
c1004c48 c1004c48 c1004c40
[    0.000000] 1f60: ffffffff 0fff6000 411fc090 10c5387d 00000001 
c017f5d4 c0ca7fdc 00000000
[    0.000000] 1f80: ffffffff 00000000 c1004c48 c1004c40 ffffffff 
0fff6000 c10cf700 10c5387d
[    0.000000] 1fa0: 00000001 c0f00aa0 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.000000] 1fc0: 00000000 c0f6ea38 00000000 00000000 00000000 
c0f00330 00000051 10c0387d
[    0.000000] 1fe0: 00000000 0fff6000 411fc090 10c5387d 00000000 
00000000 00000000 00000000
[    0.000000] [<c0a57cf4>] (fdt_check_header) from [<c0f403d8>] 
(early_init_dt_alloc_memory_arch+0x0/0x64)
[    0.000000] [<c0f403d8>] (early_init_dt_alloc_memory_arch) from 
[<00000000>] (0x0)
[    0.000000] Code: e3a00020 e12fff1e e3a0001c e12fff1e (e5902000)
[    0.000000] random: get_random_bytes called from 
print_oops_end_marker+0x24/0x4c with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill 
the idle task! ]---

