Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DA6210608
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Jul 2020 10:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgGAIUE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Jul 2020 04:20:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13419 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgGAIUE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Jul 2020 04:20:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efc46d00000>; Wed, 01 Jul 2020 01:18:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 01 Jul 2020 01:20:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 01 Jul 2020 01:20:03 -0700
Received: from [10.26.73.166] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 08:19:56 +0000
Subject: Re: [PATCH v9 3/4] dt-bindings: arm-smmu: add binding for Tegra194
 SMMU
To:     Krishna Reddy <vdumpa@nvidia.com>, <joro@8bytes.org>,
        <will@kernel.org>, <robin.murphy@arm.com>, <robh+dt@kernel.org>,
        <treding@nvidia.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <yhsu@nvidia.com>,
        <snikam@nvidia.com>, <praithatha@nvidia.com>, <talho@nvidia.com>,
        <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <20200630235752.8737-1-vdumpa@nvidia.com>
 <20200630235752.8737-4-vdumpa@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <689714e8-a5bb-7d13-f2f2-ee26b2c53811@nvidia.com>
Date:   Wed, 1 Jul 2020 09:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630235752.8737-4-vdumpa@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593591504; bh=tSDe8LeboRnurzjwRe+5HLTMPSrGI8/MJArXEKpfbZA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RGNBtsFVGdCPynKZU03jKlzrlB0P6BJ0aS4u/xPTgAr9viUfOO9j1Gn0xEnUfgsxJ
         fewKSXXv83xcmBHZh7d2x98lh6f8toxAI1QtW3Jn0bPT5Sf1iE6jZiP9DQppUv18vH
         T144o3M9HGregS5DROpZ6yBnKTJ7flIQ1Mlgue5rUqYMzq46v0YM40OYMMLBw1+Mo+
         BY5QjGQMfJMT0I28dtMaVCUgMgkkzVhDz5dgANA3kihh+lJ3K5yPR+mUAx4Uvd3TEI
         k2HPo9MnnuXnGUlbpHGWsTNA0Xf1GNPAmFAFIsPs9cwzG5swAOhYOVDvEhrdpA6B4E
         3xU9gkacrP2hw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/07/2020 00:57, Krishna Reddy wrote:
> Add binding for NVIDIA's Tegra194 SoC SMMU topology that is based
> on ARM MMU-500.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423b..662c46e16f07d 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,11 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: NVIDIA SoCs that use more than one "arm,mmu-500"
> +        items:
> +          - enum:
> +              - nvidia,tegra194-smmu
> +          - const: arm,mmu-500

We should also address Robin's comments here. I don't think that we ever
want to fail back to just the regular 'arm,mmu-500' and should be should
probably just drop this part.

Jon

-- 
nvpublic
