Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B5721D7EA
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jul 2020 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbgGMOKr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jul 2020 10:10:47 -0400
Received: from foss.arm.com ([217.140.110.172]:37166 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729776AbgGMOKp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jul 2020 10:10:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18D3E30E;
        Mon, 13 Jul 2020 07:10:45 -0700 (PDT)
Received: from [10.57.62.178] (unknown [10.57.62.178])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA2E43F7BB;
        Mon, 13 Jul 2020 07:10:40 -0700 (PDT)
Subject: Re: [PATCH v10 4/5] dt-bindings: arm-smmu: add binding for Tegra194
 SMMU
To:     Krishna Reddy <vdumpa@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Yu-Huan Hsu <YHsu@nvidia.com>,
        Sachin Nikam <Snikam@nvidia.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Bryan Huntsman <bhuntsman@nvidia.com>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-5-vdumpa@nvidia.com> <20200709201348.GA808454@bogus>
 <BYAPR12MB2822514F93F831507A811EE9B3650@BYAPR12MB2822.namprd12.prod.outlook.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c2ab2a0d-419d-555f-c124-2cfa1ecb2a81@arm.com>
Date:   Mon, 13 Jul 2020 15:10:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2822514F93F831507A811EE9B3650@BYAPR12MB2822.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-07-10 21:29, Krishna Reddy wrote:
> Thanks Rob. One question on setting "minItems: ". Please see below.
> 
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - nvidia,tegra194-smmu
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 2
>>> +          maxItems: 2
> 
>> This doesn't work. The main part of the schema already said there's only
>> 1 reg region. This part is ANDed with that, not an override. You need to add an else clause with 'maxItems: 1' and change the base schema to
>> {minItems: 1, maxItems: 2}.
> 
> As the earlier version of base schema doesn't have "minItems: " set, should it be set to 0 for backward compatibility?  Or can it just be omitted setting in base schema as before?

We've always needed at least 1 "reg" specifier in practice, so I don't 
think being backwards-compatible with broken DTs is a concern :)

Robin.

> 
> "else" part to set "maxItems: 1" and setting "maxItems: 2" in base schema is clear to me.
> 
> 
> -KR
> 
