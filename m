Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE641A2AA7
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2020 22:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgDHUuo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Apr 2020 16:50:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45571 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgDHUuo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Apr 2020 16:50:44 -0400
Received: by mail-lf1-f65.google.com with SMTP id f8so6197581lfe.12
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2020 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDe3jb7HYGWKX0IPhCmO+KPecpUQ19WATGRi38MLDt8=;
        b=FBwC1I1a34ApIWzE6B4w7yW2qmFoV/cQA1px9ZeFxvvbeW1FiME3PoKwClkh+AoJ0L
         LqfEmxGBhtbHdn1sNjTuvVzCMfT8bfaui1cmyUGqnRwwIaxF+OGdvDb1yJ5HyghAyYJr
         qY09GeU26TLBW6Cwm1JAdxGwbmgTpP04qwfEzGxMkly9ASqwph5vRlka4CynR1fHdPsg
         MKnfq6LnJEv9RXzwFqq1F7z2Ww0q/eS0kJWqy2Taa45wzAynHxyhx1Ftj4I+Z0SO+rpe
         IqcDtTG96GPg/V16BSxN9jFHgpUvD4my5oQwstg0XhrnTO3WEIU441DKMBqyE7kP0xXB
         w2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDe3jb7HYGWKX0IPhCmO+KPecpUQ19WATGRi38MLDt8=;
        b=eLEn7C/R9Nnq1X97DsDlfSUR+NIiiywLW1ivSlh5lKdmSobVfUTAymabIwUA9CNicI
         Mvb6X4MAT3S0ZEEgoWpx5o8Uo72530kCMvZZksaw3y6XE8l4EP//VIgmIuWAGfbNxuzX
         acmAEM/0jl53NgTyCzFmR9HQE3aIaqnkcI+YbFuzBiiwI+Dh4VWWASKSM/6pt7yWVuCj
         QHnqGaUvV1vwRoNcnpMmRa5KLaf2Nyz4rkKHmPNnFREgg2ZVJ4ejmSR2i5pw9OymukwC
         W/LznEDxu0lSR+BPYhadjm0h40mnL4ceGnQgBaT7QSlsMbhxgRvwWtd3ywL41M91f0MT
         i9PA==
X-Gm-Message-State: AGi0PuYVRpStuuuqZ75Og92UoaaPiHwOifsQM09LQgicFJtYsV1ZooQ6
        1YUYwHY3hsYj9JD1cH2mGj8=
X-Google-Smtp-Source: APiQypKIAZqNDZ6fKILmxrdiBcLQLUQ0IO4EO4MRSyuu/rYGA09NxSQUG6m6SANkkvtSSJazhxELFg==
X-Received: by 2002:ac2:42d9:: with SMTP id n25mr5564921lfl.97.1586379041658;
        Wed, 08 Apr 2020 13:50:41 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id b73sm9225159lfg.86.2020.04.08.13.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 13:50:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: output: Support DRM bridges
Date:   Wed,  8 Apr 2020 23:49:20 +0300
Message-Id: <20200408204920.19142-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
2.25.1

