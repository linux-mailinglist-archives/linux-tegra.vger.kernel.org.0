Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C68255DEF6
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbiF0HTy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jun 2022 03:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbiF0HTl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 03:19:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51DB60C9
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jun 2022 00:19:40 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id jh14so7399830plb.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jun 2022 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JZxq3Li79Z5k+2Clzn+hx3pkrXwmS0AqWBIMTiHuigE=;
        b=YoJk8KjRUA8HnE8CN4p7T8Au6cwFpQcElxQIPbmvUjEE1tFTsWDAk1BhEFOFyKvYc6
         e6YRvvyJM01BQMco6OLnsGUYziE/XieXJI7An7VirI4K9J1J9+TTCt1qaM4FEiXwxZXb
         7Ox/735AD+3WdwIXAdUwW3PUDQWYWXLOSmblgtFvmuKcEaRapx7PRIEHdAPqgsBQlu3F
         ipUBzZtpU07AySCyq5JNDWu/2R4wn3b7iGglGjIClREk4V9p0NL7jND4mX7Y+OFFbiY1
         042HsCB/6SoQRC0DZhWGiwtudG9toX5yfsygw7kllFBJcfDvGWbo9yfKCByqYmNkiiKb
         m4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JZxq3Li79Z5k+2Clzn+hx3pkrXwmS0AqWBIMTiHuigE=;
        b=K949WB6Fs9yStKaHYCBhEmsUMeIVAFGti0YL/D3lLFctUhTRFnjAI9eKjhJhN/F/XS
         Q6bI5gYLdThc9vPcE1oqV0zz1vYwTT+XEuCwfQ+OdaRcV+0tVVgpKV2qpVhXZsG9b6t9
         R0m2uV0ktZMhel+BWcNuqFfiQUhlCtZtc6S/upnZh1r5P+LzDhexukyP5V0Fy3euSMV9
         IdFRKJVGgwQwDENP0zlSu0iiR7Vx2/6eHnbkfIO5mwtKvynKoPba6VPY/ptfjfFCzdio
         d0LUOUwnu+YyQDmaQ9DK9n4w+P00WyB5HAPdTTdYz1i/qXY+Q1wNJgo7fwdQbptC3/Sd
         U05g==
X-Gm-Message-State: AJIora/FnCGQN8O9poqe4BI34ReKM1ThYX+s5hQu+2SPJr3aAlv2rFAo
        dTouhdV7ZtO0z51yB2nrbERxmg==
X-Google-Smtp-Source: AGRyM1uC/3nSEX8tCkOtmgtRPhmunty3WQGjgI1Keul6y/SKIEJq6JZw22D4MJswZuXm00T6VFIjIA==
X-Received: by 2002:a17:90a:8d02:b0:1ec:a006:ea13 with SMTP id c2-20020a17090a8d0200b001eca006ea13mr18740749pjo.229.1656314380229;
        Mon, 27 Jun 2022 00:19:40 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id p15-20020a635b0f000000b0040d180a3493sm6397589pgb.27.2022.06.27.00.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 00:19:39 -0700 (PDT)
Date:   Mon, 27 Jun 2022 12:49:37 +0530
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
Message-ID: <20220627071937.uneeudaqzo2aa2me@vireshk-i7>
References: <cover.1653991004.git.viresh.kumar@linaro.org>
 <2e6ee73dbc8a231377547a8e9497561cadb38166.1653991004.git.viresh.kumar@linaro.org>
 <565ff879-11e4-1ae4-08d8-1237a875ef12@gmail.com>
 <20220627060636.rfpok75zydgcwwo6@vireshk-i7>
 <4a8114f7-4ee6-a9ad-f5be-ceaf64be8a0e@gmail.com>
 <20220627064155.jo7iqz5h33l7a4vn@vireshk-i7>
 <d18a1f18-d78c-2db8-9b19-196dc88978c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18a1f18-d78c-2db8-9b19-196dc88978c2@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-06-22, 10:09, Dmitry Osipenko wrote:
> Yes, I missed that multi-clock OPP patch, thanks.
> 
> Seems _opp_compare_key() won't work properly for the multi-clocks since
> Tegra doesn't have bandwidth nor level for the 3d OPPs. Why does it need
> to check opp_table->clk_count == 1? Shouldn't it be opp_table->clk_count
> > 0?

The problem is that when we have multiple clocks, we can't assume any
of them as primary. Its the combination of the clock frequencies that
make them unique. Otherwise, what will happen if we have same
frequency of the first clock in two OPPs, but different frequency of
the second clock.

Because of this, we won't also support multiple clocks in all freq
finder APIs, like dev_pm_opp_find_freq_exact(). We can't do that from
just one frequency.

Ideally, the drivers should now be calling dev_pm_opp_set_opp() to set
the OPP now.

For your case, I think you can just add levels (like index) in the OPP
table. So we can uniquely identify each OPP.

-- 
viresh
