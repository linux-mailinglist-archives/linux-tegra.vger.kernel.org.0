Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD44C896A
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 15:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfJBNQ3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 09:16:29 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44086 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfJBNQ3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 09:16:29 -0400
Received: by mail-qt1-f196.google.com with SMTP id u40so26238707qth.11
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qDPeyTlbR6SP9wrhdvvQWPV76VpNxORLmLpug1xdtdM=;
        b=BeegJKGGQZDPnYRF8xieY4TES56mzRBrw9JIPsmXUhVO22zWQT4y2YkUBUe13SBEhb
         /jX27d/DOxpEZ5u66h5cqnSsqKDPpRVIF01ZsEMD7KT3HPVmNrinHUE44aPI1rykThY+
         Nygr+ke6MXiCYzUh5gw9/Bu+PhTytxwqLGUHac/FYX/ZTUNKOEsbNDcszVaxu3hs+rKt
         R4LQaPZXRsmREx07yDTAAg39vyu5leKRMKLgdH7QpZAgjbCF4fSRBehhfW0IWhBUtcW7
         zT0TG+qw6uPr5Ye7gdMSxBo4HFgTRN+BPhv++LEA1Arv61otGED3TgEEyJjwuL+GXxlf
         TEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qDPeyTlbR6SP9wrhdvvQWPV76VpNxORLmLpug1xdtdM=;
        b=h/HgrpjXkSfztyPQeF8rsM0dFCasJLAFqdatt4VqB9+tgRVPcAaEjoQU+9VeuZ3+dG
         bHee7ROCKWoKSBEam03YNKx2wA3ZonWiXGOgFSq/wFh2fIKHZriC5exuvxqbV+Q9bw7M
         HlC8t2m+8U8uqiFOatbgleVZq0m1vGorzlP0qgKXaN3lmHcb61FK00is+IWMsBwEPCeE
         g3wWA6VSxSY2U1RwJEJiX6hYPjToDfyJrDGR2VmMaAwO5UYirvEveHOJvQtngJATsNPx
         wPKvsx9HUxe/qxx6cEuQvHDanuht6rbvTDuauSSNRB2qlZ20C6DUDZyxa7Kr/3VviupR
         /BrA==
X-Gm-Message-State: APjAAAX5MEODv0YRmU8cHplNcO3bV9ZMksx50URujRcg/hDXqAToQ8pU
        wu9BLzq7jgJhkQAHCCnKfKc=
X-Google-Smtp-Source: APXvYqzqHYK2Jv2ntx98o3KCzlYAzKEFm3WOaJUu1aFWe+wwoIkAhtiImrRD7Rdp6hlvXGh7B8GLMQ==
X-Received: by 2002:a0c:e20c:: with SMTP id q12mr2935328qvl.214.1570022186673;
        Wed, 02 Oct 2019 06:16:26 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd17:1dcf:8657:164d])
        by smtp.gmail.com with ESMTPSA id q49sm14856443qta.60.2019.10.02.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 06:16:25 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH] usb: chipidea: tegra: add dr_mode checking to tegra-udc
Date:   Wed,  2 Oct 2019 09:16:24 -0400
Message-Id: <20191002131624.5729-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 drivers/usb/chipidea/ci_hdrc_tegra.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 12025358bb3c..8dd6f4e6cb3e 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -75,6 +75,29 @@ static int tegra_udc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* check the dual mode and warn about bad configurations */
+	switch (usb_get_dr_mode(&pdev->dev)) {
+	case USB_DR_MODE_HOST:
+		dev_dbg(&pdev->dev, "dr_mode is host, tegra-udc does not support host mode\n");
+		return -EINVAL;
+
+	case USB_DR_MODE_UNKNOWN:
+		dev_warn(&pdev->dev, "dr_mode is unset or unknown, setting peripheral mode\n");
+		udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
+		break;
+
+	case USB_DR_MODE_PERIPHERAL:
+		dev_dbg(&pdev->dev, "dr_mode is set to peripheral\n");
+		udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
+		break;
+
+	case USB_DR_MODE_OTG:
+		dev_warn(&pdev->dev, "dr_mode is otg, tegra-udc does not support otg mode\n");
+		dev_warn(&pdev->dev, "setting peripheral mode, if you need host use tegra-ehci\n");
+		udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
+		break;
+	}
+
 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(udc->phy)) {
 		err = PTR_ERR(udc->phy);
-- 
2.17.1

