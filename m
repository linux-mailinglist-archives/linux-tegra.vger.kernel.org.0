Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A53189F8E
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2020 16:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCRPXp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Mar 2020 11:23:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36183 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgCRPXo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Mar 2020 11:23:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id s5so30982620wrg.3
        for <linux-tegra@vger.kernel.org>; Wed, 18 Mar 2020 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=vcuQ9gcytyRyDY8O+hV2btKMyad21nj7al+XoxPWHJE=;
        b=nGzIz3b8BS+V35Arf30oggbsc/tPZjP11gUMYxid52jBa2s9rJgwlGXTg6QiOfyHXw
         J3XMSRISYs58xGGakGzW4VeeieqMi0KkQ0AYDynXCN7QJWOGjRmwh3E2E0vTxTsX1YOC
         5UfgdjXRHcMwEWG6RS1JZsl5y+/Y72SNan1fQs4uWeNbck8sXBffJVA+/QyirERP848B
         5DdA6sZn3TwGRsgmVtwhiP6uSZVx7f6y1VO8J9SJUASeVqcYkPvXPkWoAOExjY7l+YS2
         OyhAXthKt0wKqpSzWCj9BzeVQjSJumvScqcO77UZO1eXQas46QyaJTBCDKD/LHwyKejA
         NZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vcuQ9gcytyRyDY8O+hV2btKMyad21nj7al+XoxPWHJE=;
        b=p22xyEZcC6mWSG+LleSBL3gDBId35pECtOSjF12eBpq6+xGxVxglhoA85f8Jgh9snn
         N+3VNdY3ZVwy8Xz6gx1KCsOBOu74zL78eXZih7/bOwA3b8wIiaQRfuR7tNNgEGughR/t
         gW5U0ehpl2fhqstj+oyNOPmBSNVe6DWwo5cO8BUT02K1CS0rXRksAH0IQ5L/L6AxZWQE
         +mQmtjpOLDWX7YWWT2ioK8LoD77TicFN2wgeg4nbZQltqP4QIXIJb0rAS8rxrj5fxn0d
         1qfSKHbCHBBRKkhIIR/FgTkVpKSZfZNhaSCk5KfVCWy7i8OG54i1luzJoGgGuyZ2uhXm
         emSA==
X-Gm-Message-State: ANhLgQ0+lw3IfBP3PW57dA5eutw+vGnWcet7Y4A7qrHfo69prxKSrTh8
        ppVDKOt24N04DtjxVKH7DtVnCw==
X-Google-Smtp-Source: ADFU+vvGk6xRRdtafKwG/IAn8PrMglCVvUmZVoJhe+n4XquEkaUXMZhe+dh6g8+sA8wedIJ2nB2gFw==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr6208528wrq.177.1584545021409;
        Wed, 18 Mar 2020 08:23:41 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id v10sm4015464wml.44.2020.03.18.08.23.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 18 Mar 2020 08:23:40 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jonathanh@nvidia.com, kishon@ti.com, nkristam@nvidia.com,
        thierry.reding@gmail.com, treding@nvidia.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        stable <stable@vger.kernel.org>
Subject: [PATCH] phy: tegra: should select USB_PHY
Date:   Wed, 18 Mar 2020 15:23:33 +0000
Message-Id: <1584545013-19859-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I have hit the following build error:
armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_port_unregister':
xusb.c:(.text+0x2ac): undefined reference to `usb_remove_phy'
armv7a-hardfloat-linux-gnueabi-ld: drivers/phy/tegra/xusb.o: in function `tegra_xusb_setup_ports':
xusb.c:(.text+0xf30): undefined reference to `usb_add_phy_dev'

PHY_TEGRA_XUSB should select USB_PHY

Fixes: 23babe30fb45d ("phy: tegra: xusb: Add usb-phy support")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/phy/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index df07c4dea059..a208aca4ba7b 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -3,6 +3,7 @@ config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA
 	select USB_CONN_GPIO
+	select USB_PHY
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
-- 
2.24.1

