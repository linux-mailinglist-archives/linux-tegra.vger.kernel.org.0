Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C95CB94D
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 13:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbfJDLiQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 07:38:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35984 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729340AbfJDLiP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 07:38:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id x80so4254560lff.3
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2yh7bWzLE9qVNvX192rnmAlFhU/yxN1/ydgnK5FwSCw=;
        b=SlqYp+UQLmG3gbG+XOU0q3J/tSerKH5+Th5UyawbG+ilv4t/vfMoeJMJmuxie4lT8M
         IRDSuqZT/bJtYeoeZiIcdjELvPem+TNwvP8a9lAKgLns7Y5WmmvaFKnwIi7vCJk21YCD
         Rzcf+jkvFLfT/rI6wzpJPesniCNQcw2bNBACA+STds2bBWEuAn9oONOSojTIkJ2sdLNz
         opRiG5fNSHRCZg0pUkf3w6vhcQAFeBLlLj6ioEyFuiQIgGUul5kqYmYCSUYqoxf/NlH5
         WCdrENo0gXGHGgxUaxxJSCztsAWA8wLVwNgRVA5uDcRKxtUkRI3u0BZUiAonzz9hOwP6
         +Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2yh7bWzLE9qVNvX192rnmAlFhU/yxN1/ydgnK5FwSCw=;
        b=eb1UKXzKfXtWWU9Ln0+NtW91fiHVXcacx2DcILtmBXqYB0Efr/6Uow3qYBtj+GZn6n
         QrtlAGwbIzyXWX9g1zWjnzWvXaayOyIoaoqzgnumzNOiZ07d9nq63Kt9mdNV92rt4QdV
         UqiNh23NlBON1xu8bSCUbGFYe54gDAnNfi5yNodJQm2sN5cHvC/zt36n53Toh7q27nU1
         xANvUpKd6yLQJ5rOgBecOeVRcCY1FIzi3ssRKrhkkiyMXaESg5MYiD6BgsH3IJ5Uuept
         DEBMJSsHPv6q8nef1uG9R021VAxcOEnhXQbxypeXmUaJbOfXZxQ//VnF6t9P8hmLv8OJ
         4kCw==
X-Gm-Message-State: APjAAAUQWqF62NrrlXYaLHLyHnwo+F5gvONurYLemOY244RHYtMIoDsS
        Q8SH5Ke/4PajQnMtiipfUNsGqH3n
X-Google-Smtp-Source: APXvYqwJKaiwHnJXqrTicipCk4igPof79V6k5fNw+76qGq5/Mx7h4gpKKTEtBba2zkVttwc+T53EbA==
X-Received: by 2002:a19:c695:: with SMTP id w143mr8285814lff.162.1570189093469;
        Fri, 04 Oct 2019 04:38:13 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id k8sm1533419ljg.9.2019.10.04.04.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2019 04:38:12 -0700 (PDT)
Subject: Re: [PATCH] arm: tegra: enable pinctrl_single by default
To:     Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
References: <20191004000017.31656-1-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be0e8bee-5ef6-5850-8c21-31823b7d7cc7@gmail.com>
Date:   Fri, 4 Oct 2019 14:38:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004000017.31656-1-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2019 03:00, Peter Geis пишет:
> Enable PINCTRL_SINGLE by default, this is required to enable
> GENERIC_PINCTRL.
> This prevents tegra_defconfig build from failing with the following
> error:
> drivers/soc/tegra/pmc.c:1753:3: error: ‘const struct pinconf_ops’ has no member named ‘is_generic’
>   .is_generic = true,
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm/configs/tegra_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index 9a2f11a780a8..c9e6d0f8917b 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -130,6 +130,7 @@ CONFIG_SPI=y
>  CONFIG_SPI_TEGRA114=y
>  CONFIG_SPI_TEGRA20_SFLASH=y
>  CONFIG_SPI_TEGRA20_SLINK=y
> +CONFIG_PINCTRL_SINGLE=y
>  CONFIG_PINCTRL_AS3722=y
>  CONFIG_PINCTRL_PALMAS=y
>  CONFIG_GPIO_SYSFS=y
> 

Hello Peter,

The ‘is_generic’ is hidden by CONFIG_GENERIC_PINCONF, this option should be selected by
the pinctrl drivers. Tegra's pinctrl doesn't select that option, hence I can see the
non-multiplatform build failing to compile.

Thus the fix should be something like that:

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index a67d0d9ae8cd..98e3ca67deb1 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_TEGRA
        bool
+       select GENERIC_PINCONF
        select PINMUX
        select PINCONF

This change will force-enable CONFIG_GENERIC_PINCONF whenever CONFIG_PINCTRL_TEGRA is enabled.
