Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45BC2B7002
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Nov 2020 21:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgKQUYn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Nov 2020 15:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgKQUYm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 15:24:42 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13154C0617A7
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2020 12:24:41 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so4696649wmg.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2020 12:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=uFgfIH0qmM2n17BDKaKrcq4LBODq5k4QOoezQr/yK4Q=;
        b=vJmRBtG5Y4PKYnYzUVh08Dqvpcn/A+iQlTefDkvBSaY/otn7EDLv0dIIj3ExHDw5TK
         DJhn0fmMls/fo3Ji04nfqYpC6VAJIrSLNF1zevXLRp+Mqs0gIX3k1ay250TfmDCvRB05
         +OFGUIWqHJivI8tvxU/N+BXqMuYAmxnqziUr/zXER+4xntRWIfLL4Km6b98Y3TvV59GU
         eCTzi5TRJcLVXq0HVatVqEhWOZJHM4JeETvtJEpY6E3ejXSsyHLJMnRl9ptM2VzXUngX
         y3G3hvj79F6xHWtKigSGV3YGOmPS8F7zoviWPz5zt2J2EGLFG8jcg5kblMW5AUYS5yq7
         YUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uFgfIH0qmM2n17BDKaKrcq4LBODq5k4QOoezQr/yK4Q=;
        b=BDb4ekBaKXi8hT22RWqxr92CbvxhqVUSxGn9gOFGXJuMzvhNf52sbI6fmQMhg0I3Dc
         r7wbkQeyPuh9nfb3Q1+h9QPhHwCCOg5ciTzLhmBynKR/94VV56xGdvk7cno/Jg9UNqz1
         Mp6B29vm8TBOUbpRElANpmJlUKYm3FMbCR56JrwxQCnbNwy57QojQufyvU9hG8mmHV7C
         UGIDUcRKBJetUlivWhXQIvFnQGy+UhFQa30XF4nCmLfYaQqCcMPLQEClzZxq332S4Ckj
         1nUsL5rsBN222C2pC2uwgxQnoLbQ85gfIHdYMSZR/nm2Bf4DCQI56EZjwYbHbB3K5z3f
         nosQ==
X-Gm-Message-State: AOAM533FexQJGqH9OAu+G0NtvWbS9N/5SdIsstFSBiLnYtopG6qiZBXB
        7SeuYqNYyAsYbsCj8ZeGDVtN0w==
X-Google-Smtp-Source: ABdhPJwcGefASVcjHgpreQsZnk+jCTM8HC7WIOgyOmgrLL/gpuFF2XEZQHvIGAjfywFtjECtmDfZ7g==
X-Received: by 2002:a1c:2643:: with SMTP id m64mr903602wmm.28.1605644679580;
        Tue, 17 Nov 2020 12:24:39 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
        by smtp.googlemail.com with ESMTPSA id m18sm27902466wru.37.2020.11.17.12.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 12:24:38 -0800 (PST)
Subject: Re: [PATCH v9 01/17] memory: tegra30: Support interconnect framework
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
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
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-2-digetx@gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
Date:   Tue, 17 Nov 2020 22:24:37 +0200
MIME-Version: 1.0
In-Reply-To: <20201115212922.4390-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you working on this!

On 15.11.20 23:29, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS. MC driver now
> supports tuning of memory arbitration latency, which needs to be done
> for ISO memory clients, like a Display client for example.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/memory/tegra/Kconfig       |   1 +
>   drivers/memory/tegra/tegra30-emc.c | 349 +++++++++++++++++++++++++++--
>   drivers/memory/tegra/tegra30.c     | 173 +++++++++++++-
>   3 files changed, 501 insertions(+), 22 deletions(-)
> 
[..]> diff --git a/drivers/memory/tegra/tegra30.c 
b/drivers/memory/tegra/tegra30.c
> index d0314f29608d..ea849003014b 100644
> --- a/drivers/memory/tegra/tegra30.c
> +++ b/drivers/memory/tegra/tegra30.c
[..]
> +
> +static int tegra30_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_mc *mc = icc_provider_to_tegra_mc(src->provider);
> +	const struct tegra_mc_client *client = &mc->soc->clients[src->id];
> +	u64 peak_bandwidth = icc_units_to_bps(src->peak_bw);
> +
> +	/*
> +	 * Skip pre-initialization that is done by icc_node_add(), which sets
> +	 * bandwidth to maximum for all clients before drivers are loaded.
> +	 *
> +	 * This doesn't make sense for us because we don't have drivers for all
> +	 * clients and it's okay to keep configuration left from bootloader
> +	 * during boot, at least for today.
> +	 */
> +	if (src == dst)
> +		return 0;

Nit: The "proper" way to express this should be to implement the
.get_bw() callback to return zero as initial average/peak bandwidth.
I'm wondering if this will work here?

The rest looks good to me!

Thanks,
Georgi
