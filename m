Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAE032D4E3
	for <lists+linux-tegra@lfdr.de>; Thu,  4 Mar 2021 15:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhCDOGL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 4 Mar 2021 09:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238868AbhCDOFt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Mar 2021 09:05:49 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE2CC061574
        for <linux-tegra@vger.kernel.org>; Thu,  4 Mar 2021 06:05:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u16so9771875wrt.1
        for <linux-tegra@vger.kernel.org>; Thu, 04 Mar 2021 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cUnl222jwFTLh+LAdFT8jB1XSrLsyzyH9WNCvLDekzw=;
        b=dODD4plXwP4fPF1G+xFPMnYbIkOaVpICPPtBpFCcJ19HiBvveGP3kGHQndQZ7BiKNC
         CTLc/PeZp4w7D5OF4pLj0KuXLeQfmm/n4rDGmHVcwqa4gVgQ04BdSzJKHMeN4TRDTfNT
         7Di5R2B25Q3+w5r7kKvyEeUamx97+30tJTZ+hW4kwiWixbkQyBBTOuw+GCton+xRLYos
         a6AWzY06Gtj4c05/pJ7l76s2Pn78qmVSwe43jEh6EY7OtOoj1G7bX/CVxpeKvz3DhNEw
         c3MVMOCSB2lpLGNpSrgYG+7ufJlsAE0W+oGOaIcC3tbNKuw1E9mkKuW6ahR07NW1VS/Z
         Owww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cUnl222jwFTLh+LAdFT8jB1XSrLsyzyH9WNCvLDekzw=;
        b=DZyeFL6AnTmvBO0N7q1qLUYQ6gR+rSHj+sr9kLQoRwVdyWTOEYE40LeP+p/mSzyVPd
         SS73V2hxupbRpwHJFzvu7q1i7njPDnpJHuZ/ngDppJfZipkGlFRh8ysncZ17+nrOKkzX
         K6s/m9X8oq+tFiSVZtFmChpGMu1PNXYP87PJRT9V++rQYtP5oxQYLNLaCeBd+Wqkfc8O
         TgP0E1rbZinCmHe4/r5yaxofl33vayxjkDlAs++z0a4tEFQf/+tHkNao5zHDscjwq/TG
         rWzf7v8OpsvLCN6D7Z3my3J50Ayn5V90dDXrOJEZyjav9MZ0IWl40ejPXFaaOz3GPuuf
         bDiA==
X-Gm-Message-State: AOAM530sAKCu1Jm9TIvTxrHz1/txiQgLF+cvIxB1EOQFFqlOCyg60SxB
        Get1PKblwdZjs1l8fubQzr7b+kZmjIQNmg==
X-Google-Smtp-Source: ABdhPJw4iLbtLjYHaTyQ+qpADhnbqunFJqLnw9fHpQwAIAmWR6AOxibjrsOELRx+mORgP6ozJpFFmQ==
X-Received: by 2002:a5d:604c:: with SMTP id j12mr4128378wrt.91.1614866707238;
        Thu, 04 Mar 2021 06:05:07 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net. [82.252.144.192])
        by smtp.googlemail.com with ESMTPSA id m10sm9641151wmh.13.2021.03.04.06.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:05:06 -0800 (PST)
Subject: Re: [PATCH RESEND v2 1/2] cpuidle: tegra: Fix C7 idling state on
 Tegra114
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Anton Bambura <jenneron@protonmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20210302095405.28453-1-digetx@gmail.com>
 <36f5d767-d021-d1cb-dfc1-7b9dd63d7d9f@linaro.org>
 <CAJZ5v0hZKsTnFSrchxo_=jTv7qzoHgsq6W_5Gj4TWWjU5y71jQ@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <cd887d44-439c-5a3a-346d-ea88df327782@linaro.org>
Date:   Thu, 4 Mar 2021 15:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0hZKsTnFSrchxo_=jTv7qzoHgsq6W_5Gj4TWWjU5y71jQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/03/2021 14:55, Rafael J. Wysocki wrote:
> On Thu, Mar 4, 2021 at 1:30 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On 02/03/2021 10:54, Dmitry Osipenko wrote:
>>> Trusted Foundation firmware doesn't implement the do_idle call and in
>>> this case suspending should fall back to the common suspend path. In order
>>> to fix this issue we will unconditionally set the NOFLUSH_L2 mode via
>>> firmware call, which is a NO-OP on Tegra30/124, and then proceed to the
>>> C7 idling, like it was done by the older Tegra114 cpuidle driver.
>>>
>>> Fixes: 14e086baca50 ("cpuidle: tegra: Squash Tegra114 driver into the common driver")
>>> Cc: stable@vger.kernel.org # 5.7+
>>> Reported-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
>>> Tested-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>
>> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> So do I gather correctly that I am expected to pick up this series?

I had picked the cpuidle related patches in the past. As the traffic
became low, I assumed you directly pick them.

But I can take care of them and send a PR at -rc5 like before,
especially that we have new driver coming. It is not a problem.

Let me know what is you preferred way.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
