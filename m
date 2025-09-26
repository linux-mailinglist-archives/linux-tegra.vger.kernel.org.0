Return-Path: <linux-tegra+bounces-9516-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF6BA35AF
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 12:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD1B1C04C15
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B662F3C00;
	Fri, 26 Sep 2025 10:32:14 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7E92F39AD;
	Fri, 26 Sep 2025 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758882734; cv=none; b=FtPXrbFRQMP1Tjp8it0csTLRxrHUDJWlVXABPHN4PhZXlsOVRD3b00DmS49NSfVNiuEqifXHPa7MZiF0Ken/yFXGo2aJBEoKNkyN6d+c3x0T3y/U5hmt6l+jXCBV7yWng8MvLmodibE1SkT+RhOTz5ocHw+RHVh1259k67yXv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758882734; c=relaxed/simple;
	bh=6UocOWJg0vLw9Liyx+rrcKunzXWNG71nhMscMNqWaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsK9A/IbRKZRD+WzUSLmYrwpjhwLGis0nQBY3TuE2Plb6rrp14f/xt7MUvU14XlMYElwbiWeKPJZ+AsvBcRIEzenZe5oXyT1BCCR9i4XVt4lWV+slk4fREKg1l7Oxnrv4dclu1kvNT4hzeN2lPQ3tA9dmENRxz/lSpgLH8GHYDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3FF8168F;
	Fri, 26 Sep 2025 03:32:03 -0700 (PDT)
Received: from [10.57.32.231] (unknown [10.57.32.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BE2D3F5A1;
	Fri, 26 Sep 2025 03:32:09 -0700 (PDT)
Message-ID: <1ff12bce-1369-48e9-8807-3a7ecd8e1559@arm.com>
Date: Fri, 26 Sep 2025 11:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, suzuki.poulose@arm.com, mark.rutland@arm.com,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 rwiley@nvidia.com, sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-6-bwicaksono@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250923001840.1586078-6-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-23 1:18 am, Besar Wicaksono wrote:
> Support NVIDIA PMU that utilizes the optional event filter2 register.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>   drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++-------
>   1 file changed, 133 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index ac91dc46501d..e06a06d3407b 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -40,10 +40,21 @@
>   
>   struct nv_cspmu_ctx {
>   	const char *name;
> -	u32 filter_mask;
> -	u32 filter_default_val;
> +
>   	struct attribute **event_attr;
>   	struct attribute **format_attr;
> +
> +	u32 filter_mask;
> +	u32 filter_default_val;
> +	u32 filter2_mask;
> +	u32 filter2_default_val;
> +
> +	u32 (*get_filter)(const struct perf_event *event);
> +	u32 (*get_filter2)(const struct perf_event *event);

Callbacks for this seem like complete overkill - you already know 
whether a given implementation cares about each filter via 
.filter{,2}_mask being nonzero, so unless you intend to have wildly 
different event encodings across implementations, a simple conditional 
extension of the existing nv_cspmu_event_filter() logic should be all 
you need.

Thanks,
Robin.

> +
> +	void *data;
> +
> +	int (*init_data)(struct arm_cspmu *cspmu);
>   };
>   
>   static struct attribute *scf_pmu_event_attrs[] = {
> @@ -144,6 +155,7 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
>   static struct attribute *generic_pmu_format_attrs[] = {
>   	ARM_CSPMU_FORMAT_EVENT_ATTR,
>   	ARM_CSPMU_FORMAT_FILTER_ATTR,
> +	ARM_CSPMU_FORMAT_FILTER2_ATTR,
>   	NULL,
>   };
>   
> @@ -184,13 +196,36 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
>   	return filter_val;
>   }
>   
> +static u32 nv_cspmu_event_filter2(const struct perf_event *event)
> +{
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +
> +	const u32 filter_val = event->attr.config2 & ctx->filter2_mask;
> +
> +	if (filter_val == 0)
> +		return ctx->filter2_default_val;
> +
> +	return filter_val;
> +}
> +
>   static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
>   				   const struct perf_event *event)
>   {
> -	u32 filter = nv_cspmu_event_filter(event);
> -	u32 offset = PMEVFILTR + (4 * event->hw.idx);
> +	u32 filter, offset;
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +	offset = 4 * event->hw.idx;
>   
> -	writel(filter, cspmu->base0 + offset);
> +	if (ctx->get_filter) {
> +		filter = ctx->get_filter(event);
> +		writel(filter, cspmu->base0 + PMEVFILTR + offset);
> +	}
> +
> +	if (ctx->get_filter2) {
> +		filter = ctx->get_filter2(event);
> +		writel(filter, cspmu->base0 + PMEVFILT2R + offset);
> +	}
>   }
>   
>   static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> @@ -210,74 +245,120 @@ enum nv_cspmu_name_fmt {
>   struct nv_cspmu_match {
>   	u32 prodid;
>   	u32 prodid_mask;
> -	u64 filter_mask;
> -	u32 filter_default_val;
>   	const char *name_pattern;
>   	enum nv_cspmu_name_fmt name_fmt;
> -	struct attribute **event_attr;
> -	struct attribute **format_attr;
> +	struct nv_cspmu_ctx template_ctx;
> +	struct arm_cspmu_impl_ops ops;
>   };
>   
>   static const struct nv_cspmu_match nv_cspmu_match[] = {
>   	{
>   	  .prodid = 0x10300000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
> -	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_pcie_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = pcie_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = pcie_pmu_format_attrs,
> +		.filter_mask = NV_PCIE_FILTER_ID_MASK,
> +		.filter_default_val = NV_PCIE_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10400000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10500000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10600000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
> -	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_cnvlink_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = cnvlink_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = cnvlink_pmu_format_attrs,
> +		.filter_mask = NV_CNVL_FILTER_ID_MASK,
> +		.filter_default_val = NV_CNVL_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x2CF00000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = 0x0,
> -	  .filter_default_val = 0x0,
>   	  .name_pattern = "nvidia_scf_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = scf_pmu_event_attrs,
> -	  .format_attr = scf_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = scf_pmu_event_attrs,
> +		.format_attr = scf_pmu_format_attrs,
> +		.filter_mask = 0x0,
> +		.filter_default_val = 0x0,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0,
>   	  .prodid_mask = 0,
> -	  .filter_mask = NV_GENERIC_FILTER_ID_MASK,
> -	  .filter_default_val = NV_GENERIC_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_uncore_pmu_%u",
>   	  .name_fmt = NAME_FMT_GENERIC,
> -	  .event_attr = generic_pmu_event_attrs,
> -	  .format_attr = generic_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = generic_pmu_event_attrs,
> +		.format_attr = generic_pmu_format_attrs,
> +		.filter_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = nv_cspmu_event_filter2,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   };
>   
> @@ -310,6 +391,14 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
>   	return name;
>   }
>   
> +#define SET_OP(name, impl, match, default_op) \
> +	do { \
> +		if (match->ops.name) \
> +			impl->name = match->ops.name; \
> +		else if (default_op != NULL) \
> +			impl->name = default_op; \
> +	} while (false)
> +
>   static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
>   {
>   	struct nv_cspmu_ctx *ctx;
> @@ -330,20 +419,21 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
>   			break;
>   	}
>   
> -	ctx->name		= nv_cspmu_format_name(cspmu, match);
> -	ctx->filter_mask	= match->filter_mask;
> -	ctx->filter_default_val = match->filter_default_val;
> -	ctx->event_attr		= match->event_attr;
> -	ctx->format_attr	= match->format_attr;
> +	/* Initialize the context with the matched template. */
> +	memcpy(ctx, &match->template_ctx, sizeof(struct nv_cspmu_ctx));
> +	ctx->name = nv_cspmu_format_name(cspmu, match);
>   
>   	cspmu->impl.ctx = ctx;
>   
>   	/* NVIDIA specific callbacks. */
> -	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
> -	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
> -	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
> -	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
> -	impl_ops->get_name			= nv_cspmu_get_name;
> +	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
> +	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
> +	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
> +	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
> +	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
> +
> +	if (ctx->init_data)
> +		return ctx->init_data(cspmu);
>   
>   	return 0;
>   }

