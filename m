Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1868B43CE30
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Oct 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242893AbhJ0QEF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 Oct 2021 12:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbhJ0QEE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Oct 2021 12:04:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3BEC061570
        for <linux-tegra@vger.kernel.org>; Wed, 27 Oct 2021 09:01:39 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id o26so5545053ljj.2
        for <linux-tegra@vger.kernel.org>; Wed, 27 Oct 2021 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkCgQJkUSUXPKa9PPaG98xGW8ORLrJoeUL+lFNuAKlI=;
        b=JuXVzxzuz+qv/oGJh4H3FGcoT4i1PRfFmZGPc6lEW/N9sVUHQywzVSA6QOXoew8eMN
         2VuWytyylFxvVVv4NHBnyfc0Qf66xZSXHV0PNkrxsRogr/txx31V1QIsqMYUDW3/lS/Q
         puLCWl/i68QH+uN4xJWqYNAHxq8s/ABltDsTffJInX/ueXsemQ/gPVFmTZ93Ha2IFRxA
         fbB3/Ci3reBmhbmZLY5Agp3ldPGxwIMR97E/B9IL/d5CWC5Xg4LcOyrcEsyeLsDfw7q4
         1r0gIxWuTyvt/wIwtmEfq/EQYkL7wpbE/0EDTKaVxaRJS8WIN0jvlGqgTJ1Igaa+L78p
         ZceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkCgQJkUSUXPKa9PPaG98xGW8ORLrJoeUL+lFNuAKlI=;
        b=bQJKvgMXGHmMSVTGK+wIREGoU9YAhfC254HDhep/2qB2DoApc6ODshv0rclpGokErp
         QYQSuVO4imQs4f9Pnva21rysx23qikUFACShmfp7Pc8l5ivHO+OwAvShq496T5fC9n+P
         ugwOyA36RWLTXFHFttcjB9G7YNtrwWgKXafoG1wiq+vsuhkSHY+Vi28YJu8DJwm5PQwx
         Pq8bs6JkUTqIRHrVdf51UxvBZlvJQDX2KKPmVuC0o6xsFeQVSV5DIwae1fL63KlqjOSV
         LySTnL3k1Jr7W8BDBHWaaLWtfImQgmKB9ZTktVEWVyrO/Io+AbRO4KgotyD16NfVgbur
         z7tA==
X-Gm-Message-State: AOAM532D3fy3nfuFSSGa6FbC7aSxIK/xjjEYdNsWGYbUywNdP8iN9/hO
        tuc+dtY0bxeV48CJAPvS2zUBJsjVSZdy2b1VIHUB6A==
X-Google-Smtp-Source: ABdhPJyLTmxvQZ0j5lQGHsFYcydy71+PhRmg+SxpLEXAm87AnzbFNmKI1TyiM271I2tAbjx+BOKyohjDU7jCER0qQM4=
X-Received: by 2002:a2e:5c45:: with SMTP id q66mr22976435ljb.273.1635350497549;
 Wed, 27 Oct 2021 09:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 27 Oct 2021 18:01:01 +0200
Message-ID: <CAPDyKFrA2Jcb5BmaFmajtdUCmpwoPjAAvPC_MhoWwjDXJynD=w@mail.gmail.com>
Subject: Re: [PATCH v14 00/39] NVIDIA Tegra power management patches for 5.17
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 26 Oct 2021 at 00:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>
> All patches in this series are interdependent and should go via Tegra tree
> for simplicity.
>
> Changelog:
>
> v14: - Fixed missing runtime PM syncing on removal of drivers, which was
>        spotted by Ulf Hansson in v13.
>
>      - clk-device driver now resumes RPM on system suspend instead of
>        preparing clock which it backs. This was suggested by Ulf Hansson.
>
>      - clk-device driver now syncs power domain performance unconditionally
>        during driver's probe time since GENPD API allows to do this now.
>        It was spotted by Ulf Hansson.
>
>      - Added new "Enable runtime PM during OPP state-syncing" patch, which
>        allows drivers to sync state at any time. Previously drivers were
>        obligated to take care of enabling RPM at the "right" time.
>
>      - Moved runtime PM initialization/uninitialization of DRM drivers that
>        use host1x channel to host1x client init/deinit phase. I noticed that
>        there is UAF problem because RPM-suspend callback waits until channel
>        is idling and channel is already released/freed during driver's removal
>        phase.
>
>      - Added system suspend support to the new NVDEC DRM driver.
>
>      - Added missing pm_runtime_mark_last_busy() to DRM driver.
>
>      - Corrected VDE GENPD patch which previously made video decoder clock
>        always-enabled by mistake if legacy PD code path was used. It was
>        spotted while we were testing VDE on Tegra114 that doesn't support
>        GENPD yet.
>
>      - Added ack from Peter Chen to the USB patch that he gave to v13.
>
>      - Changed OPP table names in accordance to the new naming scheme
>        required by the recent core OPP binding.
>
>      - Added 500MHz memory OPP entry used by ASUS Transformer tablets.

Besides those minor nitpicks/questions that I have sent for patch1 and
patch29, the series looks good to me!

Feel free to add, for the whole series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
