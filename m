Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381B72556C3
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Aug 2020 10:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgH1Ipa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 28 Aug 2020 04:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728752AbgH1Iow (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Aug 2020 04:44:52 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF8DC06123C
        for <linux-tegra@vger.kernel.org>; Fri, 28 Aug 2020 01:44:51 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id i20so82692vkk.2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Aug 2020 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i68K1oVW//N2+LJY/Znt9A9GXSvc2knY+uF5OLZlW3E=;
        b=T11C7mphpjdwy94FR3QiUCw/s5gZrgGyEYLzUcAk2VBMcgtTsIiASblHRXVOWjTR8f
         fSKqXBAkgf1x0Aawx9GdU41IiybGpPpfdoZ24viRcWevKccV7/LcywLkUf39qPSUIgHM
         gs3BKu6/VuSar3C7KsUUdC7YkhhrLIOQuBKubp2UruUbOs/EryrB50B+emHFGs2JTcpL
         VnPJw8ECgwjn62NENrOKdNdJnG69PlgCedXkB67QgRMqh5EHp/8AIAUYzOyGUVsoAk4o
         QKcK/gsJaQdig0KI4JuE1N5YPUHbqVZcGeOdMXpK93TV0Xm1DzaetY5de3wKBWnGDfMQ
         EuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i68K1oVW//N2+LJY/Znt9A9GXSvc2knY+uF5OLZlW3E=;
        b=ZNwx4n1PQIan31qluvrPo3M2rf30LzULMQZ+XXggM4Zza2mz4/xdODyJI3cCAAAjKf
         fzQ0pNUBOW+lahasiIRNKNiZJ2p1UVsZB+Lbp8IEC+ZM+me88VokEqsr0z6jMm+0D756
         d8uIuAnpCXVD5YtgiT/5khiSLhWjwKdml+QFfDzp+1rSzQIC+++jf+MoYN7aplbT+HH3
         1+lAX2eomNoWpWEACvgLolIp5BVtU+SEjNriaLqRbOz5kKYIhHdjV2p2NmZN2FRMawUQ
         DfsiosaL104b5l/are98oYqOnarqzDZT1mGryg9VT2ipYKBI6LR6CiOjeQdw9H0vovks
         MxNQ==
X-Gm-Message-State: AOAM533J09brFCIATEGjausUQJiLU0hJo1YjWtZK8pdg06eHqg13HjJL
        hcis5njb0zzSIZkDSm4H5ijMBaZMBCrGBXqyh+4RpwpCFNDhIw==
X-Google-Smtp-Source: ABdhPJwyLUVJLFv8vKvkEYsSU7ILzcE5NWJavW5HwQPyZHyyUDM1gvnGVTI+2DM9xnyhEB7GbwL/uRVULNGsWzDFs6Y=
X-Received: by 2002:a1f:2a48:: with SMTP id q69mr199169vkq.69.1598604290613;
 Fri, 28 Aug 2020 01:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <1598548861-32373-1-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1598548861-32373-1-git-send-email-skomatineni@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 10:44:12 +0200
Message-ID: <CAPDyKFo+1XzHaS55jV3KsjkGA5a6A_NovLFrBw66Vg3xzTNkRQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Fix timeout clock used by hardware data timeout
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 27 Aug 2020 at 19:21, Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:
>
> Tegra210/Tegra186/Tegra194 has incorrectly enabled
> SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK from the beginning of their support.
>
> Tegra210 and later SDMMC hardware default uses sdmmc_legacy_tm (TMCLK)
> all the time for hardware data timeout instead of SDCLK and this TMCLK
> need to be kept enabled by Tegra sdmmc driver.
>
> This series includes patches to fix this for Tegra210/Tegra186/Tegra194.
>
> These patches need to be manually backported to 4.19.
>
> Will send patches for 4.19 backport separately.
>
> Delta between patch versions:
> [v7]:   v7 has below change
>         - v6 has implementation for retrieving tmclk irrespective of
>           clocks order. But based in internal discussion with Thierry
>           this is not required as typically order specified in DT
>           bindings is the order validator want to see in DT.
>
> [v6]:   v5 is sent out mistakenly with incorrect patches.
>         v6 includes proper patches addressing v4 feedback
>         - updated dt-binding doc to be more clear
>         - updated Tegra sdhci driver to retrieve sdhci and tmclk clocks
>           based on no. of clocks in sdhci device node as old device trees
>           do not use sdhci clock name and this allows proper clock retrival
>           irrespective of sdhci and tmclk clocks order in device tree.
>         - Added separate quirk for identifying SoC's supporting separate
>           timeout clock to be more clear.
>
> [v5]:   Include below changes based on v4 feedback
>         - updated dt-binding doc to be more clear
>         - updated Tegra sdhci driver to retrieve sdhci and tmclk clocks
>           based on no. of clocks in sdhci device node as old device trees
>           do not use sdhci clock name and this allows proper clock retrival
>           irrespective of sdhci and tmclk clocks order in device tree.
>         - Added separate quirk for identifying SoC's supporting separate
>           timeout clock to be more clear.
>
> [v4]:   Include additional dt-binding patch
>
> [v3]:   Same as v2 with fixes tag
>
> [v2]:   Includes minor fix
>         - Patch-0006: parentheses around operand of '!'
>
> Sowjanya Komatineni (7):
>   sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra210
>   sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra186
>   dt-bindings: mmc: tegra: Add tmclk for Tegra210 and later
>   arm64: tegra: Add missing timeout clock to Tegra210 SDMMC
>   arm64: tegra: Add missing timeout clock to Tegra186 SDMMC nodes
>   arm64: tegra: Add missing timeout clock to Tegra194 SDMMC nodes
>   sdhci: tegra: Add missing TMCLK for data timeout
>
>  .../bindings/mmc/nvidia,tegra20-sdhci.txt          | 32 +++++++++++--
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 20 ++++----
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 15 +++---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 20 ++++----
>  drivers/mmc/host/sdhci-tegra.c                     | 55 ++++++++++++++++++++--
>  5 files changed, 113 insertions(+), 29 deletions(-)
>
> --
> 2.7.4
>

Applied for fixes, thanks!

Kind regards
Uffe
