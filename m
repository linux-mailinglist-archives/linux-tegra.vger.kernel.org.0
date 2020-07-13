Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E89F21BD7D
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jul 2020 21:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgGJTS2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jul 2020 15:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgGJTS1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jul 2020 15:18:27 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B08CC08E763
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2020 12:18:27 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id q74so7205957iod.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2020 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
        b=G8ptAYtqk+SEo+CGoUOHZRF+vl7lJLdIBT0S/pHrduzEbWxvqh1IfPE2/4VhppHPde
         YRXFOyzoKkrWceSDyBehaHWrFlUcgXHG6dZJw/Ckmn9tJWTq/vXETO0JL2rxorvAqYgr
         sfYAe5TLkNk/6oh5kEcCbqnW3iSm0YxUhQvE7I1A5yKSuwuC4rUGD6Q7HEO+tu1wAlSl
         tD0rGE8wl+/tQgRZmMsrGa6EwlUhvHi7G/Qlh1O3Vt+4ehxXhBo8td3OJyHLYU9R9Rnm
         rBv1SJmQ77C6sJHC+gp5sx/9NhXLg9ziLq8flwiewQDJ8rwiHelTeKULpgwtJnZC8Zqx
         8ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
        b=N3mqMVrZch0/o2YBDF2QdlIwBl5SldvshOwHK7k5JGQ35E8tXvZcBAuvUWPNeIONXD
         vH7hnTcGBFZ53fYQGzok8kadjKuCtKwuen/LhKFLj2HKyutSTlF6S2hbsDPGSgEn14B7
         hPyqqBedDJp6Rwf2RTNbkp3+NLwRcYXGpyDA8FSjZfWysltLaWWZc4S7c/raHUw+rWg6
         JSCT3i33NmKitpIjx0FJoVgKO+kWOGiupr+xo8tQ3FdXZFl0OkCL7LkSui5R56ZXzdCP
         KvGv/MkQ9xa3Uc/VCvrIJ3IQdUefZ9d4fFEJTQRwADrpYghrvlTlgGtZ9jWWUH2I471D
         S6Lw==
X-Gm-Message-State: AOAM531ni0bOobRkF6e5H1d2Wb0KAhRYTuaVTzYmWN+a5amjSvjt0nmL
        v2usrc9Jlteq3xQLLpFU1OLLEBf/KyAtFokFD6ieLg==
X-Google-Smtp-Source: ABdhPJxMIWGB7DkTs3ZmaVNfNrJhTVDywQypoX4jJyE5KKI9jPnWPX+st4yY6PAU87KCAHCqBg6cegX8IfVhneQ5zK4=
X-Received: by 2002:a05:6638:2172:: with SMTP id p18mr81169397jak.63.1594408706326;
 Fri, 10 Jul 2020 12:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190908165642.22253-1-murphyt7@tcd.ie> <20190908165642.22253-5-murphyt7@tcd.ie>
 <20200710155933.GA20886@lst.de>
In-Reply-To: <20200710155933.GA20886@lst.de>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Fri, 10 Jul 2020 12:18:15 -0700
Message-ID: <CALQxJuumgH9xR-J1Nj3LQsLW6k+4ie_0Ho3N9UJiN4R0JBGYoQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>Btw, what is the current state of converting intel-iommu to the dma-iommu

These changes expose a bug in the i915 intel driver which hasn't been
fixed yet. I don't think anyone is actively working on it but I plan
on merging as many patches as I can so it's easier to do the
intel-iommu -> dma-iommu conversion once the bug is fixed.

You can read more about it here:
https://patchwork.kernel.org/cover/11306999/

On Fri, 10 Jul 2020 at 08:59, Christoph Hellwig <hch@lst.de> wrote:
>
> Btw, what is the current state of converting intel-iommu to the dma-iommu
> code?
