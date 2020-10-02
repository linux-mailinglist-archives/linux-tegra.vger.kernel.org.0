Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6701280C02
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Oct 2020 03:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387558AbgJBBfM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Oct 2020 21:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387496AbgJBBfM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 21:35:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F45C0613D0;
        Thu,  1 Oct 2020 18:35:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so64083pjh.5;
        Thu, 01 Oct 2020 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QuTtqNy/GP84QPKYRzpNdDYA7fmv6aYIAsbL56h5JWY=;
        b=eHbUXrVxDcAaPer4Yr33EV4LEoyANZC7C0zkg+uzZa8Tw/j1Y3nhq9VFI24d3wcmO0
         3+Rhj1j2ZyCb6o5a+MJVs6fyIK07JmASeXU6KMXdLcY45iX8MEu32zZw/lda/XjUp17V
         QlEOKRyE6NxSBucZ+63t8u+OCgM5CANJ1x+Fy6K6l2WGBeetrrOVO0+NTQBAPE/HLDK+
         sbqFpkFJbnN7EQRdYYedtoNxTBlOzt88cMwakEMoE1+g9lHDJFS/n+n5KHWEOK5WbfRs
         Diin4vhgO3iVYmAdQiIxfnZebffs/Y5383ekUaF5wQUJ0tgazTTDUKLslTvaDr5QOHQp
         ysgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QuTtqNy/GP84QPKYRzpNdDYA7fmv6aYIAsbL56h5JWY=;
        b=bdtd7R56h/qeIQP3lJAcWjjp3t6sGnwAlrfjdtMIibYuD4RB3kqJOCs9Secw1+QuyF
         RsjWfFRYWYPUSgyxhvLfqj32wupXc22T2tK6mROZil30m0acvuBgMNBl0yF6ir5VgQju
         of3fzlmHJRWHOO/dcQxSzOAyHdaEZNApu71kZVP6l7W+1D4GJL+nEPNytIW+JTEqbYoT
         e5o+tEwrVNnt0s6kUS1RnWE+t4o442ORP1IYajfYZUzfoq4pkPTAypZ/gALl/dJIA425
         UcO2tTlLEeaIgj1c8UAj7iWbR0z7eiKfG9BR1OW6vmEDi+0K96dh7yKk00gqvss2sDPn
         C8bg==
X-Gm-Message-State: AOAM533I2HaRu0zPw/wO7CYd8BFOMwvaMBK+zxDW0PxBYlukq9c0+tsW
        gl3vOd9gXKpLg5WgRXnv+7Q=
X-Google-Smtp-Source: ABdhPJzl05x/Kf8MkoUR7qi4dn1Q5lw12MgXwCQJOSpWL7k8uBPoVeaVb4mdArCGDzVllMFMP1WrJg==
X-Received: by 2002:a17:90a:71cb:: with SMTP id m11mr110904pjs.14.1601602510338;
        Thu, 01 Oct 2020 18:35:10 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id g129sm8219536pfb.9.2020.10.01.18.35.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 18:35:09 -0700 (PDT)
Date:   Thu, 1 Oct 2020 18:29:20 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201002012919.GB26971@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <20201001104614.GB3939583@ulmo>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20201001104614.GB3939583@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 12:46:14PM +0200, Thierry Reding wrote:
> > > > -	/*
> > > > -	 * This is a bit of a hack. Ideally we'd want to simply return this
> > > > -	 * value. However the IOMMU registration process will attempt to add
> > > > -	 * all devices to the IOMMU when bus_set_iommu() is called. In order
> > > > -	 * not to rely on global variables to track the IOMMU instance, we
> > > > -	 * set it here so that it can be looked up from the .probe_device()
> > > > -	 * callback via the IOMMU device's .drvdata field.
> > > > -	 */
> > > > -	mc->smmu = smmu;
> > > 
> > > I don't think this is going to work. I distinctly remember putting this
> > > here because we needed access to this before ->probe_device() had been
> > > called for any of the devices.
> > 
> > Do you remember which exact part of code needs to access mc->smmu
> > before ->probe_device() is called?
> > 
> > What I understood is that IOMMU core didn't allow ERR_PTR(-ENODEV)
> > return value from ->probe_device(), previously ->add_device(), to
> > carry on when you added this code/driver:
> >     commit 8918465163171322c77a19d5258a95f56d89d2e4
> >     Author: Thierry Reding <treding@nvidia.com>
> >     Date:   Wed Apr 16 09:24:44 2014 +0200
> >         memory: Add NVIDIA Tegra memory controller support
> > 
> > ..until the core had a change one year later:
> >     commit 38667f18900afe172a4fe44279b132b4140f920f
> >     Author: Joerg Roedel <jroedel@suse.de>
> >     Date:   Mon Jun 29 10:16:08 2015 +0200
> >         iommu: Ignore -ENODEV errors from add_device call-back
> > 
> > As my commit message of this change states, ->probe_device() will
> > be called in from both bus_set_iommu() and really_probe() of each
> > device through of_iommu_configure() -- the later one initializes
> > an fwspec by polling the iommus property in the IOMMU core, same
> > as what we do here in tegra-smmu. If this works, we can probably
> > drop the hack here and get rid of tegra_smmu_configure().
> 
> Looking at this a bit more, I notice that tegra_smmu_configure() does a
> lot of what's already done during of_iommu_configure(), so it'd indeed
> be nice if we could somehow get rid of that. However, like I said, I do
> recall that for DMA/IOMMU we need this prior to ->probe_device(), so it
> isn't clear to me if we can do that.
> 
> So I think in order to make progress we need to check that dropping this
> does indeed still work when we enable DMA/IOMMU (and the preliminary
> patches to pass 1:1 mappings via reserved-memory regions). If so, I
> think it should be safe to remove this.

I am attaching a patch that works with both IOMMU_DOMAIN_UNMANAGED
and IOMMU_DOMAIN_DMA. Would it be possible for you to give a test?

The implementation of getting mc->smmu is using a parent_driver as
I was asking you in the other reply. Yet, it could let us give it a
try.

--45Z9DzgjV8m4Oswq
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-iommu-tegra-smmu-Test.patch"

From 01693c8d4af5abb38bb5ede4b22590a647909868 Mon Sep 17 00:00:00 2001
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Thu, 1 Oct 2020 17:51:26 -0700
Subject: [PATCH] iommu/tegra-smmu: Test

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 141 ++++++++++++-------------------------
 drivers/memory/tegra/mc.c  |   5 +-
 include/soc/tegra/mc.h     |   4 +-
 3 files changed, 51 insertions(+), 99 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6a3ecc334481..ade952d3143c 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -61,6 +61,9 @@ struct tegra_smmu_as {
 	u32 attr;
 };
 
+static const struct iommu_ops tegra_smmu_ops;
+static struct device_driver *parent_driver;
+
 static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
 {
 	return container_of(dom, struct tegra_smmu_as, domain);
@@ -484,60 +487,50 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err = 0;
 
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
-
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
 	unsigned int index = 0;
 
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
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
 
@@ -807,79 +800,40 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
-static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
+static struct tegra_smmu *tegra_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 {
-	struct platform_device *pdev;
 	struct tegra_mc *mc;
+	struct device *dev;
+
+	if (!parent_driver || !fwnode)
+		return NULL;
 
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
+	dev = driver_find_device_by_fwnode(parent_driver, fwnode);
+	if (!dev)
 		return NULL;
 
-	mc = platform_get_drvdata(pdev);
+	put_device(dev);
+	mc = dev_get_drvdata(dev);
 	if (!mc)
 		return NULL;
 
 	return mc->smmu;
 }
 
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
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu;
 
-		of_node_put(args.np);
-		index++;
-	}
+	if (!fwspec)
+		return ERR_PTR(-ENODEV);
 
+	smmu = tegra_smmu_get_by_fwnode(fwspec->iommu_fwnode);
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
 
+	dev_iommu_priv_set(dev, smmu);
+
 	return &smmu->iommu;
 }
 
@@ -1078,27 +1032,22 @@ static void tegra_smmu_debugfs_exit(struct tegra_smmu *smmu)
 
 struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 				    const struct tegra_smmu_soc *soc,
-				    struct tegra_mc *mc)
+				    struct tegra_mc *mc,
+				    struct platform_driver *driver)
 {
 	struct tegra_smmu *smmu;
 	size_t size;
 	u32 value;
 	int err;
 
+	if (!driver)
+		return ERR_PTR(-ENODEV);
+	parent_driver = &driver->driver;
+
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
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
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..586f9134c5b5 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -19,6 +19,8 @@
 
 #include "mc.h"
 
+static struct platform_driver tegra_mc_driver;
+
 static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	{ .compatible = "nvidia,tegra20-mc-gart", .data = &tegra20_mc_soc },
@@ -682,7 +684,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			err);
 
 	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_SMMU) && mc->soc->smmu) {
-		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc);
+		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc,
+					    &tegra_mc_driver);
 		if (IS_ERR(mc->smmu)) {
 			dev_err(&pdev->dev, "failed to probe SMMU: %ld\n",
 				PTR_ERR(mc->smmu));
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..763738f0a5ee 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -80,12 +80,12 @@ struct gart_device;
 #ifdef CONFIG_TEGRA_IOMMU_SMMU
 struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 				    const struct tegra_smmu_soc *soc,
-				    struct tegra_mc *mc);
+				    struct tegra_mc *mc, struct platform_driver *driver);
 void tegra_smmu_remove(struct tegra_smmu *smmu);
 #else
 static inline struct tegra_smmu *
 tegra_smmu_probe(struct device *dev, const struct tegra_smmu_soc *soc,
-		 struct tegra_mc *mc)
+		 struct tegra_mc *mc, struct platform_driver *driver)
 {
 	return NULL;
 }
-- 
2.17.1


--45Z9DzgjV8m4Oswq--
