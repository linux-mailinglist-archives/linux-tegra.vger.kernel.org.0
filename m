Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07081931BB
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2020 21:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgCYUQI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Mar 2020 16:16:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50585 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYUQI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Mar 2020 16:16:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id d198so4073496wmd.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2020 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPLnagV0XBnTWT+nGjtRaD+LnSq2BqmeAJnp8U+CWPw=;
        b=sj7XVraxdwiyRAeepEQ0wy1nLUUH6vcloNotxoFwaAZmvU2GILePtp+OM8VZxzmSg1
         qVjos+BzgdtxI0QGYvlsRwZJmw1PdwfTDzM8kMKmP2AfXDgnFG7LZsGZnzTmdPqErqG6
         RfQwpZiPunHplEvI/epnPHACQlV9HoX+teAIWP9gyJkMYwBCVOirkfv4yGqGZWyEciZ2
         yM5mGeUZ/OprHtVVEEuF5yb50CJm8cBEHBMr2ooS+0jm+avVEG8DKe9QM2nWgJB7+TXH
         7+iryK1A4PDr9L6syw0p6sAbkFd2+P/p44d/rqsKPWTQG0lkd0cgRHx9fVPls/P4Snyr
         JwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPLnagV0XBnTWT+nGjtRaD+LnSq2BqmeAJnp8U+CWPw=;
        b=HWu2t1YnW/GoMLlkfp6ZQha8CvUnfMi/OK1zsN3hDtTtMLwVQL9YBFPvXYfAASIGzA
         qXmgdbIdQmwOXRxlDmgcXk8KcOJmvnJTSoE+GPeLrKGVq9h2c6XLINshs7RDWqY7//GM
         /NMVkESX/sVh5qVQYVzsQOBWAsLkwpVAmt3lJ81XrCGdA/L5aN2FWOftTWJWoStgtHuB
         9N27ffBkV8/72gDCcGxM/lJlfxMBcfPIEMDGWlErsl2U/EPtF+e5AH1kF9/a+lImxa1h
         vBlXvgfPKazfOLm1jA809U0QJrCy5bmTOJsaLqnkLPNJRyvlY6JZqk8a1Wc4u6l44uoI
         4l3g==
X-Gm-Message-State: ANhLgQ0GzmzHn/uC4G4GzXRW/D8i6fcQ7Y04Wxx+yBOvoeixp0lD9PYD
        9Q7E3Ezt7uCnfh5D41Ym8jY=
X-Google-Smtp-Source: ADFU+vvV+Qjqcd+wksczhsC9MSisSEM36LfhftNulFkmYxqwCfpDcq22YDEoWHYpgjaXwwZC4lgCyg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr5416219wml.154.1585167366416;
        Wed, 25 Mar 2020 13:16:06 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id i4sm132568wrm.32.2020.03.25.13.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 13:16:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: Fix SMMU support on Tegra124 and Tegra210
Date:   Wed, 25 Mar 2020 21:16:03 +0100
Message-Id: <20200325201604.833898-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When testing whether or not to enable the use of the SMMU, consult the
supported DMA mask rather than the actually configured DMA mask, since
the latter might already have been restricted.

Fixes: 2d9384ff9177 ("drm/tegra: Relax IOMMU usage criteria on old Tegra")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 13 +++++++++++++
 include/linux/host1x.h      |  3 +++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..583cd6e0ae27 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1039,6 +1039,7 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 
 static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
+	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
 	/*
@@ -1076,7 +1077,7 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	 * sufficient and whether or not the host1x is attached to an IOMMU
 	 * doesn't matter.
 	 */
-	if (!domain && dma_get_mask(dev->dev.parent) <= DMA_BIT_MASK(32))
+	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
 		return true;
 
 	return domain != NULL;
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 388bcc2889aa..40a4b9f8b861 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -502,6 +502,19 @@ static void __exit tegra_host1x_exit(void)
 }
 module_exit(tegra_host1x_exit);
 
+/**
+ * host1x_get_dma_mask() - query the supported DMA mask for host1x
+ * @host1x: host1x instance
+ *
+ * Note that this returns the supported DMA mask for host1x, which can be
+ * different from the applicable DMA mask under certain circumstances.
+ */
+u64 host1x_get_dma_mask(struct host1x *host1x)
+{
+	return host1x->info->dma_mask;
+}
+EXPORT_SYMBOL(host1x_get_dma_mask);
+
 MODULE_AUTHOR("Thierry Reding <thierry.reding@avionic-design.de>");
 MODULE_AUTHOR("Terje Bergstrom <tbergstrom@nvidia.com>");
 MODULE_DESCRIPTION("Host1x driver for Tegra products");
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 62d216ff1097..c230b4e70d75 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -17,9 +17,12 @@ enum host1x_class {
 	HOST1X_CLASS_GR3D = 0x60,
 };
 
+struct host1x;
 struct host1x_client;
 struct iommu_group;
 
+u64 host1x_get_dma_mask(struct host1x *host1x);
+
 /**
  * struct host1x_client_ops - host1x client operations
  * @init: host1x client initialization code
-- 
2.24.1

