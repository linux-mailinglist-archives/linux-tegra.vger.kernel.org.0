Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F64155D41C
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344467AbiF1LBL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jun 2022 07:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344893AbiF1LAm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jun 2022 07:00:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D8024F26
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 04:00:40 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so12283757pjb.2
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h6ShvjZcoY601zZn7FM3LjIpLBOtfOWzcEfWqpf8jbA=;
        b=NMksaMzAwxGTiListIr7MqaS+c7WUHZaiOfyRC9wDMzGQdHYwLLoFhp9mxmwW/ttLV
         VUaYUAOxa2UGRtOD8gFn2mjClPjj0disoyMCg2GNMp1vJzZh0KQeULYxd+jwNeNW31m+
         znDZpYIlOx3agcGDTodga9+sKMOxSQ6/bJN27F51vlKpzsLaJYVIakyKmuCBJLoXtY3j
         fHxNnL6bpSCsJS3rwmO+pwa26waDRXTkM+QZpaPTZWhuj031jSvPYzHUJ6bQdeiaxpQz
         ihahfplVSju2OHWA/c3Q7XDXZj6eGPi6nMcN0m5WKBJJRyOyfgjDPw4X/2xJjdASzgfr
         qoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h6ShvjZcoY601zZn7FM3LjIpLBOtfOWzcEfWqpf8jbA=;
        b=3VJzeB0GiTYK4miPya9+nusKz1Qy0/CfHqB1NcrMFQ0R+kqqIhJmf6EbeLZE8JwvFV
         Ev/2SECMREPPMZM/Z3ZSxsnM9L/RE9WuNgNlak0WqH5ODzQ0YUeFnH4ciClrZZdDq074
         gQX+iXOh3E/VEqAiiWJvRk/LnEo3WsS1BoviTbkUu4zaAwA1atLnq8RbWMTp+7EuLtYG
         WWYdrdd1HPqTYMmsWsdohvAnE1+xMllG5iFbMCRuRSXIyYPYqympebTiKJ66bjctIgUK
         6Njj0uqtPV2C+QFtmQDbGEt/UzM/Nld5v6QOTdtOs2E3XiVWb8Xjlv4tlP7VC1/F8bKE
         R5lw==
X-Gm-Message-State: AJIora85J54/6hJdtH1iZ5V4YhggE/tPRCftq0Ybvv+jx5D//Y1sbNin
        4iQVX5k3F9TYfwvZhKA4qsNmzQ==
X-Google-Smtp-Source: AGRyM1voLh+l6ta1rOUvT/VdTwnRym7RLxbascksczUiKOnDRLC2arEFursK2Xv7VKjmPSxg0pvzWw==
X-Received: by 2002:a17:903:1ca:b0:16a:5d7f:182f with SMTP id e10-20020a17090301ca00b0016a5d7f182fmr4277928plh.88.1656414040278;
        Tue, 28 Jun 2022 04:00:40 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id a8-20020a654188000000b003fd4831e6fesm9041298pgq.70.2022.06.28.04.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:00:39 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:30:37 +0530
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
Message-ID: <20220628110037.6v5alslnptidkoe5@vireshk-i7>
References: <20220624004831.po35sowzfo4c47b3@vireshk-i7>
 <20220624005700.oj4etaajbutvsym7@vireshk-i7>
 <73d39022-c6fc-0c21-cb68-9714846f02bf@gmail.com>
 <20220627064526.2nkezq4nufpkl4y2@vireshk-i7>
 <ecc72279-0892-d5ab-689d-87b8fba5147e@gmail.com>
 <20220627072104.ir7kujhezxhzl6a7@vireshk-i7>
 <20220628070943.5tfyad63rh6niq6x@vireshk-i7>
 <a0155aeb-b209-07e1-747a-594a755f54fc@collabora.com>
 <20220628101139.jdpsplkqbbh6qpse@vireshk-i7>
 <49ffbe2d-73ac-ee2e-e3d1-c31a88e40dd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49ffbe2d-73ac-ee2e-e3d1-c31a88e40dd4@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-06-22, 13:16, Dmitry Osipenko wrote:
> It has been in a process of deprecation for a couple years now. All IDR
> instances are slowly converting to XA. You won't need to take mutex with
> xa_alloc().

Okay, migrated to it now and pushed :)

-- 
viresh
