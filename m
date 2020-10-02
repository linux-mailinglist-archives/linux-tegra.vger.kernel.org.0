Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB37280D5F
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Oct 2020 08:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgJBGPB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 2 Oct 2020 02:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgJBGO6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 02:14:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83574C0613D0;
        Thu,  1 Oct 2020 23:14:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k13so554839pfg.1;
        Thu, 01 Oct 2020 23:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6BToyqAJn6bdUpH/19wlrEAhIq+xNGfBQ0wTV/ohxzI=;
        b=r6DqQBsErrSZj9ZPfwKj8eyULRyC5UXbu+ddvPA2bn0hQc40+PguQgSLFmpiZhoIMy
         Ya77AiW6uK3tx/75F8tuHdeScLblls076y0K95WhUbFsZiD8WGa6rhgnvMy3+hM+SGmP
         iyFoTdUXYNsZWGsvvjNlLT+awDrzvtZVCc/Nbkx/P7wZp5I5j7JloGW2EULR9sj7DHR7
         JDwbC7mtp2xz31lH4PtrxzFF49yIvsZm8V8ttAiCL+4mlZzfzXrUyZ0Hni3wjt1wz6KW
         ScnqWd9yArjItv+rkSkaG2Go7f1kFlHSh58yYx9ypbcZfYZPUrqRkMwv6su3YO/czK2x
         3zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6BToyqAJn6bdUpH/19wlrEAhIq+xNGfBQ0wTV/ohxzI=;
        b=gugl10eaU55Ndc3LZ7/ietWv6gwpbB7e//Rg+elseh3XA5rRxsrHvcvU7lMmoVgXGS
         a9M2toeAuTmimqTXEbHc39Ppgpe/oRNPEs2tH3W9ob3Yvvr612yLKNxudZuK15sFDWMx
         V5exgiBCITpAhnLjB61MYbYqE4O4POeTbqleKW6rV2FWgX8cB7N33ZTRPBKTMYPbS4Oo
         aH/asvn2kOEoxfuG1iB5zK81/WK7a/zetqY8hvpQcDg0JgdssCbIv66r5F54Cn1A2QrK
         HueT/tEkV8tFYNpdDjsnQAtF3wfkPcdnKc6yCnwRN1rneLrLUwh6s+Q/mNRk9s6AR342
         AIoQ==
X-Gm-Message-State: AOAM532fjAtPz8POGKpe4IL/N3z0PzDCCzSGDA934PcwSeZnkGBO8+Lw
        1rEbNsgMZNyn8df3fthHG+g=
X-Google-Smtp-Source: ABdhPJxv5lVIKprLIywjJhMTMo/uuq6cqeexUuvfx3VpGWgaKX+In8bs3RrsNeG3aqeXMVwa8TMzTQ==
X-Received: by 2002:a63:f854:: with SMTP id v20mr618324pgj.335.1601619298022;
        Thu, 01 Oct 2020 23:14:58 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id x4sm577429pfm.86.2020.10.01.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:14:57 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Date:   Thu,  1 Oct 2020 23:08:06 -0700
Message-Id: <20201002060807.32138-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002060807.32138-1-nicoleotsuka@gmail.com>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The bus_set_iommu() in tegra_smmu_probe() enumerates all clients
to call in tegra_smmu_probe_device() where each client searches
its DT node for smmu pointer and swgroup ID, so as to configure
an fwspec. But this requires a valid smmu pointer even before mc
and smmu drivers are probed. So in tegra_smmu_probe() we added a
line of code to fill mc->smmu, marking "a bit of a hack".

This works for most of clients in the DTB, however, doesn't work
for a client that doesn't exist in DTB, a PCI device for example.

Actually, if we return ERR_PTR(-ENODEV) in ->probe_device() when
it's called from bus_set_iommu(), iommu core will let everything
carry on. Then when a client gets probed, of_iommu_configure() in
iommu core will search DTB for swgroup ID and call ->of_xlate()
to prepare an fwspec, similar to tegra_smmu_probe_device() and
tegra_smmu_configure(). Then it'll call tegra_smmu_probe_device()
again, and this time we shall return smmu->iommu pointer properly.

So we can get rid of tegra_smmu_find() and tegra_smmu_configure()
along with DT polling code by letting the iommu core handle every
thing, except a problem that we search iommus property in DTB not
only for swgroup ID but also for mc node to get mc->smmu pointer
to call dev_iommu_priv_set() and return the smmu->iommu pointer.
So we'll need to find another way to get smmu pointer.

Referencing the implementation of sun50i-iommu driver, of_xlate()
has client's dev pointer, mc node and swgroup ID. This means that
we can call dev_iommu_priv_set() in of_xlate() instead, so we can
simply get smmu pointer in ->probe_device().

This patch reworks tegra_smmu_probe_device() by:
1) Removing mc->smmu hack in tegra_smmu_probe() so as to return
   ERR_PTR(-ENODEV) in tegra_smmu_probe_device() during stage of
   tegra_smmu_probe/tegra_mc_probe().
2) Moving dev_iommu_priv_set() to of_xlate() so we can get smmu
   pointer in tegra_smmu_probe_device() to replace DTB polling.
3) Removing tegra_smmu_configure() accordingly since iommu core
   takes care of it.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v3->v4
 * Moved dev_iommu_priv_set() to of_xlate() so we don't need
   to poll DTB for smmu pointer.
 * Removed the hack in tegra_smmu_probe() by returning ERR_PTR(
   -ENODEV) in tegra_smmu_probe_device() to let iommu core call
   in again.
 * Removed tegra_smmu_find() and tegra_smmu_configure() as iommu
   core takes care of fwspec.
v2->v3
 * Used devm_tegra_get_memory_controller() to get mc pointer
 * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
v1->v2
 * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
   with tegra_get_memory_controller call.
 * Dropped the hack in tegra_smmu_probe().

 drivers/iommu/tegra-smmu.c | 90 ++++----------------------------------
 1 file changed, 9 insertions(+), 81 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index a573a5151c69..02d02b0c55c4 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -797,75 +797,9 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
-static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
-{
-	struct platform_device *pdev;
-	struct tegra_mc *mc;
-
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return NULL;
-
-	mc = platform_get_drvdata(pdev);
-	if (!mc)
-		return NULL;
-
-	return mc->smmu;
-}
-
-static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
-				struct of_phandle_args *args)
-{
-	const struct iommu_ops *ops = smmu->iommu.ops;
-	int err;
-
-	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
-	if (err < 0) {
-		dev_err(dev, "failed to initialize fwspec: %d\n", err);
-		return err;
-	}
-
-	err = ops->of_xlate(dev, args);
-	if (err < 0) {
-		dev_err(dev, "failed to parse SW group ID: %d\n", err);
-		iommu_fwspec_free(dev);
-		return err;
-	}
-
-	return 0;
-}
-
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
-	struct device_node *np = dev->of_node;
-	struct tegra_smmu *smmu = NULL;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-	int err;
-
-	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					  &args) == 0) {
-		smmu = tegra_smmu_find(args.np);
-		if (smmu) {
-			err = tegra_smmu_configure(smmu, dev, &args);
-			of_node_put(args.np);
-
-			if (err < 0)
-				return ERR_PTR(err);
-
-			/*
-			 * Only a single IOMMU master interface is currently
-			 * supported by the Linux kernel, so abort after the
-			 * first match.
-			 */
-			dev_iommu_priv_set(dev, smmu);
-
-			break;
-		}
-
-		of_node_put(args.np);
-		index++;
-	}
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
@@ -873,10 +807,7 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	return &smmu->iommu;
 }
 
-static void tegra_smmu_release_device(struct device *dev)
-{
-	dev_iommu_priv_set(dev, NULL);
-}
+static void tegra_smmu_release_device(struct device *dev) {}
 
 static const struct tegra_smmu_group_soc *
 tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
@@ -953,8 +884,17 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
+	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
+	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
 	u32 id = args->args[0];
 
+	of_node_put(args->np);
+
+	if (!mc || !mc->smmu)
+		return -EPROBE_DEFER;
+
+	dev_iommu_priv_set(dev, mc->smmu);
+
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
@@ -1079,16 +1017,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	if (!smmu)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * This is a bit of a hack. Ideally we'd want to simply return this
-	 * value. However the IOMMU registration process will attempt to add
-	 * all devices to the IOMMU when bus_set_iommu() is called. In order
-	 * not to rely on global variables to track the IOMMU instance, we
-	 * set it here so that it can be looked up from the .probe_device()
-	 * callback via the IOMMU device's .drvdata field.
-	 */
-	mc->smmu = smmu;
-
 	size = BITS_TO_LONGS(soc->num_asids) * sizeof(long);
 
 	smmu->asids = devm_kzalloc(dev, size, GFP_KERNEL);
-- 
2.17.1

