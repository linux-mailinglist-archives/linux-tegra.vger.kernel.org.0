Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D398E2B5B14
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Nov 2020 09:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgKQIiJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Nov 2020 03:38:09 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6970 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgKQIiJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 03:38:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb38be70000>; Tue, 17 Nov 2020 00:37:59 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 08:38:07 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Nov 2020 08:38:05 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <kishon@ti.com>, <vkoul@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v1] phy: tegra: xusb: Fix usb_phy device driver field
Date:   Tue, 17 Nov 2020 16:38:03 +0800
Message-ID: <20201117083803.185209-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605602279; bh=eRjgCKXXvY73ClLCAEsF2Rjn8XJRFex977OZk+wXtq4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=M+f2iO3llrdDlcM/KChFW8YcvFpgFY9oRBYtCF6bZThSPg7/Y+F4TdzHiLz5QSDV0
         BovKSQsowASiEwpp/Buub/kh4+wZ7s0vlZ2Nqz3EV/WoFsnZhBdLAnFC4UMVbgwaDd
         /eXRd6Ri783ag/IUR/MFVain5m4jQg1+NKxZWER6FVKmgqAwFGQxzWKP0mmz6OWXp4
         /YhWkm58E91mgWhFr6uaVnNU8oylUFmbA/fEJdwid6V0nbk9jh3+mPOMOQKjg4Oq3k
         2teRzPhFC3NJqs03QcFv6pIm+yZWSoZc/XAMyIFd2fQIFwj328PrwLOMe8YzrFBeSO
         omnrVLZ7RNivQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In commit "phy: tegra: xusb: Add usb-phy support", an OTG capable PHY
device, such as phy-usb2.0 device of Jetson-TX1 platform, will be
bound to the tegra-xusb-padctl driver by the following line in
tegra_xusb_setup_usb_role_switch().

	port->usb_phy.dev->driver =3D port->padctl->dev->driver;

With this, dev_pm_ops set of tegra-xusb-padctl driver will be invoked
for the OTG capable PHY incorrectly as below logs show.

This commit fixes the issue by assigning an empty driver to it.

[  153.451108] tegra-xusb-padctl phy-usb2.0: > tegra_xusb_padctl_suspend_no=
irq(dev=3Dffff000080917000)
[  153.460353] tegra-xusb-padctl phy-usb2.0:   driver: ffff8000114453e0 (te=
gra_xusb_padctl_driver)
[  153.469245] tegra-xusb-padctl phy-usb2.0:   padctl: ffff0000829f6480
[  153.475772] tegra-xusb-padctl phy-usb2.0:     soc: ef7bdd7fffffffff (0xe=
f7bdd7fffffffff)
[  153.484061] Unable to handle kernel paging request at virtual address 00=
7bdd800000004f
[  153.492132] Mem abort info:
[  153.495083]   ESR =3D 0x96000004
[  153.498308]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  153.503771]   SET =3D 0, FnV =3D 0
[  153.506979]   EA =3D 0, S1PTW =3D 0
[  153.510260] Data abort info:
[  153.513200]   ISV =3D 0, ISS =3D 0x00000004
[  153.517181]   CM =3D 0, WnR =3D 0
[  153.520302] [007bdd800000004f] address between user and kernel address r=
anges
[  153.527600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  153.533231] Modules linked in: nouveau panel_simple tegra_video(C) tegra=
_drm drm_ttm_helper videobuf2_dma_contig ttm videobuf2_memops cec videobuf2=
_v4l2 videobuf2_common drm_kms_helper v4l2_fwnode videodev drm mc snd_hda_c=
odec_hdmi cdc_ether usbnet snd_hda_tegra r8152 crct10dif_ce snd_hda_codec s=
nd_hda_core tegra_xudc host1x lp855x_bl at24 ip_tables x_tables ipv6
[  153.566417] CPU: 0 PID: 300 Comm: systemd-sleep Tainted: G         C    =
    5.10.0-rc3-next-20201113-00019-g5c064d5372b0-dirty #624
[  153.578283] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[  153.584281] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
[  153.590381] pc : tegra_xusb_padctl_suspend_noirq+0x88/0x100
[  153.596016] lr : tegra_xusb_padctl_suspend_noirq+0x80/0x100
[  153.601632] sp : ffff8000120dbb60
[  153.604999] x29: ffff8000120dbb60 x28: ffff000080a1df00
[  153.610430] x27: 0000000000000002 x26: ffff8000106f8540
[  153.615858] x25: ffff8000113ac4a4 x24: ffff80001148c198
[  153.621277] x23: ffff800010c4538c x22: 0000000000000002
[  153.626692] x21: ffff800010ccde80 x20: ffff0000829f6480
[  153.632107] x19: ffff000080917000 x18: 0000000000000030
[  153.637521] x17: 0000000000000000 x16: 0000000000000000
[  153.642933] x15: ffff000080a1e380 x14: 74636461702d6273
[  153.648346] x13: ffff8000113ad058 x12: 0000000000000f39
[  153.653759] x11: 0000000000000513 x10: ffff800011405058
[  153.659176] x9 : 00000000fffff000 x8 : ffff8000113ad058
[  153.664590] x7 : ffff800011405058 x6 : 0000000000000000
[  153.670002] x5 : 0000000000000000 x4 : ffff0000fe908bc0
[  153.675414] x3 : ffff0000fe910228 x2 : 162ef67e0581e700
[  153.680826] x1 : 162ef67e0581e700 x0 : ef7bdd7fffffffff
[  153.686241] Call trace:
[  153.688769]  tegra_xusb_padctl_suspend_noirq+0x88/0x100
[  153.694077]  __device_suspend_noirq+0x68/0x1cc
[  153.698594]  dpm_noirq_suspend_devices+0x10c/0x1d0
[  153.703456]  dpm_suspend_noirq+0x28/0xa0
[  153.707461]  suspend_devices_and_enter+0x234/0x4bc
[  153.712314]  pm_suspend+0x1e4/0x270
[  153.715868]  state_store+0x8c/0x110
[  153.719440]  kobj_attr_store+0x1c/0x30
[  153.723259]  sysfs_kf_write+0x4c/0x7c
[  153.726981]  kernfs_fop_write+0x124/0x240
[  153.731065]  vfs_write+0xe4/0x204
[  153.734449]  ksys_write+0x6c/0x100
[  153.737925]  __arm64_sys_write+0x20/0x30
[  153.741931]  el0_svc_common.constprop.0+0x78/0x1a0
[  153.746789]  do_el0_svc+0x24/0x90
[  153.750181]  el0_sync_handler+0x254/0x260
[  153.754251]  el0_sync+0x174/0x180
[  153.757663] Code: aa0303e2 94000f64 f9405680 b40000e0 (f9402803)
[  153.763826] ---[ end trace 81543a3394cb409d ]---

Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index ad88d74c1884..181a1be5f491 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -688,7 +688,7 @@ static int tegra_xusb_setup_usb_role_switch(struct tegr=
a_xusb_port *port)
 	 * reference to retrieve usb-phy details.
 	 */
 	port->usb_phy.dev =3D &lane->pad->lanes[port->index]->dev;
-	port->usb_phy.dev->driver =3D port->padctl->dev->driver;
+	port->usb_phy.dev->driver =3D port->dev.driver;
 	port->usb_phy.otg->usb_phy =3D &port->usb_phy;
 	port->usb_phy.otg->set_peripheral =3D tegra_xusb_set_peripheral;
 	port->usb_phy.otg->set_host =3D tegra_xusb_set_host;
--=20
2.25.1

