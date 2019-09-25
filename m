Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F3ABDD0F
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Sep 2019 13:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404578AbfIYL1E (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Sep 2019 07:27:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43461 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404576AbfIYL1E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Sep 2019 07:27:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id q17so6392378wrx.10
        for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2019 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t0WF5h1lSBtPCk2h/Ht1fp/G4WdYjC0Y/PxP17Zdhjk=;
        b=JbiIIe8vHxTB1msl0vu72aLbYwUuIqsg48MHG3a8FZFUhyIHlChuzqrfPvMN/9VCqr
         JxJb2Pb9gnRy9z659Z5NwgN2svVaymQ7/q1c1PsD0X+UV/+tpqudQV/Tv48WWH3mha1K
         IMJi8Wlx7p1VLKDY5GFPFaLhpeMaZ1n+LwCM8jkcrBuqdgzUfmF3viABpHO18m1eM0rZ
         wJJ8uiQZuf3GBhGD5RkrLiEuoPp+81fF0fmyW9uNJuJOs4IrkXJKnbLuAfWMsY+xYcdk
         10lVlfBEFRgoWDjk0t6WZ0dO5ll4B2o2fgRrEF14SbfmP8ZTfM86dmdPc+cuC6XnNL5b
         uqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t0WF5h1lSBtPCk2h/Ht1fp/G4WdYjC0Y/PxP17Zdhjk=;
        b=Ice7BAJDv9tk9nhrKqYaaqKfgQCK4GnfnqVKVrSA/Jq4rzBvW6Pb8bgbFG1beXOU2A
         8rG03aGjhOhXM7fVWC52fr40oG7YYfL6A8MR9icKChAv1KIRpul3q2Vk8yHMzpJbic03
         dID2TnV4zjWQ2h84BL403uXUW6DPffbepojprtUVLXVlgCS6D84xZjSpGGLROYyWgW3D
         xz3IbgYjQMBkAKIaq0OfaDKKZUw3Lb/oMYPKk3g7rZSU7wIsu4Wtf5XZNtIzNW1a+bX7
         1bo+Ok1MP7GHKjJX1HhtLjRHbrhGhilP6o47kt+X6qgj9r7ARxBPGGHmonMQPyQcTGZk
         2W2A==
X-Gm-Message-State: APjAAAVNId9qu/VyaIZbsZs9WtWhIy8hrqvXcrqg02aozaKkiZwPgZSG
        +t6wGqrQiFjbK6icxKur0rc=
X-Google-Smtp-Source: APXvYqzfSeO1Jc5PB6DVDCLULyw/rC8Lj7bqf0IsYRULTT7G7JEnyQE4bPkc+/IRB0Js83QXfyk21g==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr8686098wrj.153.1569410821959;
        Wed, 25 Sep 2019 04:27:01 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id e6sm5769427wrp.91.2019.09.25.04.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 04:27:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix ordering of cleanup code
Date:   Wed, 25 Sep 2019 13:26:59 +0200
Message-Id: <20190925112659.2048-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
initialization") changed the initialization order of the IOMMU related
bits but didn't update the cleanup path accordingly. This asymmetry can
cause failures during error recovery.

Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initialization")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6fb7d74ff553..bc7cc32140f8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -201,19 +201,19 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (tegra->hub)
 		tegra_display_hub_cleanup(tegra->hub);
 device:
-	host1x_device_exit(device);
-fbdev:
-	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_free(drm);
-config:
-	drm_mode_config_cleanup(drm);
-
 	if (tegra->domain) {
 		mutex_destroy(&tegra->mm_lock);
 		drm_mm_takedown(&tegra->mm);
 		put_iova_domain(&tegra->carveout.domain);
 		iova_cache_put();
 	}
+
+	host1x_device_exit(device);
+fbdev:
+	drm_kms_helper_poll_fini(drm);
+	tegra_drm_fb_free(drm);
+config:
+	drm_mode_config_cleanup(drm);
 domain:
 	if (tegra->domain)
 		iommu_domain_free(tegra->domain);
-- 
2.23.0

