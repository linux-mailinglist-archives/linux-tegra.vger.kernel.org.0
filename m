Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCEE1FB02A
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 14:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgFPMSZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 08:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgFPMRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 08:17:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3300CC08C5C5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 05:17:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c71so2655463wmd.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bnxqQ/VAftsoq8Me5sQx+qpNnPJPcZh+U5miJTjAOY=;
        b=alKYbtIErka4S28IGsVN9xqXyx7H66TZN4rNQS/pSediSAYZrnjlo9VtJ0Z8kY+pqy
         78EIXv5VNf42ucbWZv0CaSNTwquvoySVK+GEhKNDkznX9iXa1kbUzG2Zu/O/wpEIvH3b
         38EU+zB238/N85VsPVYsV/co4Mxr/5/nmC44EKZnt2lIJDDQwhCpBqSM82xtcnwMl4Bh
         dkD62xdsIHYOFRgCWdeUAzRr16tsAumZsOIkjGmhnSgzxGZpzZds/1Nis1Txkvv3xXlv
         1ka8rVsa9heWJyDqTNGtb3lC37tB6X+JIACQpUsg9EFNDJwA2dAHs5JanfznnUAgA3cx
         j4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bnxqQ/VAftsoq8Me5sQx+qpNnPJPcZh+U5miJTjAOY=;
        b=F9Y2F5R0Y2kM+sy9QhVzVtGgGeUnSFfxNdOum4/cY14QCBEBiXcsqxvHqRT61VBgaR
         sdeM39ISwxk6Pw0aA4gEMkOGit35ypxwmDxyh15LcXGfrv7ItFWRcS2U7nf7/JkeZUZa
         C19CIJrl10pB3TB1LzukVBO85Ru9BIBl87arp/M5FuhbQcPj1asvRZWbYDgSpk/Z93XU
         6oxoJxxbeOU2su5R9oYU4L3hTsvuKm+05EvYqIU0cOlrLoEGmuWMaPhBgeSfkMDTUBLW
         QvSD4LW65djXtL+Jb4cP4tj9OIPWn8QjQMnemfirxLQBSYF1axTtRk54B48Xr86WDckb
         sGGg==
X-Gm-Message-State: AOAM531JYKz7oVzgjPXFXZ35Ag0OIX+yPylf4DlRDZXhZSXEwW6qoXft
        cQgGH0KrBjCNs/Cwmsnv6yc=
X-Google-Smtp-Source: ABdhPJzYD5ZgVU8Qso6kCT2qCc5TO7bLPnygjG6dG6OPFgby0GqGuhRxI4ObAAtCm77qGk70rA8Aaw==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr2888883wml.108.1592309841939;
        Tue, 16 Jun 2020 05:17:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p1sm28059177wrx.44.2020.06.16.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] drm/tegra: Add zpos property for cursor planes
Date:   Tue, 16 Jun 2020 14:17:13 +0200
Message-Id: <20200616121713.2983627-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
have a zpos property") a warning is emitted if there's a mix of planes
with and without a zpos property.

On Tegra, cursor planes are always composited on top of all other
planes, which is why they never had a zpos property attached to them.
However, since the composition order is fixed, this is trivial to
remedy by simply attaching an immutable zpos property to them.

Changes in v2:
- hardcode cursor plane zpos to 255 instead of 0 (Ville)

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
 drivers/gpu/drm/tegra/hub.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..85408eed4685 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	return &plane->base;
 }
@@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+
+	if (!cursor)
+		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
+	else
+		drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 22a03f7ffdc1..f8afc05bceb3 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, index, 0, 254);
 
 	return p;
 }
-- 
2.24.1

