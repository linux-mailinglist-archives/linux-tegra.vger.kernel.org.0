Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED8E9ED00F
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBR4r (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52739 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKBR4r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id c17so5187959wmk.2
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B2PT8OgwUzPeHw6hJgNkyoN6vsJ1kDG8Ap5UUKvhze0=;
        b=UoJ1t+XNs6ajs9GVONSz3qXRw34jZ58PHRGKTpcmzpZuD3Rldp27aTujMwoeMc636j
         6eYYSls+GuGPc4z5GkVaQO3S6Uj+JAk1AJNbZM+TWhAk/SsBEScS4O2aTPto/521WH5j
         25s3jNzMOxDZqwDquoQmQ7o9fgs8hKKS+unmnXs8R1E+5dACuL4NtIdc/0COAUc7Rjqq
         LnNZKJ08GAL1/1WZG7VIg5Qn81kVdFOBLfgx6IJp3cX4HP9ICsFdtjrlufZQ8KJZaOSX
         6m5/eagAAZeFQEoHvsGgoUTWm289Fztk2pB7yQ0B0FZEYFg3jod1/YAb+ET6nm25SdMk
         /SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B2PT8OgwUzPeHw6hJgNkyoN6vsJ1kDG8Ap5UUKvhze0=;
        b=Z3VnNk29WigQsPN0OE9OsN25dsAw2FuKLeoyI7qEVe1qbNbVwLFbirKecft4Qm67kW
         TzrK6d4Aae1ogqBdVwSImd8q9eUbecOvE+XlA+GSFjY9v9kjvAXRQutRRLITvrBONpYS
         pydOs4yDXAT+PA4oGWGoqnpPuMtQblx+oFGE/Jd5LrzmPWyHpFMnz5ca0KIBG3q3avbw
         AOqKmK9TSmsiYu/n7Y4eeCkNU3G6S0Xr2JCLZxO11mtvFw52Cfwg1nyETfZBj02pKadP
         l5MQsNGo9iIl8aY/HefnEpAwNsPM7l6pG9ghj21+879D15owo/4f6PeTn1od9qrfawfL
         yK7A==
X-Gm-Message-State: APjAAAVZ5mNU6LZ7z9alh04Gxsj9styb7MZ64Lewa7/oCZmiod2dL33+
        bhHE0ryj/CC4l4TE+AHQ0f4=
X-Google-Smtp-Source: APXvYqwh0vcSVJl/llQBGAobzeyZMsr7O0KniFZ1e9AEUl48sSDcCxY9VqTZMS3MRW5xlWyEDtHt4A==
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr14933173wmf.85.1572717404745;
        Sat, 02 Nov 2019 10:56:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t5sm673642wro.76.2019.11.02.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/9] iommu: Add dummy dev_iommu_fwspec_get() helper
Date:   Sat,  2 Nov 2019 18:56:30 +0100
Message-Id: <20191102175637.3065-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This dummy implementation is useful to avoid a dependency on the
IOMMU_API Kconfig symbol in drivers that can optionally use the IOMMU
API.

In order to fully use this, also move the struct iommu_fwspec definition
out of the IOMMU_API protected region.

Suggested-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/iommu.h | 47 ++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7bf038b371b8..b092e73b2c86 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -190,6 +190,27 @@ struct iommu_sva_ops {
 	iommu_mm_exit_handler_t mm_exit;
 };
 
+/**
+ * struct iommu_fwspec - per-device IOMMU instance data
+ * @ops: ops for this device's IOMMU
+ * @iommu_fwnode: firmware handle for this device's IOMMU
+ * @iommu_priv: IOMMU driver private data for this device
+ * @flags: IOMMU flags associated with this device
+ * @num_ids: number of associated device IDs
+ * @ids: IDs which this device may present to the IOMMU
+ */
+struct iommu_fwspec {
+	const struct iommu_ops	*ops;
+	struct fwnode_handle	*iommu_fwnode;
+	void			*iommu_priv;
+	u32			flags;
+	unsigned int		num_ids;
+	u32			ids[1];
+};
+
+/* ATS is supported */
+#define IOMMU_FWSPEC_PCI_RC_ATS			(1 << 0)
+
 #ifdef CONFIG_IOMMU_API
 
 /**
@@ -565,27 +586,6 @@ extern struct iommu_group *generic_device_group(struct device *dev);
 /* FSL-MC device grouping function */
 struct iommu_group *fsl_mc_device_group(struct device *dev);
 
-/**
- * struct iommu_fwspec - per-device IOMMU instance data
- * @ops: ops for this device's IOMMU
- * @iommu_fwnode: firmware handle for this device's IOMMU
- * @iommu_priv: IOMMU driver private data for this device
- * @flags: IOMMU flags associated with this device
- * @num_ids: number of associated device IDs
- * @ids: IDs which this device may present to the IOMMU
- */
-struct iommu_fwspec {
-	const struct iommu_ops	*ops;
-	struct fwnode_handle	*iommu_fwnode;
-	void			*iommu_priv;
-	u32			flags;
-	unsigned int		num_ids;
-	u32			ids[1];
-};
-
-/* ATS is supported */
-#define IOMMU_FWSPEC_PCI_RC_ATS			(1 << 0)
-
 /**
  * struct iommu_sva - handle to a device-mm bond
  */
@@ -980,6 +980,11 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
 	return NULL;
 }
 
+static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
+{
+	return NULL;
+}
+
 static inline bool
 iommu_dev_has_feature(struct device *dev, enum iommu_dev_features feat)
 {
-- 
2.23.0

