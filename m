Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602A355CC29
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344779AbiF1KLr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jun 2022 06:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344760AbiF1KLm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jun 2022 06:11:42 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8FE2FE43
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 03:11:41 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 65so11541144pfw.11
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tbey03ru2tYxblJ016YqjV2Da/CXTfP99CuHPvnI5hI=;
        b=bMFVF7a7mfXa02kwrInM5CuyTCpxlEtJm9MfoR/7bVBeCDo1Bjc/oxVup9khM+tDtd
         6WLfZ60J9q1Uvn+6DWeV0Y8Vm2JsWqJGjOygA+VbqzlcvziW3+Xa7rFwsYXjYnl4YiE2
         H2mXNAmb+CJfugOu1ayaJhp4NHLEitxK6CI59M5aN6NIZZ6NmPGkEsOZfacF4P2jrS9Z
         RznjS9oS6Y1XQix99tNeL/2jhv/4QgyXDUGj6p2WX9d3XpGW7szVh41DWZz8EDBdyQiH
         oywangJelRKLooUq/D4PuwoZn9BGn0pl5Mq/XqFWYpJB1tTYoJqbbIDw90lJ9EZk8LiX
         Lcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tbey03ru2tYxblJ016YqjV2Da/CXTfP99CuHPvnI5hI=;
        b=j4ilzgb3Lb/GXsS0HsvpCUkmT+xQKq80rYjgY8nxtCF7rXAZ5eKqMlC10gffcO/wmG
         KP8CQ6H8a0H15aNZ64Gl2EWYdpb+f2Ijjpsx602reZOlDxuYDu17NWV2vXs87BmkcsMA
         a4oM361GwxR4tFyKIqvgKY9qyR/Ff/GVhajNwFs0eqhvepp0N6Y5YgLfk4GNbsgf7W73
         bbJdc+P4gMUK+lS6wONB/9K1AQjy/cegT0VXPyN9TaRPKZOCcElE7WJ1zRW0pU8kdAYf
         iGH7dKhnJLPBm0eCM2f2N05pgBfmRSQhkYXrcs81Uva5knClF8Xe6kugwhgxa1Tm+Nxd
         TqFQ==
X-Gm-Message-State: AJIora8KFKZ0AuE4Xi5dLtX9H3I1RNi7zx8jv6eK3xOCYsJaJv0hsTbK
        jBrRGQDVxnGufi8jXUJDX0YDhw==
X-Google-Smtp-Source: AGRyM1sXb4XOUh03tYJk3Xrv7BW0Vthk9Lt8zrGSlDbcRtKX8L4DZdYoNiXFstwB368JKU9MskJOHA==
X-Received: by 2002:a63:7204:0:b0:40c:9dc6:57f1 with SMTP id n4-20020a637204000000b0040c9dc657f1mr16985974pgc.153.1656411101412;
        Tue, 28 Jun 2022 03:11:41 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902684f00b0015e8d4eb2ddsm3313623pln.295.2022.06.28.03.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 03:11:41 -0700 (PDT)
Date:   Tue, 28 Jun 2022 15:41:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/31] soc/tegra: Migrate to dev_pm_opp_set_config()
Message-ID: <20220628101139.jdpsplkqbbh6qpse@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <449b344f037c7ef1970bc84d31e0d4c4cb4d2951.1653564321.git.viresh.kumar@linaro.org>
 <20220624004831.po35sowzfo4c47b3@vireshk-i7>
 <20220624005700.oj4etaajbutvsym7@vireshk-i7>
 <73d39022-c6fc-0c21-cb68-9714846f02bf@gmail.com>
 <20220627064526.2nkezq4nufpkl4y2@vireshk-i7>
 <ecc72279-0892-d5ab-689d-87b8fba5147e@gmail.com>
 <20220627072104.ir7kujhezxhzl6a7@vireshk-i7>
 <20220628070943.5tfyad63rh6niq6x@vireshk-i7>
 <a0155aeb-b209-07e1-747a-594a755f54fc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0155aeb-b209-07e1-747a-594a755f54fc@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-06-22, 13:08, Dmitry Osipenko wrote:
> The opp/linux-next works fine, thank you.
> 
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks. I should add this to all the core + tegra -patches in that
branch, right ?

> BTW, the idr_alloc() is obsoleted by xa_alloc().

The earlier interface isn't deprecated, right ? I really don't want to
go change it again :)

-- 
viresh
