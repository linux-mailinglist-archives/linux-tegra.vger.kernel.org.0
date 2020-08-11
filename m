Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C08F2418EC
	for <lists+linux-tegra@lfdr.de>; Tue, 11 Aug 2020 11:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgHKJcC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 11 Aug 2020 05:32:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8223 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbgHKJcB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Aug 2020 05:32:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3265840000>; Tue, 11 Aug 2020 02:31:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Aug 2020 02:32:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Aug 2020 02:32:01 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Aug
 2020 09:31:59 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 11 Aug 2020 09:31:59 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.100.79]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f32658d0000>; Tue, 11 Aug 2020 02:31:58 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <mathias.nyman@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] usb: host: xhci-tegra: otg usb2/usb3 port init
Date:   Tue, 11 Aug 2020 17:31:43 +0800
Message-ID: <20200811093143.699541-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597138308; bh=lUATDR+Q2yhXwnxeE4pqvesXaqYEJGT7qiNLe+ZO6jk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=ea5mWEGZOaTi7BpMokk0eCWetRtiEB+o80FnQTGFX6tEgh+2W6iSzC+FN2XXOjnlQ
         WzzKx+WK6GhGtclQKbcUdphgkHukWNLBMERe2chwhy5Si8Lf2kH6rPik7JY/lI/yoA
         Le+3QtUvf1sc1RLAGtRoockf23Gvi/0bQYMUJa0gl/zp9CE55RrqaA/RtmMYm8cILy
         rXnUDXnHaAX4ay+17kg4oRonMyAOlGnxl3DA4Iun/ipi6A7JorCk0oOZQNkSAX6Z3s
         O6zAvyunjIIxTPf6dOV5UFsybQMho7WqO3T+awI/jRTnPGRPc6r6lM9AniW1I1N0zW
         kiDHn3Ps2yVww==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tegra_xusb_init_usb_phy() should initialize "otg_usb2_port" and
"otg_usb3_port" with -EINVAL because "0" is a valid value
represents usb2 port 0 or usb3 port 0.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 014d79334f50..0489a316099a 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1258,6 +1258,8 @@ static int tegra_xusb_init_usb_phy(struct tegra_xusb =
*tegra)
=20
 	INIT_WORK(&tegra->id_work, tegra_xhci_id_work);
 	tegra->id_nb.notifier_call =3D tegra_xhci_id_notify;
+	tegra->otg_usb2_port =3D -EINVAL;
+	tegra->otg_usb3_port =3D -EINVAL;
=20
 	for (i =3D 0; i < tegra->num_usb_phys; i++) {
 		struct phy *phy =3D tegra_xusb_get_phy(tegra, "usb2", i);
--=20
2.25.1

