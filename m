Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB60A3A16
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 17:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfH3PNV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 30 Aug 2019 11:13:21 -0400
Received: from foss.arm.com ([217.140.110.172]:33786 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfH3PNV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Aug 2019 11:13:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1092344;
        Fri, 30 Aug 2019 08:13:20 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F0323F703;
        Fri, 30 Aug 2019 08:13:17 -0700 (PDT)
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add binding for nvidia,smmu-v2
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
        mperttunen@nvidia.com, praithatha@nvidia.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        talho@nvidia.com, yhsu@nvidia.com, linux-tegra@vger.kernel.org,
        treding@nvidia.com, avanbrunt@nvidia.com,
        linux-arm-kernel@lists.infradead.org
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <37034b76-7e3f-5f3c-25b2-696e25127682@arm.com>
Date:   Fri, 30 Aug 2019 16:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/08/2019 23:47, Krishna Reddy wrote:
> Add binding doc for Nvidia's smmu-v2 implementation.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3b..0de3759 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -17,6 +17,7 @@ conditions.
>                           "arm,mmu-401"
>                           "arm,mmu-500"
>                           "cavium,smmu-v2"
> +                        "nidia,smmu-v2"
>                           "qcom,smmu-v2"

I agree with Mikko that the compatible must be at least SoC-specific, 
but potentially even instance-specific (e.g. "nvidia,tegra194-gpu-smmu") 
depending on how many of these parallel-SMMU configurations might be 
hiding in current and future SoCs.

Robin.

>   
>                     depending on the particular implementation and/or the
> 
