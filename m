Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D141EEE63
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jun 2020 01:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgFDXoM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 4 Jun 2020 19:44:12 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14847 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgFDXoM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Jun 2020 19:44:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed986f30000>; Thu, 04 Jun 2020 16:42:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jun 2020 16:44:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 16:44:12 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jun
 2020 23:44:11 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Jun 2020 23:44:11 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed9874a0000>; Thu, 04 Jun 2020 16:44:10 -0700
From:   Krishna Reddy <vdumpa@nvidia.com>
CC:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <treding@nvidia.com>,
        <yhsu@nvidia.com>, <snikam@nvidia.com>, <praithatha@nvidia.com>,
        <talho@nvidia.com>, <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
Date:   Thu, 4 Jun 2020 16:44:11 -0700
Message-ID: <20200604234414.21912-2-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604234414.21912-1-vdumpa@nvidia.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591314164; bh=XQIW6LdqRHZdrrT9TXLYFgRvS9J1pGHffvjR2zCPYYI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=JUFf//Ct21U1wk8yXzt31RTRTO4ZDm7YH6Z4XUQNdKSjddze2gRyVOrAFHfAHvJaC
         JNv5aBYoxq2ZqhBERTXdlgnQ2qj268HI+dPAj+W7xZqsqT6hp6CF3pJ55SSJ5hdq8T
         N2Ab4DL9pLaXr6OTpa6QJNwCkK54gdKS+W+aNRJcaPoTWltfWjeYOZpxv21suob5hv
         KgZKAvMOLwXAl+YELF8FQbw26VQMr01/x2OHEaciNwXXnKzQIC8Bm6PA57qG80wOIO
         ltkFikmQNx/kq9JsfpBQ8sRV1bkdK9NAS+Tik37qEhO61MqN3rc2lrsw41YpOSZesT
         7BdbBWPR5N7qA==
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

NVIDIA's Tegra194 soc uses two ARM MMU-500s together to interleave
IOVA accesses across them.
Add NVIDIA implementation for dual ARM MMU-500s and add new compatible
string for Tegra194 soc.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 MAINTAINERS                     |   2 +
 drivers/iommu/Makefile          |   2 +-
 drivers/iommu/arm-smmu-impl.c   |   3 +
 drivers/iommu/arm-smmu-nvidia.c | 161 ++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.h        |   1 +
 5 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b7..118da0893c964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16572,9 +16572,11 @@ F:	drivers/i2c/busses/i2c-tegra.c
=20
 TEGRA IOMMU DRIVERS
 M:	Thierry Reding <thierry.reding@gmail.com>
+R:	Krishna Reddy <vdumpa@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
 F:	drivers/iommu/tegra*
+F:	drivers/iommu/arm-smmu-nvidia.c
=20
 TEGRA KBC DRIVER
 M:	Laxman Dewangan <ldewangan@nvidia.com>
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 57cf4ba5e27cb..35542df00da72 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_AMD_IOMMU) +=3D amd_iommu.o amd_iommu_init.o=
 amd_iommu_quirks.o
 obj-$(CONFIG_AMD_IOMMU_DEBUGFS) +=3D amd_iommu_debugfs.o
 obj-$(CONFIG_AMD_IOMMU_V2) +=3D amd_iommu_v2.o
 obj-$(CONFIG_ARM_SMMU) +=3D arm_smmu.o
-arm_smmu-objs +=3D arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
+arm_smmu-objs +=3D arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o arm-smmu-nvi=
dia.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D arm-smmu-v3.o
 obj-$(CONFIG_DMAR_TABLE) +=3D dmar.o
 obj-$(CONFIG_INTEL_IOMMU) +=3D intel-iommu.o intel-pasid.o
diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index c75b9d957b702..52c84c30f83e4 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -160,6 +160,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_s=
mmu_device *smmu)
 	 */
 	switch (smmu->model) {
 	case ARM_MMU500:
+		if (of_device_is_compatible(smmu->dev->of_node,
+					    "nvidia,tegra194-smmu-500"))
+			return nvidia_smmu_impl_init(smmu);
 		smmu->impl =3D &arm_mmu500_impl;
 		break;
 	case CAVIUM_SMMUV2:
diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidi=
a.c
new file mode 100644
index 0000000000000..dafc293a45217
--- /dev/null
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Nvidia ARM SMMU v2 implementation quirks
+// Copyright (C) 2019 NVIDIA CORPORATION.  All rights reserved.
+
+#define pr_fmt(fmt) "nvidia-smmu: " fmt
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "arm-smmu.h"
+
+/* Tegra194 has three ARM MMU-500 Instances.
+ * Two of them are used together for Interleaved IOVA accesses and
+ * used by Non-Isochronous Hw devices for SMMU translations.
+ * Third one is used for SMMU translations from Isochronous HW devices.
+ * It is possible to use this Implementation to program either
+ * all three or two of the instances identically as desired through
+ * DT node.
+ *
+ * Programming all the three instances identically comes with redundant tl=
b
+ * invalidations as all three never need to be tlb invalidated for a HW de=
vice.
+ *
+ * When Linux Kernel supports multiple SMMU devices, The SMMU device used =
for
+ * Isochornous HW devices should be added as a separate ARM MMU-500 device
+ * in DT and be programmed independently for efficient tlb invalidates.
+ *
+ */
+#define MAX_SMMU_INSTANCES 3
+
+#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
+
+struct nvidia_smmu {
+	struct arm_smmu_device	smmu;
+	unsigned int		num_inst;
+	void __iomem		*bases[MAX_SMMU_INSTANCES];
+};
+
+#define to_nvidia_smmu(s) container_of(s, struct nvidia_smmu, smmu)
+
+#define nsmmu_page(smmu, inst, page) \
+	(((inst) ? to_nvidia_smmu(smmu)->bases[(inst)] : smmu->base) + \
+	((page) << smmu->pgshift))
+
+static u32 nsmmu_read_reg(struct arm_smmu_device *smmu,
+			      int page, int offset)
+{
+	return readl_relaxed(nsmmu_page(smmu, 0, page) + offset);
+}
+
+static void nsmmu_write_reg(struct arm_smmu_device *smmu,
+			    int page, int offset, u32 val)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < to_nvidia_smmu(smmu)->num_inst; i++)
+		writel_relaxed(val, nsmmu_page(smmu, i, page) + offset);
+}
+
+static u64 nsmmu_read_reg64(struct arm_smmu_device *smmu,
+				int page, int offset)
+{
+	return readq_relaxed(nsmmu_page(smmu, 0, page) + offset);
+}
+
+static void nsmmu_write_reg64(struct arm_smmu_device *smmu,
+				  int page, int offset, u64 val)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < to_nvidia_smmu(smmu)->num_inst; i++)
+		writeq_relaxed(val, nsmmu_page(smmu, i, page) + offset);
+}
+
+static void nsmmu_tlb_sync(struct arm_smmu_device *smmu, int page,
+			   int sync, int status)
+{
+	u32 reg;
+	unsigned int i;
+	unsigned int spin_cnt, delay;
+
+	arm_smmu_writel(smmu, page, sync, 0);
+
+	for (delay =3D 1; delay < TLB_LOOP_TIMEOUT; delay *=3D 2) {
+		for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			reg =3D 0;
+			for (i =3D 0; i < to_nvidia_smmu(smmu)->num_inst; i++) {
+				reg |=3D readl_relaxed(
+					nsmmu_page(smmu, i, page) + status);
+			}
+			if (!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
+				return;
+			cpu_relax();
+		}
+		udelay(delay);
+	}
+	dev_err_ratelimited(smmu->dev,
+			    "TLB sync timed out -- SMMU may be deadlocked\n");
+}
+
+static int nsmmu_reset(struct arm_smmu_device *smmu)
+{
+	u32 reg;
+	unsigned int i;
+
+	for (i =3D 0; i < to_nvidia_smmu(smmu)->num_inst; i++) {
+		/* clear global FSR */
+		reg =3D readl_relaxed(nsmmu_page(smmu, i, ARM_SMMU_GR0) +
+				    ARM_SMMU_GR0_sGFSR);
+		writel_relaxed(reg, nsmmu_page(smmu, i, ARM_SMMU_GR0) +
+				    ARM_SMMU_GR0_sGFSR);
+	}
+
+	return 0;
+}
+
+static const struct arm_smmu_impl nvidia_smmu_impl =3D {
+	.read_reg =3D nsmmu_read_reg,
+	.write_reg =3D nsmmu_write_reg,
+	.read_reg64 =3D nsmmu_read_reg64,
+	.write_reg64 =3D nsmmu_write_reg64,
+	.reset =3D nsmmu_reset,
+	.tlb_sync =3D nsmmu_tlb_sync,
+};
+
+struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
)
+{
+	unsigned int i;
+	struct nvidia_smmu *nsmmu;
+	struct resource *res;
+	struct device *dev =3D smmu->dev;
+	struct platform_device *pdev =3D to_platform_device(smmu->dev);
+
+	nsmmu =3D devm_kzalloc(smmu->dev, sizeof(*nsmmu), GFP_KERNEL);
+	if (!nsmmu)
+		return ERR_PTR(-ENOMEM);
+
+	nsmmu->smmu =3D *smmu;
+	/* Instance 0 is ioremapped by arm-smmu.c */
+	nsmmu->num_inst =3D 1;
+
+	for (i =3D 1; i < MAX_SMMU_INSTANCES; i++) {
+		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			break;
+		nsmmu->bases[i] =3D devm_ioremap_resource(dev, res);
+		if (IS_ERR(nsmmu->bases[i]))
+			return (struct arm_smmu_device *)nsmmu->bases[i];
+		nsmmu->num_inst++;
+	}
+
+	nsmmu->smmu.impl =3D &nvidia_smmu_impl;
+	devm_kfree(smmu->dev, smmu);
+	pr_info("NVIDIA ARM SMMU Implementation, Instances=3D%d\n",
+		nsmmu->num_inst);
+
+	return &nsmmu->smmu;
+}
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d172c024be618..d88374b68da31 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -451,6 +451,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_devi=
ce *smmu, int page,
=20
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
);
=20
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
=20
--=20
2.26.2

