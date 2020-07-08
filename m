Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1569217EB9
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jul 2020 07:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgGHFAT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jul 2020 01:00:19 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14486 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbgGHFAS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Jul 2020 01:00:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0552770000>; Tue, 07 Jul 2020 21:58:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jul 2020 22:00:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jul 2020 22:00:17 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jul
 2020 05:00:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 8 Jul 2020 05:00:14 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0552de0005>; Tue, 07 Jul 2020 22:00:14 -0700
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <yhsu@nvidia.com>,
        <snikam@nvidia.com>, <praithatha@nvidia.com>, <talho@nvidia.com>,
        <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        <nicoleotsuka@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v10 5/5] iommu/arm-smmu: Add global/context fault implementation hooks
Date:   Tue, 7 Jul 2020 22:00:17 -0700
Message-ID: <20200708050017.31563-6-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708050017.31563-1-vdumpa@nvidia.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594184311; bh=q+IDg4zKgWthMqXSnjoQk3oNZ+m7q2O5x8AX7ZLlnqg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=dIptEjAOoiBK+4HTvMHwsp5hs19Pbj6lkBBG7x8xR0H0hcY3FfaWbIpI4sF6756JD
         XL01AKtmz/SAXTYSmsopdIPIFhs5OCiAbmp9YcpkQZFehzIu0/7gKNf47L3J+4rJ0U
         u269twEDTF3F9NF4be8mp00bLExWnTNx2bR0VXvT4RRugMHcJ7N0Kt5ihLqs67g3t/
         fZ/n4P5rlleJ9rd6OcwJ6aJQ0EE7vV7kmPXDUwRSf6tQKAiuKBxme/jvsItXLKmrWo
         D+u8s2NLD0ZGUzXyvokPtfmSzMHXvxLEAQmvwBTYW2aL/egMlsrYwG+ksO51G+BYoj
         7QVzk1yaSKyIQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add global/context fault hooks to allow vendor specific implementations
override default fault interrupt handlers.

Update NVIDIA implementation to override the default global/context fault
interrupt handlers and handle interrupts across the two ARM MMU-500s that
are programmed identically.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 99 +++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c        | 17 +++++-
 drivers/iommu/arm-smmu.h        |  3 +
 3 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidi=
a.c
index 2f55e5793d34..31368057e9be 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -127,6 +127,103 @@ static int nvidia_smmu_reset(struct arm_smmu_device *=
smmu)
 	return 0;
 }
=20
+static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
+						 struct arm_smmu_device *smmu,
+						 int inst)
+{
+	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
+	void __iomem *gr0_base =3D nvidia_smmu_page(smmu, inst, 0);
+
+	gfsr =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
+	if (!gfsr)
+		return IRQ_NONE;
+
+	gfsynr0 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
+	gfsynr1 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
+	gfsynr2 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
+
+	dev_err_ratelimited(smmu->dev,
+			    "Unexpected global fault, this could be serious\n");
+	dev_err_ratelimited(smmu->dev,
+			    "\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
+			    gfsr, gfsynr0, gfsynr1, gfsynr2);
+
+	writel_relaxed(gfsr, gr0_base + ARM_SMMU_GR0_sGFSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
+{
+	unsigned int inst;
+	irqreturn_t ret =3D IRQ_NONE;
+	struct arm_smmu_device *smmu =3D dev;
+
+	for (inst =3D 0; inst < NUM_SMMU_INSTANCES; inst++) {
+		irqreturn_t irq_ret;
+
+		irq_ret =3D nvidia_smmu_global_fault_inst(irq, smmu, inst);
+		if (irq_ret =3D=3D IRQ_HANDLED)
+			ret =3D IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
+						  struct arm_smmu_device *smmu,
+						  int idx, int inst)
+{
+	u32 fsr, fsynr, cbfrsynra;
+	unsigned long iova;
+	void __iomem *gr1_base =3D nvidia_smmu_page(smmu, inst, 1);
+	void __iomem *cb_base =3D nvidia_smmu_page(smmu, inst, smmu->numpage + id=
x);
+
+	fsr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
+	if (!(fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
+	iova =3D readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
+	cbfrsynra =3D readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	dev_err_ratelimited(smmu->dev,
+			    "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x,=
 cbfrsynra=3D0x%x, cb=3D%d\n",
+			    fsr, iova, fsynr, cbfrsynra, idx);
+
+	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
+{
+	int idx;
+	unsigned int inst;
+	irqreturn_t ret =3D IRQ_NONE;
+	struct arm_smmu_device *smmu;
+	struct iommu_domain *domain =3D dev;
+	struct arm_smmu_domain *smmu_domain;
+
+	smmu_domain =3D container_of(domain, struct arm_smmu_domain, domain);
+	smmu =3D smmu_domain->smmu;
+
+	for (inst =3D 0; inst < NUM_SMMU_INSTANCES; inst++) {
+		irqreturn_t irq_ret;
+
+		/*
+		 * Interrupt line is shared between all contexts.
+		 * Check for faults across all contexts.
+		 */
+		for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
+			irq_ret =3D nvidia_smmu_context_fault_bank(irq, smmu,
+								 idx, inst);
+			if (irq_ret =3D=3D IRQ_HANDLED)
+				ret =3D IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl =3D {
 	.read_reg =3D nvidia_smmu_read_reg,
 	.write_reg =3D nvidia_smmu_write_reg,
@@ -134,6 +231,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl =3D =
{
 	.write_reg64 =3D nvidia_smmu_write_reg64,
 	.reset =3D nvidia_smmu_reset,
 	.tlb_sync =3D nvidia_smmu_tlb_sync,
+	.global_fault =3D nvidia_smmu_global_fault,
+	.context_fault =3D nvidia_smmu_context_fault,
 };
=20
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index c123a5814f70..020afddfaa0f 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -670,6 +670,7 @@ static int arm_smmu_init_domain_context(struct iommu_do=
main *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
+	irqreturn_t (*context_fault)(int irq, void *dev);
=20
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -832,7 +833,13 @@ static int arm_smmu_init_domain_context(struct iommu_d=
omain *domain,
 	 * handler seeing a half-initialised domain state.
 	 */
 	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
-	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
+
+	if (smmu->impl && smmu->impl->context_fault)
+		context_fault =3D smmu->impl->context_fault;
+	else
+		context_fault =3D arm_smmu_context_fault;
+
+	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
 			       IRQF_SHARED, "arm-smmu-context-fault", domain);
 	if (ret < 0) {
 		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
@@ -2105,6 +2112,7 @@ static int arm_smmu_device_probe(struct platform_devi=
ce *pdev)
 	struct arm_smmu_device *smmu;
 	struct device *dev =3D &pdev->dev;
 	int num_irqs, i, err;
+	irqreturn_t (*global_fault)(int irq, void *dev);
=20
 	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2191,9 +2199,14 @@ static int arm_smmu_device_probe(struct platform_dev=
ice *pdev)
 		smmu->num_context_irqs =3D smmu->num_context_banks;
 	}
=20
+	if (smmu->impl && smmu->impl->global_fault)
+		global_fault =3D smmu->impl->global_fault;
+	else
+		global_fault =3D arm_smmu_global_fault;
+
 	for (i =3D 0; i < smmu->num_global_irqs; ++i) {
 		err =3D devm_request_irq(smmu->dev, smmu->irqs[i],
-				       arm_smmu_global_fault,
+				       global_fault,
 				       IRQF_SHARED,
 				       "arm-smmu global fault",
 				       smmu);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index fad63efa1a72..d890a4a968e8 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -18,6 +18,7 @@
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/irqreturn.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -389,6 +390,8 @@ struct arm_smmu_impl {
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
+	irqreturn_t (*global_fault)(int irq, void *dev);
+	irqreturn_t (*context_fault)(int irq, void *dev);
 };
=20
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, in=
t n)
--=20
2.26.2

