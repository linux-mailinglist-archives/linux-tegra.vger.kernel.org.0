Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F037520F496
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 14:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732816AbgF3M1p (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 08:27:45 -0400
Received: from foss.arm.com ([217.140.110.172]:46140 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730689AbgF3M1o (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 08:27:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E26E1FB;
        Tue, 30 Jun 2020 05:27:44 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B98A3F71E;
        Tue, 30 Jun 2020 05:27:38 -0700 (PDT)
Subject: Re: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     joro@8bytes.org, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com,
        snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com,
        bbiswas@nvidia.com, mperttunen@nvidia.com, nicolinc@nvidia.com,
        bhuntsman@nvidia.com, nicoleotsuka@gmail.com
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-3-vdumpa@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
Date:   Tue, 30 Jun 2020 13:27:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630001051.12350-3-vdumpa@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-06-30 01:10, Krishna Reddy wrote:
> Add binding for NVIDIA's Tegra194 SoC SMMU topology that is based
> on ARM MMU-500.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423b..5b2586ac715ed 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,11 @@ properties:
>                 - qcom,sc7180-smmu-500
>                 - qcom,sdm845-smmu-500
>             - const: arm,mmu-500
> +      - description: NVIDIA SoCs that use more than one "arm,mmu-500"

Hmm, there must be a better way to word that to express that it only 
applies to the sets of SMMUs that must be programmed identically, and 
not any other independent MMU-500s that might also happen to be in the 
same SoC.

> +        items:
> +          - enum:
> +              - nvdia,tegra194-smmu
> +          - const: arm,mmu-500

Is the fallback compatible appropriate here? If software treats this as 
a standard MMU-500 it will only program the first instance (because the 
second isn't presented as a separate MMU-500) - is there any way that 
isn't going to blow up?

Robin.

>         - items:
>             - const: arm,mmu-500
>             - const: arm,smmu-v2
> 
