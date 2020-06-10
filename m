Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050B01F533F
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 13:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgFJLbF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 07:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgFJLbF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 07:31:05 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786EDC03E96B
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 04:31:03 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so1498120wmc.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ardIA30Cz13XtF+U/U15p9rEJqh94FzHVSb2vyWMMhk=;
        b=m/ThlLZAUAyFP3u4G9C/AzmOxnBF5yPWbsHgn7DqaZhgmhhUhMRHg/ToY0QGCpreZ0
         NdM2VqZ444TfJI9dn9eTfdhU7ZzHVNEo4/2u+UwCmzslibxDW3j6Btkog74d24+RocZF
         IkuOG9pFJKr2SzYQ8rixCgBxROwANu/wrMT80BrVlLrVHkjPykr1tjJw74LpdCVfUfLD
         Saw1b1jL4XseW2Cud8192yRQ7k/mqyYVEEzkzPv9GoQvsamPA/wTrKxZ0uJ4QNQZQRGz
         kYvK5r8w0ug1LNiturIZLrVm96ikwWeMMQoyRzKF51eWl/zj20axBAD4T/Vv9JJjVdhd
         y2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ardIA30Cz13XtF+U/U15p9rEJqh94FzHVSb2vyWMMhk=;
        b=sFRs1TLcjbOGp2h3yhNrMEZXW+SbxNiBpssGGllG/3hzlIRwE8EnivP2v5S1kdEqAt
         fE3EpmGbEFHDF+I2gO2NHuA/PxFhT5nGf0egdfzPKMzWjVNLZ2eznguOEZnOrpY6E6QN
         qqhwWVDaPgW+YLz8K5bEED+EV4mgZ5F/HrZkCqWLz9xXZoctY2IKjRXXQctNqq6AngIP
         1bGFhKM8zO1AsanT0kZwuNZdqBX9a4eJY6m0xSmIbwqyS1FQCTnSHqOihu8w9aybrFzy
         eBDgrM6ZBmVOZlfOZIno5nOubj2PmgLxPSmP5MTslxS6US/xeF64emg3Dp30U6yWnIpl
         Wtcw==
X-Gm-Message-State: AOAM531L0WLh9YX05/MKAYxl+u+vCr9ekp6WSIV2z9wDnE8SxhGUUknb
        90DuFH42gHh2djwNlxuxPW8=
X-Google-Smtp-Source: ABdhPJx92QxD7BLgW0VvHj+gzaeNHu1Ptz16H36mGDQVNM4gJwio9XuZU+qKfE+gd3udi5eRNwE7og==
X-Received: by 2002:a05:600c:2153:: with SMTP id v19mr2681128wml.47.1591788661991;
        Wed, 10 Jun 2020 04:31:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u3sm7675777wrw.89.2020.06.10.04.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 04:31:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Add zpos property for cursor planes
Date:   Wed, 10 Jun 2020 13:30:59 +0200
Message-Id: <20200610113059.2164132-1-thierry.reding@gmail.com>
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

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
 drivers/gpu/drm/tegra/hub.c |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..e7a6eb952ece 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, 1 + plane->index, 1, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 0);
 
 	return &plane->base;
 }
@@ -1074,7 +1075,12 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+
+	if (!cursor)
+		drm_plane_create_zpos_property(&plane->base, 1 + plane->index,
+					       1, 255);
+	else
+		drm_plane_create_zpos_immutable_property(&plane->base, 0);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a2ef8f218d4e..697d75bbb9fa 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, 1 + index, 1, 255);
 
 	return p;
 }
-- 
2.24.1

