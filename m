Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7457120B009
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 12:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgFZKuQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 06:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgFZKuQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 06:50:16 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBB3C08C5C1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ztn9cU3Hz2nUeJeffgVLOKOqTt8Y22EoCeHKPw3nA7M=; b=y2PbgC9AK/8gwjBOptepXhQ+Wt
        flrfgX+VsuRaQIdQ/06ForJdZDN7TrzpavdW4gWv9E7wOZDOoFcoUT5iQX+aOG+ltkrF6EwGERbRn
        G5MXUbPi2VvrBm1c1QozGt/WdMwnInTUmMhn2ysU2jdWaAbB1K2066nP6BnZPqjfkbjcJ19I+dQXm
        ZpClBlaSEPOh3fb0ADmasgDkLfDpB32zK9XC9Esq/bdGYFcy4vvoNHfSojk04sr4cwVxXP0QiJ6X4
        9mN8JKMF1Z1VYo+g5DQeef9RYbSNYqZmpkSw0eqg0U0siKsCpTL08hcmZiwh7jgXIaWV8yAyvLfgt
        /sHYh5Xw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jolvx-00074N-NM; Fri, 26 Jun 2020 13:50:13 +0300
Subject: Re: [PATCH] soc/tegra: Add Tegra Soc Version support
To:     Sandipan Patra <spatra@nvidia.com>, treding@nvidia.com,
        jonathanh@nvidia.com
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1593167369-25901-1-git-send-email-spatra@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <64d65736-62c2-de17-5657-389475fff6e2@kapsi.fi>
Date:   Fri, 26 Jun 2020 13:50:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593167369-25901-1-git-send-email-spatra@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/26/20 1:29 PM, Sandipan Patra wrote:
> Add the chip IDs for NVIDIA Tegra186, Tegra194 and Tegra234
> SoC family.

families

> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
>   include/soc/tegra/fuse.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index 252ea20..4a5236b 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2012-2020, NVIDIA CORPORATION.  All rights reserved.
>    */
>   
>   #ifndef __SOC_TEGRA_FUSE_H__
> @@ -12,6 +12,9 @@
>   #define TEGRA124	0x40
>   #define TEGRA132	0x13
>   #define TEGRA210	0x21
> +#define TEGRA186	0x18
> +#define TEGRA194	0x19
> +#define TEGRA234	0x23
>   
>   #define TEGRA_FUSE_SKU_CALIB_0	0xf0
>   #define TEGRA30_FUSE_SATA_CALIB	0x124
> 

Also, can you make the commit message something like "soc/tegra: Add 
defines for Tegra186+ chip IDs"?

thanks,
Mikko
