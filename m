Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF721FD8B8
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jun 2020 00:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgFQW2C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 18:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgFQW2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 18:28:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D31EC06174E;
        Wed, 17 Jun 2020 15:28:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c17so4831408lji.11;
        Wed, 17 Jun 2020 15:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
        b=W6fRa05DMd5iUXT65xEWeMDU5c+C8e53g2PTD+NY5ci+/e7IuGGJJE2Bj/v1m+W38k
         yztIM0u+sakc6Wmhc05kLzSKqcP3TUvr+46f6vauwZ3zTeV9GYGfdeT+rDMsm4w6niW5
         nDpZ7JKOIY/77pavIswi9UR4m/psn7lNTtNuJEruPntOzhjCMcrO4/IUdyGh2Xxs8GQl
         LftzTXaEvcSptQxasV8M9zrTN+kGfaAafeDMKPGMToKT/Fhrm12/x2XxGNpe4pBN3XmG
         wNIoeHixCOQURG3ashZTasqfIhNbVXFtqh6cRqGEO0OYo0PXPAcuxGWKqhP7itVVByag
         3T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
        b=r3rdoQvoB8x6y3VO0XCYhYQoMvoeb8+5Za5wSkxql5fB7S1z2dTvUOrFaGoLiI8VkZ
         zdoqQGKvLhp4jK8usL9vVDGdez173Nkae+NSltaCRK7StNJ650Af2PowUCF9i1V/1NrI
         oudZ8HCZxKqfQ55dQYCKDaPgPD6mhPQhTPE+smbzl37oPj16qaZx3NX9UILlMdlQHrR5
         92Zy3GcFrP1zTGa2tbq+EwTewn4G3ULmfc/Jtjt9iBzQKxFZ5ok8ebh4YDmg/L6f687k
         GtsBcVAGaMTSzm76xJmUVvmOwrQ9ebUsiD6SP4jiSiExCzgBjZYog0j3W2KWwoWzZlCd
         +EbQ==
X-Gm-Message-State: AOAM531q8txZ7tJiCN8X+sAs24ZD21yIbhVgOC2TfZh5lujoagRSI7mC
        03VOVdAPD789COYWzl/N1qU=
X-Google-Smtp-Source: ABdhPJz09K4xYG7RHHMCEu95XlB0Ky4jivwqb/WBQsRuNgWFJrSXFINjMfowbCP5/Jy5ZCbJsdYnnQ==
X-Received: by 2002:a2e:8690:: with SMTP id l16mr623699lji.462.1592432878644;
        Wed, 17 Jun 2020 15:27:58 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:27:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/7] drm/tegra: output: Support DRM bridges
Date:   Thu, 18 Jun 2020 01:27:00 +0300
Message-Id: <20200617222703.17080-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Newer Tegra device-trees will specify a video output graph which involves
a bridge. This patch adds initial support for the DRM bridges to the Tegra
DRM output.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index b25443255be6..f38de08e0c95 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a6a711d54e88..ccd1421f1b24 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -99,8 +100,19 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+					  &output->panel, &output->bridge);
+	if (err && err != -ENODEV)
+		return err;
+
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
+		/*
+		 * Don't mix nvidia,panel phandle with the graph in a
+		 * device-tree.
+		 */
+		WARN_ON(output->panel || output->bridge);
+
 		output->panel = of_drm_find_panel(panel);
 		of_node_put(panel);
 
-- 
2.26.0

