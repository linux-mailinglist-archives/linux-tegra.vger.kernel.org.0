Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675FE561774
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jun 2022 12:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbiF3KPp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jun 2022 06:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbiF3KPp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jun 2022 06:15:45 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905BD44A38
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jun 2022 03:15:44 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d5so16589058plo.12
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jun 2022 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P2OGlRzOsLlHMLHaMAa8dkdRgxXAL7ovu/mT9dYjCwk=;
        b=N3x/Ba1JJJpTAZU0/4ZAV0fceIVWqg2X5lBHu64bgQHXr603tXSd8bXKqm5vH8Kukj
         XaZyjJnw+4Pvm0PnFbP+5oS8F33+YN5uuHkfrWVfidHO9zEKtVZENMCfrRPDoj3DDEx2
         0AQ36VZ2aNunl4y674CdMIC8EsxvyjF7A8ZS1g94xjDBctSeeY0nk21nz04ZX9+U2hFW
         U0zoVkl9rTnpsKe2sjWLXXUg/paTmXzgDdOGGTR3+h1AQljLicERqt1u0/OJvNaca57C
         ufaEAO/cB02UVhu7C0tU/qsyf10r0P1zEmFFUjqkRQ9gLXJSkWWOXKfYJOVba0q5Jgy8
         aLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P2OGlRzOsLlHMLHaMAa8dkdRgxXAL7ovu/mT9dYjCwk=;
        b=vo7gKow/KBC+eJy7izucBUPEkLgB0stXN4+hphOjZ5ydE5A/57SJOgP3JzzCF3JCqM
         mlbOG4CGNmvEQn/c8MRwU+EtlCepujSUYPjmf/6XeI8XC4vmj1IljcZ2eMzGQxvUhdNj
         wIneGTz36tooxGE3NiaPq4x0dI5I/1raiKSoiji1UqzP7+dI3VytB8XKT631yFIgJbR0
         IqpFiM7ZIgv6jYhO3Wz5AtuTudn0hbDiueesNheoBL5PiLO4sr9GSiX+MYX1AP84JqlY
         eEKnk/DOHlbhqr8tpkPCf1D6c35X2i1v70MxTkcjhwlTNftS/SLOWviYyNw8CRDYba2A
         4r5w==
X-Gm-Message-State: AJIora9t281p5q8yE2SFZu0X1wcfSFaaHMiOt+Q0h3CQWgKxqF0ekQg1
        klGsZJEjVe9/QAmNqO2x5/FsxQ==
X-Google-Smtp-Source: AGRyM1uqc8gtS8EqA81rlfwaMQt35aZZ4Tvp6yATRhuVRjNaxjXfM4zXo2yc60PMZF9UCIf5WN8dFA==
X-Received: by 2002:a17:902:f792:b0:168:e97b:3c05 with SMTP id q18-20020a170902f79200b00168e97b3c05mr14909999pln.94.1656584144118;
        Thu, 30 Jun 2022 03:15:44 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79052000000b00525251ce47esm13173547pfo.103.2022.06.30.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 03:15:43 -0700 (PDT)
Date:   Thu, 30 Jun 2022 15:45:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/8] OPP: Allow multiple clocks for a device
Message-ID: <20220630101540.5dafkegrmcattt2c@vireshk-i7>
References: <cover.1654849214.git.viresh.kumar@linaro.org>
 <8b29fa207024dc295639f9ba52c28e45782e3baa.1654849214.git.viresh.kumar@linaro.org>
 <55623c12-dda3-613f-5bc9-80b3b6fec5f9@nvidia.com>
 <20220622141511.yzg5itkdwirpavfj@vireshk-i7>
 <40e616eb-22f9-19c2-8d77-20cd3c7c518b@nvidia.com>
 <c6f100e4-8a35-ebf0-f833-06ff0d8a2fb6@collabora.com>
 <20220630005028.fddtcbkoksbygwc5@vireshk-i7>
 <8367c38b-8cd3-cde1-5833-874769ef3350@collabora.com>
 <20220630095245.otvo53ezd4avoujw@vireshk-i7>
 <b899ff5f-b424-5f44-7c94-deb013ff6bbc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b899ff5f-b424-5f44-7c94-deb013ff6bbc@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30-06-22, 12:57, Dmitry Osipenko wrote:
> The set_freq_table() gets available freqs using
> dev_pm_opp_find_freq_ceil() iteration.
> 
> The first dev_pm_opp_find_freq_ceil(freq=0) succeeds and returns ceil
> freq=1.

I don't see how this can possibly happen. One possibility is that freq
is set to 0 and one the next loop you do freq++, which can make it 1.

> The second dev_pm_opp_find_freq_ceil(freq=1) fails with -ERANGE.

Even if we send freq = 1, I don't see how we can get ERANGE if the OPP
table is properly initialized.

> I haven't looked yet at why freq is set to 1.

Thanks, but I would need some help to get it debugged.

-- 
viresh
