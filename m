Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62622C45A9
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfJBBmI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:08 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43060 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729705AbfJBBmH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:07 -0400
Received: by mail-qt1-f193.google.com with SMTP id c3so24245976qtv.10
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=awrwGnHuwC5YhncLJNhAbYA0Up9Svb8ONkd2BNf+dwQ=;
        b=UpzXTPYf/RC+dpnX7HzcG2osxDieyvcW3mP0RhQycARs4FB7wGcvbJZfuSTXlxTg5f
         AFC3NN03agGhvFoWPLVrPQaiAGiqJvnuTtLfFGX9LiPol3T6PZDsoqjWKXV7zRqLrpn0
         MsnDsHzL9aloH1Wv3H2Q+baF8X/EtHPMaA5p9Xbi7RAB6dF0iIuQx/Q9FLGrFSr4IScf
         XrYMTafSIg+HwkuhKHN1HBZzov1I/CdvWq09iMgC3wU+X7V/tiR/Y98LpR88OinpSG3a
         AFPdg1BWHO5Odi5EZzhjCpz9xuUtiMoge0Kbtx0HzV0ywpmVb62uvuhcPGGMhvSws9oJ
         tpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=awrwGnHuwC5YhncLJNhAbYA0Up9Svb8ONkd2BNf+dwQ=;
        b=tva4jjX9/tGOZ0BEhP2f5gFO9RC6g6X0giRrXvQBqeZfiqB7YnFB6U48UaY9B81TeH
         YDRaD7xByBiZyzQA1YCSEZP+w+x1d0iQjS2T1FSYNYTCCkMxW22ZZRbQyv/hhxCwmTIo
         D2b8Ve+TebwF2p6KqnXw1bUwTBykUu7EXhzY1sDx1Vqm5i4wxDfvy430RsnqgbLCepfh
         R4e7/Vkiev+7pcLWlSIctodw+fUXzFpO1KrJhuMugf0nhhFY5UwHFhMJEQUx97aOIjM8
         qxF+sPgso7+LEkwpk+Ek+cGtjYhpE4ZrckMCZaFBFvarpeSQBwbYhPNkP573vkib6yAV
         jxaQ==
X-Gm-Message-State: APjAAAXEIoThNYb+ateeZB/ML9d0+mdDRgQh1hnfSzuQqdhLeRTCE08T
        ScD8MlvKJ/guoFMgAj6brLw=
X-Google-Smtp-Source: APXvYqz1TgfFTk8rGZI5eYWTflkR/ddeI08BSkpNDOyj/oDt8+uEfCpW5RmEmIj5RnMbAZ9mIXyiKg==
X-Received: by 2002:a0c:91ce:: with SMTP id r14mr920349qvr.119.1569980525325;
        Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH 3/5] usb: chipidea: tegra: add dr_mode checking to tegra-udc
Date:   Tue,  1 Oct 2019 21:41:51 -0400
Message-Id: <20191002014153.29831-4-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As the tegra-udc driver does not yet support all modes, add dr_mode
checking capability.
Warn about invalid configurations and explicitly assign dr_mode before
handing off to the chipidea core driver.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 0c9911d44ee5..29415c3a2f48 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -25,7 +25,7 @@ struct tegra_udc_soc_info {
 };
 
 static const struct tegra_udc_soc_info tegra_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA | CI_HDRC_TEGRA_HOST,
 };
 
 static const struct of_device_id tegra_udc_of_match[] = {
@@ -63,6 +63,28 @@ static int tegra_udc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* check the dual mode and warn about bad configurations */
+	switch (usb_get_dr_mode(&pdev->dev)) {
+	case USB_DR_MODE_HOST:
+		dev_dbg(&pdev->dev, "dr_mode is set to host\n");
+		udc->data.dr_mode = USB_DR_MODE_HOST;
+		break;
+
+	case USB_DR_MODE_UNKNOWN:
+		dev_warn(&pdev->dev, "dr_mode is unset or unknown, setting host mode\n");
+		udc->data.dr_mode = USB_DR_MODE_HOST;
+		break;
+
+	case USB_DR_MODE_PERIPHERAL:
+		dev_dbg(&pdev->dev, "dr_mode is set to peripheral\n");
+		udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
+		break;
+
+	case USB_DR_MODE_OTG:
+		dev_err(&pdev->dev, "dr_mode is otg, tegra-udc does not support otg at this time\n");
+		return -EINVAL;
+	}
+
 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(udc->phy)) {
 		err = PTR_ERR(udc->phy);
-- 
2.17.1

