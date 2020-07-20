Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE46D225C28
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Jul 2020 11:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgGTJ6A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Jul 2020 05:58:00 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13456 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgGTJ57 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Jul 2020 05:57:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f156a300000>; Mon, 20 Jul 2020 02:56:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Jul 2020 02:57:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Jul 2020 02:57:59 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 09:57:56 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 20 Jul 2020 09:57:56 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f156aa20000>; Mon, 20 Jul 2020 02:57:56 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <vkoul@kernel.org>, <kishon@ti.com>
CC:     <thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [PATCH V5 0/7] Tegra XUSB charger detect support
Date:   Mon, 20 Jul 2020 15:25:41 +0530
Message-ID: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595238960; bh=aFkfjJ9bCYehKWw/qILt0k8Q+GjYO21Yl9FLA4DbOlY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=ili5auLRqsGjE+nhxZNVimJ+32Zdx9lTV3ZGopQ1+fAypSC2zkbXa4Z2SXNXDa1dh
         zuREwftAwWXV5BD9NncTxh6lh0HkAN1I01zFSvhTq6ZWhWrAg9jLcOLyCBGJGR1AO1
         oUGiDMth1/jJH70xNTIdMNiE6cpcYGtThqYNNO+9tVhTU11iW3/FyCzXwJnITUOeDo
         lVuztB9TUQzRrnvT6u/6/fH3bWLAMZp3sJjJBh7cFRD0SJ9Houbbc4L8MOSIEwqyLq
         CT/8QH+aHeVK1VPdCkw5yEApSLevTKNNIvlszmmZ67qpUxbqxe0znaJx6zkZxdo2Ck
         xZYG/ZXZF9+zw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch series adds charger detect support on XUSB hardware used in
Tegra210 and Tegra186 SoCs.

This patchset is composed with :
 - dt bindings of XUSB Pad Controller
 - Tegra XUSB device mode driver to add vbus_draw support 
 - Tegra PHY driver for charger detect support

Tests done:
 - Connect USB cable from ubuntu host to micro-B port of DUT to detect
   SDP_TYPE charger
 - Connect USB cable from external powered USB hub(which inturn connects
   to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
 - Connect USB cable from USB charger to micro-B port of DUT to detect
   DCP_TYPE charger.
DUT: Jetson-tx1, Jetson tx2.

V5:
 - Fixed kernel robot warnings to updated functions as static.
V4:
 - Added ACKed-by details for PHY driver.
 - Used BIT macro instead of (1 << index) usage as suggested by Chunfeng Yun.
V3:
 - Added ACKed-by details for PHY driver and DT changes.
 - Functions and its arguments are aligned.
 - Tabs are used for alignment of MACRO's
 - For vbus_draw USDC callback, usb_phy set_power error is propogated.
 - Fixed various comments given by thierry.
V2:
 - Added ACKed-by details for DT patches.
 - All patches rebased.

Nagarjuna Kristam (7):
  dt-bindings: phy: tegra-xusb: Add charger-detect property
  phy: tegra: xusb: Add support for UTMI pad power control
  phy: tegra: xusb: Add USB2 pad power control support for Tegra210
  phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
  phy: tegra: xusb: Add support for charger detect
  phy: tegra: xusb: Enable charger detect for Tegra186
  phy: tegra: xusb: Enable charger detect for Tegra210

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   4 +
 drivers/phy/tegra/Makefile                         |   2 +-
 drivers/phy/tegra/cd.c                             | 283 +++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra186.c                  |  92 +++++--
 drivers/phy/tegra/xusb-tegra210.c                  | 223 +++++++++++-----
 drivers/phy/tegra/xusb.c                           |  80 ++++++
 drivers/phy/tegra/xusb.h                           |  22 ++
 7 files changed, 621 insertions(+), 85 deletions(-)
 create mode 100644 drivers/phy/tegra/cd.c

-- 
2.7.4

