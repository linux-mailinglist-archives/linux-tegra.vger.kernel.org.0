Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F3A1EEE73
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jun 2020 01:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgFDXoV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 4 Jun 2020 19:44:21 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11082 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgFDXoU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Jun 2020 19:44:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed986f10000>; Thu, 04 Jun 2020 16:42:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jun 2020 16:44:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 16:44:20 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jun
 2020 23:44:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Jun 2020 23:44:12 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed9874b0004>; Thu, 04 Jun 2020 16:44:12 -0700
From:   Krishna Reddy <vdumpa@nvidia.com>
CC:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <treding@nvidia.com>,
        <yhsu@nvidia.com>, <snikam@nvidia.com>, <praithatha@nvidia.com>,
        <talho@nvidia.com>, <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v6 3/4] iommu/arm-smmu: Add global/context fault implementation hooks
Date:   Thu, 4 Jun 2020 16:44:13 -0700
Message-ID: <20200604234414.21912-4-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604234414.21912-1-vdumpa@nvidia.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591314161; bh=XEWwDzSnAreryGBzc4HvqeqSxvljF9DfDJ/mUCpyvzo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=rYHPOU57msb4RCk8eRt+ENwtGN4XZ/hOkC/h6CV8GaqKF58Bam7mp90CBkR3vSXTu
         YBv5kw7EThAaiZ8hjUUhypdMWwciqXuujteYLmRr/26Aq5VQM50QpEYnArfRQb5rkJ
         cMdItgoiqq6ugCEbIjAqalAdjDKLpeDzQdK9TLD3YGzVX/dIQq7/YeC1saIRwsS89E
         z7NQm97haox01RTaDGdfLdBA9TJM63gRT9+bVeI+4QB5CM/IlGkHMBrZ5L6lofD2vO
         /uPBXMOV7/w5OpT1/4/HYA5hAzesNRbYPXoh+bNT2Vp+BokYudRud6pbmX54mrsQ6q
         5YdjcpxRv6B+w==
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add global/context fault hooks to allow NVIDIA SMMU implementation
handle faults across multiple SMMUs.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 100 ++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c        |  11 +++-
 drivers/iommu/arm-smmu.h        |   3 +
 3 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidi=
a.c
index dafc293a45217..5999b6a770992 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -117,6 +117,104 @@ static int nsmmu_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
=20
+static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct arm_smmu_domain, domain);
+}
+
+static irqreturn_t nsmmu_global_fault_inst(int irq,
+					       struct arm_smmu_device *smmu,
+					       int inst)
+{
+	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
+
+	gfsr =3D readl_relaxed(nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
+	gfsynr0 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR0);
+	gfsynr1 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR1);
+	gfsynr2 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR2);
+
+	if (!gfsr)
+		return IRQ_NONE;
+
+	dev_err_ratelimited(smmu->dev,
+		"Unexpected global fault, this could be serious\n");
+	dev_err_ratelimited(smmu->dev,
+		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
+		gfsr, gfsynr0, gfsynr1, gfsynr2);
+
+	writel_relaxed(gfsr, nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nsmmu_global_fault(int irq, void *dev)
+{
+	int inst;
+	irqreturn_t irq_ret =3D IRQ_NONE;
+	struct arm_smmu_device *smmu =3D dev;
+
+	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
+		irq_ret =3D nsmmu_global_fault_inst(irq, smmu, inst);
+		if (irq_ret =3D=3D IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	return irq_ret;
+}
+
+static irqreturn_t nsmmu_context_fault_bank(int irq,
+					    struct arm_smmu_device *smmu,
+					    int idx, int inst)
+{
+	u32 fsr, fsynr, cbfrsynra;
+	unsigned long iova;
+
+	fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
+	if (!(fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr =3D readl_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			      ARM_SMMU_CB_FSYNR0);
+	iova =3D readq_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			     ARM_SMMU_CB_FAR);
+	cbfrsynra =3D readl_relaxed(nsmmu_page(smmu, inst, 1) +
+				  ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	dev_err_ratelimited(smmu->dev,
+	"Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x, cbfrs=
ynra=3D0x%x, cb=3D%d\n",
+			    fsr, iova, fsynr, cbfrsynra, idx);
+
+	writel_relaxed(fsr, nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			    ARM_SMMU_CB_FSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nsmmu_context_fault(int irq, void *dev)
+{
+	int inst, idx;
+	irqreturn_t irq_ret =3D IRQ_NONE;
+	struct iommu_domain *domain =3D dev;
+	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
+		/* Interrupt line shared between all context faults.
+		 * Check for faults across all contexts.
+		 */
+		for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
+			irq_ret =3D nsmmu_context_fault_bank(irq, smmu,
+							   idx, inst);
+
+			if (irq_ret =3D=3D IRQ_HANDLED)
+				return irq_ret;
+		}
+	}
+
+	return irq_ret;
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl =3D {
 	.read_reg =3D nsmmu_read_reg,
 	.write_reg =3D nsmmu_write_reg,
@@ -124,6 +222,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl =3D =
{
 	.write_reg64 =3D nsmmu_write_reg64,
 	.reset =3D nsmmu_reset,
 	.tlb_sync =3D nsmmu_tlb_sync,
+	.global_fault =3D nsmmu_global_fault,
+	.context_fault =3D nsmmu_context_fault,
 };
=20
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705b..d720e1e191176 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_do=
main *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
+	irqreturn_t (*context_fault)(int irq, void *dev);
=20
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -835,7 +836,9 @@ static int arm_smmu_init_domain_context(struct iommu_do=
main *domain,
 	 * handler seeing a half-initialised domain state.
 	 */
 	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
-	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
+	context_fault =3D (smmu->impl && smmu->impl->context_fault) ?
+			 smmu->impl->context_fault : arm_smmu_context_fault;
+	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
 			       IRQF_SHARED, "arm-smmu-context-fault", domain);
 	if (ret < 0) {
 		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
@@ -2107,6 +2110,7 @@ static int arm_smmu_device_probe(struct platform_devi=
ce *pdev)
 	struct arm_smmu_device *smmu;
 	struct device *dev =3D &pdev->dev;
 	int num_irqs, i, err;
+	irqreturn_t (*global_fault)(int irq, void *dev);
=20
 	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2193,9 +2197,12 @@ static int arm_smmu_device_probe(struct platform_dev=
ice *pdev)
 		smmu->num_context_irqs =3D smmu->num_context_banks;
 	}
=20
+	global_fault =3D (smmu->impl && smmu->impl->global_fault) ?
+			smmu->impl->global_fault : arm_smmu_global_fault;
+
 	for (i =3D 0; i < smmu->num_global_irqs; ++i) {
 		err =3D devm_request_irq(smmu->dev, smmu->irqs[i],
-				       arm_smmu_global_fault,
+				       global_fault,
 				       IRQF_SHARED,
 				       "arm-smmu global fault",
 				       smmu);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d88374b68da31..f8ce34c07d961 100644
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
@@ -387,6 +388,8 @@ struct arm_smmu_impl {
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

