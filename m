Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA26178B9
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 13:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfEHLrv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 07:47:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37551 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfEHLrv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 07:47:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id a12so16691856wrn.4
        for <linux-tegra@vger.kernel.org>; Wed, 08 May 2019 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hpWh4FLHfTm12R9a+G2H8ZnndDdHHQh/uKWiEfB41lY=;
        b=T19FI9rr24oxNF0Zfk0svOeBJeAvGES4DG1//cKgfWNlgb6VBV3oaRyzZpMbb0RZ5Z
         uoI+Ga+XALqYCihw/P8BZMzyHv4pu9iYLsqelUWaiNnPglCA9nrRREbulYclR9xqEqe1
         Mbgc94VcdeXAofMAWu/S2k7BCrjXl7JH1Eu4xfJw/98PwHKpGUz5J75+hPrzvPqjFZWl
         JuXl0f9WL3udDhipjOgXn5W49kiBLaCA1GwpGTj7RPqrYXqZsyOWZFnEtQAexqdZLvpV
         rwaHTILwuoa+TYXj7Q9PhN31xGiSaNb7ERcbHtETdwU/1rperT80xjNIQUYG2ecfBU0U
         DYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hpWh4FLHfTm12R9a+G2H8ZnndDdHHQh/uKWiEfB41lY=;
        b=Z6Tr70BJ5SPaIFE//R6ZmWd0JsNwUjcWlK06kIH4L2omMyjxxivp+xpgYhx+bd9ziO
         xxj+ektLYSR2bPOeaZG2jCr1gCIqaDmpQI6fGMib3a5HeVLWneUfWV4jeNGSTgA+O/xT
         g63yKoXF8G7lSE8mdUKZXKAr2Y9RGGlNZh8xINBWr2/bJwrIyU4dhYdBVy5chqW8+qK2
         RuUrrTSnoBm9i6RmfhQFbmkKFL28OspZU0pT9akHwgVHsMAg34sY0li11zi4BF91k4Fl
         Ec3Ld/Wj0bh+McMb0UEaLNuLIoQUxcgpVCe2SUfpyEQxsnuy4d7Pwfe1lg6448D72w7Y
         Z6Pg==
X-Gm-Message-State: APjAAAVV2gJx4qLaD8pZ1pdC1HFijODEnyiY7JkuvPKqbtW7Ei1rYeDC
        evG7WjuabA5FpgzrjNMKUAn9bsiWVHw=
X-Google-Smtp-Source: APXvYqzkNeZZpEjSqk3ZmtqtJh6nNjJqLlgrXUcwmsu96FP/f07PyTMhtwugNqXNkzzOtnla0ED5fQ==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr20558616wrn.175.1557316069563;
        Wed, 08 May 2019 04:47:49 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id g10sm3039010wrw.80.2019.05.08.04.47.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:47:49 -0700 (PDT)
Date:   Wed, 8 May 2019 12:47:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mallikarjun Kasoju <mkasoju@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] mfd: max77620: Support Maxim 77663
Message-ID: <20190508114747.GK31645@dell>
References: <20190505154325.30026-1-digetx@gmail.com>
 <20190505154325.30026-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190505154325.30026-5-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 05 May 2019, Dmitry Osipenko wrote:

> Add support for Maxim 77663 using the Max77620 driver. The hardware
> is very similar to Max77663/20024, although there are couple minor
> differences.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/max77620.c       | 69 +++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/max77620.h |  1 +
>  2 files changed, 69 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
