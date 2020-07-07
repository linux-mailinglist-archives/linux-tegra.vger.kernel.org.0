Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63EF2178BF
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jul 2020 22:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgGGUM7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jul 2020 16:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbgGGUM6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jul 2020 16:12:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E82C08C5DC
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2020 13:12:58 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j4so44181304wrp.10
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2020 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufMaQijpZxkwPwAr9gZMUr6WxEnpa6HiMV9RcHXuTwM=;
        b=Jc8+1Bt4+yZ+72JwlaX/4LbCarKqgHkIvMH8RXH7ParTT0qyrwu7nDaqDYvK5TmYnN
         f4YXcswUT94xoP4KTTwyVIX0vAJHBeBnSm8VbvKA2lXaWW1d860dZpnC30Qwi8DKO7xS
         utUL879Q+0s6m0mBrBxYl8jOBXFwz6oarUdxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufMaQijpZxkwPwAr9gZMUr6WxEnpa6HiMV9RcHXuTwM=;
        b=n/poIKd4Hkr9x+L1Qz14CtIFehZPqIuAzPKfv3EnIYzppKCPZcrww4hpmzM2n4dJM3
         PK5RCSYeIGdlsEv5wmDwKkwlJixvDEhYsE8F+OMA3iZPcrf9di9/+i8Z1dbtzOMqXwgJ
         WJK3iw2/vO7hXNIGa3s3d1pGMAVYrnThptXX+lF1JAf2p16WWVyorzuuSFDi352akUIE
         N0xl75ydIAH5jhBT67UOC0Hh5E2A8xS+mbNmheASHvYh7oFiNzCawjL/8BhaxQNti8QG
         Yluqoa59mZ4OI8CPvt7sfD0eCvQXLXXxK4ZWQIZ+Pp8jsLF60Qry9cW/US/XNxlJHrKH
         u+2Q==
X-Gm-Message-State: AOAM530WSeBr41O8OKNklvO+riqC8nE2rmiBKdlM1yW8+QZWyLC3l0Q5
        lYHgjVh7kIRjVfIWVa37Lr26J71OZtM=
X-Google-Smtp-Source: ABdhPJwuWb6pVb4wr6EdtDvBXcWINsi7MUjr5wmIW0V0ekFf31STAKNgPJW5XI7gRyMNJ5yiOX8/jA==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr54731394wra.165.1594152777136;
        Tue, 07 Jul 2020 13:12:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:12:56 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 13/25] drm/tegra: Annotate dma-fence critical section in commit path
Date:   Tue,  7 Jul 2020 22:12:17 +0200
Message-Id: <20200707201229.472834-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Again ends just after drm_atomic_helper_commit_hw_done(), but with the
twist that we need to make sure we're only annotate the custom
version. And not the other clause which just calls
drm_atomic_helper_commit_tail_rpm(), which is already annotated.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ba9d1c3e7cac..9aea8fe48db3 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -65,11 +65,14 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (tegra->hub) {
+		bool fence_cookie = dma_fence_begin_signalling();
+
 		drm_atomic_helper_commit_modeset_disables(drm, old_state);
 		tegra_display_hub_atomic_commit(drm, old_state);
 		drm_atomic_helper_commit_planes(drm, old_state, 0);
 		drm_atomic_helper_commit_modeset_enables(drm, old_state);
 		drm_atomic_helper_commit_hw_done(old_state);
+		dma_fence_end_signalling(fence_cookie);
 		drm_atomic_helper_wait_for_vblanks(drm, old_state);
 		drm_atomic_helper_cleanup_planes(drm, old_state);
 	} else {
-- 
2.27.0

