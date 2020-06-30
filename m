Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB0020F09D
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731515AbgF3Ih1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 04:37:27 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17597 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731476AbgF3Ih0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 04:37:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efaf9950000>; Tue, 30 Jun 2020 01:36:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 01:37:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 01:37:26 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 08:37:18 +0000
Subject: Re: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
To:     Krishna Reddy <vdumpa@nvidia.com>
CC:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <treding@nvidia.com>,
        <yhsu@nvidia.com>, <snikam@nvidia.com>, <praithatha@nvidia.com>,
        <talho@nvidia.com>, <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-4-vdumpa@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
Date:   Tue, 30 Jun 2020 09:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630001051.12350-4-vdumpa@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593506197; bh=72sjvS5OeRNzGJemrzzyR9F18Oc7fZfIj/1NnRKYpRE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ET617ItKPJmQZ4OggW+dP3YjoRaXe52rJ9jAGLKIQUJy3aEXp6LQk9LWIE9mhYvtx
         42FDez1ciM7+tNTX9sCKur+62GgByXXDNzH2mVGcydjTQZGYRJ1348qS3XKDWAEkSu
         yjye/IuiSPNEHXDvKoMrCboVoHHl42o5pDmKa4lKtXrKHPxdutKHGRy3vAwlR3XtmQ
         KPV/ed3C1AfrJ6wWbxg0QxUsAE70geTiHmAk5GjlTxfy8KRxClCPfx6gjNSCntjBhE
         DvJTvpQVVKFnK0nMk1vN+xTfnFeHZ2akRuCIchO5eWm7cFi1wNHaQlcknIiWe2A9VS
         tZV0G0cQJ85tw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/06/2020 01:10, Krishna Reddy wrote:
> Add global/context fault hooks to allow NVIDIA SMMU implementation
> handle faults across multiple SMMUs.

Nit ... this is not just for NVIDIA, but this allows anyone to add
custom global/context and fault hooks. So I think that the changelog
should be clear that this change permits custom fault hooks and that
custom fault hooks are needed for the Tegra194 SMMU. You may also want
to say why.

> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 98 +++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.c        | 17 +++++-
>  drivers/iommu/arm-smmu.h        |  3 +
>  3 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
> index 1124f0ac1823a..c9423b4199c65 100644
> --- a/drivers/iommu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -147,6 +147,102 @@ static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> +static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct arm_smmu_domain, domain);
> +}
> +
> +static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
> +					       struct arm_smmu_device *smmu,
> +					       int inst)
> +{
> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
> +	void __iomem *gr0_base = nvidia_smmu_page(smmu, inst, 0);
> +
> +	gfsr = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
> +	if (!gfsr)
> +		return IRQ_NONE;
> +
> +	gfsynr0 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
> +	gfsynr1 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
> +	gfsynr2 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
> +
> +	dev_err_ratelimited(smmu->dev,
> +		"Unexpected global fault, this could be serious\n");
> +	dev_err_ratelimited(smmu->dev,
> +		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
> +		gfsr, gfsynr0, gfsynr1, gfsynr2);
> +
> +	writel_relaxed(gfsr, gr0_base + ARM_SMMU_GR0_sGFSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
> +{
> +	int inst;

Should be unsigned

> +	irqreturn_t irq_ret = IRQ_NONE;
> +	struct arm_smmu_device *smmu = dev;
> +	struct nvidia_smmu *nvidia_smmu = to_nvidia_smmu(smmu);
> +
> +	for (inst = 0; inst < nvidia_smmu->num_inst; inst++) {
> +		irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
> +		if (irq_ret == IRQ_HANDLED)
> +			return irq_ret;

Any chance there could be more than one SMMU faulting by the time we
service the interrupt?

> +	}
> +
> +	return irq_ret;
> +}
> +
> +static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
> +					    struct arm_smmu_device *smmu,
> +					    int idx, int inst)
> +{
> +	u32 fsr, fsynr, cbfrsynra;
> +	unsigned long iova;
> +	void __iomem *gr1_base = nvidia_smmu_page(smmu, inst, 1);
> +	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
> +
> +	fsr = readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
> +	if (!(fsr & ARM_SMMU_FSR_FAULT))
> +		return IRQ_NONE;
> +
> +	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
> +	iova = readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
> +	cbfrsynra = readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(idx));
> +
> +	dev_err_ratelimited(smmu->dev,
> +	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> +			    fsr, iova, fsynr, cbfrsynra, idx);
> +
> +	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
> +{
> +	int inst, idx;

Unsigned

> +	irqreturn_t irq_ret = IRQ_NONE;
> +	struct iommu_domain *domain = dev;
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	for (inst = 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
> +		/*
> +		 * Interrupt line shared between all context faults.
> +		 * Check for faults across all contexts.
> +		 */
> +		for (idx = 0; idx < smmu->num_context_banks; idx++) {
> +			irq_ret = nvidia_smmu_context_fault_bank(irq, smmu,
> +								 idx, inst);
> +
> +			if (irq_ret == IRQ_HANDLED)
> +				return irq_ret;

Any reason why we don't check all banks?

> +		}
> +	}
> +
> +	return irq_ret;
> +}
> +
>  static const struct arm_smmu_impl nvidia_smmu_impl = {
>  	.read_reg = nvidia_smmu_read_reg,
>  	.write_reg = nvidia_smmu_write_reg,
> @@ -154,6 +250,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
>  	.write_reg64 = nvidia_smmu_write_reg64,
>  	.reset = nvidia_smmu_reset,
>  	.tlb_sync = nvidia_smmu_tlb_sync,
> +	.global_fault = nvidia_smmu_global_fault,
> +	.context_fault = nvidia_smmu_context_fault,
>  };
>  
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 243bc4cb2705b..3bb0aba15a356 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	enum io_pgtable_fmt fmt;
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	irqreturn_t (*context_fault)(int irq, void *dev);
>  
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -835,7 +836,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	 * handler seeing a half-initialised domain state.
>  	 */
>  	irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
> -	ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
> +
> +	if (smmu->impl && smmu->impl->context_fault)
> +		context_fault = smmu->impl->context_fault;
> +	else
> +		context_fault = arm_smmu_context_fault;

Why not see the default smmu->impl->context_fault to
arm_smmu_context_fault in arm_smmu_impl_init() and then allow the
various implementations to override as necessary? Then you can get rid
of this context_fault variable here and just use
smmu->impl->context_fault below.

> +
> +	ret = devm_request_irq(smmu->dev, irq, context_fault,
>  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
>  	if (ret < 0) {
>  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
> @@ -2107,6 +2114,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	struct arm_smmu_device *smmu;
>  	struct device *dev = &pdev->dev;
>  	int num_irqs, i, err;
> +	irqreturn_t (*global_fault)(int irq, void *dev);
>  
>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> @@ -2193,9 +2201,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  		smmu->num_context_irqs = smmu->num_context_banks;
>  	}
>  
> +	if (smmu->impl && smmu->impl->global_fault)
> +		global_fault = smmu->impl->global_fault;
> +	else
> +		global_fault = arm_smmu_global_fault;
> +

Same here.

Jon

-- 
nvpublic
