Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAE22F625B
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Jan 2021 14:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbhANNsn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 14 Jan 2021 08:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbhANNsn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 08:48:43 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87B1C061757
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 05:47:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id g10so4745616wmh.2
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TbqE2IlRGagFgBkQ2kCkUrfXzLCjHj/NgUbyVG+QOLU=;
        b=OwOxLsbosDLvoLhRLZ8mzzei4v0t2XhAEbH8Iq2Sxm640+qWBEKYZm4cocQg4aGYiV
         Xffe/6oKYTXJTmiquE5GGTUFqyH4SWt1o3Mk/HO8mr1iB4/oJKfzT+653Fp1pZ6tPwzi
         S1stu6wWFThE8hKMRzYPWMNQPSVjWsmHzrcFSQebC+wFsDX7FJfNPmzHzMhUEvcJ4Cv+
         by4PSWVqcLWwoS6qTTEpItMusrhWhM+A6A9T+EBRMyqDtNd1C3s6YY82pNWW5Yu/oudv
         zQUzIvGo47Uv1SukMAsYZkAvpT4tZhYQ7JGE+BCNysEIgarpETIZ2w3ApWtZcqTPbAU2
         CxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TbqE2IlRGagFgBkQ2kCkUrfXzLCjHj/NgUbyVG+QOLU=;
        b=g5R141vPEUKdMU/d9atP8F8M8FOPMPsqL82TFIU/mcvYbPvJ6DxKcfu0BiJvI8Qn2m
         OmRckA5d+y1+kwmEVV8v0dEpg/UTDLI1XlkCeO9+5yHJT9q5xjJ8Bpf8eeRu+xxs/AMZ
         P1PPkZDplbHc3yvivp0LjBxYxLXU5dpNlNauhaInLXwJIWKtLDtZ3Sx2bZ+Qq/W7i/Wa
         5D/YSRdprVpHGbCLyhgbwBF98Bkadcr2v3iZUVYI1dtHCNpwzPL2Nwrn29jTRMOEd2yr
         IyVlTZcAb8BWQnuvMmUyRvR68mCsTVT2mN8Z3W8axl62ErguuS/Ido0PxKZlp0ykuGyK
         4RhA==
X-Gm-Message-State: AOAM530TMUSgzR49qAR7nJRHFxW8QEAvZXXyAybxCvzd1asxUlxzrTk2
        e4WNpUAYUOSVWWWZSXvkW65tEw==
X-Google-Smtp-Source: ABdhPJx7eMOHq1ibtaSAKOLLhWbpBK52AbF8LO4+T4csN/v/5B1yHZ36jNUkiZ/Dhf1ZMfYjqWO/Sw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4021448wmp.156.1610632075437;
        Thu, 14 Jan 2021 05:47:55 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id n9sm9766176wrq.41.2021.01.14.05.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 05:47:54 -0800 (PST)
Date:   Thu, 14 Jan 2021 13:47:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] mfd: Add driver for Embedded Controller found on
 Acer Iconia Tab A500
Message-ID: <20210114134753.GY3975472@dell>
References: <20201228160547.30562-1-digetx@gmail.com>
 <20201228160547.30562-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201228160547.30562-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Dec 2020, Dmitry Osipenko wrote:

> Acer Iconia Tab A500 is an Android tablet device, it has ENE KB930
> Embedded Controller which provides battery-gauge, LED, GPIO and some
> other functions. The EC uses firmware that is specifically customized
> for Acer A500. This patch adds MFD driver for the Embedded Controller
> which allows to power-off / reboot the A500 device, it also provides
> a common register read/write API that will be used by the sub-devices.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/Kconfig        |  11 ++
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/acer-ec-a500.c | 202 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 214 insertions(+)
>  create mode 100644 drivers/mfd/acer-ec-a500.c

Looks good to me:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Do you have a merge plan?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
