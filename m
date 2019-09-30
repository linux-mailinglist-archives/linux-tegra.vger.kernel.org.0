Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2029EC24B3
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 17:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbfI3PzF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 11:55:05 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40404 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfI3PzF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 11:55:05 -0400
Received: by mail-qt1-f194.google.com with SMTP id f7so17654016qtq.7
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XXV6yfU6Lr/wMPwN8poIJMB4cYZejX74x2FAj1F/4RA=;
        b=K5fdYjIONT3mgN3X8gbjk4n0jZmzDU3xKYJgfASEcyWxjjWF32zArigh/zkcqNQCKI
         4YmKUGjL3+FBg//Nx1/BpNXquinoikXrYjvOpbjFN4dqbI/XmhDLwRQH4tpRV+snz4kD
         3PgnhUVr+CVMPXbQBZZwOb1tDdhY6UPg7zLHwBjg0C/XWqcyIlD48Y5vKeu2u1H+EoU4
         DE44MjA4/+MmauLnA8WO5QFIszUJPz02s6KIzme7VlUdFJr43TVZ878E5YLMaaYtSSXs
         7dJUiQCWV9y3X+XzVHOyF4NqOm1WVS1WolgydpNyjTDNreQsibL/89BF/7A2QesvtkZS
         ujTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XXV6yfU6Lr/wMPwN8poIJMB4cYZejX74x2FAj1F/4RA=;
        b=b78PmbhcDFg8IFsnns2EHxl5dxx2GNbah3IS43HGEJRC5VyhmTbZFQFz/S6wXoNhM2
         j206RpYU1uM/RROGcrGSDIRYq+1/zq9We/usidtk0nz5ALYnlreLv6YKLqMmlBv5P3Zc
         jZh0M+3r7jee53Mcmtf1HOLWZa9qvNm+NSrNxkrdly43lgijLnVrI2YGjqN108hqcNXv
         wzGx583XSRNokaebxV4fTZuTcLiUl72h1KAfJAiQKqSj4r5/KQ2NsZqlm8DTRsNCjj+B
         Qq99Ka8SwwlDLyQYXYYnAMQHLir+z/8PNrzhDIch5QaGvmLFHxSMKQmKHrmjxnM6+jys
         aqCQ==
X-Gm-Message-State: APjAAAU0iJLD6U7bWOdch1+9MQMxT69EmgnVBBPFmrjaAkfs4E1zuQPg
        EkI8EbUF/U4y1Etxu5tr9MjP2OAly//xu9CpJ8k=
X-Google-Smtp-Source: APXvYqzxWrkJkyV9N1e2X9bGlYWXvl9+ghbkpmFGTasz6zJp+bD6aQUsgvePr+LgqZiHcxCT+36IUE46iyfnO0Gc6WY=
X-Received: by 2002:ac8:1616:: with SMTP id p22mr24826399qtj.356.1569858903948;
 Mon, 30 Sep 2019 08:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com> <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
In-Reply-To: <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 30 Sep 2019 11:54:48 -0400
Message-ID: <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dmitry,

As far as I can tell the cpuidle drivers work perfectly, but I don't
have full power management yet on either my T20 device nor my T30
device.
They aren't the cause of this though.

I've been sticking to the mainline release code since 5.3 landed, as
something was merged into linux-next that breaks brcm4329/brcm4330
firmware loading.

Jumping to linux-next to test your driver just revealed the behavior.

On my T20 device I haven't encountered issues, but that operates
almost exclusively in gadget mode.
On my T30 device tegra-udc is misbehaving, especially on linux-next.

By removing the hardcoded LL_DEBUG config and moving to a command line
earlycon statement, I seem to be making progress in capturing what's
going on.
With the following actions, I got a panic crash dump:
phy set to peripheral, boot with tegra-ehci in host mode, usb hub plugged i=
n.
Booted successfully, hub enumerated, passed data through attached
ethernet device.
Unbind the tegra-ehci driver, bind the tegra-udc driver.
Hub enumerates, as well as attached ethernet device, but writes to the
device throw constant errors.
Unbind the tegra-udc driver, produces the following panic:
[ 8178.962076] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[ 8178.970178] pgd =3D 96662d36
[ 8178.972901] [00000000] *pgd=3D00000000
[ 8178.976500] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[ 8178.981810] Modules linked in: cpufreq_conservative
cpufreq_userspace cpufreq_powersave tegra_drm brcmfmac drm_kms_helper
zram c
fbfillrect syscopyarea cfbimgblt sysfillrect cfg80211 sysimgblt
fb_sys_fops cfbcopyarea drm hci_uart btbcm bluetooth snd_soc_tegra3
0_i2s ax88179_178a snd_soc_tegra_pcm drm_panel_orientation_quirks
usbnet sg host1x brcmutil mii snd_soc_tegra30_ahub tegra_wdt sch_
fq_codel ip_tables x_tables autofs4
[ 8179.019181] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W
  5.3.0-next-20190926+ #32
[ 8179.027782] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[ 8179.034067] PC is at __queue_work+0xd8/0x6b4
[ 8179.038339] LR is at 0xed801a20
[ 8179.041481] pc : [<c014f378>]    lr : [<ed801a20>]    psr: a0000193
[ 8179.047742] sp : ede2fb80  ip : ed801a54  fp : ede2fbd4
[ 8179.052963] r10: ffffe000  r9 : c12f59c8  r8 : 00000003
[ 8179.058184] r7 : ea523600  r6 : c12098a8  r5 : ea5b035c  r4 : 00000000
[ 8179.064706] r3 : 00000000  r2 : 00000000  r1 : edc09000  r0 : edc09000
[ 8179.071230] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment none
[ 8179.078445] Control: 10c5387d  Table: b07ec04a  DAC: 00000051
[ 8179.084189] Process swapper/3 (pid: 0, stack limit =3D 0x4b2c6521)
[ 8179.090192] Stack: (0xede2fb80 to 0xede30000)
[ 8179.094553] fb80: 00000000 00000000 c014f2d4 ede2fb98 c0af9850
c01604b0 ecc0a000 c0db228c
[ 8179.102726] fba0: 00000007 00000004 c01a67a8 ea5b035c 60000193
00000004 ea523600 c1209888
[ 8179.110899] fbc0: 00000770 0000000c ede2fbf4 ede2fbd8 c014f9a4
c014f2ac 0000000c ea5b02c0
[ 8179.119073] fbe0: ea5b0040 ede2fc28 ede2fc5c ede2fbf8 c075a140
c014f960 ede2fc5c c0fa2510
[ 8179.127245] fc00: 00000fa0 00000000 c0196a9c c1209888 51f168f9
00000770 ea5b0044 20000193
[ 8179.135418] fc20: c0b64cfc 00000000 00000002 ad3f7838 ee7cda80
ea5b02c0 c12098a8 ee7cda80
[ 8179.143591] fc40: ee7cdae8 ffffe000 7fffffff c0759f94 ede2fcc4
ede2fc60 c01d55cc c0759fa0
[ 8179.151764] fc60: c1209888 00000770 51f14da0 c0d33ec8 00000006
c12d37d0 51f14da0 00000770
[ 8179.159937] fc80: c120a4d0 ee7cda80 51f14da0 00000770 512986a5
ad3f7838 00000001 ee7cda80
[ 8179.168112] fca0: 20000193 00000003 ee7cdbe0 ee7cdba0 7fffffff
ffffffff ede2fd2c ede2fcc8
[ 8179.176286] fcc0: c01d69b0 c01d542c 20000193 0000000f c01e98b8
00000770 51f14da0 ee7cdca0
[ 8179.184459] fce0: ee7cdc60 ee7cdce0 ee7cdab0 ee7cdb60 c14fe6ec
00000000 00000000 ede32918
[ 8179.192632] fd00: ede2fd5c edcc8300 edd3fa68 edd3fa00 00000000
00000014 ffffe000 c12098a8
[ 8179.200806] fd20: ede2fd3c ede2fd30 c080a7a8 c01d68a4 ede2fd94
ede2fd40 c01a6f30 c080a788
[ 8179.208979] fd40: ede2fda4 ede2fd50 c019748c c0d2f28c c12d2a74
edd3fa00 c12d3140 c12d3158
[ 8179.217152] fd60: ede2fd98 00000000 00000000 c1209888 edd3fa68
edd3fa00 00000000 00000001
[ 8179.225324] fd80: edc08c00 ede2fe68 ede2fdbc ede2fd98 c01a7298
c01a6eac 00000000 ad3f7838
[ 8179.233498] fda0: c0af9738 edd3fa00 edd3fa68 c12851b0 ede2fddc
ede2fdc0 c01a7330 c01a7268
[ 8179.241670] fdc0: edd3fa00 edd3fa68 c12851b0 00000000 ede2fdfc
ede2fde0 c01abf80 c01a72f4
[ 8179.249846] fde0: c110e618 00000000 00000014 00000000 ede2fe0c
ede2fe00 c01a5e20 c01abeb8
[ 8179.258019] fe00: ede2fe3c ede2fe10 c01a6568 c01a5df8 ede2fe68
c120a4e4 fe44010c fe440100
[ 8179.266193] fe20: ede2fe68 fe441100 ede2e000 ee7d38b0 ede2fe64
ede2fe40 c01023c8 c01a64e8
[ 8179.274366] fe40: c07d2c64 60000113 ffffffff ede2fe9c 00000000
ede2e000 ede2ff0c ede2fe68
[ 8179.282539] fe60: c0101acc c0102388 00000000 c12af2e0 fa000000
00000050 00000000 c12af2e0
[ 8179.290712] fe80: 00000000 c12af2e0 00000000 4ff13378 ee7d38b0
ede2ff0c ede2feb8 ede2feb8
[ 8179.298885] fea0: c07d2a4c c07d2c64 60000113 ffffffff 00000051
00000000 00000fef 00000000
[ 8179.307059] fec0: 00000000 c12098a8 00000770 4feca380 00000770
00000000 003e4180 00000000
[ 8179.315232] fee0: c0178020 ed2ef5c0 ed2ef5d4 ee7d38b0 ffff0000
c12af2e0 c18d6a28 ffffe000
[ 8179.323406] ff00: ede2ff4c ede2ff10 c07d64b0 c07d28fc c01b9874
ffff0000 00000002 c18d6a24
[ 8179.331574] ff20: ede2ff44 ee7d38b0 c12af2e0 00000002 00000008
ee7d38b0 c12af2e0 c110d8a8
[ 8179.339746] ff40: ede2ff6c ede2ff50 c07d2fec c07d62ec ffffe000
c12098a8 c12098f0 00000008
[ 8179.347919] ff60: ede2ff7c ede2ff70 c016bbb8 c07d2f98 ede2ffcc
ede2ff80 c016c0b0 c016bb94
[ 8179.356092] ff80: ee7d4b00 00000002 c0d2a8d8 c12d2a2d c1209888
c0db228c 01c0387d ad3f7838
[ 8179.364266] ffa0: 8800406a 00000089 00000003 10c0387d c12f4fc0
8800406a 412fc099 00000000
[ 8179.372440] ffc0: ede2ffdc ede2ffd0 c016c44c c016be6c ede2fff4
ede2ffe0 c01115ac c016c430
[ 8179.380612] ffe0: b5e2006a 00000051 00000000 ede2fff8 88102a2c
c0111454 00000000 00000000
[ 8179.388778] Backtrace:
[ 8179.391241] [<c014f2a0>] (__queue_work) from [<c014f9a4>]
(queue_work_on+0x50/0x5c)
[ 8179.398893]  r10:0000000c r9:00000770 r8:c1209888 r7:ea523600
r6:00000004 r5:60000193
[ 8179.406715]  r4:ea5b035c
[ 8179.409266] [<c014f954>] (queue_work_on) from [<c075a140>]
(ci_otg_hrtimer_func+0x1ac/0x1d0)
[ 8179.417697]  r7:ede2fc28 r6:ea5b0040 r5:ea5b02c0 r4:0000000c
[ 8179.423368] [<c0759f94>] (ci_otg_hrtimer_func) from [<c01d55cc>]
(__hrtimer_run_queues+0x1ac/0x5e0)
[ 8179.432408]  r10:c0759f94 r9:7fffffff r8:ffffe000 r7:ee7cdae8
r6:ee7cda80 r5:c12098a8
[ 8179.440225]  r4:ea5b02c0
[ 8179.442766] [<c01d5420>] (__hrtimer_run_queues) from [<c01d69b0>]
(hrtimer_interrupt+0x118/0x2d8)
[ 8179.451633]  r10:ffffffff r9:7fffffff r8:ee7cdba0 r7:ee7cdbe0
r6:00000003 r5:20000193
[ 8179.459454]  r4:ee7cda80
[ 8179.461997] [<c01d6898>] (hrtimer_interrupt) from [<c080a7a8>]
(tegra_timer_isr+0x2c/0x34)
[ 8179.470256]  r10:c12098a8 r9:ffffe000 r8:00000014 r7:00000000
r6:edd3fa00 r5:edd3fa68
[ 8179.478073]  r4:edcc8300
[ 8179.480620] [<c080a77c>] (tegra_timer_isr) from [<c01a6f30>]
(__handle_irq_event_percpu+0x90/0x3bc)
[ 8179.489662] [<c01a6ea0>] (__handle_irq_event_percpu) from
[<c01a7298>] (handle_irq_event_percpu+0x3c/0x8c)
[ 8179.499307]  r10:ede2fe68 r9:edc08c00 r8:00000001 r7:00000000
r6:edd3fa00 r5:edd3fa68
[ 8179.507128]  r4:c1209888
[ 8179.509665] [<c01a725c>] (handle_irq_event_percpu) from
[<c01a7330>] (handle_irq_event+0x48/0x6c)
[ 8179.518527]  r6:c12851b0 r5:edd3fa68 r4:edd3fa00
[ 8179.523154] [<c01a72e8>] (handle_irq_event) from [<c01abf80>]
(handle_fasteoi_irq+0xd4/0x188)
[ 8179.531672]  r7:00000000 r6:c12851b0 r5:edd3fa68 r4:edd3fa00
[ 8179.537334] [<c01abeac>] (handle_fasteoi_irq) from [<c01a5e20>]
(generic_handle_irq+0x34/0x44)
[ 8179.545938]  r7:00000000 r6:00000014 r5:00000000 r4:c110e618
[ 8179.551600] [<c01a5dec>] (generic_handle_irq) from [<c01a6568>]
(__handle_domain_irq+0x8c/0xfc)
[ 8179.560298] [<c01a64dc>] (__handle_domain_irq) from [<c01023c8>]
(gic_handle_irq+0x4c/0x88)
[ 8179.568644]  r10:ee7d38b0 r9:ede2e000 r8:fe441100 r7:ede2fe68
r6:fe440100 r5:fe44010c
[ 8179.576466]  r4:c120a4e4 r3:ede2fe68
[ 8179.580040] [<c010237c>] (gic_handle_irq) from [<c0101acc>]
(__irq_svc+0x6c/0xa8)
[ 8179.587516] Exception stack(0xede2fe68 to 0xede2feb0)
[ 8179.592567] fe60:                   00000000 c12af2e0 fa000000
00000050 00000000 c12af2e0
[ 8179.600740] fe80: 00000000 c12af2e0 00000000 4ff13378 ee7d38b0
ede2ff0c ede2feb8 ede2feb8
[ 8179.608911] fea0: c07d2a4c c07d2c64 60000113 ffffffff
[ 8179.613962]  r9:ede2e000 r8:00000000 r7:ede2fe9c r6:ffffffff
r5:60000113 r4:c07d2c64
[ 8179.621713] [<c07d28f0>] (cpuidle_enter_state) from [<c07d64b0>]
(cpuidle_enter_state_coupled+0x1d0/0x4b8)
[ 8179.631357]  r10:ffffe000 r9:c18d6a28 r8:c12af2e0 r7:ffff0000
r6:ee7d38b0 r5:ed2ef5d4
[ 8179.639178]  r4:ed2ef5c0
[ 8179.641714] [<c07d62e0>] (cpuidle_enter_state_coupled) from
[<c07d2fec>] (cpuidle_enter+0x60/0x64)
[ 8179.650666]  r10:c110d8a8 r9:c12af2e0 r8:ee7d38b0 r7:00000008
r6:00000002 r5:c12af2e0
[ 8179.658482]  r4:ee7d38b0
[ 8179.661030] [<c07d2f8c>] (cpuidle_enter) from [<c016bbb8>]
(call_cpuidle+0x30/0x48)
[ 8179.668681]  r7:00000008 r6:c12098f0 r5:c12098a8 r4:ffffe000
[ 8179.674343] [<c016bb88>] (call_cpuidle) from [<c016c0b0>]
(do_idle+0x250/0x2c8)
[ 8179.681651] [<c016be60>] (do_idle) from [<c016c44c>]
(cpu_startup_entry+0x28/0x2c)
[ 8179.689217]  r10:00000000 r9:412fc099 r8:8800406a r7:c12f4fc0
r6:10c0387d r5:00000003
[ 8179.697038]  r4:00000089
[ 8179.699585] [<c016c424>] (cpu_startup_entry) from [<c01115ac>]
(secondary_start_kernel+0x164/0x18c)
[ 8179.708628] [<c0111448>] (secondary_start_kernel) from [<88102a2c>]
(0x88102a2c)
[ 8179.716018]  r5:00000051 r4:b5e2006a
[ 8179.719598] Code: e1a00005 ebfff925 e2501000 0a000121 (e5943000)
[ 8179.725699] ---[ end trace 30079ced35bb2668 ]---

Then hard crash with a [ 8179.730310] Kernel panic - not syncing:
Fatal exception in interrupt.

On Mon, Sep 30, 2019 at 10:46 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 30.09.2019 03:33, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Good Evening,
> >
> > While testing Dmitry's cpuidle driver I found that tegra-udc is broken
> > completely on linux-next.
> > Even in peripheral mode, disconnected from the host, it locks at the sa=
me place.
> >
> > [    2.864983] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
> > [    2.871723] tegra-ehci: Tegra EHCI driver
> > [    2.880593] tegra-ehci 7d004000.usb: EHCI Host Controller
> > [    2.886484] tegra-ehci 7d004000.usb: new USB bus registered,
> > assigned bus number 1
> > [    2.895250] tegra-ehci 7d004000.usb: irq 88, io mem 0x7d004000
> > [    2.916528] tegra-ehci 7d004000.usb: USB 2.0 started, EHCI 1.00
> > [    2.927441] hub 1-0:1.0: USB hub found
> > [    2.931479] hub 1-0:1.0: 1 port detected
> > [    2.939124] usbcore: registered new interface driver cdc_acm
> > [    2.944889] cdc_acm: USB Abstract Control Model driver for USB
> > modems and ISDN adapters
> > [    2.953185] usbcore: registered new interface driver cdc_wdm
> > [    2.959107] usbcore: registered new interface driver uas
> > [    2.964824] usbcore: registered new interface driver usb-storage
> > [    2.974726] tegra-udc 7d000000.usb: 7d000000.usb supply vbus not
> > found, using dummy regulator
> > [    2.990506] ci_hdrc ci_hdrc.0: EHCI Host Controller
> > [    2.992320] udc ci_hdrc.0: registering UDC driver [g_ncm]
> > [    2.995708] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus =
number 2
> > [    3.001232] using random self ethernet address
> > [    3.012631] using random host ethernet address
> > [    3.017190] g_ncm gadget: adding config #1 'CDC Ethernet (NCM)'/(ptr=
val)
> > [    3.020523] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
> > [    3.024058] g_ncm gadget: adding 'cdc_network'/(ptrval) to config
> > 'CDC Ethernet (NCM)'/(ptrval)
> > [    3.033578] hub 2-0:1.0: USB hub found
> > [    3.041721] usb0: HOST MAC 9e:a2:94:94:76:53
> > [    3.042085] hub 2-0:1.0: 1 port detected
> > [    3.046706] usb0: MAC b2:13:8e:20:a9:fa
> > [    3.054215] g_ncm gadget: CDC Network: dual speed IN/ep1in
> > OUT/ep1out NOTIFY/ep2in
> > [    3.061861] g_ncm gadget: cfg 1/(ptrval) speeds: high full
> > [    3.067402] g_ncm gadget:   interface 0 =3D cdc_network/(ptrval)
> > [    3.073292] g_ncm gadget:   interface 1 =3D cdc_network/(ptrval)
> > [    3.079206] g_ncm gadget: NCM Gadget
> > [    3.082843] g_ncm gadget: g_ncm ready
> > [    3.091020] rtc rtc1: alarm rollover: day
> > [    3.096710] tegra_rtc 7000e000.rtc: char device (253:1)
> > [    3.102059] tegra_rtc 7000e000.rtc: registered as rtc1
> > [    3.107257] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
> > [    3.114270] i2c /dev entries driver
> > [    3.118781] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 =
busy
> > [    3.128234] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 =
busy
> > [    3.135069] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 =
busy
> > [    3.141875] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 =
busy
> > [    3.148644] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 =
busy
> > [    3.155402] tegra-apbdma 6000a000.dma: private_candidate: dma0c
> >
> > Thank you for your time,
> > Peter
> >
>
> Do you mean that it works when:
>
> a) the cpuidle patches are *not* applied
> b) with cpuidle patches applied and USB driver being disabled
>
> The UDC driver works perfectly fine for me, I'm using it all the time on
> T20 and T30.
