Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64769349402
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Mar 2021 15:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhCYO1i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Mar 2021 10:27:38 -0400
Received: from foss.arm.com ([217.140.110.172]:50776 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231404AbhCYO1Z (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:27:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18E91143D;
        Thu, 25 Mar 2021 07:27:25 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 840A13F792;
        Thu, 25 Mar 2021 07:27:23 -0700 (PDT)
Subject: Re: [PATCH 5/9] iommu/arm-smmu: tegra: Detect number of instances at
 runtime
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-6-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <2f2039a0-bf7e-9261-62f6-bea118c64b38@arm.com>
Date:   Thu, 25 Mar 2021 14:27:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-03-25 13:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Parse the reg property in device tree and detect the number of instances
> represented by a device tree node. This is subsequently needed in order
> to support single-instance SMMUs with the Tegra implementation because
> additional programming is needed to properly configure the SID override
> registers in the memory controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 49 ++++++++++++++------
>   1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> index 29117444e5a0..5b1170b028f0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
> @@ -20,13 +20,19 @@
>    * The third instance usage is through standard arm-smmu driver itself and
>    * is out of scope of this implementation.
>    */
> -#define NUM_SMMU_INSTANCES 2
> +#define MAX_SMMU_INSTANCES 2
>   
>   struct nvidia_smmu {
> -	struct arm_smmu_device	smmu;
> -	void __iomem		*bases[NUM_SMMU_INSTANCES];
> +	struct arm_smmu_device smmu;
> +	void __iomem *bases[MAX_SMMU_INSTANCES];
> +	unsigned int num_instances;

Surely it would make more sense to just add a second set of 
implementation ops without all the overrides that aren't needed for a 
single instance?

Also note that the binding currently requires the Tegra-specific 
compatible to have exactly two regions.

Robin.

>   };
>   
> +static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *smmu)
> +{
> +	return container_of(smmu, struct nvidia_smmu, smmu);
> +}
> +
>   static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
>   					     unsigned int inst, int page)
>   {
> @@ -47,9 +53,10 @@ static u32 nvidia_smmu_read_reg(struct arm_smmu_device *smmu,
>   static void nvidia_smmu_write_reg(struct arm_smmu_device *smmu,
>   				  int page, int offset, u32 val)
>   {
> +	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
>   	unsigned int i;
>   
> -	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
> +	for (i = 0; i < nvidia->num_instances; i++) {
>   		void __iomem *reg = nvidia_smmu_page(smmu, i, page) + offset;
>   
>   		writel_relaxed(val, reg);
> @@ -67,9 +74,10 @@ static u64 nvidia_smmu_read_reg64(struct arm_smmu_device *smmu,
>   static void nvidia_smmu_write_reg64(struct arm_smmu_device *smmu,
>   				    int page, int offset, u64 val)
>   {
> +	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
>   	unsigned int i;
>   
> -	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
> +	for (i = 0; i < nvidia->num_instances; i++) {
>   		void __iomem *reg = nvidia_smmu_page(smmu, i, page) + offset;
>   
>   		writeq_relaxed(val, reg);
> @@ -79,6 +87,7 @@ static void nvidia_smmu_write_reg64(struct arm_smmu_device *smmu,
>   static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>   				 int sync, int status)
>   {
> +	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
>   	unsigned int delay;
>   
>   	arm_smmu_writel(smmu, page, sync, 0);
> @@ -90,7 +99,7 @@ static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>   			u32 val = 0;
>   			unsigned int i;
>   
> -			for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
> +			for (i = 0; i < nvidia->num_instances; i++) {
>   				void __iomem *reg;
>   
>   				reg = nvidia_smmu_page(smmu, i, page) + status;
> @@ -112,9 +121,10 @@ static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>   
>   static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
>   {
> +	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
>   	unsigned int i;
>   
> -	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
> +	for (i = 0; i < nvidia->num_instances; i++) {
>   		u32 val;
>   		void __iomem *reg = nvidia_smmu_page(smmu, i, ARM_SMMU_GR0) +
>   				    ARM_SMMU_GR0_sGFSR;
> @@ -157,8 +167,9 @@ static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
>   	unsigned int inst;
>   	irqreturn_t ret = IRQ_NONE;
>   	struct arm_smmu_device *smmu = dev;
> +	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
>   
> -	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
> +	for (inst = 0; inst < nvidia->num_instances; inst++) {
>   		irqreturn_t irq_ret;
>   
>   		irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
> @@ -202,11 +213,13 @@ static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
>   	struct arm_smmu_device *smmu;
>   	struct iommu_domain *domain = dev;
>   	struct arm_smmu_domain *smmu_domain;
> +	struct nvidia_smmu *nvidia;
>   
>   	smmu_domain = container_of(domain, struct arm_smmu_domain, domain);
>   	smmu = smmu_domain->smmu;
> +	nvidia = to_nvidia_smmu(smmu);
>   
> -	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
> +	for (inst = 0; inst < nvidia->num_instances; inst++) {
>   		irqreturn_t irq_ret;
>   
>   		/*
> @@ -241,6 +254,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
>   	struct device *dev = smmu->dev;
>   	struct nvidia_smmu *nvidia_smmu;
>   	struct platform_device *pdev = to_platform_device(dev);
> +	unsigned int i;
>   
>   	nvidia_smmu = devm_krealloc(dev, smmu, sizeof(*nvidia_smmu), GFP_KERNEL);
>   	if (!nvidia_smmu)
> @@ -248,14 +262,19 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
>   
>   	/* Instance 0 is ioremapped by arm-smmu.c. */
>   	nvidia_smmu->bases[0] = smmu->base;
> +	nvidia_smmu->num_instances++;
> +
> +	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		if (!res)
> +			break;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!res)
> -		return ERR_PTR(-ENODEV);
> +		nvidia_smmu->bases[i] = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(nvidia_smmu->bases[i]))
> +			return ERR_CAST(nvidia_smmu->bases[i]);
>   
> -	nvidia_smmu->bases[1] = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(nvidia_smmu->bases[1]))
> -		return ERR_CAST(nvidia_smmu->bases[1]);
> +		nvidia_smmu->num_instances++;
> +	}
>   
>   	nvidia_smmu->smmu.impl = &nvidia_smmu_impl;
>   
> 
