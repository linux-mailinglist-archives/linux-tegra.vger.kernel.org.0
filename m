Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC391A8E77
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 00:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbgDNWUi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 18:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387646AbgDNWUY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 18:20:24 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AEBC061A0E
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:21 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so1034024lfg.9
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zemnxajRILWoZMeBdBTnUfi/BmlkbHyd8FyHUOxvzuw=;
        b=KU0KC/6kKXBdTSuhTqT6QSpZNSf0GWmK6fdeSEC7fmm45ekuHvd86jQfOs3qxf0tK2
         wG4VFeCNxR/zmV9TYTaNNh4A3g0Qs2nkmdx/zGPb1JSiGDQZWY+p5s3bqgzgE+HCnYDx
         tZNWY4QipWHe845qlNIC/VZfRv1DGtMPY9XxhUH/2Xsz6I/KJAW9TYiF91KpUR3zhM+Y
         Nilq3tRMSqSWXtw6NvCFV3Cz8yaS9i1gcyi6vIFpv36ouS+wcI88wTDh3HfLWPxZYKPf
         jepC1NyTeDvbVXFB+AXN8xDHC45upE20hQHnfll9zrJhQYfbYZK6IisKMwNohOTL9IJ3
         rZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zemnxajRILWoZMeBdBTnUfi/BmlkbHyd8FyHUOxvzuw=;
        b=MBWAb9xx8bhKaEO884QdWaWrCPSQGVE8XTVqfrHk2QxMnpmxWGMh+4w9cKXGOApH/y
         2qnIL3/iNo7hORs12GGe/XhrqEQ68pPjKb//wltwteuJ7nT9FWJPAap3joAUhz5HqSMq
         2mfgpkANJ4xzD/jLxvbZGWukBNLRf8heWG6ZnZ5ucBsrR7VrTlzCDpH7542Yx/+t2TDp
         ua5ziO2deRSCORWIno0FuCl6ouIdT+/LP/lJxZplhPlwa3B0nasPKBU67lhFCBwR4/Vl
         R7Jxw2ttgKoGqsM5TCuatAHjaNWwuYamPB1aL6FD0igVe3oH6hNDjjZndKDJ6wzqKXZ9
         +e1g==
X-Gm-Message-State: AGi0PuapXhtBtktAiryiGwylHKQd5XeXYXSj7wzPzqDroj0lP6L7RTY2
        KJLNMf3rR9aeliCKF7quRNU=
X-Google-Smtp-Source: APiQypKYoF+QM9cOIvlfpZWhxvyICsjR+0sLrT8HpIQs6NqBbxBA7bY7rrbyI/cQOiBYO79SdZTh1g==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr1149738lfg.53.1586902820227;
        Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:20:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/2] drm/tegra: output: Support DRM bridges
Date:   Wed, 15 Apr 2020 01:20:06 +0300
Message-Id: <20200414222007.31306-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414222007.31306-1-digetx@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Newer Tegra device-trees will define a video output graph which involves
a bridge. This patch adds support for the DRM bridges to the Tegra's DRM
output.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..9ca11989679c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -16,6 +16,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <uapi/drm/tegra_drm.h>
 
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..6b8fae4659b4 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -96,13 +96,28 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_probe(struct tegra_output *output)
 {
-	struct device_node *ddc, *panel;
+	struct device_node *ddc, *panel, *port;
 	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	/* newer device-trees may utilize output graph */
+	port = of_get_child_by_name(output->of_node, "port");
+	if (port) {
+		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0,
+						  &output->panel,
+						  &output->bridge);
+		of_node_put(port);
+		if (err)
+			return err;
+	}
+
+	if (output->panel || output->bridge)
+		goto edid_property;
+
+	/* for older device-trees we fall back to nvidia,panel */
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
@@ -112,6 +127,7 @@ int tegra_output_probe(struct tegra_output *output)
 		of_node_put(panel);
 	}
 
+edid_property:
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
@@ -189,6 +205,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
 			return err;
+	} else if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, 0);
+		if (err) {
+			dev_err(drm->dev, "cannot connect bridge: %d\n", err);
+			return err;
+		}
 	}
 
 	/*
-- 
2.26.0

