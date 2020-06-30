Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFEF920F43C
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 14:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387519AbgF3MOA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 08:14:00 -0400
Received: from foss.arm.com ([217.140.110.172]:45014 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387472AbgF3MN6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 08:13:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66D641FB;
        Tue, 30 Jun 2020 05:13:57 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7644C3F71E;
        Tue, 30 Jun 2020 05:13:54 -0700 (PDT)
Subject: Re: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
To:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Cc:     snikam@nvidia.com, nicoleotsuka@gmail.com, mperttunen@nvidia.com,
        bhuntsman@nvidia.com, will@kernel.org,
        linux-kernel@vger.kernel.org, praithatha@nvidia.com,
        talho@nvidia.com, iommu@lists.linux-foundation.org,
        nicolinc@nvidia.com, linux-tegra@vger.kernel.org, yhsu@nvidia.com,
        treding@nvidia.com, linux-arm-kernel@lists.infradead.org,
        bbiswas@nvidia.com
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-4-vdumpa@nvidia.com>
 <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <6c2ce909-c71b-351f-79f5-b1a4b4c0e4ac@arm.com>
Date:   Tue, 30 Jun 2020 13:13:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-06-30 09:37, Jon Hunter wrote:
> 
> On 30/06/2020 01:10, Krishna Reddy wrote:
>> Add global/context fault hooks to allow NVIDIA SMMU implementation
>> handle faults across multiple SMMUs.
> 
> Nit ... this is not just for NVIDIA, but this allows anyone to add
> custom global/context and fault hooks. So I think that the changelog
> should be clear that this change permits custom fault hooks and that
> custom fault hooks are needed for the Tegra194 SMMU. You may also want
> to say why.
> 
>>
>> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
>> ---
>>   drivers/iommu/arm-smmu-nvidia.c | 98 +++++++++++++++++++++++++++++++++
>>   drivers/iommu/arm-smmu.c        | 17 +++++-
>>   drivers/iommu/arm-smmu.h        |  3 +
>>   3 files changed, 116 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
>> index 1124f0ac1823a..c9423b4199c65 100644
>> --- a/drivers/iommu/arm-smmu-nvidia.c
>> +++ b/drivers/iommu/arm-smmu-nvidia.c
>> @@ -147,6 +147,102 @@ static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
>>   	return 0;
>>   }
>>   
>> +static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>> +{
>> +	return container_of(dom, struct arm_smmu_domain, domain);
>> +}
>> +
>> +static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
>> +					       struct arm_smmu_device *smmu,
>> +					       int inst)
>> +{
>> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
>> +	void __iomem *gr0_base = nvidia_smmu_page(smmu, inst, 0);
>> +
>> +	gfsr = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
>> +	if (!gfsr)
>> +		return IRQ_NONE;
>> +
>> +	gfsynr0 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
>> +	gfsynr1 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
>> +	gfsynr2 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
>> +
>> +	dev_err_ratelimited(smmu->dev,
>> +		"Unexpected global fault, this could be serious\n");
>> +	dev_err_ratelimited(smmu->dev,
>> +		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
>> +		gfsr, gfsynr0, gfsynr1, gfsynr2);
>> +
>> +	writel_relaxed(gfsr, gr0_base + ARM_SMMU_GR0_sGFSR);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
>> +{
>> +	int inst;
> 
> Should be unsigned
> 
>> +	irqreturn_t irq_ret = IRQ_NONE;
>> +	struct arm_smmu_device *smmu = dev;
>> +	struct nvidia_smmu *nvidia_smmu = to_nvidia_smmu(smmu);
>> +
>> +	for (inst = 0; inst < nvidia_smmu->num_inst; inst++) {
>> +		irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
>> +		if (irq_ret == IRQ_HANDLED)
>> +			return irq_ret;
> 
> Any chance there could be more than one SMMU faulting by the time we
> service the interrupt?

It certainly seems plausible if the interconnect is automatically 
load-balancing requests across the SMMU instances - say a driver bug 
caused a buffer to be unmapped too early, there could be many in-flight 
accesses to parts of that buffer that aren't all taking the same path 
and thus could now fault in parallel.

[ And anyone inclined to nitpick global vs. context faults, s/unmap a 
buffer/tear down a domain/ ;) ]

Either way I think it would be easier to reason about if we just handled 
these like a typical shared interrupt and always checked all the instances.

>> +	}
>> +
>> +	return irq_ret;
>> +}
>> +
>> +static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
>> +					    struct arm_smmu_device *smmu,
>> +					    int idx, int inst)
>> +{
>> +	u32 fsr, fsynr, cbfrsynra;
>> +	unsigned long iova;
>> +	void __iomem *gr1_base = nvidia_smmu_page(smmu, inst, 1);
>> +	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
>> +
>> +	fsr = readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
>> +	if (!(fsr & ARM_SMMU_FSR_FAULT))
>> +		return IRQ_NONE;
>> +
>> +	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
>> +	iova = readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
>> +	cbfrsynra = readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(idx));
>> +
>> +	dev_err_ratelimited(smmu->dev,
>> +	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>> +			    fsr, iova, fsynr, cbfrsynra, idx);
>> +
>> +	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
>> +{
>> +	int inst, idx;
> 
> Unsigned
> 
>> +	irqreturn_t irq_ret = IRQ_NONE;
>> +	struct iommu_domain *domain = dev;
>> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +
>> +	for (inst = 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
>> +		/*
>> +		 * Interrupt line shared between all context faults.
>> +		 * Check for faults across all contexts.
>> +		 */
>> +		for (idx = 0; idx < smmu->num_context_banks; idx++) {
>> +			irq_ret = nvidia_smmu_context_fault_bank(irq, smmu,
>> +								 idx, inst);
>> +
>> +			if (irq_ret == IRQ_HANDLED)
>> +				return irq_ret;
> 
> Any reason why we don't check all banks?

As above, we certainly shouldn't bail out without checking the bank for 
the offending domain across all of its instances, and I guess the way 
this works means that we would have to iterate all the banks to achieve 
that.

>> +		}
>> +	}
>> +
>> +	return irq_ret;
>> +}
>> +
>>   static const struct arm_smmu_impl nvidia_smmu_impl = {
>>   	.read_reg = nvidia_smmu_read_reg,
>>   	.write_reg = nvidia_smmu_write_reg,
>> @@ -154,6 +250,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
>>   	.write_reg64 = nvidia_smmu_write_reg64,
>>   	.reset = nvidia_smmu_reset,
>>   	.tlb_sync = nvidia_smmu_tlb_sync,
>> +	.global_fault = nvidia_smmu_global_fault,
>> +	.context_fault = nvidia_smmu_context_fault,
>>   };
>>   
>>   struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 243bc4cb2705b..3bb0aba15a356 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   	enum io_pgtable_fmt fmt;
>>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +	irqreturn_t (*context_fault)(int irq, void *dev);
>>   
>>   	mutex_lock(&smmu_domain->init_mutex);
>>   	if (smmu_domain->smmu)
>> @@ -835,7 +836,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   	 * handler seeing a half-initialised domain state.
>>   	 */
>>   	irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
>> -	ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
>> +
>> +	if (smmu->impl && smmu->impl->context_fault)
>> +		context_fault = smmu->impl->context_fault;
>> +	else
>> +		context_fault = arm_smmu_context_fault;
> 
> Why not see the default smmu->impl->context_fault to
> arm_smmu_context_fault in arm_smmu_impl_init() and then allow the
> various implementations to override as necessary? Then you can get rid
> of this context_fault variable here and just use
> smmu->impl->context_fault below.

Because the default smmu->impl is NULL. And as I've said before, NAK to 
forcing the common case to allocate a set of "quirks" purely to override 
the default IRQ handler with the default IRQ handler ;)

Robin.

>> +
>> +	ret = devm_request_irq(smmu->dev, irq, context_fault,
>>   			       IRQF_SHARED, "arm-smmu-context-fault", domain);
>>   	if (ret < 0) {
>>   		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
>> @@ -2107,6 +2114,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	struct arm_smmu_device *smmu;
>>   	struct device *dev = &pdev->dev;
>>   	int num_irqs, i, err;
>> +	irqreturn_t (*global_fault)(int irq, void *dev);
>>   
>>   	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>   	if (!smmu) {
>> @@ -2193,9 +2201,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   		smmu->num_context_irqs = smmu->num_context_banks;
>>   	}
>>   
>> +	if (smmu->impl && smmu->impl->global_fault)
>> +		global_fault = smmu->impl->global_fault;
>> +	else
>> +		global_fault = arm_smmu_global_fault;
>> +
> 
> Same here.
> 
> Jon
> 
