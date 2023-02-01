Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CB867CF48
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Jan 2023 16:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjAZPIW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 Jan 2023 10:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjAZPIU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Jan 2023 10:08:20 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B432534028
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 07:08:06 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3432258wma.1
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWybXstDtmac5VdIej2b+7R5PfQ9B5fE76OLfTPN+b4=;
        b=A//3U2SIc2wG9Vh0wjfVTMUVkT26PFsuDYD2j/MRskLrqCBRFpDxBUC+/4x0O+RvL7
         YYQE+IwOXQV6jvlJKrvtkHKOgShYADHBRNWZwIlA0LJdwL0KfQgaIw/4CXL00lYM3mMk
         XrNH81g2TqscSVbIzwmQhhj/8ceQNxfAoCgHkhd5k8B8SjlZ6PsXDo2Kk0BElCqEU8Dh
         3ryepJqG2AsToC8B3+EYazKYlqhQ+24agDqk8/zLoIIBJbE8rqc6F/SUHbEa/2VKT6vV
         nXYgNuf0P8BAVBvxOB4Z+cFNdBOJ8GesJLydsEO5/bgU0OPaZMf6k+Tti526iNjbRzvG
         CCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWybXstDtmac5VdIej2b+7R5PfQ9B5fE76OLfTPN+b4=;
        b=1HmPbyVoDsCBCn+ybPsYuYvyCo575os1uin4e4U4/ZpZU/5+1terXB3ax6h366M6Jn
         AxEZS6Ol5/oNNh9JEm99/NdfxmFnpFWl6pEX5B2sxJtCfBql37heelWbho21FXcdXJhS
         d9S2KFnoaZKLr9bSXRQZM1aTcUtMOA9O1wItI0eIOa6Y+grf1IBWzkbyKONqnQgZ3pvR
         udWpaEuxcwlGF5VApnEe2tPaZazRMSwscUyvyKQBDpzEFiF/l3i9mN27BSfaUqBbOt6q
         zbSIho8ppUp+BUdFVffwZSbqXNZ2Hs3AOng8bA8jjGAIgs5pMvKIMyoDUcyocdqORRIX
         OkUQ==
X-Gm-Message-State: AFqh2kqRn1I7k6c7ttHpXqDYljDGRnNQNIEF1gduhTjonaEzW242D1Fv
        6Bx6b+cu9fh98th3Zc6jEFRQCw==
X-Google-Smtp-Source: AMrXdXuEjH4USsuvwXhdPL1xcAmYipo4ZM8dlqzB9QwmP3IdfyPURw1V8TRmRW4JmMVFEUSRaUZENg==
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id j26-20020a05600c1c1a00b003dafbd2a324mr36003515wms.36.1674745685150;
        Thu, 26 Jan 2023 07:08:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id s15-20020a05600c384f00b003d9de0c39fasm5868846wmr.36.2023.01.26.07.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:08:04 -0800 (PST)
Message-ID: <a08355e1-c393-2b2e-4a44-360e08607bb9@linaro.org>
Date:   Thu, 26 Jan 2023 16:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: tegra-bpmp: Check if BPMP supports trip points
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221129153914.2699041-1-cyndis@kapsi.fi>
 <Y9KTrO+WqJJwuEDf@orome>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y9KTrO+WqJJwuEDf@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi Thierry,

On 26/01/2023 15:52, Thierry Reding wrote:
> On Tue, Nov 29, 2022 at 05:39:14PM +0200, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Check if BPMP supports thermal trip points, and if not,
>> do not expose the .set_trips callback to the thermal core
>> framework. This can happen in virtualized environments
>> where asynchronous communication with VM BPMP drivers is not
>> available.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/thermal/tegra/tegra-bpmp-thermal.c | 52 +++++++++++++++++++++-
>>   1 file changed, 51 insertions(+), 1 deletion(-)
> 
> Applied, thanks.

I prefer you provide an Acked-by and I take the thermal related patches. 
Especially in this period where we are reworking the framework with the 
thermal trip points ;)

Thanks
   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

