Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992524BA997
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Feb 2022 20:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiBQTUD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Feb 2022 14:20:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQTUB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:20:01 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CBCC3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:46 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id m17so11366995edc.13
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQmeAi19A/OsX9lov6xL3g5+a3jrQFNVCPVJ5GcglQw=;
        b=TPL//2i+WbSZj3T6ZVU5OcUWkBMAJ6G08K0zK2b/jpvxbe7iVYr+E7ueUgc6jp6c8n
         JgHfdG2hs88/BgSUwlrAMix4KCiI9myVl90HxPss3/4CssrKibCU5BNxkBmASsILVfPR
         qV/ia3IDdiWR/IEjlQ6rp35Kz4cy+LEQ/7czgEECsuwfwFybxFSW0aQMt3EGmxMOpARs
         XH2Fe4Z5PhYwYhJixlIjdo1zJyBKyEdH1fYHR/+vIRSPUBEB2jT/62UH/8AJK8/f5bhh
         v4JAPjn+sFXHLJb6amuZvs7iCWnW1pAlKl93GQRwBRoZlGzXipJoHrOzQPYicwGtOovt
         gLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQmeAi19A/OsX9lov6xL3g5+a3jrQFNVCPVJ5GcglQw=;
        b=646MuM2GA9oUmL1x55+aixkaijbnyKS4y25G3AjTylepDbnUTX2mueZ+VGvnSWE+fc
         CbBi0eA6k+LcUiTFeqUra6Z38Tr7LSZkO65Ov5UC9u3meVwtDneszm86xCm9AoIvGv26
         YMZWzwGwvWzB9kVWuJSXfylmNKD8pe6pjb3KwanRQAOeWJCe0qn00KkE6U6litDMZ/CA
         AdLeNSip3kzpEcL8nmX5RdB9QuKlUmt/TtomPg8Npbauz4/aS2y9YhCQbYg47u93ILD8
         0FTTl6lttry/JiYqG/Fv3QSgdbPGdQis/AawGJyvku8iRMD1RrCTwlUr1CrJNLjXpebk
         aD+Q==
X-Gm-Message-State: AOAM533lSbX2ROe80fjpmvdfwds6Hiei/NpTrU8aMl/whYdDJlWkZty2
        5NSGo6kj8kQ3mvuUEz+07uQ=
X-Google-Smtp-Source: ABdhPJw7QKNomrP4JZ39/Ysa8qauSWlX8eHApUmOgFXTZ7Ivh43x8QJtJB0FghXWUFFNFpSttsddKQ==
X-Received: by 2002:aa7:d98a:0:b0:410:b844:7889 with SMTP id u10-20020aa7d98a000000b00410b8447889mr4323798eds.109.1645125584622;
        Thu, 17 Feb 2022 11:19:44 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id g16sm1430407ejf.218.2022.02.17.11.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:19:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 07/25] tegra: Make API more consistent
Date:   Thu, 17 Feb 2022 20:19:13 +0100
Message-Id: <20220217191931.2534836-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Most functions in libdrm_tegra take as first parameter the object that
they operate on. Make the device and buffer object creation functions
follow the same scheme.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c           | 13 +++++++------
 tegra/tegra.h           | 10 +++++-----
 tests/tegra/openclose.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index cf091c1d758f..6a51c43110e5 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -66,7 +66,7 @@ static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
     return 0;
 }
 
-drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
+drm_public int drm_tegra_new(int fd, struct drm_tegra **drmp)
 {
     bool supported = false;
     drmVersionPtr version;
@@ -118,8 +118,8 @@ static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                 uint32_t flags, uint32_t size)
+drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                 struct drm_tegra_bo **bop)
 {
     struct drm_tegra_gem_create args;
     struct drm_tegra_bo *bo;
@@ -152,8 +152,8 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                  uint32_t handle, uint32_t flags, uint32_t size)
+drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                  uint32_t size, struct drm_tegra_bo **bop)
 {
     struct drm_tegra_bo *bo;
 
@@ -183,7 +183,8 @@ drm_public void drm_tegra_bo_unref(struct drm_tegra_bo *bo)
         drm_tegra_bo_free(bo);
 }
 
-drm_public int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
+drm_public int
+drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
 {
     if (!bo || !handle)
         return -EINVAL;
diff --git a/tegra/tegra.h b/tegra/tegra.h
index aaaf455fbc8e..2bcd596e2d61 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -31,13 +31,13 @@
 struct drm_tegra_bo;
 struct drm_tegra;
 
-int drm_tegra_new(struct drm_tegra **drmp, int fd);
+int drm_tegra_new(int fd, struct drm_tegra **drmp);
 void drm_tegra_close(struct drm_tegra *drm);
 
-int drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                     uint32_t flags, uint32_t size);
-int drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                      uint32_t handle, uint32_t flags, uint32_t size);
+int drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                     struct drm_tegra_bo **bop);
+int drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                      uint32_t size, struct drm_tegra_bo **bop);
 struct drm_tegra_bo *drm_tegra_bo_ref(struct drm_tegra_bo *bo);
 void drm_tegra_bo_unref(struct drm_tegra_bo *bo);
 int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
diff --git a/tests/tegra/openclose.c b/tests/tegra/openclose.c
index 104e83806f3a..61dbc2ba4f5f 100644
--- a/tests/tegra/openclose.c
+++ b/tests/tegra/openclose.c
@@ -56,7 +56,7 @@ int main(int argc, char *argv[])
         drmFreeVersion(version);
     }
 
-    err = drm_tegra_new(&tegra, fd);
+    err = drm_tegra_new(fd, &tegra);
     if (err < 0)
         return 1;
 
-- 
2.35.1

