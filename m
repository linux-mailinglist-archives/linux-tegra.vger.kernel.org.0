Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DAC259ECB
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Sep 2020 20:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731468AbgIAS4k (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Sep 2020 14:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731566AbgIAS4Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Sep 2020 14:56:25 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11949C061244;
        Tue,  1 Sep 2020 11:56:25 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y2so1379503lfy.10;
        Tue, 01 Sep 2020 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G85PUm7a3EZzS/FYnNEVI0eznDTH8pPJcc+osLm7WqY=;
        b=tVRoeQwB/gWeuJVETgIoI6uDSLBu9Oi18EgggfK6uMO6UdxaRljqsV964YZWadqrUD
         gnqR/AUlD1T/UL2fXjhcB4us5pytm/ub02fZv4t79xOsyGD7v2OKOonJB1hxTlohcn/b
         3SL21pqUtnNXQs4+7+oouQ2Ppzio4eXKbbvGhuujsuUCRBRioI75eRg/okkBcUhbEPXT
         Wb1CQfA3E//DU2JpFZteOvIezkrUmhiGht8sT2mEGv4iAMtCcwm76LuMvZO0fb6Dv1V/
         jScuFD/qzzG4zSH31l/chlaXN3QgEuoeBbsGZBYjbVRN9Hxo17lJ2aY1WoAw1VrY0L6M
         GiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G85PUm7a3EZzS/FYnNEVI0eznDTH8pPJcc+osLm7WqY=;
        b=RJC9J7ogCFEv8GMgyeZ913sFscxuqelQjVKtRHYo7YittwUVmNRKCUHOLaTF0kceu4
         2zkitXYaZAkCBEOUeP0OWJyGibM7zyy+pgONjKXTxtYyKIBSan3sg+jkuQp6WTQNFACZ
         KSuOO4K2BycPLDK4KopZedM5JD+qgOO5EbznYJwc6s5y9xzGPUjRI3eHJbodumxQ4/hT
         Gz6KSxB7FN5vx65OMvAueSsFYBXeJWvyhtbDTnlD4JXUEQrEoWlp9zWXtk4cg/Aepvlc
         IHZ/T3e4ADzPyUyMBw1o5rjAdU///D+OyWm4V01k+ouTR799bxUaO2oMC8ESsuSxFWxc
         HFUQ==
X-Gm-Message-State: AOAM531un6BGW7OgJTJR0Zrf+tORPIASHZGJwMBu+/XD0edyn/JsVYdL
        4tL4CsBpH7rsIUXkYKCtA1Bhn7es1X8=
X-Google-Smtp-Source: ABdhPJytkMxC+QnEFyPCwOzPuvfcWYWQYoBFmyrc6f5aTlvzcgsyU7pjMfTvbqXAGKvX8ZR5PgQIPg==
X-Received: by 2002:a19:447:: with SMTP id 68mr1387400lfe.26.1598986583325;
        Tue, 01 Sep 2020 11:56:23 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 10sm468433lfq.64.2020.09.01.11.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 11:56:22 -0700 (PDT)
Subject: Re: [PATCH v4] iommu/tegra-smmu: Add locking around mapping
 operations
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Cc:     iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200901171305.6929-1-digetx@gmail.com>
Message-ID: <2d38fcab-bc7a-2986-ff39-9403164914e4@gmail.com>
Date:   Tue, 1 Sep 2020 21:56:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901171305.6929-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.09.2020 20:13, Dmitry Osipenko пишет:
...
> +	/*
> +	 * In order to prevent exhaustion of the atomic memory pool, we
> +	 * allocate page in a sleeping context if GFP flags permit. Hence
> +	 * spinlock needs to be unlocked and re-locked after allocation.
> +	 */
> +	if (!(gfp & GFP_NOWAIT))
> +		spin_unlock_irqrestore(&as->lock, *flags);
> +
> +	page = alloc_page(gfp | __GFP_DMA | __GFP_ZERO);
> +
> +	if (!(gfp & GFP_NOWAIT))
> +		spin_lock_irqsave(&as->lock, *flags);

I realized that GFP_NOWAIT is a wrong flag to check here once I saw
warnings about sleeping in atomic context. Apparently __GFP_ATOMIC
should be used instead, I'll make v5.
