Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC05B3FD3A3
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Sep 2021 08:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242128AbhIAGDY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Sep 2021 02:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242085AbhIAGDX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Sep 2021 02:03:23 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2B3C061575
        for <linux-tegra@vger.kernel.org>; Tue, 31 Aug 2021 23:02:27 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso832178pjb.3
        for <linux-tegra@vger.kernel.org>; Tue, 31 Aug 2021 23:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ziNI5peMvYej2c86szG+b+RIN9vcpD2Q6jiK+c9Dsp0=;
        b=VppkQ1L5OP7WzN9sX4JjF6uR/tB1ixdRKfkAFndlNli8KnSwM198Yd6xqfJsB4lS7b
         R0fn6Co3ZrF9bQJ3GlVu+J06fi+0vErxRuan0Z5Rg5zBSsM+ODoV4v/H7Br7cAtG5U19
         6QOS3M4oDk74qmMUijl2VmzPvHqRz66gPOEE4sTb8ZR/fJV8d7FtbGIc0TYzuL0BJto2
         sbgZYZTd843DV9Xgc662DGz9N679pFBLFojVXhERhX3qcbDy9Y1z5/BQixVOglh5RH/s
         Pov/xZ2cKhDyuor1e+cqMui9X6DnbVTllyB171am+kRyQKYjoWISx/4IEC0zDtcNwAcs
         y/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ziNI5peMvYej2c86szG+b+RIN9vcpD2Q6jiK+c9Dsp0=;
        b=EUr1MJKnU78CDZC7yU+PascsrXYNKAQceUz8QGbg7dB0+wsXpHUTD2Ia07xZcV07Us
         SeZw90m0DYQYfbS7olrpTDpp+f1SX4HUU26Qng4BtU673Fa/B8JyyR/YTj52Bn6vnwY1
         EGq7KkRWl66kyy2DVP/eviyss7DV2wb1DhzWRcDcq4QvRfI/WlyiSTCFqaV7WGArER44
         Gth5+3jLl6WVCItRxJMom9AO9QsUttZBKQIwqychITONH7pj29F9LURxWnL5GgZlqcx1
         uI3XnchztTGq3DWJSs96qKSlWODDzCTzn1a73C2I7ex7BPVx3uqBOT9eA+8T+gikL9Xm
         Z9mQ==
X-Gm-Message-State: AOAM532ugNyQz0iis2o2i9pdWElJ9LIok1y6IPRKM1ektNIPGvXCcdXM
        5afTVAu7zAy/hL+35uvGRYt6Lg==
X-Google-Smtp-Source: ABdhPJxttiK+IAdc3GQskh/5HBoecSoXKKeBhgWeJNiLAtIEvUw+mJsJhOKk0TcuJDQtQUqAH/1v7g==
X-Received: by 2002:a17:902:7e47:b0:137:60bd:c08f with SMTP id a7-20020a1709027e4700b0013760bdc08fmr8287953pln.8.1630476146931;
        Tue, 31 Aug 2021 23:02:26 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id i14sm19420357pfd.112.2021.08.31.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 23:02:26 -0700 (PDT)
Date:   Wed, 1 Sep 2021 11:32:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v10 2/8] opp: Allow dev_pm_opp_set_clkname() to replace
 released clock
Message-ID: <20210901060224.lulxhpwya7jguphi@vireshk-i7>
References: <20210831135450.26070-1-digetx@gmail.com>
 <20210831135450.26070-3-digetx@gmail.com>
 <20210901044235.2je35y3ajtctrall@vireshk-i7>
 <6010b244-4260-8ae9-2b8a-7fd689781d36@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6010b244-4260-8ae9-2b8a-7fd689781d36@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01-09-21, 08:46, Dmitry Osipenko wrote:
> 01.09.2021 07:42, Viresh Kumar пишет:
> > On 31-08-21, 16:54, Dmitry Osipenko wrote:
> >> The opp_table->clk is set to error once clock is released by
> >> dev_pm_opp_put_clkname(). This doesn't allow to set clock again,
> > 
> > I am not sure why are you required to set the clk again here ? I mean,
> > users aren't expected to put clkname in the middle of using it. The
> > set-name API also checks that the OPP list should be empty in such a
> > case.
> 
> I added explanatory comment to tegra_pmc_pd_dev_get_performance_state(),
> isn't it enough?

It confused me even more. Lemme comment there.

-- 
viresh
