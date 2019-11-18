Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35399100279
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 11:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKRKfy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 05:35:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36866 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRKfy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 05:35:54 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so18142327wmj.2
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 02:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOwJZP0J7iDFrucO385G7SzgcBLPJoOGi9VDEvyVQfk=;
        b=liBzcF0q0R7pU1njSk5pcTNLImCXtbYEylrqni9HUYs9TtIojj7P4J1HU/XVNGZg9x
         j22qg32BjvSkZyKX9+vta5Kg0slb3+0yLSF/KCogPIQanRkFVTULjk1mbmloGzfeBCFb
         VwaOGEsVwJQVkXWz774gqhuoIxeyasmJ0BbY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOwJZP0J7iDFrucO385G7SzgcBLPJoOGi9VDEvyVQfk=;
        b=f0DLW6/F4R65OqVsvGt86inksNQ9PbrjtcwGKXm6w4Y/h3OqKIe8mRdqdPeZJH3567
         7chkDb7zWcarOrS0N2EG9IWfmnsCoNrKNLDMXR1Hn33Cmx9nVPw5O9rFNKyx/lZZo4Jr
         n1FY7oJcRJD/700RwtE+fR4mhoVlOdoJoXUcp/FurXqBNsnhYgaom7GfcUtDuhfGiFUF
         27HF0ScS4qQzpDGU4F4Sp0IbNDu5b2v/3mdCZKRIlYztIZXCGCI3Dt1ekxTBgHlKlZJM
         Jj2EcIpeY6Knv1epBJeOZZmTI/Wk+Nn2bwNY7euKRNdJg7RSfkJP8td/s9LLmHy+E8BG
         t2UA==
X-Gm-Message-State: APjAAAUBtTpwavZ13vdjpfgoHx9+PWyoFo/EWJgLSJUjIsK/AI3/Mave
        QHr/drn/v0vnodcKXyVrm5pEHA==
X-Google-Smtp-Source: APXvYqyv++eTh4dfRe6HPZGN9Rfh3IWSCLv9l/B563p4a/JGelFE1fu2E2/VaqryK02I8smzGjsNXg==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr26445746wmf.173.1574073353073;
        Mon, 18 Nov 2019 02:35:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:35:52 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 08/15] drm/tegra: Remove dma_buf->k(un)map
Date:   Mon, 18 Nov 2019 11:35:29 +0100
Message-Id: <20191118103536.17675-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

No in-tree users left.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/gem.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 662cb7c87ef5..84bb29070536 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -585,16 +585,6 @@ static int tegra_gem_prime_end_cpu_access(struct dma_buf *buf,
 	return 0;
 }
 
-static void *tegra_gem_prime_kmap(struct dma_buf *buf, unsigned long page)
-{
-	return NULL;
-}
-
-static void tegra_gem_prime_kunmap(struct dma_buf *buf, unsigned long page,
-				   void *addr)
-{
-}
-
 static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 {
 	struct drm_gem_object *gem = buf->priv;
@@ -625,8 +615,6 @@ static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {
 	.release = tegra_gem_prime_release,
 	.begin_cpu_access = tegra_gem_prime_begin_cpu_access,
 	.end_cpu_access = tegra_gem_prime_end_cpu_access,
-	.map = tegra_gem_prime_kmap,
-	.unmap = tegra_gem_prime_kunmap,
 	.mmap = tegra_gem_prime_mmap,
 	.vmap = tegra_gem_prime_vmap,
 	.vunmap = tegra_gem_prime_vunmap,
-- 
2.24.0

