Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8956E558C89
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jun 2022 02:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbiFXA7T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jun 2022 20:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiFXA7S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jun 2022 20:59:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A1B51339
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jun 2022 17:59:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso1285862pjh.4
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jun 2022 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KmS8YzmeCRLv0I98pRDwb5hkTAXUpnuhqIpKkfmBufE=;
        b=JwKtT3fL1uGxHggTu0QP9C6/zTY9cE/chhtLyUukOJz3qAa7Y0GKN4wo/9nSFFhBN2
         LbH8QZ+Ndo5GLN1iBbnmWCIF9Iv8604vl3J2W3NPRStBsrBu2Ze/Lzz+QCdEC/xJQ5dn
         ZliKB8Pz8hwPepF1chLtAnEp/Wf0b9l/fttcFDyfxj5Y56IZE+up0KmAMGZO74s76n6j
         WzBvHMgV2rJMpjTt/McgH3aFee0+p+b4oFy/ebML/kzuDQctvFdVN240LANClVcII1ew
         r+z7u7R+lraPlaz7KEeu6jHIHAB0xXnGyzl7yB41aCTkIb1seE6scTNJAgUz+Lo6N1sf
         vaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KmS8YzmeCRLv0I98pRDwb5hkTAXUpnuhqIpKkfmBufE=;
        b=eY+MGI8XR+kLTsKHUQ3sWZiUe+s7FfRXQPuPDGrOboJ7WGGlYGfse4LHDINP/AFODV
         mkFWHaGRlWepnhh4Hs3WD69/lSgI/l3i+c2gxt2JGuGYAFCczQ9XArTTAFS0ZdwfWcLG
         fLwJ0dF8yjbq7crIlhTIv7zfKGjIZF3LT7vBskQEVlvRh6EEMzUQKEXCODstdDXQMUPE
         aioy9VRbMBX4eJfbi3+C6i4CBLYmUuXU60M9CtiActuBjq2Y6eJQerNklju0twfStaK8
         DRkatrcG74dEfvl3QVNui+dHP6btj5u8MDRcVTjVJB0uttFO07IUoq6c/624snGVx/9q
         FPoQ==
X-Gm-Message-State: AJIora+WOKlC9dl+78qfPF/BmU/5ONH8LjRo38QDJXKCCi18LCgbjwBO
        oy5sQVd8qmqx82U/0xr1XW6lzg==
X-Google-Smtp-Source: AGRyM1tLz9sqqBrgejC9t9gGmFOiQz9+sLFk6OZq10wqEkbzb29GFJyyM8rzDKK3Akgmo2Yjqga6/g==
X-Received: by 2002:a17:90a:4210:b0:1ec:b859:91a3 with SMTP id o16-20020a17090a421000b001ecb85991a3mr848011pjg.164.1656032356081;
        Thu, 23 Jun 2022 17:59:16 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709027ed600b0016a0fe1a1fbsm391415plb.220.2022.06.23.17.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 17:59:15 -0700 (PDT)
Date:   Fri, 24 Jun 2022 06:29:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/31] soc/tegra: Remove the call to
 devm_pm_opp_set_clkname()
Message-ID: <20220624005913.ytsskavsaxt4rzzm@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <1e88b248352afe03cd3bf0e887b1f2be86b5afb5.1653564321.git.viresh.kumar@linaro.org>
 <12c085af-1202-95cf-e9ad-ddcfbdadf0d6@nvidia.com>
 <20220624002805.anv62ufihdrncwus@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624002805.anv62ufihdrncwus@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24-06-22, 05:58, Viresh Kumar wrote:
> Though there will still be a problem here with my changes, we don't
> accept NULL clkname anymore for the set-clkname API. And tegra does
> this to pick the first clock available in DT (at index 0) I think.
> Other drivers (mostly qcom) who need such dummy OPP table, provide a
> real clock name instead. Will it be possible to pass that here somehow
> ?

Jon,

Okay, I was able to handle it without making any further updates to
the OPP core. Nothing else required from your side on this.

I have pushed the updates (to this patch and 22/31) to opp/linux-next
branch. You can try it now and it should just work. I have only build
tested it though.

Thanks.

-- 
viresh
