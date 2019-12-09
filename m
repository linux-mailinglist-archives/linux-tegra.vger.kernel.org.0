Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96BC116CA9
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfLIMAO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:14 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40062 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfLIMAO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:14 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so14596695wmi.5
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WWB0gv0IKvrIB1DiP2k54lYzCkgCyMMzc45SZZG00Os=;
        b=oGcGDPaluv2mBeTtJ/vs1cgoT3/Yi9JY24nblOBc3AC3qvNYxsD63sgL33QiKkU6iB
         X8TDy4+G7ji6c6xTws1R7ECRQt7lgV1pf4j0kS9Sdtz5iNsgheiBNdCA/nRwGfwdXbbG
         VJ2Z8LK5nmL5Bphivwd4iGrV+HeiLjG7MEfFj7IdaYnvClWNLXBojZUunFPnrqggkhRd
         BOrH0+SRbKFrZS2KpV8qqux1pjbwa4vD9QqOTI6WXkAtigiPhfnORPebg+m9T+4kaaQ7
         YQhzF9WraavPVfSv6a7tq83qWbjQwA4IDb1jm1I0QMSVYBra1DulAO/gWPOt1+5Dec/Z
         RYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WWB0gv0IKvrIB1DiP2k54lYzCkgCyMMzc45SZZG00Os=;
        b=H4Vvp+nEYnECN6Y51LhSi51/+Ip3Bj0jaTUN8Jh2lvwpdxoRTFkgQoyfE0nxd96Wo7
         VveW0PI26Jv3ZgYzgYvOoZCOjiRlRxej2qiarsZwwxsd0zucNrXNomLDBWwpumCe/IND
         UvgEefDq4eXDWOVMCHtSgGIwvJHDps4vvUIDVD3YQHJ3Mov4tisjjCD5UeeLa0LbRxOL
         NdQzN8DO2Gtj4kpXS+mwbQfNr3+2MkRVJYWNcorJonrnC/1ZXXFDS/r87TcEvuh2e3Dg
         SNeaGY4gY8DnE4NSFZ55aTX3Hq4b2qyEX7xdqIB0ykARJ9r5wN5YbSX+gXr9itW1oaey
         6r5w==
X-Gm-Message-State: APjAAAUaFMWTkjD/LleS1rngJkEmpU57/7OzMRdwVj7Ibkjeh1d8tKo1
        kvNxfrGWkJsY1NmO1gbRPSI=
X-Google-Smtp-Source: APXvYqxdw3QGqId0WWIJ8FkEPSj74gaCo0YXXuupNcHzm44v6wyffmecyZxNMEwCEOOhxRKKC/h/QA==
X-Received: by 2002:a1c:4004:: with SMTP id n4mr23578319wma.153.1575892811780;
        Mon, 09 Dec 2019 04:00:11 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c1sm26876206wrs.24.2019.12.09.04.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v3 2/9] iommu: Add dummy dev_iommu_fwspec_get() helper
Date:   Mon,  9 Dec 2019 12:59:58 +0100
Message-Id: <20191209120005.2254786-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
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

Acked-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- remove duplicate struct iommu_fwspec definition

 include/linux/iommu.h | 48 +++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 216e919875ea..bb28453bb09c 100644
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
@@ -634,7 +634,6 @@ int iommu_sva_get_pasid(struct iommu_sva *handle);
 
 struct iommu_ops {};
 struct iommu_group {};
-struct iommu_fwspec {};
 struct iommu_device {};
 struct iommu_fault_param {};
 struct iommu_iotlb_gather {};
@@ -980,6 +979,11 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
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

