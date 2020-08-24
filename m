Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D427924F320
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Aug 2020 09:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgHXHdi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Aug 2020 03:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHXHdg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 03:33:36 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E707C0613ED
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 00:33:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c15so7575363wrs.11
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9b6JStI+Pc7Gan44H9Zai7qTn63i//epl6t/+SyCbvI=;
        b=QtU30oREihjyaqVpYIPlh7uBHK/+lhu3kH4oL78qeud837ZI7zpawFKbrvXu6gEeF7
         lirP1Q5eX5PgM10QHCj806++kYW29bWS1XHPniLoLJmno35vPnyrxiKHV7p3aodMTbfn
         Y04755PuaOjBiEiyjPx6oxKlWUTs8W/nrEsTE3D3EiVIAnqck+zGCO2Kq8GPGxqS88WV
         f4gu+gKuQuMYYK3aNi2V+GEfSaNUiYjGZVV3Uw2wOTjSE1MiKI50ALupBV4fO60Qx61C
         dqwaeZn9bWLrQ8yqRwpZvWKQJqdQJBPxLU4x9pO0dXGyofFd0dRNrP7PqtDNr3k7hB5u
         E43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9b6JStI+Pc7Gan44H9Zai7qTn63i//epl6t/+SyCbvI=;
        b=O3TZv+2xguTPNT4+RgqXfukYG03nGBbEQyB66Zi3dHxUFNpJtZGDR8lKRJJ6VFpegy
         NAGny8ptSnWDz22lLNG1JwhbyYtFdq8GPb5FsjpoO4mTBr9bRk/qS/aI4vjdKjkHD4uP
         cWXW8XsEE+fD9VaJnwMxaxgUP8e5g9Mp1zHFTu5m/a46WN2CwskAiWES2kQgRTXLNiOt
         jtaLCyrjcJzJl/GgXg+1VxX6MdmywZPyMxyInVfZynX9Sl9WwnHWi3wxk5MCth3LaeZR
         9BAoVsr0XwsXyaedJl9uv4wC7jE9bq32i5y7My2bKBl237GwN+JEiuh4z0bufAQaw3Yu
         hgXg==
X-Gm-Message-State: AOAM533LedpctJePw7INF2MPKrJkFqKQantAypvPbKjjiUbCxRPE4pTG
        f7TujmBfza/oCs/6LyC9ZGTHDA==
X-Google-Smtp-Source: ABdhPJyrXOh+fiqV7Y/t9Tokf2adkKintBDcUuhkhcJ9lId4930V3lXNU3Dgrt+bFOeg/VRmD57z0w==
X-Received: by 2002:adf:9ec1:: with SMTP id b1mr4456180wrf.171.1598254413967;
        Mon, 24 Aug 2020 00:33:33 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id t14sm21197697wrv.14.2020.08.24.00.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 00:33:33 -0700 (PDT)
Date:   Mon, 24 Aug 2020 08:33:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] mfd: Add driver for Embedded Controller found on
 Acer Iconia Tab A500
Message-ID: <20200824073331.GG3248864@dell>
References: <20200823140846.19299-1-digetx@gmail.com>
 <20200823140846.19299-2-digetx@gmail.com>
 <20200823181653.GC209852@demiurge.local>
 <82abab10-9af6-a9c4-b241-d5a3af5b588d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82abab10-9af6-a9c4-b241-d5a3af5b588d@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 23 Aug 2020, Dmitry Osipenko wrote:

> 23.08.2020 21:16, Lubomir Rintel пишет:
> > Hello,
> ...
> >> +config MFD_ACER_A500_EC
> >> +	tristate "Embedded Controller driver for Acer Iconia Tab A500"
> >> +	depends on (I2C_TEGRA && ARCH_TEGRA_2x_SOC) || COMPILE_TEST
> > 
> > This seems to also depend on I2C and OF. Perhaps I2C_TEGRA and
> > ARCH_TEGRA_2x_SOC imply that, but it could lead to build failures with
> > COMPILE_TEST=y. 
> 
> Hello, Lubomir! You're right about the I2C because it could be compiled
> as a loadable module, good catch! The OF seems should fine as-is.
> 
> ...
> >> +static struct a500_ec *a500_ec_scratch;
> > 
> > If this is only used for power_off, please rename it. I've been told to
> > do so in my driver: https://lore.kernel.org/lkml/20200519104933.GX271301@dell/
> 
> I don't mind to rename the variable, but not sure whether it will be a
> worthwhile change since _scratch is also a common naming scheme among
> MFD drivers. Please see max77620_scratch for example, which I added
> about a year ago.

If something is used once, it does not make it 'common'.

Not sure how this slipped my notice before, but I don't like it.

Ensure any global struct used for power_off only includes items
required for this purpose.  It's unfortunate this API requires a
global variable at all.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
