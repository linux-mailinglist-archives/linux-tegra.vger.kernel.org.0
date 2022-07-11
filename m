Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D77655DDFC
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbiF0GmB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jun 2022 02:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbiF0GmA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 02:42:00 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE01558B
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:41:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso9615744pjz.0
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=45rauxW62zvLiLrUYdOABR/1r2UUII+y5PQH23JQu7k=;
        b=vhJiLwQCcFv1Yt6V2yG+9+dObL9WLX6fmLFxVczsb1YHUoreh12Pi8nSs4GErNzvpV
         5V9xb73nB2888hljZbsR327vjZCmTDW6nSpy3h3wt0ViTXOUFRmpoP7TgfWUK1HhLjzp
         lTUGwqSfqakgzvKRHVkxFx2ZZguCL9M4BIgCRV01skb5o+FnFptRkRPLwOIo/h35HZQy
         X7mgKXYHVbmmEttrTkz4As+vdrVb2pDEpNl1Ow7sjEbUzy/VJXi1S+xlTdiHhvZ/rkmd
         DOUOS8aPOLvdaRwrCkxIA3HsVoUnpzxhd0AqERM6fQMZIwpnERb3GXCziX2Pkyd5TK7P
         5X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45rauxW62zvLiLrUYdOABR/1r2UUII+y5PQH23JQu7k=;
        b=g35yz7Ohs/2pM4+dNy0L7+Sa6XLPZMbrs+1wfYVgXZPcsMurFGNafUuCYqq5LSq+gg
         Oc6t76WYQlInXxsheRn/F9/rUqMrZMOlFtJ9nrLLRP+ghHxGQhhDJKdu+YfbE4M16ixP
         YsZsbJGj+FIi7ZEvtnZrt4xnrsbfzH4tmA7eN6hS63W+OpfILquZLh56l03EJIJs1I12
         Fo+HAdhpmIV5hy3UZvM9cbYHum0KPoh5xLJPbkVaIZ6rdFaMmItqxsu9PTeLkfgEs/T4
         c6/6xZG2uKBtO3QrPdxPb3TynrjrRNF/v1D3u33B+e5cAx/xN4y8vAs41f+MLCW9Izt9
         1Nqg==
X-Gm-Message-State: AJIora83Yit0DRQRSXS3ZMNqNelPASHva4Z4KaLAN2gwKswFm/KlKioF
        7Df5kEmMcXnqE4UcAqw/YpiCpw==
X-Google-Smtp-Source: AGRyM1viYEO4TpTC4lUvX8VkhvtNg6ETswsD7mpBbxH+A0JO6sX4fcnU9+xgZXgcwEJpuRRsDyKwiw==
X-Received: by 2002:a17:90b:3ece:b0:1ed:13a9:8531 with SMTP id rm14-20020a17090b3ece00b001ed13a98531mr19005332pjb.183.1656312117699;
        Sun, 26 Jun 2022 23:41:57 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id g38-20020a635226000000b0040cb1f55391sm6281148pgb.2.2022.06.26.23.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 23:41:57 -0700 (PDT)
Date:   Mon, 27 Jun 2022 12:11:55 +0530
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
Message-ID: <20220627064155.jo7iqz5h33l7a4vn@vireshk-i7>
References: <cover.1653991004.git.viresh.kumar@linaro.org>
 <2e6ee73dbc8a231377547a8e9497561cadb38166.1653991004.git.viresh.kumar@linaro.org>
 <565ff879-11e4-1ae4-08d8-1237a875ef12@gmail.com>
 <20220627060636.rfpok75zydgcwwo6@vireshk-i7>
 <4a8114f7-4ee6-a9ad-f5be-ceaf64be8a0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8114f7-4ee6-a9ad-f5be-ceaf64be8a0e@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-06-22, 09:10, Dmitry Osipenko wrote:
> Okay, but Tegra 3d driver doesn't need config_regulators(), it needs
> customized set_opp() to set clock rate for both 3d engines.

What does that mean, you need to set two clocks ? There is separate
support added for that already [1].

-- 
viresh

[1] https://lore.kernel.org/lkml/cover.1654849214.git.viresh.kumar@linaro.org/
