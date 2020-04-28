Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2F61BB73E
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2020 09:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgD1HJ6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Apr 2020 03:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgD1HJ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Apr 2020 03:09:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901D8C03C1A9
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2020 00:09:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j1so23326549wrt.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2020 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lMEa6R/eYAIqk1WFDzSBGM7+C3iUTrOyPMrRdGdHxQI=;
        b=XK+3/aOKMdWUeiVuCoBZONtKCMfLLzYajSsCKOXfvsR6utqJUQhr+6FIry9ABFD6g1
         HFBeJpmo1mf3rvsdRFrXS8PXKlhAuKWiCd9I6K7lZfGYcZJ79v1T5YimjffH0G9yj87q
         aLSE8hWboyqXwcsegUE2bW4HB/6ZE6+LDN9X1l6E91g1+1xWVoCwP/OTOeOQUY/bk+IP
         ZYMbzeihgHkWc2ALWXiCsvcM6w3y3gNigL8hdyGqEsu+u9b0PIBuG+nKgpYIEUEBlD65
         LRvndNI/a7Stuwyeb/MaYykxFCyRuZKjpvL/mlSn+6riTQ/VGOs0cZMmhJ1yKIhho5/C
         9frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lMEa6R/eYAIqk1WFDzSBGM7+C3iUTrOyPMrRdGdHxQI=;
        b=h+89OF3itdnbGAmnIzQtflet6WEaGyLEbUZ+iJ0WTvyIIulmCu4Y1Za7uW3mo4AAQR
         YiOa7qDg/hM+6M/276wxktiuk0aBJ82qnbIGREj2/A0/sJD9A74noIXmO1KayOyZUvWM
         ylO7wb8XVvCAuQfAq9X9OWWJr/cc3gsRokkvbwKZRb8nzFf5RYdzX8w6Wfp9PeSYBse5
         u36Xa5PVAr6kGPpB3tnomEtmdgF14OVjCsi9tVc5eh/sPj0iupP8lfv9lLFJpzT3z3ix
         5u9qElyZeH3iwrVzZIKeHnZc+vkOExeQhODVqAU8ZlydiKyp/QyBHjRwUw7QZhA2UmPu
         aREQ==
X-Gm-Message-State: AGi0PuaFcrW5ZfTUj+BvwAxGQf4Rh51EeVWSZlf1QXs6Wc+sFkzFdNF9
        XSuI2Maef9yS74XU2WAGikJAZg==
X-Google-Smtp-Source: APiQypK0KOM5V4C2Z5llck0w8pFFM5So+4+1Ay4saK2Pj2qjCPKB3yWrM321BmZUfw8SL8WDLVr+bw==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr31406670wrv.314.1588057796054;
        Tue, 28 Apr 2020 00:09:56 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id j4sm23732081wrm.85.2020.04.28.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 00:09:55 -0700 (PDT)
Date:   Tue, 28 Apr 2020 08:09:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Milo Kim <milo.kim@ti.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Message-ID: <20200428070953.GI3559@dell>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224140748.2182-1-jonathanh@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 Feb 2020, Jon Hunter wrote:

> If probing the LP885x backlight fails after the regulators have been
> enabled, then the following warning is seen when releasing the
> regulators ...
> 
>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> 
>  ...
> 
>  Call trace:
>   _regulator_put.part.28+0x158/0x160
>   regulator_put+0x34/0x50
>   devm_regulator_release+0x10/0x18
>   release_nodes+0x12c/0x230
>   devres_release_all+0x34/0x50
>   really_probe+0x1c0/0x370
>   driver_probe_device+0x58/0x100
>   device_driver_attach+0x6c/0x78
>   __driver_attach+0xb0/0xf0
>   bus_for_each_dev+0x68/0xc8
>   driver_attach+0x20/0x28
>   bus_add_driver+0x160/0x1f0
>   driver_register+0x60/0x110
>   i2c_register_driver+0x40/0x80
>   lp855x_driver_init+0x20/0x1000 [lp855x_bl]
>   do_one_initcall+0x58/0x1a0
>   do_init_module+0x54/0x1d0
>   load_module+0x1d80/0x21c8
>   __do_sys_finit_module+0xe8/0x100
>   __arm64_sys_finit_module+0x18/0x20
>   el0_svc_common.constprop.3+0xb0/0x168
>   do_el0_svc+0x20/0x98
>   el0_sync_handler+0xf4/0x1b0
>   el0_sync+0x140/0x180
> 
> Fix this by ensuring that the regulators are disabled, if enabled, on
> probe failure.
> 
> Finally, ensure that the vddio regulator is disabled in the driver
> remove handler.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/video/backlight/lp855x_bl.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
