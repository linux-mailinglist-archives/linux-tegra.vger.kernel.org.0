Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E7B4F4E74
	for <lists+linux-tegra@lfdr.de>; Wed,  6 Apr 2022 03:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351807AbiDFAT6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Apr 2022 20:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447048AbiDEPpn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Apr 2022 11:45:43 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACCB67B120
        for <linux-tegra@vger.kernel.org>; Tue,  5 Apr 2022 07:19:57 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7974B1474;
        Tue,  5 Apr 2022 07:19:57 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8F723F5A1;
        Tue,  5 Apr 2022 07:19:56 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [PATCH] drm/tegra: Stop using iommu_present()
Date:   Tue,  5 Apr 2022 15:19:53 +0100
Message-Id: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove the pointless check. host1x_drm_wants_iommu() cannot return true
unless an IOMMU exists for the host1x platform device, which at the moment
means the iommu_present() test could never fail.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9464f522e257..bc4321561400 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1149,7 +1149,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err = -ENOMEM;
-- 
2.28.0.dirty

