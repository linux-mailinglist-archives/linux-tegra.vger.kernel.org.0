Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091C981291
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 08:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfHEGzC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 02:55:02 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15776 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfHEGzC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 02:55:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d47d2c60000>; Sun, 04 Aug 2019 23:55:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 04 Aug 2019 23:55:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 04 Aug 2019 23:55:01 -0700
Received: from [10.24.44.128] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Aug
 2019 06:54:58 +0000
Subject: Re: [PATCH] firmware: tegra: Move BPMP resume to noirq phase
To:     <talho@nvidia.com>, <sivaramn@nvidia.com>, <stefank@nvidia.com>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <lorenzo.pieralisi@arm.com>, <linux-tegra@vger.kernel.org>,
        <kthota@nvidia.com>, <mmaddireddy@nvidia.com>, <sagar.tv@gmail.com>
References: <20190802061727.18177-1-vidyas@nvidia.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <0882ed22-c6e9-b54a-cedd-2ba2a8d5036f@nvidia.com>
Date:   Mon, 5 Aug 2019 12:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802061727.18177-1-vidyas@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564988102; bh=M+JBWu/EoCADEI1Lhb+zi5vjviXbpZq2N/lkwdWkeZg=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ooNk+TVrgigYKHXKBZLOtY740BrYMLLJmogqQw1qTQaJZf6osqO9iNO8Tg7PEQzrf
         FF4FyhraHOJZ7Zw8KDM8tiKuB9cPXT5ze6wy46RaAalX0Od3u/AaFql4aLBuHTrNFL
         PUH5NKdazbZV0P6HE8f1fMKEFuOA4hZGWpFE98OpYJU1+BrCj90wk81mcFd0thpkFd
         vE5Mx3adeVbC9wB/L/5YC/nEN7bThRmeamk21kx5qP+vDRptPxcHxYmfmuCAUnbS3I
         izhCCdJPdj4TspkrEfIpsXWyDN/7nBSrhiV+CXRozQi6cbyHm1pyf39mJZ3ED13ACf
         HRR24ivWltxjg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/2/2019 11:47 AM, Vidya Sagar wrote:

Timo / Sivaram / Stefan,
Can you please review this change?

Thanks,
Vidya Sagar

> Modules like PCIe in Tegra194 need BPMP firmware services in noirq phase
> and hence move BPMP resume to noirq phase.
> This patch is verified on Tegra210, Tegra186 and Tegra194.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>   drivers/firmware/tegra/bpmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 19c56133234b..6741fcda0c37 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -804,7 +804,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops tegra_bpmp_pm_ops = {
> -	.resume_early = tegra_bpmp_resume,
> +	.resume_noirq = tegra_bpmp_resume,
>   };
>   
>   #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> 

