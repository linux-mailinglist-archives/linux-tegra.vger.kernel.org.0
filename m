Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EAB1FBDC6
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 20:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgFPSPE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 14:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgFPSPE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 14:15:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A7EC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 11:15:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id p5so21741335wrw.9
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cwXIj5ouQp4SkSeQCvfyT9yp/LQNeF4xzvNurOwI34=;
        b=T3SXtACH0iEYl0XvM+ojOpUB0FTQiKxHS6P1I6QXfEcMO7WEYmkFIdOzhGJBVBhbyR
         9pgF+5o7KYJA4mMCrwhqp9jAIkOU2uLpLPLk+JGnuUfSqLwuv6C0NeXc82VylSgoLbKr
         E6kkMdjR9Y6+QarVBRbOkxGTdafxoH8MSXfr3IHae0zaks87sPZnVXa6OYdCgw8S7r3T
         vWYfmPdZMED1v413T7Ls+fr0eJNnr7j8T4Z7i4Pd/HKzYbxVUJOw4rMctgBpyT5WQHcf
         299qBR+Nb+jB9s/7JYRYo70EKII47QM5i3uAZTVagLFDbzjfmhZzY1FfbMpjk9+RvkLG
         hl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cwXIj5ouQp4SkSeQCvfyT9yp/LQNeF4xzvNurOwI34=;
        b=GWGqdkPjzJX1lgDBtdpoCoKpYdx5sBB/+sV3Zw9bcpOblCdMmDTk10F7SwAC9s36UO
         i1MDr1qk81Ou6YgvLHVHRwm6/+Qo3QC8MvGFIsTnNAuvO6XA0icPx+g5zlMtQ0MAaaSz
         0DLmGfwyF4197KOeDtkirBBvitm0wUFShkdWQlJkEd9NLjoVHZohNieA5h8vfoPtJ8cu
         8BnrSLE6OxgM9sWorWxeKf8caiHVImA9IQ3IoQ91+m3OG/zoS3bPVY7mUADoVVOPyAE9
         H6B63736sim7+5ULhZFJ5gm61lVBxEGR5noUcOjjLDhHaZ05C2T60eDDdpG1lNh7iPmH
         Oj+g==
X-Gm-Message-State: AOAM532SiwYec5//ZxUk70R9s5NucQNdUev3ykq05r+mSfh6u2Y5Ld/M
        EJkFKyKWyX959zOMc2M6JsM=
X-Google-Smtp-Source: ABdhPJwMuwx+oPVBG4tX5rC/goYaMI+Zw5SMzO0D0jdyuongMlTFYMvYds2ermJbrAAVQ0T/KQ6uRQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4160642wrc.85.1592331301368;
        Tue, 16 Jun 2020 11:15:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r14sm1899663wrx.42.2020.06.16.11.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 11:14:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Date:   Tue, 16 Jun 2020 20:14:49 +0200
Message-Id: <20200616181449.3147258-1-thierry.reding@gmail.com>
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

v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..04d6848d19fc 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	return &plane->base;
 }
-- 
2.24.1

