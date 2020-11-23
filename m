Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F582BFFE0
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Nov 2020 07:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgKWGRi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Nov 2020 01:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbgKWGRh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 01:17:37 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F98C061A4D
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 22:17:37 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t37so13199209pga.7
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 22:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GKa7W0DjsQScUMdM+fh7P8EBsnhIK0qKVT7JJFmlduM=;
        b=rGEfXEwlr66TrbSIzeEJ5FDjg42pe+KTbVMCt3orA1E7AS+8bNxLN7hgHnv9wZ4zRW
         7tpleeyHmO/Mk8recctOvWkoXB3ku7K//lc6CBgJCg0vWvIt2AJaVorT8KgtJz/s6UB0
         cpghzzT0Whp/cpSh8xdsm+7U0PDuVKeQZYtYxg7x7LSYM7de4ahGiiU9M/u1Byu8drem
         otVZOkwRy7/W7UYjnbAxFwhn3Sd2uxThXBJZ4CVJgiBId/k4K2AClDUHlRFQFeBgjwHm
         rOckwkbQUfwnqqyNo7jur3VrxoBOcrEAz7n+xImPhIOplX5ie4p+LdjYQX3X+I048R3F
         +i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GKa7W0DjsQScUMdM+fh7P8EBsnhIK0qKVT7JJFmlduM=;
        b=NL3uZYb0RLbK2rnCidQUvOPjr4DvtZDRvTOTgjy/mM2BEiQ1FGaqzndw3AyQo+/S4e
         K8Lbcm/uMiFDkcB0Auw0MAg1I08KtuRFN3sLJy9L6zfTRuHOqFiWstjSUzu/5/nSk5MF
         0DILVHQwAxWdn2LEySVOQaJNU9waSvLyv8UezPesscbDACsnRaHlDpoCgN/AsXaUeL42
         2pvv71rbr0P1GLOvMHcEdnn/LiqQnAB8yQvVRdxucYt3hAPi5YODiJjPOigopDp2yP6b
         NrZPcW4l/vdaVS9wxfsJeFLMdyF0ntLRCbE9rQgOPaOBQnFwcU1IADSmhFrWegknfMAF
         MsEw==
X-Gm-Message-State: AOAM5316M0lSvPqHIarb4cTqqhilZAID7VrO21BV8C7N8g3UE9BpN8Wn
        Df7paf1o8unPDzJP4EJZN2Tt3A==
X-Google-Smtp-Source: ABdhPJzlkLlCQ2x4GcvUyoOExAar0nVc9jrP+KcgO26RrmOh/VDHjgc+ePCKgyNUoHpOWBv65Xzzwg==
X-Received: by 2002:a62:52d7:0:b029:18b:7093:fb88 with SMTP id g206-20020a6252d70000b029018b7093fb88mr24458173pfb.76.1606112257122;
        Sun, 22 Nov 2020 22:17:37 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id u197sm10953224pfc.127.2020.11.22.22.17.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 22:17:36 -0800 (PST)
Date:   Mon, 23 Nov 2020 11:47:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 00/19] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20201123061734.mpmkdxzullrh52o7@vireshk-i7>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23-11-20, 03:27, Dmitry Osipenko wrote:
> This series brings initial support for memory interconnect to Tegra20,
> Tegra30 and Tegra124 SoCs.
> 
> For the starter only display controllers and devfreq devices are getting
> interconnect API support, others could be supported later on. The display
> controllers have the biggest demand for interconnect API right now because
> dynamic memory frequency scaling can't be done safely without taking into
> account bandwidth requirement from the displays. In particular this series
> fixes distorted display output on T30 Ouya and T124 TK1 devices.
> 
> Changelog:
> 
> v10 - In a longer run it will be much nicer if we could support EMC
>       hardware versioning on Tegra20 and it's not late to support it now.
>       Hence I added these new patches:
> 
>         dt-bindings: memory: tegra20: emc: Document opp-supported-hw property
>         memory: tegra20: Support hardware versioning and clean up OPP table initialization
> 
>     - Removed error message from tegra30-devfreq driver about missing OPP
>       properties in a device-tree because EMC driver already prints that
>       message and it uses OPP API error code instead of checking DT directly,
>       which is a more correct way of doing that.

Looks good to me (from OPP APIs usage perspective). Thanks for
continuing with this and fixing all the issues Dmitry.

-- 
viresh
