Return-Path: <linux-tegra+bounces-3209-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBC494E78E
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Aug 2024 09:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28D11F237FD
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Aug 2024 07:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2271607B8;
	Mon, 12 Aug 2024 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqvqL9c7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2881547CB;
	Mon, 12 Aug 2024 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446865; cv=none; b=LnzMjv4AA+2dsP0v4aAtTKE29Yh8jmIGZiq4+U62XCjhoZVw8hPWbXyNOooWLBI3haPzNh330Uvko9N2B+9/s+XAk0evNZj0uXVGRXOx2EIQixErHuPrHSyMI0y1gJyGrGE8p/u0Yl6H2XOxLovEsBWVZVzgywBiGEWVM+Rrd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446865; c=relaxed/simple;
	bh=nLYeFCmV2sqj4+yCU6U1t0LxOTa1hw9jyckG6WHjQvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xc4jkIBXInVVbS7QhqwnR9PAZ9GiYS5mbQM7G7JvF3BJDemjCQ1y2MmWCG0r9hIWdAi2nMKZ3VHpjHbfhQrRE/8IyGnrHZ2q7zDP5NNuaVpg/HMD9BKgCtL6tYMKj5j6YJN8fmyamsNqgzhEjpkzck5nFfeNTt81Wh063ohEahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqvqL9c7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723446864; x=1754982864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nLYeFCmV2sqj4+yCU6U1t0LxOTa1hw9jyckG6WHjQvg=;
  b=DqvqL9c7bVT8n41u/UjrSOHj79S6IxA4cMPa2HVxKv8yRZsS1DCYKA0t
   vc8ferCqGO1qzNCBQ+dhVBkeiAbs6Lfs5PEZPTKc/KPA4JMg3trJj4Yg6
   t9VXlsi6NTXaNc1RmsL47o94FmlQE92LM+YijjZHQKqk8Xf5r8iEkk6SZ
   98rKSIXrv72sptOAJf2HulgmjzrOa2BCqWPFFQzM3JxLBRGXkh/+qod0J
   LLLgrVQRrsCa7Lio9xwx8AyLT8xlDLfL6XFNj651TSNg18lCFRIMnQ8Lj
   IZbCJrtYdiJGz1fthUI1LWYz3QDuIbmBrICUx3rI1rFoEbSqPH6WQ96/I
   Q==;
X-CSE-ConnectionGUID: XH9ypoG1RGqNmYiGxoaPfQ==
X-CSE-MsgGUID: AHCAIQ1XTKO74/OPm3SbLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21711590"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21711590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:14:23 -0700
X-CSE-ConnectionGUID: gDxvwbtUQGqyr6hrki+oVA==
X-CSE-MsgGUID: EJqZOrj4S8WKg9ArWC+AEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="57823841"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 00:14:17 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 3/3] drm/tegra: Remove call to iommu_domain_alloc()
Date: Mon, 12 Aug 2024 15:10:34 +0800
Message-Id: <20240812071034.9443-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812071034.9443-1-baolu.lu@linux.intel.com>
References: <20240812071034.9443-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

Normally, iommu_paging_domain_alloc() could be a replacement for
iommu_domain_alloc() if the caller has the right device for IOMMU API
use. Unfortunately, this is not the case for this driver.

Iterate the devices on the platform bus and find a suitable device
whose device DMA is translated by an IOMMU. Then use this device to
allocate an iommu domain. The iommu subsystem prevents domains
allocated by one iommu driver from being attached to devices managed
by any different iommu driver.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20240610085555.88197-20-baolu.lu@linux.intel.com
---
 drivers/gpu/drm/tegra/drm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..ee391f859992 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1133,6 +1133,17 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	return domain != NULL;
 }
 
+static int iommu_mapped_device(struct device *dev, void *data)
+{
+	struct device **iommu_dev = data;
+
+	if (!device_iommu_mapped(dev))
+		return 0;
+
+	*iommu_dev = dev;
+	return 1;
+}
+
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct tegra_drm *tegra;
@@ -1149,16 +1160,21 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tegra->domain) {
-			err = -ENOMEM;
-			goto free;
+	if (host1x_drm_wants_iommu(dev)) {
+		struct device *iommu_dev = NULL;
+
+		bus_for_each_dev(&platform_bus_type, NULL, &iommu_dev, iommu_mapped_device);
+		if (iommu_dev) {
+			tegra->domain = iommu_paging_domain_alloc(iommu_dev);
+			if (IS_ERR(tegra->domain)) {
+				err = PTR_ERR(tegra->domain);
+				goto free;
+			}
+
+			err = iova_cache_get();
+			if (err < 0)
+				goto domain;
 		}
-
-		err = iova_cache_get();
-		if (err < 0)
-			goto domain;
 	}
 
 	mutex_init(&tegra->clients_lock);
-- 
2.34.1


