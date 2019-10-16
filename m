Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F38B3D8FF3
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbfJPLud (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:50:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33765 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfJPLud (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:50:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so4502603wme.0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KxMKHYwy35NNoeyYDHpxCJLWi0KbH8LhZBAxPloA92g=;
        b=OsFUbu3suqoYDFuGTEzUavtATxC8zNR4L+kz9eKi26eAFXbGqTtNxSvf4Q4FRrf+yO
         PDJcYMY0+Xk693/MAziYz0CmpU8ZyD+c7MoIPmibbY1DZIXkxk8aCVLBzPCqBxy64yEl
         dAK+lCRIi1AIiiNN4WdbvlZ23wHUp1c9CFJDoI/cgb+hDh7j459FKLvKbn+fwbrE7yg4
         7q1ovTiu7R7P0h+XbK0Mt+F7PAihKlQk+tAxzmN2JDwUwHV/0U/ARYCfacmemST85nPn
         JRaYj+loR68HiBwhsqnS5MeoG/bJ9VvZrcY3ItfgaMjvDgE65VXow+WcKKf+0WsDPLQm
         gXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxMKHYwy35NNoeyYDHpxCJLWi0KbH8LhZBAxPloA92g=;
        b=YGwAHUUI9dZ0eGqvICrEBI3G05ogIOJqZaHs7ddPuwK1TqSbclLkDQlW+pGGqZE0Y2
         VPwkX6ywqpiOcC/vNuLog6CBE8dEtgdJZNNSByVCTRSJAiH7A0tWSgBS+WKdP2iwx1NM
         Vd3VLE5G8e9Cof23ej+kpvKzq3+U2eQkHyUb7EjrUh8eryiAIPmPGjV1BvSQDMVKVUhU
         YbsWZXrg6YK+ym8c06e0gm992Lkv5ozJ+db4HGqzMvpC0aeaug7ViVQjRRQjpT1WdXiP
         Xu53v85D0yR+ZR6B9nxX2Ua2lomfEtsHf5ArjQnveYRIbzlQGlN/Lz3ktbSR7jpA4RXh
         yNGg==
X-Gm-Message-State: APjAAAUqdZoQC4Vm4xMHvAoUWz4l1Cxdq4UcZr36cgN3tQVBD1NAj5V5
        XEm8WTVD7HbcF8Hb0fviCds=
X-Google-Smtp-Source: APXvYqyYpKxhBiddMFkqlwoqXwAOqQLv7ut1wSH5oGmFDVdWwDuqiL1WO7pERb65z/XmMOT5r0EU2A==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr3305915wmd.75.1571226631215;
        Wed, 16 Oct 2019 04:50:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r7sm23662073wrt.28.2019.10.16.04.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:50:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] iommu/tegra-smmu: Fix client enablement order
Date:   Wed, 16 Oct 2019 13:50:25 +0200
Message-Id: <20191016115026.1768745-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115026.1768745-1-thierry.reding@gmail.com>
References: <20191016115026.1768745-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Navneet Kumar <navneetk@nvidia.com>

Enable clients' translation only after setting up the swgroups.

Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 03e667480ec6..9425d01a95ac 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -351,6 +351,20 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 	unsigned int i;
 	u32 value;
 
+	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	if (group) {
+		value = smmu_readl(smmu, group->reg);
+		value &= ~SMMU_ASID_MASK;
+		value |= SMMU_ASID_VALUE(asid);
+		value |= SMMU_ASID_ENABLE;
+		smmu_writel(smmu, value, group->reg);
+	} else {
+		pr_warn("%s group from swgroup %u not found\n", __func__,
+				swgroup);
+		/* No point moving ahead if group was not found */
+		return;
+	}
+
 	for (i = 0; i < smmu->soc->num_clients; i++) {
 		const struct tegra_mc_client *client = &smmu->soc->clients[i];
 
@@ -361,15 +375,6 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value |= BIT(client->smmu.bit);
 		smmu_writel(smmu, value, client->smmu.reg);
 	}
-
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
-	if (group) {
-		value = smmu_readl(smmu, group->reg);
-		value &= ~SMMU_ASID_MASK;
-		value |= SMMU_ASID_VALUE(asid);
-		value |= SMMU_ASID_ENABLE;
-		smmu_writel(smmu, value, group->reg);
-	}
 }
 
 static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
-- 
2.23.0

