Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C723426051D
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Sep 2020 21:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgIGTaK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Sep 2020 15:30:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6782 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIGTaK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:30:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5689bc0000>; Mon, 07 Sep 2020 12:27:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:30:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:30:10 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:30:08 +0000
Subject: Re: [PATCH 3/9] dt-bindings: fuse: tegra: Document Tegra234
 compatible string
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-4-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2eea99dc-878e-f941-8a2b-63001121804b@nvidia.com>
Date:   Mon, 7 Sep 2020 20:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-4-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599506876; bh=WHSdgXpp+Nrm1TEANs7zy2yX4KtvPt4/QxwVEUCEnSM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KD38fIqmQlC2e75eJ2IlDAQw85V9ZIZfYpGRKGsorEXVKUSKWlspfvHi4weeM/0Jf
         SRVtqOtAUA5NudLdP1kd4iuAWscU86KXHaEGh5hVTLtblLt4J0ctVdcNtXRBuAExqv
         NCJcRNvhrYwsZ9xSdWDJapaMJtojmOHy78WmzhpmVMQQ6szqXerHgU12r4/girGaZA
         9/YAkXrRwbORro/hSyp0HbR4F4OX3FpWMfQZyRXZ/YrgJCy7NrtfOcXLC5s9+ooQnP
         Tvyfs9fogsUs51Xuj6jg0MrtI4j+zRW+FXefoc8HNBYXBM0WFsxnRHLHOBmxjGAAZu
         ShOmWCkd7rXNw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra234 FUSE block is very similar to that on prior chips but not
> completely compatible. Document the new compatible string.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
> index 2aaf661c04ee..b76cf42639f1 100644
> --- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
> +++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
> @@ -7,6 +7,7 @@ Required properties:
>    For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
>    For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
>    "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
> +  For Tegra234 must conatin "nvidia,tegra234-efuse".
>    Details:
>    nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
>  	due to a hardware bug. Tegra20 also lacks certain information which is
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
