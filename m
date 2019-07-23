Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E3C70EA4
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jul 2019 03:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727748AbfGWB2j (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jul 2019 21:28:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45816 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbfGWB2j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jul 2019 21:28:39 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so28047806lfm.12;
        Mon, 22 Jul 2019 18:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gIYcTaQj/+SkX7yvGGMwkSvF+AQQFoKeHMX8gPDrDZg=;
        b=ZHd6prdSkrp1UPBPap/AbYZ00BMdAyydMj6Pu2KfLtj+hs7fPUkKc7MsyZ2qgyzu2J
         zyeAmYqdIA8PCAAiYg5k/AyXZ9XlXCQ5woN/PLf/aeCrm1xC9Ds0D6AClRl7pARst28R
         PgGnbVl07VEzifaAD9x+N0qTFfH3WWJlb78hDMUgkYW+jF4VI/5+OmcTIlHph0YNEy9J
         sMaHUFcNMKoM+ZXT//pAD9ArzZAYHoVO6K0NAyNknYiXVK/cS2l6LX3hg0iPE6IPR9me
         u/oiq2559EvPRuN1JatEqopwJ6dLOWf+Lf6VMHPG1znrZ7yAZ8ZQxh+17pI9bQknxDQB
         Bszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gIYcTaQj/+SkX7yvGGMwkSvF+AQQFoKeHMX8gPDrDZg=;
        b=aR8jQNi/kvW9GkqMNYxihisqgJGNxjd3mOqbqSin4LJT+9Vy1InBsPTaNXV0G1Y5yQ
         bnzxnb0AjnA1RHF490yr44xV7P7UTsms6X5Kq0GOoRofe/ryDDGFvKeLLIbX/0yFU4A1
         wDJYbb7Lw4O/ap1KIFq5ky93kRqMO0nNqFBJi40G0ZWBShM9uaHnEs+k2208xXZ82m4B
         hwVODxU0i71SPmYvnHBc7ULdEBtGlr7GfBYOMuQL1hzd5dOubDKTuwGfPlahL9pa7QPM
         jy+9U/1DbwggQxaJ2z5fzHsMuVw7D6Dl36ZSniWnVv8UBgmZmIzvijE72lDJda0AFhTU
         nHVw==
X-Gm-Message-State: APjAAAUIUIYZAtr3ddqksCzO4XeShRd1zb1Ud2CYrCZiiLau4SC9A8Bu
        hEAKyLYZYHMYkmDSTn0V9+Jx2GTt
X-Google-Smtp-Source: APXvYqxBXJh8LWIs3E2Sj1iC6W0Ob5m1moMAlE4AK6o5A0IG5MPwdPy8w7gpiwsXOH2rEbrmjuwzZg==
X-Received: by 2002:a19:5217:: with SMTP id m23mr33141702lfb.124.1563845317016;
        Mon, 22 Jul 2019 18:28:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id z23sm6231230lfq.77.2019.07.22.18.28.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 18:28:36 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Tegra30+ CPU suspend-resume bug-fixes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190707230358.10672-1-digetx@gmail.com>
Message-ID: <f81a974b-4e64-9b66-0399-519480f53c31@gmail.com>
Date:   Tue, 23 Jul 2019 04:28:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190707230358.10672-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.07.2019 2:03, Dmitry Osipenko пишет:
> Hello,
> 
> This small series addresses two suspend-resume bugs: one affects Tegra30+
> due to a typo in the code, other fixes CPU hang on Tegra30 specifically.
> 
> Please review and apply, thanks!
> 
> Dmitry Osipenko (2):
>   ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
>   ARM: tegra: Use WFE for power-gating on Tegra30
> 
>  arch/arm/mach-tegra/reset-handler.S |  6 +++---
>  arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
>  drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
>  3 files changed, 23 insertions(+), 6 deletions(-)
> 

Hello Peter,

We were talking about these fixes on the IRC not so long time ago, does
it look good to you? Care to give an ACK?
