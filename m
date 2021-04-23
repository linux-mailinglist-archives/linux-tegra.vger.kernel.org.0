Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9D43696EE
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Apr 2021 18:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbhDWQcc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Apr 2021 12:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhDWQcc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 12:32:32 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63E9C061574;
        Fri, 23 Apr 2021 09:31:55 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id j7so21231674eds.8;
        Fri, 23 Apr 2021 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1VY28Z37MPEV6Kt+8joC6jx+HXlldXYlWb0gBBnzDC4=;
        b=qaMHOop5F7+0YNk9A67uQMd5OE8PSCE5QOa1iBh/LMr8E0Tirdwp4pfUQTzGPFHHb5
         9bsEnUCvZY5Y8Qo0pV/pygqnNN1/sag+yxO3r1g0lov6l3mMMNzoaruSt++Df5nsdPPw
         skv0XyQLzKEbtmwLdyJEATdfSAoPjBkP3U7MiVA9wg1VasGe90XASNogAm4F/Q54MYKh
         pxgKoNTtZ4r0V2tLFZOmmGE75xGga+rz0c7muJb4efXBojyTkyGhDMxdJXEXJFfi8IMc
         XollAZMEqOSb9XuxvCCCgpETuygTlrPB5JQIeAxXSQ/Dhr3B1m7eFZ9j1SIF8IeevaCi
         GVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1VY28Z37MPEV6Kt+8joC6jx+HXlldXYlWb0gBBnzDC4=;
        b=q3Hc65BMp/L2QzkGm9B+tRkdm6RTjGX9ST72TuFf9/yBJKqhzAqsaHAamiwkQOclUp
         5rVaJZunGh3U8FLR+BrvajcyW7RI78q5hTrHKLBiFCHpNqm9ZNpDbLnMdq23kPnd6gtb
         +gJrn9prL660QYjzHfhKqDostfY2bfK3wX9KdwO48kgnIwjLQYrphqb68OW5PeYUVOQ0
         uwHQlcRgsdElYNjlwhDSzmxMklRsdMCnAm2sV1L95ql5BSc/4GmWDSfMA8AYXlxwiVVW
         h07Xoz4yBD2PiB1COUYV0+8eTPlBnNu8RH9MutjImx36kcH78uvUGV3+kYFH6JJa+b5H
         qDgg==
X-Gm-Message-State: AOAM530g8AtTVgiDuODD+BfPBIkgRG1XxD3Szr6xAIwwO3fBwHYXSTWP
        I7G2bK5KW9k1HqykrI/rTqk=
X-Google-Smtp-Source: ABdhPJx6kev8Evs6lQORshsQLF8RGAF8MELC3qxbd+9sES40NAGXlFm/g7VleXHaG/jO3m87mjyTYg==
X-Received: by 2002:a05:6402:54f:: with SMTP id i15mr5535218edx.365.1619195514456;
        Fri, 23 Apr 2021 09:31:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o9sm4333335ejg.56.2021.04.23.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:31:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Fri, 23 Apr 2021 18:32:31 +0200
Message-Id: <20210423163234.3651547-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is an implementation that IOMMU drivers can use to obtain reserved
memory regions from a device tree node. It uses the reserved-memory DT
bindings to find the regions associated with a given device. If these
regions are marked accordingly, identity mappings will be created for
them in the IOMMU domain that the devices will be attached to.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- change "active" property to identity mapping flag that is part of the
  memory region specifier (as defined by #memory-region-cells) to allow
  per-reference flags to be used

Changes in v2:
- use "active" property to determine whether direct mappings are needed
---
 drivers/iommu/of_iommu.c | 54 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |  8 ++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a9d2df001149..321ebd5fdaba 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -11,12 +11,15 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/fsl/mc.h>
 
+#include <dt-bindings/reserved-memory.h>
+
 #define NO_IOMMU	1
 
 /**
@@ -240,3 +243,54 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
 	return ops;
 }
+
+/**
+ * of_iommu_get_resv_regions - reserved region driver helper for device tree
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * IOMMU drivers can use this to implement their .get_resv_regions() callback
+ * for memory regions attached to a device tree node. See the reserved-memory
+ * device tree bindings on how to use these:
+ *
+ *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+ */
+void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_phandle_iterator it;
+	int err;
+
+	of_for_each_phandle(&it, err, dev->of_node, "memory-region", "#memory-region-cells", 0) {
+		struct iommu_resv_region *region;
+		struct of_phandle_args args;
+		struct resource res;
+
+		args.args_count = of_phandle_iterator_args(&it, args.args, MAX_PHANDLE_ARGS);
+
+		err = of_address_to_resource(it.node, 0, &res);
+		if (err < 0) {
+			dev_err(dev, "failed to parse memory region %pOF: %d\n",
+				it.node, err);
+			continue;
+		}
+
+		if (args.args_count > 0) {
+			/*
+			 * Active memory regions are expected to be accessed by hardware during
+			 * boot and must therefore have an identity mapping created prior to the
+			 * driver taking control of the hardware. This ensures that non-quiescent
+			 * hardware doesn't cause IOMMU faults during boot.
+			 */
+			if (args.args[0] & MEMORY_REGION_IDENTITY_MAPPING) {
+				region = iommu_alloc_resv_region(res.start, resource_size(&res),
+								 IOMMU_READ | IOMMU_WRITE,
+								 IOMMU_RESV_DIRECT_RELAXABLE);
+				if (!region)
+					continue;
+
+				list_add_tail(&region->list, list);
+			}
+		}
+	}
+}
+EXPORT_SYMBOL(of_iommu_get_resv_regions);
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 16f4b3e87f20..8412437acaac 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -16,6 +16,9 @@ extern const struct iommu_ops *of_iommu_configure(struct device *dev,
 					struct device_node *master_np,
 					const u32 *id);
 
+extern void of_iommu_get_resv_regions(struct device *dev,
+				      struct list_head *list);
+
 #else
 
 static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
@@ -32,6 +35,11 @@ static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
 	return NULL;
 }
 
+static inline void of_iommu_get_resv_regions(struct device *dev,
+					     struct list_head *list)
+{
+}
+
 #endif	/* CONFIG_OF_IOMMU */
 
 #endif /* __OF_IOMMU_H */
-- 
2.30.2

