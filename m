Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF6B20F9B0
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 18:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbgF3Qob (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 12:44:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3335 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbgF3Qob (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 12:44:31 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb6bbc0002>; Tue, 30 Jun 2020 09:43:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 09:44:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 30 Jun 2020 09:44:30 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 16:44:25 +0000
Subject: Re: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Krishna Reddy <vdumpa@nvidia.com>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        "Yu-Huan Hsu" <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Bryan Huntsman <bhuntsman@nvidia.com>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <e6da9661-4e62-6e34-ac21-63ff993ca8bc@nvidia.com>
 <BYAPR12MB282210677459B8D62623C642B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <4037efc7-fbed-e8cf-dac7-212c65014e4e@nvidia.com>
Message-ID: <eb0ffc7e-f41b-d17c-6a90-049335098cd2@nvidia.com>
Date:   Tue, 30 Jun 2020 17:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4037efc7-fbed-e8cf-dac7-212c65014e4e@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593535420; bh=wfS2EeHQkmlhZY5U4/UFUr69ArCFndTN9ROhcFPEI1M=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RpzzfzIx5Pvr8kBRvnnxiXZncwQ9u01wYvBZU7qtc0WldUlzAiBfBsBypPux7uaZ7
         Mq2kKQhObMQz4+2w6EMvtTBA2Ze5CTHbAPKzP1ViLUXqbGrxMWtiCASh0ZReWsE5Ml
         KQJdovzVUgyfbtAeQd4TtYuX+9pIP9FMdQcRi1nuCwpLbEIzI583GI2XPALg8/8drf
         zGPquwH0ymfoL/FVTw2J3LhGOh+oMmQ2OGDookibXrLDT6YEKcRBUVw+lhkyqeGSto
         KkUNRaHAYsNB+kcYkssfiGLkwASZSzb9ID3DyV+xlku+sYrTx0K5DXc+wjxbrnqIP5
         iaVGNwznKEgSw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/06/2020 17:32, Jon Hunter wrote:
> On 30/06/2020 17:23, Krishna Reddy wrote:
>>>> +struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device 
>>>> +*smmu) {
>>>> +	unsigned int i;
>> ....
>>>> +	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
>>>> +		struct resource *res;
>>>> +
>>>> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>>>> +		if (!res)
>>>> +			break;
>>
>>> Currently this driver is only supported for Tegra194 which I understand has 3 SMMUs. Therefore, I don't feel that we should fail silently here, I think it is better to return an error if all 3 cannot be initialised.
>>
>> Initialization of all the three SMMU instances is not necessary here.
> 
> That is not what I am saying.
> 
>> The driver can work with all the possible number of instances 1, 2 and 3 based on the DT config though it doesn't make much sense to use it with 1 instance.
>> There is no silent failure here from driver point of view. If there is misconfig in DT, SMMU faults would catch issues.
> 
> I disagree and you should return a proper error here.

OK, well I see what you are saying, but if we intended to support all 3
for Tegra194, then we should ensure all 3 are initialised correctly.

My concern here is testing, because when things break in upstream I am
usually the one that tracks it down. Not having clear warning/error
messages when something is not initialised as expected makes it harder.

It would be better to query the number of SMMUs populated in device-tree
and then ensure that all are initialised correctly.

Jon

-- 
nvpublic
