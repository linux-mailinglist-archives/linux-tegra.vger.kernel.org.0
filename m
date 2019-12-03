Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9F51101FA
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfLCQTY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35334 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id u8so4204094wmu.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=13dFyRuLsyW17L3u2HAbZCErRk1PbJ6inYhyuChxpmg=;
        b=vb9/WSWv8RFWMt8ae7K+046gviWArn2nCvSELxg/IJxynNXa3TtXmebq1XvZbHPCP1
         jLXCrm5krgUzUg+7uBVkbRisQdlgOvUof2Kp5S6k3EYLs0INzTFzvXtnib953Ux1OF9q
         6gQ6JYKRnB/RJxRRBbDdjMDDfWdT4EOEM0gznGBHwV+7uYsZXUUFlG+vPJXUnsRh7alD
         mOS5PxV1j8UbhhcocaSLNnHSSPAlcMUe5cgadKt8exOK+T2J3acdj2JbofI4zapdJmVy
         w35Oc6R+jWs+H2GtnizeznUQxFmLtopdWeCE9FQNm1YF4wBFfEqXIWvo6hkO5AZYdyMU
         UVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13dFyRuLsyW17L3u2HAbZCErRk1PbJ6inYhyuChxpmg=;
        b=T7CcjDxuB8cuoCzEoiZRO/qcSA7n8PSxrq9GJF35wDCHmNRMch9Yj3FScEVG920PKd
         ywQIVc1wx6idfVRaUv/wjNoa1CqWKP6uuLQbs/SuaAWHUM16u79fP7IdT0VK8/gEXTaF
         t7D2UAi0Rxf3wSvCjAlm0b8RiXEdqLZi0UayzxEyQ7ZFqcubGLHNsu0t7yQcBGtJdIyA
         wO+onDj8Ea8FRZmfb99IDJO4VBs3I1r6vv9lQxH00KyGmh91RmG33uylwIc66J7MuBPI
         NcYI0PKszN6GDeXIBOQJ4qBB/yU3tDEZK8jk1zK5hq36XmingSFd3l3yrSGfLKSHB2iG
         ZgDA==
X-Gm-Message-State: APjAAAWQOiyZTJS8RVS3vdl5aVuTi14giHTnHc/bRaTQha8tkB8qFPF2
        SyXbWAj2Ync33Yd0f4iDULcEjlId9uQ=
X-Google-Smtp-Source: APXvYqz/z7cWbhRIA/RS2LVcKFh88eK0TxN7IMSGMD/oby9NvGZZmwhcOQvVZi+xjZ4n9c13I9N4Rw==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr36446287wmf.93.1575389962291;
        Tue, 03 Dec 2019 08:19:22 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z13sm3619750wmi.18.2019.12.03.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 3/9] drm/tegra: gem: Remove premature import restrictions
Date:   Tue,  3 Dec 2019 17:19:08 +0100
Message-Id: <20191203161914.1312555-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All the display related blocks on Tegra require contiguous memory. Using
the DMA API, there is no knowing at import time which device will end up
using the buffer, so it's not known whether or not an IOMMU will be used
to map the buffer.

Move the check for non-contiguous buffers/mappings to the tegra_dc_pin()
function which is now the earliest point where it is known if a DMA BUF
can be used by the given device or not.

v2: add check for contiguous buffer/mapping in tegra_dc_pin()

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c   |  7 -------
 drivers/gpu/drm/tegra/plane.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6dfad56eee2b..bc15b430156d 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -440,13 +440,6 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 		err = tegra_bo_iommu_map(tegra, bo);
 		if (err < 0)
 			goto detach;
-	} else {
-		if (bo->sgt->nents > 1) {
-			err = -EINVAL;
-			goto detach;
-		}
-
-		bo->iova = sg_dma_address(bo->sgt->sgl);
 	}
 
 	bo->gem.import_attach = attach;
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 163b590be224..cadcdd9ea427 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -129,6 +129,17 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 				goto unpin;
 			}
 
+			/*
+			 * The display controller needs contiguous memory, so
+			 * fail if the buffer is discontiguous and we fail to
+			 * map its SG table to a single contiguous chunk of
+			 * I/O virtual memory.
+			 */
+			if (err > 1) {
+				err = -EINVAL;
+				goto unpin;
+			}
+
 			state->iova[i] = sg_dma_address(sgt->sgl);
 			state->sgt[i] = sgt;
 		} else {
-- 
2.23.0

