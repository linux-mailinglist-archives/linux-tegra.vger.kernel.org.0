Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B1C1AE41F
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 19:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbgDQRyy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 13:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729980AbgDQRyy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 13:54:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9EAC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so2919062ljg.8
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wz/cPTE8kMVij9chCAHM9jmhnQSQFkeUt4WN8AQKozw=;
        b=lgjOoqNqwgEKCq/1F/bKkbgM6VBQoN+T9/MnpqycC7++jIXWK9d99r1tCqWUnRZosv
         iDk/HHbQZVYxpPbOy0kSzA7AQhi5+2HtLxdwK2AuqZ2rH6ZJALBtjK5Km1NU12vs2d2Z
         JqzHVt+Ufl1CCIIAjvaXmLbYaHiEnE/jQdIMAjSCBP8dVMdACXR+T5GYNXVwI7PepUnJ
         faeo1t97uMM75EVL5Tv0CVXUCZw5/aWyua/zVbvdr+1XNPnpO59n2JpQtpN9tLLcCowr
         0zk6/+u2RiZfXEAtd5cv9xo4u/xgpUiw5c3lXci6UnB1lc3waSAKQRycyT8YEbwVLZcM
         rBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wz/cPTE8kMVij9chCAHM9jmhnQSQFkeUt4WN8AQKozw=;
        b=K6xCCYHSG6HHg3NCuBte1Yr1JmvejCqFYSLmBYZxB/HzNjpj66H2XE0kNTZjpkwV5M
         P2jYCKOFNdzjphpOLDOfpFqvP2T/YJMeJx+/tTvjFbtZYXapaoZQozzaGnAaBnf7ygw7
         1nXWyazt3Y2R5dk4qUUhNrmkNZmrqhMPXz69P2BBAMb00N6xv3BodTgwshfQgCk+oP+y
         bz3kDjnnkuBDM0DJEbJ7crQAXH1YiaPs4pGEtGavmwBYa5ErqicTvWzNw/JkZGL2UrZR
         YL9c7swnGLitcvWffV0wbHcWQVLh1UtaKNfLJ+rPleFzsOPN1HKYWFKnWPICGS4BLfle
         /A5Q==
X-Gm-Message-State: AGi0Pubh+H8PBrXJN84z1IMOdCL9VpLdt8RxhPf1cM8MlO13GIa13Ji9
        4Eu4sWWlBojPC6h89gV3EocF6k0h
X-Google-Smtp-Source: APiQypKBYY3x7qO73+HDOn2c5cUVwJifMFdMk8fGmZVY3f2S5Uj7xsolZU8I3NbfB7jGWJoAWYyCIg==
X-Received: by 2002:a2e:914f:: with SMTP id q15mr2842890ljg.238.1587146091297;
        Fri, 17 Apr 2020 10:54:51 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:54:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Date:   Fri, 17 Apr 2020 20:52:37 +0300
Message-Id: <20200417175238.27154-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417175238.27154-1-digetx@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Newer Tegra device-trees will specify a video output graph which involves
a bridge. This patch adds initial support for the DRM bridges to the
Tegra's DRM output.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

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
index a6a711d54e88..ec0cd4a1ced1 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -92,13 +93,23 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_probe(struct tegra_output *output)
 {
-	struct device_node *ddc, *panel;
+	struct device_node *ddc, *panel, *port;
 	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	port = of_get_child_by_name(output->of_node, "port");
+	if (port) {
+		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0, NULL,
+						  &output->bridge);
+		of_node_put(port);
+
+		if (err)
+			return err;
+	}
+
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
-- 
2.26.0

