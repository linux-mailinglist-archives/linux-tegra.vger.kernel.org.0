Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A3432C314
	for <lists+linux-tegra@lfdr.de>; Thu,  4 Mar 2021 01:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhCCX7t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Mar 2021 18:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449699AbhCCECF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 23:02:05 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B07C061797
        for <linux-tegra@vger.kernel.org>; Tue,  2 Mar 2021 20:01:25 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id l7so11106926pfd.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Mar 2021 20:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Sf0sHmQlDAnRMVroNklxTV9sD5YAM/nZAMHjs+CyJB4=;
        b=DqjN4DryIrwYkAZERDCNYsxYTCg/FgOx9g1tN3t7SP5NtBAhKPdo3lCnaiNnrvavBj
         ydQv0eborD4BkC3Y+XzqoGy8aiCKnHRP/JylIcwHTxxvnmHfiNck3OubW7XBEGVgwM/E
         eyPJ8aPDHdCm58TuvDHH1oXt8LBXlpvuzLeu0uEQYnF2tpIuFpM9aTgmkMnNPRxOhiUp
         6urTlvt4r1gJIWV2+KwsuriqRhtODU56xJwHEbD5X45GvkFali3XUBHAsbusiBqISTAG
         QjqQrRgogRk0iqTBD5b5SIRJMgViOx9k1dBWLNi6KV3Q8WtSrwTaeC9YwaQEP5fqZsTD
         H6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Sf0sHmQlDAnRMVroNklxTV9sD5YAM/nZAMHjs+CyJB4=;
        b=GHqYEyieqLXaUlRkPfaCOeK3vRu0kTBRwBK6IsjQkPQg7lVVgfnsRTwEuDJlb7wouG
         fnmXfzFOym2eQXNqdlfBCsdfuKYMvr71m5vlwOrjC9zYg3EBcEWm/PCx5vmeNMZ9oGC4
         5kdNY6G5xghnCnh6NYfug43pSkBC7vHKVpEfE510c98KIYkcCV+wmapJdpLP+9LI2f6Q
         DYPEfzFqxzm/6dYBdjL1vqHCHUQEWs7+StCGchuHT21ahSq6pCIp1juIhMo2q30kls0D
         uTviu8EFg0dbxgVIt3As1A8sLAh7ltLH5ri8f4o274KCR5Mo+ieyZ3+VRFHwl4lc/73J
         whqQ==
X-Gm-Message-State: AOAM53012x52o/3lUV3AfIE0fg2D8dpPzQkcvYzqNnl5UiTF136TZVC8
        KmvyDNSqYzE9MDI/5kvZaDWE2Q==
X-Google-Smtp-Source: ABdhPJyoXDxfKpU/1wXB2PIFN0nnkGXEo3xzDutxggeVYQFsmIzt54/Cnp3VafjpSiT43J+plIUXXQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr20987404pgl.199.1614744084943;
        Tue, 02 Mar 2021 20:01:24 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id e1sm4992656pjt.10.2021.03.02.20.01.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 20:01:24 -0800 (PST)
Date:   Wed, 3 Mar 2021 09:31:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, ddavenport@chromium.org,
        jsanka@codeaurora.org, rnayak@codeaurora.org,
        tongtiangen@huawei.com, miaoqinglang@huawei.com,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
        mka@chromium.org, harigovi@codeaurora.org,
        rikard.falkeborn@gmail.com, natechancellor@gmail.com,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        parashar@codeaurora.org, dianders@chromium.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
Message-ID: <20210303040119.hpeybankxph4fyuj@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
 <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02-03-21, 16:40, Dmitry Osipenko wrote:
> 20.01.2021 19:01, Dmitry Osipenko пишет:
> > 01.01.2021 19:54, Yangtao Li пишет:
> >> Hi,
> >>
> >> This patchset add devm_pm_opp_set_clkname, devm_pm_opp_put_clkname,
> >> devm_pm_opp_set_regulators, devm_pm_opp_put_regulators,
> >> devm_pm_opp_set_supported_hw, devm_pm_opp_of_add_table and
> >> devm_pm_opp_register_notifier.
> > 
> > Hello Yangtao,
> > 
> > Thank you for your effort, looking forward to v2!
> 
> Yangtao, could you please let me know what is the status of this series?
> Will you be able to make a v2 anytime soon?

Dmitry, if Yangtao doesn't reply back this week with a proposal, please go ahead
and respin the patches yourself. Thanks.

-- 
viresh
