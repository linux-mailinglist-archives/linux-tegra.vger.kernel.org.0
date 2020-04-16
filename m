Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A011ACEAE
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbgDPR02 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgDPR01 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:26:27 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C597C061A0F
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:26 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m19so6154859lfq.13
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFzc6fT7PJhOVc2PmEDvrBnBpynDH67qawUCdvlDUBA=;
        b=XtJDuxVSs63q0EVoGLvIoGPtPP7Hv/oO6lZvbqj5/JWUrSsEb+fCWFWmuuucmMpuhf
         TKwH27fiOd3qNrhl/mWe6UGRPxfDcRfxtlSSqinEM90hrGFRiPo2R1p1B0bu36R4pDIV
         5QqkPRzPX89xSkpG9QI1vTMnOodL/HNM0nRvr2YZY/wNGCfor1g6RamfpcLVjDEZz79c
         wEgiW2x3nFLTY3a1j6VNXjXKiSxCnVbX7p8Qp7oh0Tu/svGdZkIC3oTFt/Ox+ELmgAsC
         IyLvejJRj/Nsnw/aeUnAHDWTNPKrTLF11g3Col6priDNVx/zUbU0zqe5VAq1b8LbZyaR
         JfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFzc6fT7PJhOVc2PmEDvrBnBpynDH67qawUCdvlDUBA=;
        b=NNZ0F8juC3fvKtH4oWM62EOBI1ychhJANvMtl8CJiTMBZDk34kixTrO0St3KUiGa1N
         fi3+WvK9GGeMTAy/ur/sFiIz9BnW2J1zPoSXviAqan66QSgYaM5dh+t92DZA161aOCl8
         Ypd20zchLgB66urE67y3qRLXXoIYhougdaqRCVHtouQwFqYyqMLc1/WbSuHpgNxNaIBg
         b4ot9j9DNVBjdVYxDzvYbxcA0MkxEcsvPYHPXQAvNMdH43dbNaycbDQK2uwGsdIkmcpV
         AMxt9Mv4MnkogWBvFwX0K9zi2zAT7fJELVmg6KEt6I4VLJhzNUpw/azqQChG/x95EdYa
         kiJA==
X-Gm-Message-State: AGi0PuYPTeTfgOO7A/vvdp88+vC1W99cy4ut8GSHcPDbf7/1B5li8wrv
        3arAsbuDKuWkBs5bDrsvuKA=
X-Google-Smtp-Source: APiQypIiyjkqz7+51N41EvFkk++/rxy4a2pb95TOvbOxygyTMT2pz6q4DvMSYi+QJF4ZmBV9xlBjAA==
X-Received: by 2002:a19:d3:: with SMTP id 202mr6549662lfa.24.1587057984730;
        Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
Date:   Thu, 16 Apr 2020 20:24:05 +0300
Message-Id: <20200416172405.5051-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416172405.5051-1-digetx@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Newer Tegra device-trees will specify a video output graph that involves
LVDS encoder bridge, This patch adds support for the LVDS encoder bridge
to the RGB output, allowing us to model display hardware properly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 10 ++++++++++
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 804869799305..cccd368b6752 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/of_gpio.h>
 
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
index a6a711d54e88..37fc6b8c173f 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -180,6 +180,16 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	int connector_type;
 	int err;
 
+	if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (err) {
+			dev_err(output->dev, "cannot connect bridge: %d\n",
+				err);
+			return err;
+		}
+	}
+
 	if (output->panel) {
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 0562a7eb793f..0df213e92664 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
@@ -210,6 +211,7 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
+	const unsigned int encoder_port = 0, panel_port = 1;
 	struct device_node *np;
 	struct tegra_rgb *rgb;
 	int err;
@@ -226,6 +228,38 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
+	/*
+	 * Tegra devices that have LVDS panel utilize LVDS-encoder bridge
+	 * for converting 24/18 RGB data-lanes into 8 lanes. Encoder usually
+	 * have a powerdown control which needs to be enabled in order to
+	 * transfer data to the panel. Historically devices that use an older
+	 * device-tree version didn't model the bridge, assuming that encoder
+	 * is turned ON by default, while today's DRM allows us to model LVDS
+	 * encoder properly.
+	 *
+	 * Newer device-trees may utilize output->encoder->panel graph.
+	 *
+	 * For older device-trees we fall back to use nvidia,panel phandle.
+	 */
+	np = of_graph_get_remote_node(rgb->output.of_node, encoder_port, -1);
+	if (np) {
+		rgb->output.bridge = of_drm_find_bridge(np);
+		of_node_put(np);
+
+		if (!rgb->output.bridge)
+			return -EPROBE_DEFER;
+
+		np = of_graph_get_remote_node(rgb->output.bridge->of_node,
+					      panel_port, -1);
+		if (np) {
+			rgb->output.panel = of_drm_find_panel(np);
+			of_node_put(np);
+
+			if (IS_ERR(rgb->output.panel))
+				return PTR_ERR(rgb->output.panel);
+		}
+	}
+
 	err = tegra_output_probe(&rgb->output);
 	if (err < 0)
 		return err;
-- 
2.26.0

