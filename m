Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6355F1DED8A
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 18:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730469AbgEVQmi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 12:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730325AbgEVQmi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 12:42:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE0EC061A0E
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 09:42:37 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so9213142wmb.4
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HX9V/z77GLOnDyyh9f54+oEvg1NpMcG6LWrR+XoGJjs=;
        b=WrB42hWucxjJtH0PqAfaePqJpA9G7L4670KAr251gLFKp3FJkoN9ApQQ0iNKTUt2+E
         SvD7Q09Prlz3bHOgJJuve/7pcePKl4itpLiEqR0p/wi2lKxclMeOfa53ryZ2UUDBYZAC
         zYlhYe+9zAdT1FUrmpQPz2+smevQch7e5qmYH6HvrMEG98BHErDio6vfTDHGRamFpgvS
         KkiXrNlUAOFSgsiLubEGmpB13EPp3swcs3m8lxdDpKWhptzIsirZjPaFufvaiMkn8rAA
         rlAFN2eukCRk/DXqYUDDaSqBra+wEuWdvHHSaavNGXNB69PFEiu0tzIP8xG5pWAbbpmP
         7tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HX9V/z77GLOnDyyh9f54+oEvg1NpMcG6LWrR+XoGJjs=;
        b=pfzsMcycNAVhtxJylCaXQr78xlCc206rAi1xcnZbnr4NHgYY03fxHRR7PE8al9KRUS
         +aLQOXocmxAv313ua2wHzNxx366iIZBq79xKuB7y9quNxDKizkIpfmZE3dQsznsIPdnh
         z6+KgFEgxBdbw5/BabWM4kDYNWfj4w+M2V6PgoZQhNWf+rJU/97v6IiefzM7kXOE+Bol
         jrHiKoWdmGZ9xEiSHLSBl0dM+K+vh3zxi/HDR7nW1FTbVz/DIRaocV9/RJc+ObDBzGkL
         ezXmAT4pU4d5HUXT25xkjgoWOI0ERgz3c0Vx9B/2gY0ZyU6lZtIfjW0kE7hJ5jO0yaLt
         qkTA==
X-Gm-Message-State: AOAM532c15OPf88hN/HOtJHwxjSEs0icV0Jz1iN8n0XogxUeaXlrQ81u
        yqEpJjkuUzfGTff8ApwwAyX2WO0LkWk=
X-Google-Smtp-Source: ABdhPJxXljZFc73zMOt1P71ryNnDFRaST4phyymzlWVFlCUrgGbfeqIp7VAMePSAiXUzsgnGEzejsg==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr4076568wmd.53.1590165756406;
        Fri, 22 May 2020 09:42:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id j1sm10070523wrm.40.2020.05.22.09.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 09:42:35 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] cpuidle: tegra: Support CPU cluster power-down
 state on Tegra30
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-4-digetx@gmail.com> <20200506163341.GA2723057@ulmo>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <99326cc2-0b08-6793-ee8b-1076ec9c9f55@linaro.org>
Date:   Fri, 22 May 2020 18:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506163341.GA2723057@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/05/2020 18:33, Thierry Reding wrote:
> On Wed, Mar 25, 2020 at 01:43:35AM +0300, Dmitry Osipenko wrote:
>> The new Tegra CPU Idle driver now has a unified code path for the coupled
>> CC6 (LP2) state, this allows to enable the deepest idling state on Tegra30
>> SoC where the whole CPU cluster is power-gated.
>>
>> Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Tested-by: Jasper Korten <jja2000@gmail.com>
>> Tested-by: David Heidelberg <david@ixit.cz>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/cpuidle/cpuidle-tegra.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Daniel,
> 
> do you mind if I pick this up into the Tegra tree because of the runtime
> dependencies on the firmware and ARM core changes in patches 1 & 2?

Sorry for the late reply, I'm overbooked this cycle.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
