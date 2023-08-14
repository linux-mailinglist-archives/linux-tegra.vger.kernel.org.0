Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8506277B19C
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Aug 2023 08:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbjHNGda (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Aug 2023 02:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjHNGc7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Aug 2023 02:32:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F228114;
        Sun, 13 Aug 2023 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691994778; x=1723530778;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8GKcCJfcJUphTqzm0WnLK4Rn40GEWwQ/J1t9r2W/Lgo=;
  b=LIEgoB7t7absdD1z8hX7jSQHo1mWCVZSyLpOxnYyxpYD3ZnlERkmkJDo
   hbPMRp+Ws/G70sDdYFXn7y39a1vqpq0tRdanMztPtJRsZIHwHnDHRLvf9
   lMT+vTxsOmfHk+h/xxTIPmnjAay7avZJqlghVmKNHuPdJNx+Zk4Z2bYoW
   NrdJPUKKlhhOG2m2Imv+5f//rfZ+ACFqlMLYizCnYJ51omt4AffeRL2V9
   BKNFGGFVj24hyi7gi5zQJA1qo5jsA+QpwSy1moX9WhdkZXHkRw3l0GA4I
   LfYVDUGICEvkFVivlaIOpxBp83YrgKvKV+iZsOEq5cO8RW4Q5m8vKunfG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="371976492"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="371976492"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="823332925"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="823332925"
Received: from wentaox1-mobl.ccr.corp.intel.com (HELO [10.254.215.205]) ([10.254.215.205])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:32:36 -0700
Message-ID: <8cef9a0d-15ba-f8af-7e22-d4d3063c97bf@linux.intel.com>
Date:   Mon, 14 Aug 2023 14:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc:     baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
References: <17-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <17-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023/8/3 8:08, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index a503ed758ec302..9d7b9d8b4386d4 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -387,6 +387,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
>   	return 0;
>   }
>   
> +static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
> +				      struct device *dev)
> +{
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +	struct qcom_iommu_domain *qcom_domain;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
> +	unsigned int i;
> +
> +	if (domain == identity_domain || !domain)
> +		return 0;
> +
> +	qcom_domain = to_qcom_iommu_domain(domain);
> +	if (WARN_ON(!qcom_domain->iommu))
> +		return -EINVAL;
> +
> +	pm_runtime_get_sync(qcom_iommu->dev);
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
> +
> +		/* Disable the context bank: */
> +		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> +
> +		ctx->domain = NULL;

Does setting ctx->domain to NULL still match this semantics?

> +	}
> +	pm_runtime_put_sync(qcom_iommu->dev);
> +	return 0;
> +}
> +
> +static struct iommu_domain_ops qcom_iommu_identity_ops = {
> +	.attach_dev = qcom_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain qcom_iommu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &qcom_iommu_identity_ops,
> +};
> +
>   static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
>   			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
>   			  int prot, gfp_t gfp, size_t *mapped)
> @@ -553,6 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>   }
>   
>   static const struct iommu_ops qcom_iommu_ops = {
> +	.identity_domain = &qcom_iommu_identity_domain,
>   	.capable	= qcom_iommu_capable,
>   	.domain_alloc	= qcom_iommu_domain_alloc,
>   	.probe_device	= qcom_iommu_probe_device,

Anyway,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
