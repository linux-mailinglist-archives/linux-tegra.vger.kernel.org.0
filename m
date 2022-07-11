Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2ABB55DD9B
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbiF0GGl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jun 2022 02:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbiF0GGk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 02:06:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FB82BD5
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:06:39 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 23so8151639pgc.8
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nOzyogr+Rqxif6Bc3eoSLTASJasFD2T5gl1RDId9+P0=;
        b=n87I5HDSx7WDUkeuMKtzvPIOHGFxQ0Mkr3RWVP1PDENEhMk3OHfq6qh1E5fR99Z8xS
         2cxK8Lu8tgYAfmFpdtRWBWP/iroFnnRPo6IRF4yLGNX+TJGdxwlSMkK9yODjDylD8SgL
         evPGPmUKchB/BpPY6zlSqSpLgVAoBrFflKV1hoV1Exu1Ss7R5fZnm1TI3n925TUwnkR3
         AS2c5migT+pksEAHzFdonWe6blFAQ4ZD9oq8uxCJn8km2kv/i0Ks3nAVKKfTunIQ/457
         sKQryKqRDS5UclUpWdmBpzYer+wRk96ewpJSOjeAysBX/FfZjHu8ucoFsL1NMntdOz45
         0XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nOzyogr+Rqxif6Bc3eoSLTASJasFD2T5gl1RDId9+P0=;
        b=p1IkYNbNT0BvPQCCQ2Evn8SxRB8Es/1qJrs8NHfcrtN9UddKL9E8jLTYvz40trxJye
         2wF0ld+fvyZMh1dc+qNq2JaVZzut/ZkGQ6Bt4fj5lfu50BSD98401uXA3ViRHVG1ji6e
         s6UNvOVhKWiK0wBhsybOw9ysEpNfGNaW0cryDY1TuQQ7OwcIKhmZ+qBeVxKqcS6J5yf4
         APLtPAdUXsa0yZDpvIsaVyE7BlGJxRudwsh7dcXUiqWqm7DZrknIhk6KNDdOn7/wiXva
         NDV0tcNOtHbPj3av0kYHdJeIpm4Z6tHE4/oTcjlirPDXzWosHHj/wWG1f0qmHVXJ39Aw
         BIYw==
X-Gm-Message-State: AJIora8WiLIeGRfQQn41yDXYRRz+fzC3XTDtjLM3Sq6O1jeZ8634PWyt
        O4dWPvszeFNzI09rAKGZqLAYHQ==
X-Google-Smtp-Source: AGRyM1t8ECCXrJ0AGUUb9nKFNb9DNU8fTTgGyeurBJQU4fUL2u0Id05i62BkWPYyRDnqIR2gdyhxbQ==
X-Received: by 2002:a63:6946:0:b0:40d:e26:f2e0 with SMTP id e67-20020a636946000000b0040d0e26f2e0mr11768466pgc.118.1656309998670;
        Sun, 26 Jun 2022 23:06:38 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id l15-20020a63da4f000000b0040d0a57be02sm6068704pgj.31.2022.06.26.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 23:06:38 -0700 (PDT)
Date:   Mon, 27 Jun 2022 11:36:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Keerthy <j-keerthy@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/5] OPP: Remove custom OPP helper support
Message-ID: <20220627060636.rfpok75zydgcwwo6@vireshk-i7>
References: <cover.1653991004.git.viresh.kumar@linaro.org>
 <2e6ee73dbc8a231377547a8e9497561cadb38166.1653991004.git.viresh.kumar@linaro.org>
 <565ff879-11e4-1ae4-08d8-1237a875ef12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <565ff879-11e4-1ae4-08d8-1237a875ef12@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On 25-06-22, 14:42, Dmitry Osipenko wrote:
> 31.05.2022 13:10, Viresh Kumar пишет:
> > The only user of the custom helper is migrated to use
> > config_regulators() interface. Remove the now unused custom OPP helper
> > support.
> > 
> > This cleans up _set_opp() and leaves a single code path to be used by
> > all users.

> Unfortunately we can't remove the set_opp_helper(). It's terrible that
> this function is unused by Tegra 3d driver because it should be used.
> 
> The patch that supposed to use the devm_pm_opp_register_set_opp_helper()
> [1] was merged a half year ago and just today I noticed that the merged
> code doesn't have devm_pm_opp_register_set_opp_helper() [2]. I think
> Thierry edited my patch before applying it, perhaps there was a merge
> conflict :/ This needs to be fixed now.

As the commit log above says, we aren't removing the feature, but just
changing the interface to cnofig_regulators(). That was the only
special handling the drivers were required to do earlier as well, for
which the helper interface was added.

-- 
viresh
