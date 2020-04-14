Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE19E1A8E76
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 00:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbgDNWUg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 18:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387610AbgDNWUY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 18:20:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE44C061A0F
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m8so1582099lji.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onnXURnDKlMg1uxo6qnz+iE+q0NRBVnox8AeT5i1HKQ=;
        b=qMMpe9cdrz7x4TJjmfaO5VHmQbNxFkDe2pVnhslgkSnWNj83Y0vjcvV2f1RQLROfHZ
         rox+B8BeaGYOnyn1RoiXIYkD8d0moANyTzwDMbg2/wKQgc6t4kgqaeYfQoGwGcTpXFN0
         rh1+4YV5pfrftLUrKZeykau1/fuLm7VsZItuWqOfqK9/bixQMpPHS++g1wYZpXwhDfLk
         4K8jTISGXO3wDuzlc5KWJX7YBzkXJKtDM85m2+0tYibU2BG//4jtnnfV1i9j2qPKUuBU
         9IauDIjwQodV4UxcABcPBdUfSZ0fagMBbKPNX8lAkyC3hJGof7O8ZZzzid6KpjvBSkEU
         rxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onnXURnDKlMg1uxo6qnz+iE+q0NRBVnox8AeT5i1HKQ=;
        b=Y9g/heGH/yxRoQbLAY4elHfqOwkuOMP+asNwjXS3S3Jecnrtw/Mn7anhYu8EaRKEtO
         s7rloXYmdlDoj/5Lb5Et3hBjm8ELdR+ohYlODcrqJ3tdX8+qhhaveQ2nKIonDvv7YSc9
         gAfr9aihi59aYoSQSbudNAdWw6dhxtSe1a3bR/q4Axh79qZwfY9VZSQbhlq3EyOH1zZM
         qgQ6IX6p1b1I7BY/sFrSMkjTBzgYLbU1frzoL3uo3rY4KZv7bfCwM05BDH5gEVROVZuY
         hkAvxSPB6KL0r8tarRtgWQ5DBt+bdwNEpp1mm0Xpsv0u7jvXcBXx/MwW6Tu/Eu2S9zxJ
         /AIg==
X-Gm-Message-State: AGi0PubD41TQ4+BDsOUowJQOC2kkn3DqEDwMeoAsl7WmuBZhcpmSrQ1Y
        k5c+X2x6y+K1TL9noiyqrSw=
X-Google-Smtp-Source: APiQypLpYz8jfKSPIBcjC/VEtLmf4Lu78UHdIMgYpTMwUzxmRljvh+WvmekbJEyXhoYHYWqxOGXryA==
X-Received: by 2002:a2e:8410:: with SMTP id z16mr1339187ljg.197.1586902821153;
        Tue, 14 Apr 2020 15:20:21 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/2] drm/tegra: output: rgb: Don't register connector if bridge is used
Date:   Wed, 15 Apr 2020 01:20:07 +0300
Message-Id: <20200414222007.31306-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414222007.31306-1-digetx@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We rely on the connector that is created by the bridge, and thus, the
Tegra's output connector is not needed in this case because it will be
an unused connector.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4be4dfd4a68a..6e6b3fee1d87 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -275,21 +275,32 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
+	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_helper_add(&output->encoder,
+			       &tegra_rgb_encoder_helper_funcs);
+
+	/*
+	 * We don't create a parent "output bridge" that sets the
+	 * DRM_BRIDGE_ATTACH_NO_CONNECTOR flag for drm_bridge_attach(),
+	 * and thus, the bridge creates connector for us in this case.
+	 * The output's connector is unused and not needed if bridge is
+	 * used, so skip the connector's registration in this case.
+	 */
+	if (output->bridge)
+		goto init_output;
+
 	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 	drm_connector_helper_add(&output->connector,
 				 &tegra_rgb_connector_helper_funcs);
 	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
-	drm_encoder_helper_add(&output->encoder,
-			       &tegra_rgb_encoder_helper_funcs);
-
 	drm_connector_attach_encoder(&output->connector,
 					  &output->encoder);
 	drm_connector_register(&output->connector);
 
+init_output:
 	err = tegra_output_init(drm, output);
 	if (err < 0) {
 		dev_err(output->dev, "failed to initialize output: %d\n", err);
-- 
2.26.0

