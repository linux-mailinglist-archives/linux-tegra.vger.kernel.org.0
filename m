Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D833288ED3
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Oct 2020 18:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389761AbgJIQ05 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Oct 2020 12:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQ0x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 12:26:53 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2143C0613D2;
        Fri,  9 Oct 2020 09:26:53 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so4670703pfa.9;
        Fri, 09 Oct 2020 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZWxbRshp8MJG+F1k6j3kgCoRLsMcROB1lfsB8R210UY=;
        b=E+EhZK32vINwNAGQf2aieQU00mOSyr1ajQJGuCIEGPhD9NE7DidmYD/BFJZR8y7us5
         G1ckNixn58zSco7LKFT8561XYO7rDT8K4OKh9XGzNJzT5FkAHVDLyXt/G9rNV9CGGgfO
         Dh3RS68ZLlCVWyCv+cmUQ1smZc4dGocX0heHKc3mq/n1ArjjFOeab0A45FKZntUSRK0N
         KARhvbNPbcNQaxDDP6a83SEgv3zs8HOHJaVBL4u2jaV2QiYalbKwWmM4Iv5b+09MGgLB
         j9UeM+FSNlxvyQhoql5flPjy4qujYt+WPxk+Oq0JQMFDAmwusoB2RjcNoZMfMMWbdhRD
         98UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZWxbRshp8MJG+F1k6j3kgCoRLsMcROB1lfsB8R210UY=;
        b=I90eoCBUWzSgi4XNNX3kT6zMnl6KJfR1qOM3CfFvIQ8zWqfrLwcb9WXQ2yDzKdOmjf
         h3GIGY55dyJoMX0eTrjMgDH5S8Hh3FetkcEUM8iSF2VqmDJaG9Tqprbz5QQ5+gkDz8o+
         O/Rzvr1oAfZB6BU3YrvCM3d9puWGRNx7VCYN4IAVDdA+/3aoffsFvxenFc0+s5zkIBys
         dQhHv+i+wfSR9l1vRq9l1yNh0CIGYAs3Q+xGxlODj7fqq5KJw7qrMwaXXxGfyjoXkuCj
         vFBVK55pMQKdII6QksFeSyeSO4X+LEz1ayFra12+OaGWqL4dILZIy1OuhOzwkHcYpEJi
         JhKg==
X-Gm-Message-State: AOAM5330c7QGY8FiG0qzw7cfqNnIeeVeDQlEV7FHdPgirj+cdIAlSULg
        qs8OUI+mMO4IVmBQqzm5BvQ=
X-Google-Smtp-Source: ABdhPJwZRhY2Z6hroolaHzQc+h0DxfDbvDBlPFlR0p76Xw445Uuw0TfmAu7Ic/cnziBbIKvwpvOJkA==
X-Received: by 2002:a17:90b:4398:: with SMTP id in24mr5233446pjb.236.1602260813269;
        Fri, 09 Oct 2020 09:26:53 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id q24sm9591229pgb.12.2020.10.09.09.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 09:26:52 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
Date:   Fri,  9 Oct 2020 09:19:34 -0700
Message-Id: <20201009161936.23122-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009161936.23122-1-nicoleotsuka@gmail.com>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In tegra_smmu_(de)attach_dev() functions, we poll DTB for each
client's iommus property to get swgroup ID in order to prepare
"as" and enable smmu. Actually tegra_smmu_configure() prepared
an fwspec for each client, and added to the fwspec all swgroup
IDs of client DT node in DTB.

So this patch uses fwspec in tegra_smmu_(de)attach_dev() so as
to replace the redundant DT polling code.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v6->v7:
 * No change
v5->v6:
 * Added Dmitry's Reviewed-by and Tested-by
v4->v5:
 * Removed "index" and "err" assigning to 0
v3->v4:
 * Seperated the change, as a cleanup, from the rework patch
v1->v3:
 * N/A

 drivers/iommu/tegra-smmu.c | 56 ++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6a3ecc334481..297d49f3f80e 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -484,60 +484,50 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-	int err = 0;
-
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
+	unsigned int index;
+	int err;
 
-		of_node_put(args.np);
+	if (!fwspec)
+		return -ENOENT;
 
+	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
-		if (err < 0)
-			return err;
+		if (err)
+			goto disable;
 
-		tegra_smmu_enable(smmu, swgroup, as->id);
-		index++;
+		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
 	if (index == 0)
 		return -ENODEV;
 
 	return 0;
+
+disable:
+	while (index--) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_as_unprepare(smmu, as);
+	}
+
+	return err;
 }
 
 static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = as->smmu;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
+	unsigned int index;
 
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
-
-		of_node_put(args.np);
+	if (!fwspec)
+		return;
 
-		tegra_smmu_disable(smmu, swgroup, as->id);
+	for (index = 0; index < fwspec->num_ids; index++) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
-		index++;
 	}
 }
 
-- 
2.17.1

