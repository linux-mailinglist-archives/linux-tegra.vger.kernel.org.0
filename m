Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E2541FF1A
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Oct 2021 03:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhJCBej (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Oct 2021 21:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhJCBei (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 21:34:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC10AC061780;
        Sat,  2 Oct 2021 18:32:51 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id m22so17135270wrb.0;
        Sat, 02 Oct 2021 18:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytSrPE+NR12lrZWB6vcJD04bouRj97mzjhJl6l3sCao=;
        b=cR1LLnvqFCeQUtUUOe8ETTUE0p5SyhWkKm6kGRNtS9lU3rmZgkv3V6/OCERCj6dCrN
         ZDZd8gFp1znhhcv3qyEQ+gs/8h+Y+AzodX5HDopeLq3gd4zohdlg3igPWyJto6GzkcF/
         cWCTRbDpygofFExBGo7U4kKUW4tsEumSE0C6EndqIb/H6mEeZl9o4gcaK5svew5qWBoB
         rv8wDPoJcaX/qktZybimpn/CVpH9Vuo01iuHY5lDOoKhW/fwG53xb2JZpn6zEoihNzLz
         C1Q869GMFMEo0qE9l2emFl4WF8F4YTwdxkfBlDXrSXs5aUeKed4i6t6O9RjgPdQ2YfDE
         Xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytSrPE+NR12lrZWB6vcJD04bouRj97mzjhJl6l3sCao=;
        b=j45h+rrcXtG4KE04v3dOpJMMgk5VIlk0hMVMWsnYcazBPGXPgwuTQcpWI7XWwqaWY0
         LawdqdahWGip1L1q9gcOCnNjgAb97lL14SwxRFFzMYUdxC/gFKrDKMBwW5dnEB2n466D
         SMqJPn4Hujmmwf3TCkpHR8nyBC2df3ObXw70cJABjOQLhx0vVArmppZI4dEQKChgj3Mn
         1oANdBP8GlkXe1mIBOZJp9xbR76CVsloiaGAylLG7D8sCAn7tYsAnMV6ucyxpX9mH22S
         qSvyfV1n/OXhb8COTc7s6dSMnsKpETNlVfyy+rVlg7f35y8WT1vAtnSdrCkIhXvNYvDI
         T4gw==
X-Gm-Message-State: AOAM531d3E/bXTVQyRDsBzQFIgjdODAGO12pHuiURL24nlkzocFaATQD
        XLWVMGZfR+aC3POdwE3zKQs=
X-Google-Smtp-Source: ABdhPJxIaapYkxlEKJh87HIm9pkj7ieeEn4l6z9JySjkeZIx/VPBjWOMWVBgGtIfQ6bC39g2NZ5XQg==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr5863858wrp.172.1633224770566;
        Sat, 02 Oct 2021 18:32:50 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id 20sm12481926wme.46.2021.10.02.18.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 18:32:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/4] memory: Add LPDDR2 configuration helpers
Date:   Sun,  3 Oct 2021 04:32:34 +0300
Message-Id: <20211003013235.2357-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003013235.2357-1-digetx@gmail.com>
References: <20211003013235.2357-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add helpers for reading and parsing standard LPDDR2 properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/jedec_ddr.h      | 21 +++++++++++++++++
 drivers/memory/jedec_ddr_data.c | 42 +++++++++++++++++++++++++++++++++
 drivers/memory/of_memory.c      | 34 ++++++++++++++++++++++++++
 drivers/memory/of_memory.h      |  9 +++++++
 4 files changed, 106 insertions(+)

diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
index e59ccbd982d0..14cef272559e 100644
--- a/drivers/memory/jedec_ddr.h
+++ b/drivers/memory/jedec_ddr.h
@@ -230,4 +230,25 @@ struct lpddr3_min_tck {
 	u32 tMRD;
 };
 
+union lpddr2_basic_config4 {
+	u32 value;
+
+	struct {
+		unsigned int arch_type : 2;
+		unsigned int density : 4;
+		unsigned int io_width : 2;
+	} __packed;
+};
+
+struct lpddr2_configuration {
+	int arch_type;
+	int density;
+	int io_width;
+	int manufacturer_id;
+	int revision_id1;
+	int revision_id2;
+};
+
+const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id);
+
 #endif /* __JEDEC_DDR_H */
diff --git a/drivers/memory/jedec_ddr_data.c b/drivers/memory/jedec_ddr_data.c
index ed601d813175..1f214716ac45 100644
--- a/drivers/memory/jedec_ddr_data.c
+++ b/drivers/memory/jedec_ddr_data.c
@@ -7,6 +7,7 @@
  * Aneesh V <aneesh@ti.com>
  */
 
+#include <dt-bindings/memory/lpddr2.h>
 #include <linux/export.h>
 
 #include "jedec_ddr.h"
@@ -131,3 +132,44 @@ const struct lpddr2_min_tck lpddr2_jedec_min_tck = {
 	.tFAW		= 8
 };
 EXPORT_SYMBOL_GPL(lpddr2_jedec_min_tck);
+
+const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id)
+{
+	switch (manufacturer_id) {
+	case LPDDR2_MANID_SAMSUNG:
+		return "Samsung";
+	case LPDDR2_MANID_QIMONDA:
+		return "Qimonda";
+	case LPDDR2_MANID_ELPIDA:
+		return "Elpida";
+	case LPDDR2_MANID_ETRON:
+		return "Etron";
+	case LPDDR2_MANID_NANYA:
+		return "Nanya";
+	case LPDDR2_MANID_HYNIX:
+		return "Hynix";
+	case LPDDR2_MANID_MOSEL:
+		return "Mosel";
+	case LPDDR2_MANID_WINBOND:
+		return "Winbond";
+	case LPDDR2_MANID_ESMT:
+		return "ESMT";
+	case LPDDR2_MANID_SPANSION:
+		return "Spansion";
+	case LPDDR2_MANID_SST:
+		return "SST";
+	case LPDDR2_MANID_ZMOS:
+		return "ZMOS";
+	case LPDDR2_MANID_INTEL:
+		return "Intel";
+	case LPDDR2_MANID_NUMONYX:
+		return "Numonyx";
+	case LPDDR2_MANID_MICRON:
+		return "Micron";
+	default:
+		break;
+	}
+
+	return "invalid";
+}
+EXPORT_SYMBOL_GPL(lpddr2_jedec_manufacturer);
diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index d9f5437d3bce..8aa777f2a090 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -298,3 +298,37 @@ const struct lpddr3_timings
 	return NULL;
 }
 EXPORT_SYMBOL(of_lpddr3_get_ddr_timings);
+
+/**
+ * of_lpddr2_get_config() - extracts the lpddr2 chip configuration.
+ * @np: Pointer to device tree node containing configuration
+ * @conf: Configuration updated by this function
+ *
+ * Populates lpddr2_configuration structure by extracting data from device
+ * tree node. Returns 0 on success or error code on failure. If property
+ * is missing in device-tree, then the corresponding @conf value is set to
+ * -ENOENT.
+ */
+int of_lpddr2_get_config(struct device_node *np,
+			 struct lpddr2_configuration *conf)
+{
+	int err, ret = -ENOENT;
+
+#define OF_LPDDR2_READ_U32(prop, dtprop) \
+	err = of_property_read_u32(np, dtprop, &conf->prop); \
+	if (err) \
+		conf->prop = -ENOENT; \
+	else \
+		ret = 0
+
+	/* at least one property should be parsed */
+	OF_LPDDR2_READ_U32(manufacturer_id, "jedec,lpddr2-manufacturer-id");
+	OF_LPDDR2_READ_U32(revision_id1, "jedec,lpddr2-revision-id1");
+	OF_LPDDR2_READ_U32(revision_id2, "jedec,lpddr2-revision-id2");
+	OF_LPDDR2_READ_U32(io_width, "jedec,lpddr2-io-width-bits");
+	OF_LPDDR2_READ_U32(density, "jedec,lpddr2-density-mbits");
+	OF_LPDDR2_READ_U32(arch_type, "jedec,lpddr2-type");
+
+	return ret;
+}
+EXPORT_SYMBOL(of_lpddr2_get_config);
diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
index 4a99b232ab0a..95eccc251b04 100644
--- a/drivers/memory/of_memory.h
+++ b/drivers/memory/of_memory.h
@@ -20,6 +20,9 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 const struct lpddr3_timings *
 of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
 			  struct device *dev, u32 device_type, u32 *nr_frequencies);
+
+int of_lpddr2_get_config(struct device_node *np,
+			 struct lpddr2_configuration *conf);
 #else
 static inline const struct lpddr2_min_tck
 	*of_get_min_tck(struct device_node *np, struct device *dev)
@@ -46,6 +49,12 @@ static inline const struct lpddr3_timings
 {
 	return NULL;
 }
+
+static int of_lpddr2_get_config(struct device_node *np,
+				struct lpddr2_configuration *conf)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_OF && CONFIG_DDR */
 
 #endif /* __LINUX_MEMORY_OF_REG_ */
-- 
2.32.0

