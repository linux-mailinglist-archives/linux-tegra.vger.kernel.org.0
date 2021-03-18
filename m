Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE6134035F
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Mar 2021 11:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhCRKdK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Mar 2021 06:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCRKcy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 06:32:54 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BFBC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 03:32:53 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f17so1075311plr.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hvOZrihWdisZdnlkHkbs2gZ7Njlm0i8zYMMhkfhvOGo=;
        b=S2UsjbTYxqFDkJmL1RWqn2nZBITRq5U6c3mweI+lLm7HLUBWLkByttTApuwC/4ls/J
         qOFDWTbQSzJHxVAoQEIgLtd4mX02gTwLEhGPcjp/vtaLzdFEff+LoRtobKX/3SLhcfQf
         rPNJkGGAKBYPEdIB7CHrGkfwsghn93SHGuPVWyLOlWipesF9aatnSWY1KniDWtKGJ0Ar
         wza3mwKKLlcSNUvWZEdgakmDjZd5HGwu48BgV2E1AWbDJdxh7DkWRtaDCHvwNxk793k7
         qkfRPEKVNnFOqX3s0kwR+G1RTfOARX3PTMTXnNTxRvFv6g16m9oIp6BIAwgkH6ZWjB/i
         Gi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hvOZrihWdisZdnlkHkbs2gZ7Njlm0i8zYMMhkfhvOGo=;
        b=uC7rAQgbAKjCwMSSH9w7ycVWA8m1SaXcee+W1V7zMRgvG9qAgITWdTKj/rkNJgwr4H
         i2BvAmfIgap8ebWaE3+oCyV9EQlFreaho05dl2D8FEWMfsIw1cauQS7hKCuFkAESb+Wf
         aqj88WbzORDVctPSD8pUHy77ZuOQpOqO2LYHr+cJo7ceHx+kEKwjLbKGePuF0g9T1sYe
         F30t3BU/7jeArgVblyRatU4pk6SI3e8eMkvUWVfSPjEMTPHKjV0q8NE2F0sVrH8YFSLE
         S5QxxiFg+ignERNPfa5M0JLw//EwJX2x2Ctmrc1XRRUxC7nyQjB6yZtUdpvYW9O1Y3+3
         yL6g==
X-Gm-Message-State: AOAM533sTy9gd0K+ACUf88DUBNpsnS4226iZcXR+Iy+g5ZjoL1DwWvDw
        4EiUP39Z/hnZ8Jzwg5J0wMebZg==
X-Google-Smtp-Source: ABdhPJxWTgJJz1w4lucXWykRQdhmBaaDMgCw060xrjRN50G8JIQFVTHFYPdL4bHtHsnxms2ADWbjbQ==
X-Received: by 2002:a17:90a:d311:: with SMTP id p17mr3639700pju.43.1616063572778;
        Thu, 18 Mar 2021 03:32:52 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id a19sm1945524pfn.181.2021.03.18.03.32.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:32:52 -0700 (PDT)
Date:   Thu, 18 Mar 2021 16:02:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Fertser <fercerpav@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
Message-ID: <20210318103250.shjyd66pxw2g2nsd@vireshk-i7>
References: <20210314164810.26317-1-digetx@gmail.com>
 <20210314164810.26317-2-digetx@gmail.com>
 <8f78a014-eeab-d788-7d3b-b52b8109cb2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f78a014-eeab-d788-7d3b-b52b8109cb2c@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-03-21, 13:27, Dmitry Osipenko wrote:
> 14.03.2021 19:48, Dmitry Osipenko пишет:
> > Add common helper which initializes OPP table for Tegra SoC core devices.
> > 
> > Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> > Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> > Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> > Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/soc/tegra/common.c | 137 +++++++++++++++++++++++++++++++++++++
> >  include/soc/tegra/common.h |  30 ++++++++
> >  2 files changed, 167 insertions(+)
> 
> Viresh, do you think it will be possible to take this patch via the OPP
> tree along with the devres patches if Thierry will give an ack? This
> will allow us to start adding power management support to Tegra drivers
> once 5.13 will be released.

I can do that.. OR

I can give an immutable to Thierry over which he can base these patches..

-- 
viresh
