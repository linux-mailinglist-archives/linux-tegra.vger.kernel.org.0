Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642D5CBD63
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbfJDOgM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 10:36:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37781 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388989AbfJDOgM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 10:36:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id p14so6573947wro.4
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=H+yr5kS5iH2wmnNe9kPeQU/T3tzbAN3a+t+sjJ+iY7U=;
        b=yTGJqZkm09u05ribXQL0uDJJ9aCSfe45YY5Zmi6pWlVEFuFQctsjKj7yLyufgnswfX
         rJd0cAagn5RI67Kf3o9tdxqzvBMT9p9kPSfzME32i5S+eQVWvryxrBzdPlMsUgXwIgHr
         Ds/Ynp/Yf60O8c7I9AKA45KqfdWShNERMT6WfOpXwXHch1+57zBQymt2GLpYU7WVhQ99
         gP+pXFbzcFLFKP0GndNbZIJWmH0G5DyjS1yzgO7s0kQ8YtfMhKZFjKu4/Iv55C2oSVNA
         cCklWMufOaHW4ABU667u118NIZF3O6jrehnSoF/J219zt3lVEZtSgXWz+5WuYfHQwo87
         ETlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=H+yr5kS5iH2wmnNe9kPeQU/T3tzbAN3a+t+sjJ+iY7U=;
        b=uhCi0KNcE1BjZda2xku+1jCao/tD7un17YO+M/Eq63bH4OaqEJ1a8pdX6b14IBXSSy
         iCzWckZA6+aaf3XB7eifrqUAjm1VKnGM3N9jR/7/ZzL15PQBVvoenxDCei53nTfcnrdp
         QgDDNBdosaXiN2Z1mCgpwOQLzg/Z99xeFMyMG5ZRVoDA9cAfg9qkfflNNyytW9GcgC9E
         7m9z1PzPRjrcQnseahEFu9TS5ACWl/48jc40zAsm6IOi6lL2s5xaexzcqW3zs6BUoenW
         dKJ+lMV2L8/KxqLDubUbpy05aA2RphAbOC0D9Jev2ToI9Dex/sY99YXwhKfjl8yT0iPu
         5pkw==
X-Gm-Message-State: APjAAAX547kZF9QYfWpwL0Hj6p9o1+dCm4bD2hfVDyrcdc1VO2Xs8onl
        GiQipQo4kyzk8un3i4mQxRE5Fg==
X-Google-Smtp-Source: APXvYqz2i9TJzrN0Lsg67JBKMSZYobGbOf6d9N2rrnf6nMWRkWoUODo9EYYr7bSLftlbdYhSpmZ0vQ==
X-Received: by 2002:adf:cc8a:: with SMTP id p10mr11756685wrj.321.1570199769269;
        Fri, 04 Oct 2019 07:36:09 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id z189sm6971821wmc.25.2019.10.04.07.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:36:08 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:36:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: max77620: Do not allocate IRQs upfront
Message-ID: <20191004143607.GL18429@dell>
References: <20191002144318.140365-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191002144318.140365-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 02 Oct 2019, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
> upfront if passed a non-zero irq_base parameter. However, the intention
> is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
> instead of -1 to fix that use-case.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/mfd/max77620.c       | 5 ++---
>  include/linux/mfd/max77620.h | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
