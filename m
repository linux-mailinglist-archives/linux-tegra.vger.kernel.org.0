Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C3CD2DDB
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2019 17:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfJJPg2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Oct 2019 11:36:28 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]:38853 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPg1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Oct 2019 11:36:27 -0400
Received: by mail-qk1-f176.google.com with SMTP id x4so2077956qkx.5
        for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2019 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=prpXzphQJumOyLDe4Nm/YOF90eLDcqWqLpS6huWhxJ4=;
        b=Gk2omkabsTTwVEsA6RtQ26py2R0sf9ae8ki82Q1wMproZw3FSghKy2zCQIUfQdelt1
         z0/gL2odMpAqiNGZHcBP7pxRWB1qBw6BTe8oZhQymlF/M9RYGjZ517cWdX16dTb+SqNk
         WD2qeE7Sss0gumhUoemIVdNiuKYPfn4JyBWW7azm1k/Q2zu2mpAenLo/CCwFLmgR/TEn
         q30FhqcLlqDRV2uFI7FYnivWsK/+OUDbDZl3VFkhhPlHkOiPB3xVGfp08GkG3Cyh8KNJ
         t2EUOHaP5lEdI0hhXaSSp6cXUEfSwTF2+1D1Groo8SI6n8xKlxHm8V5uY/z5azBFSlCl
         Yw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=prpXzphQJumOyLDe4Nm/YOF90eLDcqWqLpS6huWhxJ4=;
        b=bTRV5pIPC+WLa7hz/KHxLkP3UoJG6CCeOA5z2idTxoLXxLkFRtPqNSMbhscd2/pyUh
         p6TzINZ9g68L4vMn+viZ5we/EzxAYZD9g4oP3WJzvjxPhAEg16zh3um9z7OUyqvZrAXT
         c7XBNDJzdQ5SyHAQ3taujZcd83jHX8nuSV5Td1T+H2x92bTWeb7YXUV1WzJOZ757OlPL
         e5lyRaYCbcO7e6V3bg5B4gObTpZ8zy9ALYSa3NSgMsnTWutdWi14m97vtl3cPEqKHEVF
         UVrHwAFp5Owpqb9My+A7i9PmHPKQ0tHGKKHL8pxogikT/lvZp7UqsJEYcX1u8kl3ZmhP
         GGLg==
X-Gm-Message-State: APjAAAUY5o0hC+6PupQ8tSv46vYsQp+Pa5wOjloK/D5XJzduisfC+EXC
        spb1MVnnwq5nB9WFG3HuxUMuEtJ29x5duEtIQI1TXCt8LAM=
X-Google-Smtp-Source: APXvYqxwMKij5PS3/d8ECsrztndknX1AVWSeEZxx58VOXcYtUkKLL4JAZJPt+unI0bTtu22dP0z3tU2S7sH7EMoiJWQ=
X-Received: by 2002:a37:4ac8:: with SMTP id x191mr10671025qka.85.1570721784327;
 Thu, 10 Oct 2019 08:36:24 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date:   Thu, 10 Oct 2019 17:35:58 +0200
Message-ID: <CAFCWPP+SHYrN7=oz64DTTNtRU6hv3=gM=WjO3Sn-32HMe5g2+A@mail.gmail.com>
Subject: Kernel panic 5.4.0-rc1-next-20191004
To:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello.

Kernel compilation for testing on Jetson TX2 Developer Kit
resulted in a Kernel panic error.
I did the compilation while running the 5.4.0-rc1-next-20191004
kernel, which I had previously compiled on the NVIDIA kernel
I did the compilation directly on the device (without the cross compilation)

Here are the last lines:

  AR      fs/built-in.a
  CC      ipc/compat.o
  CC      ipc/util.o
  CC      ipc/msgutil.o
  CC      ipc/msg.o
  CC      ipc/sem.o
  CC      ipc/shm.o
  CC      ipc/syscall.o
  CC      ipc/ipc_sysctl.o
  CC      ipc/mqueue.o
  CC      ipc/namespace.o
  CC      ipc/mq_sysctl.o
  AR      ipc/built-in.a
  CC      security/integrity/iint.o
  CC      security/integrity/integrity_audit.o
  AR      security/integrity/built-in.a
  CC      security/keys/gc.o
  CC      security/keys/key.o
  CC      security/keys/keyring.o
  CC      security/keys/keyctl.o
  CC      security/keys/permission.o
  CC      security/keys/process_keys.o
  CC      security/keys/request_key.o
  CC      security/keys/request_key_auth.o
  CC      security/keys/user_defined.o
  CC      security/keys/compat.o
[ 1289.625126] SError Interrupt on CPU0, code 0xbf40c000 -- SError
[ 1289.625128] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G S
  5.4.0-rc1-next-20191004-test #2
[ 1289.625129] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[ 1289.625130] pstate: 40000085 (nZcv daIf -PAN -UAO)
[ 1289.625131] pc : arch_cpu_idle+0x8/0x18
[ 1289.625132] lr : default_idle_call+0x18/0x30
[ 1289.625132] sp : ffff800011793ec0
[ 1289.625133] x29: ffff800011793ec0 x28: 00000000814a0018
[ 1289.625135] x27: 0000000000000004 x26: 0000000000000000
[ 1289.625136] x25: 0000000000000000 x24: ffff80001179a214
[ 1289.625138] x23: ffff8000117a2d40 x22: ffff8000113e8ab8
[ 1289.625139] x21: ffff80001179a1f0 x20: 0000000000000000
[ 1289.625141] x19: ffff80001179a118 x18: 0000000000000000
[ 1289.625142] x17: 0000000000000000 x16: 0000000000000000
[ 1289.625144] x15: 000000000000023d x14: 000000000000018a
[ 1289.625145] x13: 0000000000000000 x12: 0000000000000001
[ 1289.625147] x11: 0000000000000000 x10: 00000000000009a0
[ 1289.625148] x9 : ffff800011793e20 x8 : ffff8000117a3740
[ 1289.625150] x7 : 0000000000000000 x6 : 0000000000000000
[ 1289.625151] x5 : ffff8001dbb9c000 x4 : 0000000000000000
[ 1289.625152] x3 : 4000000000000000 x2 : 0000000000000000
[ 1289.625154] x1 : 0000000000ad825c x0 : 0000000000000028
[ 1289.625157] SError Interrupt on CPU3, code 0xbf40c000 -- SError
[ 1289.625158] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G S
  5.4.0-rc1-next-20191004-test #2
[ 1289.625159] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[ 1289.625160] pstate: 40000085 (nZcv daIf -PAN -UAO)
[ 1289.625161] pc : arch_cpu_idle+0x8/0x18
[ 1289.625161] lr : default_idle_call+0x18/0x30
[ 1289.625162] sp : ffff800011a6bf30
[ 1289.625162] x29: ffff800011a6bf30 x28: 0000000000000000
[ 1289.625164] x27: 0000000000000000 x26: 0000000000000000
[ 1289.625165] x25: 0000000000000000 x24: ffff80001179a214
[ 1289.625167] x23: ffff0001ebce3700 x22: ffff8000113e8ab8
[ 1289.625168] x21: ffff80001179a1f0 x20: 0000000000000003
[ 1289.625170] x19: ffff80001179a118 x18: 0000000000000000
[ 1289.625171] x17: 0000000000000000 x16: 0000000000000000
[ 1289.625173] x15: 0000000000000000 x14: 0000000000000000
[ 1289.625174] x13: 00001a52727cd3dc x12: 0000000000000001
[ 1289.625176] x11: 0000000000000000 x10: 00000000000009a0
[ 1289.625177] x9 : ffff800011a6be90 x8 : ffff0001ebce4100
[ 1289.625178] x7 : ffff8001dbbde000 x6 : 000000097bbd5f9e
[ 1289.625180] x5 : 00ffffffffffffff x4 : 001982c300000000
[ 1289.625181] x3 : 4000000000000000 x2 : 0000000000000000
[ 1289.625183] x1 : 0000000000046afc x0 : 0000000000000028
[ 1289.625185] SError Interrupt on CPU4, code 0xbf40c000 -- SError
[ 1289.625186] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G S
  5.4.0-rc1-next-20191004-test #2
[ 1289.625187] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[ 1289.625187] pstate: 40000085 (nZcv daIf -PAN -UAO)
[ 1289.625188] pc : arch_cpu_idle+0x8/0x18
[ 1289.625189] lr : default_idle_call+0x18/0x30
[ 1289.625189] sp : ffff800011a73f30
[ 1289.625190] x29: ffff800011a73f30 x28: 0000000000000000
[ 1289.625191] x27: 0000000000000000 x26: 0000000000000000
[ 1289.625193] x25: 0000000000000000 x24: ffff80001179a214
[ 1289.625194] x23: ffff0001ebce44c0 x22: ffff8000113e8ab8
[ 1289.625196] x21: ffff80001179a1f0 x20: 0000000000000004
[ 1289.625197] x19: ffff80001179a118 x18: 0000000000000000
[ 1289.625198] x17: 0000000000000000 x16: 0000000000000000
[ 1289.625200] x15: 0000000000000000 x14: 0000000000000000
[ 1289.625201] x13: 0000000000000000 x12: 0000000000000001
[ 1289.625203] x11: 0000000000000000 x10: 0000000000000000
[ 1289.625204] x9 : 0000000000000000 x8 : 0000000000000000
[ 1289.625206] x7 : ffff8001dbbf4000 x6 : 000000097bb3d636
[ 1289.625207] x5 : 00ffffffffffffff x4 : 0018ea2c80000000
[ 1289.625208] x3 : 4000000000000000 x2 : 0000000000000000
[ 1289.625210] x1 : 0000000000051ac4 x0 : 0000000000000028
[ 1289.625212] Kernel panic - not syncing: Asynchronous SError Interrupt
[ 1289.625213] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G S
  5.4.0-rc1-next-20191004-test #2
[ 1289.625213] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[ 1289.625214] Call trace:
[ 1289.625215]  dump_backtrace+0x0/0x140
[ 1289.625215]  show_stack+0x14/0x20
[ 1289.625216]  dump_stack+0xa8/0xf0
[ 1289.625216]  panic+0x148/0x314
[ 1289.625217]  nmi_panic+0x84/0x88
[ 1289.625217]  arm64_serror_panic+0x74/0x80
[ 1289.625218]  do_serror+0x80/0x138
[ 1289.625218]  el1_error+0x84/0xf8
[ 1289.625219]  arch_cpu_idle+0x8/0x18
[ 1289.625220]  do_idle+0x200/0x280
[ 1289.625220]  cpu_startup_entry+0x24/0x40
[ 1289.625221]  secondary_start_kernel+0x154/0x190
[ 1289.625222] SError Interrupt on CPU5, code 0xbf40c000 -- SError
[ 1289.625223] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G S
  5.4.0-rc1-next-20191004-test #2
[ 1289.625224] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[ 1289.625224] pstate: 40000085 (nZcv daIf -PAN -UAO)
[ 1289.625225] pc : arch_cpu_idle+0x8/0x18
[ 1289.625226] lr : default_idle_call+0x18/0x30
[ 1289.625226] sp : ffff800011a7bf30
[ 1289.625227] x29: ffff800011a7bf30 x28: 0000000000000000
[ 1289.625228] x27: 0000000000000000 x26: 0000000000000000
[ 1289.625230] x25: 0000000000000000 x24: ffff80001179a214
[ 1289.625231] x23: ffff0001ebce5280 x22: ffff8000113e8ab8
[ 1289.625233] x21: ffff80001179a1f0 x20: 0000000000000005
[ 1289.625234] x19: ffff80001179a118 x18: 0000000000000000
[ 1289.625236] x17: 0000000000000000 x16: 0000000000000000
[ 1289.625237] x15: 0000000000000000 x14: 0000000000000000
[ 1289.625239] x13: 0000000000000000 x12: 0000000000000001
[ 1289.625240] x11: 0000000000000000 x10: 0000000000000000
[ 1289.625241] x9 : 0000000000000000 x8 : 0000000000000000
[ 1289.625243] x7 : 0000000000e6689e x6 : 00000136a6a9af00
[ 1289.625244] x5 : ffff0001ecff0d70 x4 : 0000000000000000
[ 1289.625246] x3 : 4000000000000000 x2 : 0000000000000000
[ 1289.625247] x1 : 000000000004e0c8 x0 : 0000000000000028
[ 1290.661583] SMP: stopping secondary CPUs
[ 1290.661584] SMP: failed to stop secondary CPUs 1-2,4
[ 1290.661585] Kernel Offset: disabled
[ 1290.661585] CPU features: 0x0002,21806000
[ 1290.661586] Memory Limit: none

I don't know is a mistake on my side or in the code.
Thank you for the expression.

Milan

Remember, no question is too stupid and no problem too small
                           -- We've all been beginners
