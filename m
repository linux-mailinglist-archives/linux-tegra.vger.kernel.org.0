Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1661DED85
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 18:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730325AbgEVQmH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 12:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgEVQmH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 12:42:07 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2804C05BD43
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 09:42:06 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u1so9226116wmn.3
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kXR2twCKOxNd/RH/IQzsN+rM8+RXBUpGpC2FYxTrbU8=;
        b=hEiqy3uqrT9lg3GWToPK8Mzw7EZa1i8lUCSeecfulcQ6eNRBruSUMx6KBP8GpoGtP7
         QJWXw9eP7/OZxJ1w5D0L808lQLoGWA93LJ/WK15UPH0yS3j1aqsvki1CRpaMDw6MnJcT
         9TOc30AjfVwCWQmZ/ni1IH2ul1q5k+uw9MJOZG5rb2F1Ivwjo0Ek8MUqNAQX6uJG3zN4
         RhlswUMpYxMl+5XZXXME5DQUF/0WOyaKLM9ueMqzk4eJBU9JisZtKgvUSVPJ1nsqHQbf
         7I5M6mD7vbH3UogxYTTyVGEiTd+oNBYoeKlVStp1g1IneESqsT6y7yH9J6x3wnuofx+r
         k/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kXR2twCKOxNd/RH/IQzsN+rM8+RXBUpGpC2FYxTrbU8=;
        b=fztNI67T+Edg9mKmlIhSkA/wchrx+w3K0YIUDwtG59f5nPSJr9/Q3+iN81Q0/gVCO/
         G6C4gOQf6M4+Z6YLi0lfonzHLZgxDP4J+pybL0lxbdy+4j7aiM9nVv4rUymzQJJHGR5t
         owZLy4CZ59Ps0VEXmckg1h/2YGRU6m49/zEpyXzAzwHAgn4aeb7Bv+XR5sndUJpigU0y
         LL5Dvi7rP53OWw8Vs/dpMS3SNM4Gx277MvAXkNiqMdMLQj7QHIkHM6V+T71gHSdQ0LFd
         3EeFyoeQcVgHCw16+LEt55PM7rggW5TKHBUoo6tNY+oFXk4gXpquJ4OT1Adju0wxaXV9
         CMlQ==
X-Gm-Message-State: AOAM532ZB5mDQjLDioyFtFT4LQ6wo0BGpvwfB20qxlrDTyLfKiitiyyf
        P1TMqc2QMyeSK2QYx4vQsNecwQ==
X-Google-Smtp-Source: ABdhPJyNfOtfbbzPx2Vjf/jCMaB0CNn/f8ikG1EPlHZRalC+QP/hN1hC0OvNBwwSeVrATHcZR/Y6Uw==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr13231402wmk.112.1590165725337;
        Fri, 22 May 2020 09:42:05 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id x1sm9555137wrt.86.2020.05.22.09.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 09:42:04 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] cpuidle: tegra: Support CPU cluster power-down
 state on Tegra30
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-4-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <11d886d8-3624-016b-bada-ee9c62e83da0@linaro.org>
Date:   Fri, 22 May 2020 18:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200324224335.5825-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/03/2020 23:43, Dmitry Osipenko wrote:
> The new Tegra CPU Idle driver now has a unified code path for the coupled
> CC6 (LP2) state, this allows to enable the deepest idling state on Tegra30
> SoC where the whole CPU cluster is power-gated.
> 
> Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
