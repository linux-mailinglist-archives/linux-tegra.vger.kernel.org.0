Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D762D62FF
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbfJNMvG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42263 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so19555496wrw.9
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hANW8n51/2TerGmbLCgZv/CuSuRXQd643gepZFK9hnc=;
        b=FH9GU5LIfYrvKMM0VQueVtxsk2INkBq+qpUi/rO8dShCffTYMsqbyIsBc0RZYEFlQa
         S2PL1z4hHISnNlRIeTHqfdHwzlR2DLrKWQ4CjBiqrSinZ+jHc0DTXjSjFKYQe2kYxA6b
         UAgfZHe6cKBwp3ZoketphiL8GAL6MrZgOWOPE+lrOa3gYgw1MSli3+czinyu9UE+tdiI
         Lm6xyR1KCsKAphTiq78PcI5DKXCdn7ImtaRiq5Na4yJOenpszLme6hcCq0ftlh4FdgWP
         gYNRHFn1ZwwcE6JtneCyAhE2YcSBqT9Yk5+yuywj5PYO8nsUBi2pU7ZKupMHBzxAwZjn
         ey4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hANW8n51/2TerGmbLCgZv/CuSuRXQd643gepZFK9hnc=;
        b=G9VK+uWAlA6ltqrDUyYz09PQFxhheiHY0c0IzPwOX1uQFADeuKDWw04qe2+eesEsJV
         7vMoR4Kb8DlCYDWfMbwIpegQGZlPG+hQ26nGhu69G8Dle6pTcXPdp8OwWyMPIaHtf9VA
         aLSccYaDcKr83Pg1VopGEFRfZziC3l/wHY3TE2+bJqDGMKUDlTDiH/1KIXLORZG9ywI3
         61cXBsHdIlJuDlD013tH4yQWgB/M/CrjbG9TQcaMoyd4twUkru0w1CX01jRzhFa3QwUa
         iH0ZCz8Q0wjq4QfHA6H7OZxOn1Ukfu6jIQD3NKnMGrQUnDDLb61jPSxZhxIVdsH8iILc
         jlcA==
X-Gm-Message-State: APjAAAXXNgrJFSlZIyfmxqY3oMvh3dWBnQ0U20BEXGyNl9qUKwWho334
        oqygIXfOjbIGLEEKFYxdMo0=
X-Google-Smtp-Source: APXvYqybmot/4ZJNgw6ylAiNa+i9nfpB1OEZUQ+aZJOVklE7DDa43GuKJsTwPpS6ZdV8c+Sq1irO7Q==
X-Received: by 2002:adf:e705:: with SMTP id c5mr24803233wrm.375.1571057464290;
        Mon, 14 Oct 2019 05:51:04 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n18sm15138096wmi.20.2019.10.14.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/14] drm/tegra: Use DRM_DEBUG_DRIVER for driver messages
Date:   Mon, 14 Oct 2019 14:50:41 +0200
Message-Id: <20191014125049.425101-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The driver-specific messages should use the DRM_UT_DRIVER category so
that they can be properly filtered.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bc7cc32140f8..498d22a65616 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -163,10 +163,10 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
 		mutex_init(&tegra->mm_lock);
 
-		DRM_DEBUG("IOMMU apertures:\n");
-		DRM_DEBUG("  GEM: %#llx-%#llx\n", gem_start, gem_end);
-		DRM_DEBUG("  Carveout: %#llx-%#llx\n", carveout_start,
-			  carveout_end);
+		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
+		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
+		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
+				 carveout_end);
 	}
 
 	if (tegra->hub) {
-- 
2.23.0

