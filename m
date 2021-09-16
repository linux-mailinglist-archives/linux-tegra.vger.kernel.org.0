Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2BD40DC84
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Sep 2021 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhIPOOj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Sep 2021 10:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbhIPOOj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 10:14:39 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FE8C061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kZm/kIR4q3OlGfacyoE/ISxCNlyyhRyWlex9SfooV/U=; b=O2R+uZxkGrKRGqxpk5mHU51lhQ
        MC+VkSDCrzuURpmQTRq89pe+Jrb4F4ydjwlxswr7jXJkPggJpopSs9PnfBVKdyyb9Rsz8e/PXodk+
        E3EsW0hKiReUqBim2HiltZJ7IKW98Lk4azH7nEmGT6gzAbrmjmvNf20seDMyHUK+yLWkheq9XqGXG
        9vGcYif/Od2Pcf6selIPKKiWUto/4HWNk+EQFlY4gy8JdhW/KSEjduKzB8WphH/E5+tDmJ1WAIzUI
        QHs1IkPmF4dMx/egkx8DlFQP9E6VxVXuggfLPYixsRW7yLRYdEMLq2tafOX0cjEAMZc/OSACVg5NC
        YtvYGBaA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mQs8X-0000eQ-HE; Thu, 16 Sep 2021 17:13:13 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     digetx@gmail.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: Use correct property for BO size
Date:   Thu, 16 Sep 2021 17:13:07 +0300
Message-Id: <20210916141307.2010255-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The size property is not always populated, while the gem.size
property is.

Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index dc16a24f4dbe..690a339c52ec 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 		mapping->iova = sg_dma_address(mapping->sgt->sgl);
 	}
 
-	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
 
 	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
-- 
2.32.0

