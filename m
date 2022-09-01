Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA855A8C33
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Sep 2022 06:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiIAEMZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Sep 2022 00:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbiIAEMS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Sep 2022 00:12:18 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C13162156
        for <linux-tegra@vger.kernel.org>; Wed, 31 Aug 2022 21:12:15 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id t129so16370734pfb.6
        for <linux-tegra@vger.kernel.org>; Wed, 31 Aug 2022 21:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=QYgMza2AaX3AvhmNyfYp8r8eePiZFJ+z36tNuhktPOY=;
        b=zwuLUwmMuCzFGcTeU+KhO7Po+dYGuakY3o9HKfnmfkawrsrwsngweV7o4fUqhvpxJp
         cIa16/6QdDtKkG4yYW25ilVLpfCNv1YTnoq1Y2U3Y6N6e2wMQvSArxK4pqyf8PhTOd4N
         yPHtz2edIldSW1bGAWd0hRYLvME8uXy81bgTdXunMF47S3f6KU/hFl97II/MdWczD/aL
         lpIChxi3c9r4Jfjc9pNA5FMW3T1elqSATx9SeJ5OYDFa5mTEnuADbtELimtsdibjNHZW
         21/86O4Wncgzh7ncjPd6wmusIbtZ5H664vcIRvblli6y78ZvBCbs945kJnyjwSmf7CuE
         imVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=QYgMza2AaX3AvhmNyfYp8r8eePiZFJ+z36tNuhktPOY=;
        b=2uVVRN1NMtmN7VPf+McoK7mX/nijMCDvjnEiiz8A8H0lm3O334vXjHld8YCeFWEK07
         AY7JM6S8yCOBBdKz6xv3R0iA4JSka5C4ekkQ4iZSrulVxwVTUO+QubxSJjVi7OjP4hfg
         UreKWoUs9DTrVE8grmFsX2FRTN7dOgtVAko65GFXd1KhYSt+eEFrULiyX5kafBWjPvml
         wkMqDIP+5Lqsvmodrd/TcSybej4jKzqLHU0wBXm1290jBlwFYyDPL7Y89+vVIulhsD2C
         b3aN/8oU8lK43cz3BKDfm6O/7i0kS1/ASZGRrHTAex6i5Z4Ai1Oz4/y2aOMDxGuBF/y4
         sZjQ==
X-Gm-Message-State: ACgBeo1fstV+dp/38HRYAE6yUeyJ2PQuc4QdXiVOb4eBtT2WqR3Jhz7x
        NM+8oNMydYU2nGxVbCPB9BMe7w==
X-Google-Smtp-Source: AA6agR4mD0JVC7CGxzWeGPzZbkU8rIeCS0T2Lvsa6iPiRzfI719gc0G3G/rio0zITCqgYzXJ1fMQwg==
X-Received: by 2002:a05:6a00:1947:b0:536:6730:7d33 with SMTP id s7-20020a056a00194700b0053667307d33mr29412187pfk.10.1662005533799;
        Wed, 31 Aug 2022 21:12:13 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id 78-20020a621651000000b0052e6d6f3cb7sm12138672pfw.189.2022.08.31.21.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 21:12:12 -0700 (PDT)
Date:   Thu, 1 Sep 2022 09:42:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     cgel.zte@gmail.com
Cc:     rafael@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] cpufreq: tegra194: Remove the unneeded result
 variable
Message-ID: <20220901041210.d34mel5bah65v7bq@vireshk-i7>
References: <20220831033213.302056-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831033213.302056-1-ye.xingchen@zte.com.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-08-22, 03:32, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value smp_call_function_single() directly instead of storing it
>  in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 1216046cf4c2..7e143c06972e 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -314,11 +314,7 @@ static void tegra194_get_cpu_ndiv_sysreg(void *ndiv)
>  
>  static int tegra194_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
>  {
> -	int ret;
> -
> -	ret = smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, &ndiv, true);
> -
> -	return ret;
> +	return smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, &ndiv, true);
>  }
>  
>  static void tegra194_set_cpu_ndiv_sysreg(void *data)

Applied. Thanks.

-- 
viresh
