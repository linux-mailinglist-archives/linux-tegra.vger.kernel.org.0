Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337242F12EF
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Jan 2021 14:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbhAKNBw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Jan 2021 08:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728850AbhAKNBv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:51 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81841C0617AB
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=MaDpPH+B3eezo8YVv9ptDJ+BRb1IzILBcUMQmkzOJVQ=; b=r4exhXthCiTWH45hPqLGfxsYxK
        Lay+miEqgWcqFcuNLw34/Hf5xJbBLlR0PfrB+Hi6CPJba/klC6Sect8azM4pQ0DDCQS/t6kRPgKgB
        3ytXn0RKD/MjtpukJQHsb+YhZZ1wAv3hAhhMIiuxLTotoAT/m75OztsKa+n0uy5oIugrNVnMsriUF
        Mp+idSlKJyoxqLGwQ7k2EVnakfLl3jAXle2LZ4F74Bf9C/WGU8eAIQP3TozLSG9KtDS7r1qQPPdeq
        jxcflHiaXDbWYYsPQYnRhoQmROLSuOctOplhFINLqdvQwMP2QDCbutbEpD1Eiwf0mOaV1F1k9orl7
        nCi2KpJA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo7-0002tl-Hj; Mon, 11 Jan 2021 15:00:27 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 17/21] drm/tegra: Set resv fields when importing/exporting GEMs
Date:   Mon, 11 Jan 2021 15:00:15 +0200
Message-Id: <20210111130019.3515669-18-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To allow sharing of implicit fences when exporting/importing dma_buf
objects, set the 'resv' fields when importing or exporting GEM
objects.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 26af8daa9a16..731e6bdc01b4 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -431,6 +431,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	}
 
 	bo->gem.import_attach = attach;
+	bo->gem.resv = buf->resv;
 
 	return bo;
 
@@ -683,6 +684,7 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 	exp_info.size = gem->size;
 	exp_info.flags = flags;
 	exp_info.priv = gem;
+	exp_info.resv = gem->resv;
 
 	return drm_gem_dmabuf_export(gem->dev, &exp_info);
 }
-- 
2.30.0

