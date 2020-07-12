Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F8421C89C
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Jul 2020 12:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGLKsr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 06:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGLKsp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 06:48:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79165C061794
        for <linux-tegra@vger.kernel.org>; Sun, 12 Jul 2020 03:48:44 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so11266802ljm.11
        for <linux-tegra@vger.kernel.org>; Sun, 12 Jul 2020 03:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3OF768bWIKlxo6xuo1+u0kpBkyC0jwZ2U+ICdvGz7+I=;
        b=WFcw+6G2OlPrQtf5lwTfWvjPY0kKHySneb4qw7cFDwvcRx4LkiVcGQaGmzT5fFRQtu
         OoLeexe55CGdC0nzNS8Wbo/z7bftFuhIEpa8uadlM0QgDrg4aLrdSWonIz7EPKk9TAVM
         jE/Lo6Dqc/I9BYcF/W/YXjG8m7LzAe3CmVjLruVCeVwYYLCnp+o3c1c+AbRfuYrmH0OZ
         KG0AiQ/JCSSmuaRXe6+nJ+Z+TvmgjLqpLwA7ZF1ZcoqLN0ECf+a+nsiMlfzLCV2spD4T
         UfZs1PqVsBhLM0/DJA+jC1Xvq+8UwcGJtPg5o1lENSW0eXbon4XvnoyYEMbQRSdhtBx6
         pd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3OF768bWIKlxo6xuo1+u0kpBkyC0jwZ2U+ICdvGz7+I=;
        b=WcdSXgSt33Xo0lESxU85YztuQtp+hnnKtGNFTLBQ7onIoBfhbqX0yw75y3rN274RHi
         YWAExoXXxls5IKk8JMjToGlR+MtC6KrfzKK6Ak50JJ4913fvMEKLfy44QL/1Uq0YQ7Pa
         RD3CGt519HylnhJiRtjZ3tloWpwcgoXl6SaFcm1fxpMa1wvwYRz7HpatOE53AHRINXgM
         b5UOVIYOILIQGTBJaTYBNy1RL/oZ5cORKyEGsJU4z0u6bZkFcSHBpls3LLcTZEOkv5Yt
         DJPpQ5QmDDqsR5o5DhefqKHgAAN+gSn/EiIhyoxXZzDPBxrphpQlUDnE3UmonJRMngz5
         PViA==
X-Gm-Message-State: AOAM532TcKv7CHPVAw9v8k8qF+YrkY5cotCJxRG4H9VUKobdsEYaHJVb
        on9gMg3YbXN5oJ3MNoye/gvHMoJL
X-Google-Smtp-Source: ABdhPJyb3alvy/vaEKCnOmtkmtxvntD3ThS9IAKQm7tAslScKJMMTXLOKtHd7KpGHhhuPHc7+X+RBA==
X-Received: by 2002:a2e:9c95:: with SMTP id x21mr38585898lji.234.1594550922907;
        Sun, 12 Jul 2020 03:48:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id v10sm3370122ljg.113.2020.07.12.03.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 03:48:42 -0700 (PDT)
Subject: Re: [PATCH] ARM: tegra: Enable CPUFREQ userspace governor
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200712103114.24825-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
Date:   Sun, 12 Jul 2020 13:48:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712103114.24825-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.07.2020 13:31, Jon Hunter пишет:
> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
> we can test CPUFREQ with the userspace governor with this configuration
> on 32-bit Tegra devices.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  The_Yellow_Theme_24-192.wav      | 0
>  arch/arm/configs/tegra_defconfig | 1 +
>  2 files changed, 1 insertion(+)

>  create mode 100644 The_Yellow_Theme_24-192.wav
> 
> diff --git a/The_Yellow_Theme_24-192.wav b/The_Yellow_Theme_24-192.wav
> new file mode 100644

Hello, Jon! This looks like something unrelated to this patch :)
