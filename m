Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE5E63EC34
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Dec 2022 10:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLAJUR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Dec 2022 04:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiLAJUP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Dec 2022 04:20:15 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651CF73424
        for <linux-tegra@vger.kernel.org>; Thu,  1 Dec 2022 01:20:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id s196so1157745pgs.3
        for <linux-tegra@vger.kernel.org>; Thu, 01 Dec 2022 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5COQrmAFX80Rt9/QM8jDMmpKU72o7nnxyNe4BluLOMQ=;
        b=rXzzzyCGtE2MiaqDV3YOQFFJnBtfFZXPm412NZoX9eFQsYO6V1LQGMt0V9dsZbk7D7
         uZlD6U4sAjq1JhJYXGHx3DlPXxnnkQYtnxQ9jvlSQfrPNNCYc/u7/w6mUksCvDsEY7j/
         nC1N/Bx/O9tH2YDxsvfrnubO4aSaSkJ3ks80it9KxIiq/JFTWPzrbOmNd/Sh7DxW0hEe
         LvIanTk+/EGREAdtBb6n2i48zATDKGypwryeccQsd8odzySVMUzd7q8RAuzMLAq4bGrF
         3iGhKyUFo40Gi/iVZyzqv14i4ngqRXfhS8GJ3Kf9xv7PSmsMrEljIX4S2y2n9nWVPwhZ
         m39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5COQrmAFX80Rt9/QM8jDMmpKU72o7nnxyNe4BluLOMQ=;
        b=cmA8bKPkGnwGS9Ah9pTLaFN4NZLwiPqtRR4SNi2yaSQRrOptiB4Exh+/a57u7FLpIe
         s8+p7Y4H+Rj9rWpqHHEYzdzFfWxpCcXR3/nQGw/bcf9vgd+gAQzj4G4sjE4bofaRt+Ek
         MBOoc4XAcMWcBhKCEOpulRA5D807h0qOnp/oRHcVjVLnKjgsFgcEKg1L9j88Z3yy8GZl
         3SJ+Dor3RP070fkzmFs4qD1D30RmVemXzWRZOE63a2dU/I3b2YmgRZlXlEoNnI5ajZtQ
         uvo75MG3q22oFORczNoWYu1V2ya2sYxB0XLGMkKK8Egh/3xTlGmVXWd2jgpjGBQRJX6+
         JPPA==
X-Gm-Message-State: ANoB5pn0gwaGKVHkHm1LwoPe2Ivak04rpZj1Su41wU5zodtA2ffRvZhi
        /b0N9Y9B4I7m7nMtQjR1WZGeTQ==
X-Google-Smtp-Source: AA0mqf6XZ6BIBIaTNJzI3h5545GwZMXPWSEEOR6kemnJDSWPfoZxJpIHr12pfUHNGP8pI05+jEUT+A==
X-Received: by 2002:a63:e444:0:b0:477:6a3a:e614 with SMTP id i4-20020a63e444000000b004776a3ae614mr40676499pgk.81.1669886410907;
        Thu, 01 Dec 2022 01:20:10 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id i190-20020a6287c7000000b0056c704abca7sm2714966pfe.220.2022.12.01.01.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:20:10 -0800 (PST)
Date:   Thu, 1 Dec 2022 14:50:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Use flexible array to simplify memory
 allocation
Message-ID: <20221201092008.2nainxhjpxnsptin@vireshk-i7>
References: <e39752476d02605b2be46cab7115f71255ce13a8.1668949256.git.christophe.jaillet@wanadoo.fr>
 <f6b75a33df6f5fd94da3cfecb1e9e7590bf8cd37.1668963937.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b75a33df6f5fd94da3cfecb1e9e7590bf8cd37.1668963937.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-11-22, 18:19, Christophe JAILLET wrote:
> Use flexible array to simplify memory allocation.
> It saves some memory, avoids an indirection when reading the 'clusters'
> array and removes some LoC.
> 
> 
> Detailed explanation:
> ====================
> Knowing that:
>   - each devm_ allocation over-allocates 40 bytes for internal needs
>   - Some rounding is done by the memory allocator on 8, 16, 32, 64, 96,
>     128, 192, 256, 512, 1024, 2048, 4096, 8192 boundaries
> 
> and that:
>   - sizeof(struct tegra186_cpufreq_data) = 24
>   - sizeof(struct tegra186_cpufreq_cluster) = 16
> 
> Memory allocations in tegra186_cpufreq_probe() are:
>   data:           (24 + 40) = 64 		      => 64 bytes
>   data->clusters: (2 * 16 + 40) = 72     => 96 bytes
> So a total of 160 bytes are allocated.
> 56 for the real need, 80 for internal uses and 24 are wasted.
> 
> 
> If 'struct tegra186_cpufreq_data' is reordered so that 'clusters' is a
> flexible array:
>   - it saves one pointer in the structure
>   - only one allocation is needed
> 
> So, only 96 bytes are allocated:
>   16 + 2 * 16 + 40 = 88  => 96 bytes
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied. Thanks.

-- 
viresh
