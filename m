Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF87C45A8
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbfJBBmH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41137 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfJBBmH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:07 -0400
Received: by mail-qt1-f195.google.com with SMTP id d16so3679301qtq.8
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WFVI5vnRYJNZHJ41fHYSfC0RgxUT1KNcfu7smrWxT4w=;
        b=GC9bXgMp5PBogmH7XVR3ImkRAnpW3ifmgc3aqJhUoNtRx8tZO+e4j4OoHP8EaKfhk0
         OHIP+nDUDb2WMCwrEtJMkAP/YtUWY6X3nPpaup1quNcK8TkHYGZZ5vi9evguMpQhxUMx
         RjUhfvpLa2FPn0BoBR/G2Qbesh241Z2VZfn66ZmoKc+7SegWTMPMRTE9lXqg00CuwBBr
         T2nJAwLp9yssTnEr7RvTolpA45ORjC5zaoBV9hKwm+K4JZUtQEC0xUSUU6gEFzjs5UN+
         W3S1KamxcO3++bwHND6l3H1FckCGtIGl2eiwZ60EtH8MeFVDHDviezc83gnKMP+yzBy5
         GlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WFVI5vnRYJNZHJ41fHYSfC0RgxUT1KNcfu7smrWxT4w=;
        b=MdzuRz25Hah9VGvtWTlWR6/swhBH80q0My09+n1c/MH2aF68tHhDpW/cSz9Xh2HVdC
         iNPscJcjkp7lgx9iEux24sDVzlEksBXgjt3Qu2WUR7SemkkommjQNAihbA7WI5nUCsYh
         n7FZKRnwfr+HXG1FcJd0n5CHmmXon1R10iJPVaYO8o8SZ4aiVgnOAkTjwwp7hPbPk3lu
         h49F2GS8fwWdoy5VLMBOZtYXpKkvYrigWiKynazrpPE/aNQ1oS834CXiBWIkuey9UP7P
         DyGJbYwXwd/HEXmPjUps8+wN6hCKaXas3nY4VQUvJSIz5uaGPzjiYlxe4QFvjjpNMh6h
         CKOA==
X-Gm-Message-State: APjAAAVM1pq9z1myArFENeqLXt4VIyW1MGGdqjdPUdQS4kOdEh3WDNHA
        Nc7u2HQod5tJubwJ3HSnL/thVYpA2ftWJA==
X-Google-Smtp-Source: APXvYqx7inc3QbA8Md7rjk4klsnEMo0mehfLpRg5lOh3LkkKiV9ILewdhKrxJyrImQH9cyrJcBnXOA==
X-Received: by 2002:a0c:e60b:: with SMTP id z11mr925936qvm.53.1569980526358;
        Tue, 01 Oct 2019 18:42:06 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:06 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
Date:   Tue,  1 Oct 2019 21:41:53 -0400
Message-Id: <20191002014153.29831-6-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the functions to the chipidea host driver to enable tegra specific
dma alignment and reset handlers.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c |  7 +++++++
 drivers/usb/chipidea/host.c          | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 29415c3a2f48..2f7d542d2273 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -118,6 +118,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	udc->data.usb_phy = udc->phy;
 	udc->data.capoffset = DEF_CAPOFFSET;
 
+	/* check the double reset flag */
+	if (of_property_read_bool(pdev->dev.of_node,
+				"nvidia,needs-double-reset")) {
+		dev_dbg(&pdev->dev, "setting double reset flag\n");
+		udc->data.flags |= CI_HDRC_TEGRA_DOUBLE_RESET;
+	}
+
 	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &udc->data);
 	if (IS_ERR(udc->dev)) {
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index b45ceb91c735..e95b7cb8c54d 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -20,6 +20,7 @@
 #include "ci.h"
 #include "bits.h"
 #include "host.h"
+#include "tegra.h"
 
 static struct hc_driver __read_mostly ci_ehci_hc_driver;
 static int (*orig_bus_suspend)(struct usb_hcd *hcd);
@@ -275,6 +276,13 @@ static int ci_ehci_hub_control(
 		goto done;
 	}
 
+	/* For Tegra USB1 port we need to issue Port Reset twice internally */
+	if (ci->platdata->flags & CI_HDRC_TEGRA_DOUBLE_RESET &&
+	(typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET)) {
+		spin_unlock_irqrestore(&ehci->lock, flags);
+		return tegra_ehci_internal_port_reset(ehci, status_reg);
+	}
+
 	/*
 	 * After resume has finished, it needs do some post resume
 	 * operation for some SoCs.
@@ -364,6 +372,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
 	rdrv->name	= "host";
 	ci->roles[CI_ROLE_HOST] = rdrv;
 
+	if (ci->platdata->flags & CI_HDRC_TEGRA_HOST) {
+		ci_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
+		ci_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

