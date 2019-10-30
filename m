Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C8E9E52
	for <lists+linux-tegra@lfdr.de>; Wed, 30 Oct 2019 16:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfJ3PFx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Oct 2019 11:05:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34182 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3PFx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Oct 2019 11:05:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id 139so3094090ljf.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Oct 2019 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bGA7jzeI+WSL3DCOKTBSMk1Fh+Qqh8rfkLd96X7MeMU=;
        b=U9ZLP+C04jV6AyiqKsohMJ11jXX+BFRc5cPf26fENiDOxBYVHAbTlHhT3kieBmO8/5
         iuwEYl6KgVUBNVEsBoc1yRKw7GNpwICas9vjpAHbJsFPoyf8pQAC7HeIDktipmUb4PwO
         y2STZ/4CEIcBxvVaYjLnz6iNoir220J9FWACwOHTy8fOgVHQvdt/jY6pxq0QWl5MLrkn
         pPgU6kUR4i7xKqBqUicK//Gy7QocPEsacF85FRNaiZUHVAZbFMIFy5miGOWHpxbpRxg1
         dEA38TYhShHQS6Dqf60PgzAQuV/we9qOKPkQ8itu3LZROTGPZIPGbUhPtXWvo7++mXf5
         4d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bGA7jzeI+WSL3DCOKTBSMk1Fh+Qqh8rfkLd96X7MeMU=;
        b=RMHaS54xFeDihWG5PG+x90iOaybJXgoxmnafbx7/DvkqVZzmldR/NC5wjTPGHSwsLA
         V4zdajG0y6+pe9IG+pavkLk3wIBfACq+Zs9fwBUFPfkbkwY6+H+raXhknbeM7+Hwfj20
         209TLnBpJrZ2hrYEIcDGPNVDvTS6KbFf+dmNdReI1B+WpDJ5lVJTOTcRdz1nm9VWwXW6
         kNyDyuKkiwaQ3tV6i0R9gHv4JNdgdStc/PJO8Gg6mCXIYVlGyrFadSc2mCAXrr/9zvMf
         kp5yaBTLF8vAEUGlhAyd4m6tswYgpm/Bf+Di6brXXGqnbyDOiQMKGXpu9biwllGZEzAA
         BWnA==
X-Gm-Message-State: APjAAAUhssnX3P3Tkp6nXI28h5MGROJ6rsY4zJ4PD2YKrC16nB/33Ym5
        KbOtGmKmaY+xiKxRqSV0+g0=
X-Google-Smtp-Source: APXvYqyJVGoNBv8bRQWQgZ4x4zi0fegM6cCiPLIHIjDQJr2OozF3NumX0c0oe8JVZi+ZNJ/Yi3HiOQ==
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr147731ljk.17.1572447950958;
        Wed, 30 Oct 2019 08:05:50 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id 190sm105565ljj.72.2019.10.30.08.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:05:50 -0700 (PDT)
Subject: Re: [PATCH 01/12] memory: tegra: Add gr2d and gr3d to DRM IOMMU group
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
        dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
 <20191028123718.3890217-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ecafd917-bcf7-0f3e-2423-6b79793d56a2@gmail.com>
Date:   Wed, 30 Oct 2019 18:05:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028123718.3890217-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.10.2019 15:37, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> All of the devices making up the Tegra DRM device want to share a single
> IOMMU domain. Put them into a single group to allow them to do that.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/tegra/tegra114.c | 10 ++++++----
>  drivers/memory/tegra/tegra124.c |  8 +++++---
>  drivers/memory/tegra/tegra30.c  | 11 +++++++----
>  3 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
> index ac8351b5beeb..48ef01c3ff90 100644
> --- a/drivers/memory/tegra/tegra114.c
> +++ b/drivers/memory/tegra/tegra114.c
> @@ -909,16 +909,18 @@ static const struct tegra_smmu_swgroup tegra114_swgroups[] = {
>  	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
>  };
>  
> -static const unsigned int tegra114_group_display[] = {
> +static const unsigned int tegra114_group_drm[] = {
>  	TEGRA_SWGROUP_DC,
>  	TEGRA_SWGROUP_DCB,
> +	TEGRA_SWGROUP_G2,
> +	TEGRA_SWGROUP_NV,
>  };
>  
>  static const struct tegra_smmu_group_soc tegra114_groups[] = {
>  	{
> -		.name = "display",
> -		.swgroups = tegra114_group_display,
> -		.num_swgroups = ARRAY_SIZE(tegra114_group_display),
> +		.name = "drm",
> +		.swgroups = tegra114_group_drm,
> +		.num_swgroups = ARRAY_SIZE(tegra114_group_drm),
>  	},
>  };
>  
> diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
> index 5d0ccb2be206..62b30b1b9677 100644
> --- a/drivers/memory/tegra/tegra124.c
> +++ b/drivers/memory/tegra/tegra124.c
> @@ -974,16 +974,18 @@ static const struct tegra_smmu_swgroup tegra124_swgroups[] = {
>  	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
>  };
>  
> -static const unsigned int tegra124_group_display[] = {
> +static const unsigned int tegra124_group_drm[] = {
>  	TEGRA_SWGROUP_DC,
>  	TEGRA_SWGROUP_DCB,
> +	TEGRA_SWGROUP_GPU,
> +	TEGRA_SWGROUP_VIC,
>  };
>  
>  static const struct tegra_smmu_group_soc tegra124_groups[] = {
>  	{
>  		.name = "display",
> -		.swgroups = tegra124_group_display,
> -		.num_swgroups = ARRAY_SIZE(tegra124_group_display),
> +		.swgroups = tegra124_group_drm,
> +		.num_swgroups = ARRAY_SIZE(tegra124_group_drm),
>  	},

The "display" -> "drm" group's renaming is missed for T124.

[snip]
