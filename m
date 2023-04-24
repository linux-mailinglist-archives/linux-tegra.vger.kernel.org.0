Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481026E5D18
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Apr 2023 11:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjDRJNW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Apr 2023 05:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjDRJNU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Apr 2023 05:13:20 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832A44ED5
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 02:13:18 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso1554672b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681809198; x=1684401198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbleKyCRtEj4mzfFg8I15iJYzLocd2tmdYnO3kTlaTM=;
        b=mAR79v7Tn0gnysG30TB5j3Pp0X26z8pZv0JEzF+Tqkz49IEzlC+s0Yyv7WXhbv4yYq
         F+TDUy6I52Y5dNVvbGC7sgkiB70fCfGKJlCoZViRHiaAbukG2YT+GJkxE/GlePzswAmj
         DNwAMDwz5K8+vf+eK6BFlJCdxRf3BnXXBPMLVkGlDfyZLZ8bW09Og+LrCRbjDjweZatT
         rrOygmPKKhxnJxCNahihy09XwykQM7h3R76R9LF6A5lVDUcVPX8gCWWpWo69b+hpjABp
         7kgpJntY9UpqB8kDuD8Gz/rE5x9ChJESOIYcBuBskXljHfr7c/GgsMLtudPLTw8IB1e4
         ApOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809198; x=1684401198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbleKyCRtEj4mzfFg8I15iJYzLocd2tmdYnO3kTlaTM=;
        b=bsp/UtpWw+T62ZDJCIzDkBHnm/idfK7Ta1e8cG3S9GNwxAHtaBVyr4Mhl0boVPZbH0
         uVEEcIzM1weByjpwfzdH/AIX6RP0C4PuZZ1WJGlECzM3gHcDVJFi2vcjiSZ0HFZFnFKO
         CjVQYjfYbJ2eyuAOptgiv5kt7QDb4TjDl8XOdFyo8aALtvNn5DQdsr3s5ix8wDUaHm81
         I9WmKmxM3LxGyRTKEFoFirrqbLsNUbqkuP20lwP8Yv7AWUoe/LyIRdH7XJSINQgFZZtB
         fmh4raXaj4j2+sGjg4/e5H2jOKRKJuHxKJ7oLzAUvUhQrrJLYVCQDy2j5zGGqNaRchEn
         4Dzg==
X-Gm-Message-State: AAQBX9dwO0NVqJqQTdZoSC/+Bd2QcGvxgEM9gn7D3T7stx7I35WWwhM0
        hfM8F3bpByTxFP3A8nwZiwRpoQ==
X-Google-Smtp-Source: AKy350btit3r+ik6rSegfaTgfcFeOECknK0pFDr3Uu7rl6nEAw1H+XBYxFE0VoXAoRGBuSsBsAHVLA==
X-Received: by 2002:a17:902:8e82:b0:1a6:9762:6eee with SMTP id bg2-20020a1709028e8200b001a697626eeemr1390525plb.40.1681809197881;
        Tue, 18 Apr 2023 02:13:17 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902d70b00b001a66bf1406bsm9129056ply.144.2023.04.18.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:13:17 -0700 (PDT)
Date:   Tue, 18 Apr 2023 14:43:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     treding@nvidia.com, krzysztof.kozlowski@linaro.org,
        dmitry.osipenko@collabora.com, rafael@kernel.org,
        jonathanh@nvidia.com, robh+dt@kernel.org, lpieralisi@kernel.org,
        helgaas@kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        mmaddireddy@nvidia.com, kw@linux.com, bhelgaas@google.com,
        vidyas@nvidia.com, sanjayc@nvidia.com, ksitaraman@nvidia.com,
        ishah@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch v6 6/9] cpufreq: tegra194: add OPP support and set
 bandwidth
Message-ID: <20230418091315.bxh4hp6g3vekdi2r@vireshk-i7>
References: <20230411110002.19824-1-sumitg@nvidia.com>
 <20230411110002.19824-7-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411110002.19824-7-sumitg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-04-23, 16:29, Sumit Gupta wrote:
> Add support to use OPP table from DT in Tegra194 cpufreq driver.
> Tegra SoC's receive the frequency lookup table (LUT) from BPMP-FW.
> Cross check the OPP's present in DT against the LUT from BPMP-FW
> and enable only those DT OPP's which are present in LUT also.
> 
> The OPP table in DT has CPU Frequency to bandwidth mapping where
> the bandwidth value is per MC channel. DRAM bandwidth depends on the
> number of MC channels which can vary as per the boot configuration.
> This per channel bandwidth from OPP table will be later converted by
> MC driver to final bandwidth value by multiplying with number of
> channels before sending the request to BPMP-FW.
> 
> If OPP table is not present in DT, then use the LUT from BPMP-FW
> directy as the CPU frequency table and not do the DRAM frequency
> scaling which is same as the current behavior.
> 
> Now, as the CPU Frequency table is being controlling through OPP
> table in DT. Keeping fewer entries in the table will create less
> frequency steps and can help to scale fast to high frequencies
> when required.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 156 ++++++++++++++++++++++++++---
>  1 file changed, 143 insertions(+), 13 deletions(-)

Can this be applied independently of the rest of the series ?

-- 
viresh
