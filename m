Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8B7260522
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Sep 2020 21:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgIGTcN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Sep 2020 15:32:13 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9413 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIGTcM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:32:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568a8a0002>; Mon, 07 Sep 2020 12:31:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:32:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:32:12 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:32:11 +0000
Subject: Re: [PATCH 6/9] soc/tegra: fuse: Implement tegra_is_silicon()
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-7-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c3bff9d8-7b74-3614-177a-09efcc05982f@nvidia.com>
Date:   Mon, 7 Sep 2020 20:32:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-7-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599507082; bh=/YF/3JKdhepIUJQHtp1dC2dHY99EgNC1kkVPQTVClTI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=c7XfpzjXP6tkzhbJBMFDWeto7wxUM01B2i2I4TfwzHeiHbJWUH22dzLDmq6uqI/Bm
         W4elZYXjaXhpYTxnbbdWaazbyQpTutzm8M4l0D+nNtjnPMrEb3KpCcPXrHKzzjHw3f
         Cr+Vh1heASGzIPXm5zwbs+4XtVdRXVV8uhP17/yHoeLfYke8ntdp61GSTMCVvNQbop
         g2lGwIxmdHX6ourZ/zro230hvu7P1StOYXDBOxUzl7cPIaWNQKxQCgtcE0eMo0o/Au
         Sz0IBeAbKJ0H0gEnVUcJ0xRZfhPQqbjQNNH4/s0+JQuq76lkQkEVVJEVfdugPGqjHx
         RNiOZmDK2bdtg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This function can be used by drivers to determine whether code is
> running on silicon or on a simulation platform.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 13 +++++++++++++
>  include/soc/tegra/fuse.h               |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 89f1479b4d0e..be6b7fc169ca 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -52,6 +52,19 @@ u8 tegra_get_platform(void)
>  	return (tegra_read_chipid() >> 20) & 0xf;
>  }
>  
> +bool tegra_is_silicon(void)
> +{
> +	switch (tegra_get_chip_id()) {
> +	case TEGRA194:
> +		if (tegra_get_platform() == 0)
> +			return true;
> +
> +		return false;
> +	}
> +
> +	return false;
> +}
> +

Should we do this the other way around and default to is-silicon?

For devices prior to Tegra194, this will always return false.

Jon

-- 
nvpublic
