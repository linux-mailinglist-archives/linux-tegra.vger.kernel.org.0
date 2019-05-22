Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E24A26728
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 17:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfEVPsa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 11:48:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33558 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbfEVPs3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 11:48:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so5040257wme.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ymCN4zK26ZTUFCEXX7eQSW+kelBNJC5uXfNvBUA89w=;
        b=SFk/HRAUYcYrwCMhsQ2edNdvV5hwj+tm2jzDiidQKYpQ7PC6R3+2qJ6oihdSnqcAR5
         1N7zPNgIENz0Xa7mggkJ9pMW5U+leJ9FwbRm/ZuOf82rpKimd9LKqoE4Sey3atnhhtGH
         sgAYV8IDrSRwA//5yQ7YSMQeM2Hfdx8cC2XyUhoLMjcVbLLmZrPAiyaxDVDQZNgn7r4A
         dc5cv2fEPpkTY4wqXBc1BstyU6YwlQSwaEXsqERVK7MBXPT4rHoVMvHuMs7djKFPdmLA
         /VoeiSotnElK/vtb6xVFXGfRCD/eEkP1kn9AGBofejsYnXrngE6nq27zBuGj8/smPEcx
         fK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ymCN4zK26ZTUFCEXX7eQSW+kelBNJC5uXfNvBUA89w=;
        b=baBFNMAsmDB+t8UnuLI14lsGgYOMJyDgJTqoLel8urUl9nZajYYGDc+9SSbMX63pRg
         5BUGvkWUCtBJghr2jZluHI3c4pgr95nHRi9MnDFJw9dv8gv3IdFldkyb1a+WENB8LMMn
         Lj9lrjhyZhTRNEPQE+DYmJpG+gpt9sKhirSoMIq958nGuGp9BDbrS/Su6wVt5EB/TjjE
         cmSivHt9/o+dsr9wEcwiYnv8FtFR+Yd35zpXHOeIcJ9TRnbJnkzI8uvgxwh0+eTk46+K
         yyfo123YQQemhqM1pBrrVfx4dMsPdKIg9aO69fqUyUQgtqIUrSORcCJVhM1KRJjiYXoD
         4F8Q==
X-Gm-Message-State: APjAAAVjjSL8eSsT+8telREuYy0TKyGfsruu8zYpkAG3JgWCSV6efab7
        eHEidJ2QxZK/MmVDleMtURc=
X-Google-Smtp-Source: APXvYqzs7YHIDcZN4IrAo88L1Gs+cRh/lgeCh5bjQJtVA479VVwk4p4HXw1ftnCxMsHoHR99X76uVA==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr1642875wmc.69.1558540107798;
        Wed, 22 May 2019 08:48:27 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id t6sm12567117wmt.34.2019.05.22.08.48.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 08:48:27 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     kernel@collabora.com, Thierry Reding <treding@nvidia.com>,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Date:   Wed, 22 May 2019 16:46:59 +0100
Message-Id: <20190522154702.16269-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

DRM_UNLOCKED doesn't do anything for non-legacy drivers. Remove it.

Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 0c5f1e6a0446..8836c113b392 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -891,33 +891,33 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 #ifdef CONFIG_DRM_TEGRA_STAGING
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_WAIT, tegra_syncpt_wait,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_OPEN_CHANNEL, tegra_open_channel,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CLOSE_CHANNEL, tegra_close_channel,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GET_SYNCPT, tegra_get_syncpt,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SUBMIT, tegra_submit,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GET_SYNCPT_BASE, tegra_get_syncpt_base,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_SET_TILING, tegra_gem_set_tiling,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_GET_TILING, tegra_gem_get_tiling,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_SET_FLAGS, tegra_gem_set_flags,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_GET_FLAGS, tegra_gem_get_flags,
-			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_RENDER_ALLOW),
 #endif
 };
 
-- 
2.21.0

