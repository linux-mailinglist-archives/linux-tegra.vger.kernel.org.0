Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28703178B5
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 13:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfEHLrI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 07:47:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53180 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfEHLrI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 07:47:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id o25so2886936wmf.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 May 2019 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vunkPogDgwLHcgU4wUE6GKJkPYgwGc3vJvW5IzNJ5vc=;
        b=f+MXrgTRcWRIj+qZ/Un0BzbnjYWwXWgNixmZCI4qv9Ljw3jYEhvy3zFN/JRmQPAwGh
         bPIDGlc8abvgq5MNh8rgeP7ThB30VNcDEGGqp+xIrwZhgGG7e5CFogYowUcBLTaE2uZQ
         /Uo82iLQJV6Pl0gsb0iJrGqVcibcayqRxOyF9qR9ARQGLQFEORZFLur6pSYCcFbL30xa
         54b9aWnbre9mKvjlWnzei7oIuRFT768v4qrrUaMq1v3J113r3DEARBk+aeNyNC/1+VDw
         0/gwo2bUQw5TQrBNSBi8zOJv9+wQbk+ZqPoCEuLw7/L0SRxQS7u/QYgafiYdo8z2EnsW
         d1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vunkPogDgwLHcgU4wUE6GKJkPYgwGc3vJvW5IzNJ5vc=;
        b=NMi7TPDRHxe4edZARg1ChZnsu2Xhh3uI53ftt3tFporvBIJJjyz/tHQSso6CCh8jb9
         i1yfIz9jt/I2GhX46Rwwc8wECCoi1bxelrl0S+RADu9wS84ZpK5EBQrQ3KvUipqOkEDi
         SJZlKAwNWC8xiHDSfCFfnf5Jo2gLJd6c+tKTL5h5U8V/NdBsDyzV74efVl/D6wzia6f1
         D1rRmcZN69y0mX3Wmf/6SwH41M1WUwV3hzuek3UWLyN8sE21JztLA04qhJ7Vdlomtgcd
         OfH4RRwOWWJqL0P5N7Zd7/gvMWfgsVyT+w5inP3hQ0Og2cpP1mg63fCSuHuvUjl1rZqB
         9thA==
X-Gm-Message-State: APjAAAVpNb4oTJlizr2786gcaghm3mY4gw/krLikAQB3cB4EIl0WXAnw
        f8ulNTAMxdvjM5LaJu1Bp90MzA==
X-Google-Smtp-Source: APXvYqzpCgkgpGH2BTeC9oKEa1MkFjpRLgtAMVclT8UitoiRuPCfcMXNALUCuwIMhowtfqHy1htzmg==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr2736566wmj.98.1557316026856;
        Wed, 08 May 2019 04:47:06 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id v12sm15433361wrw.23.2019.05.08.04.47.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:47:06 -0700 (PDT)
Date:   Wed, 8 May 2019 12:47:04 +0100
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
Subject: Re: [PATCH v4 3/6] mfd: max77620: Fix swapped FPS_PERIOD_MAX_US
 values
Message-ID: <20190508114704.GJ31645@dell>
References: <20190505154325.30026-1-digetx@gmail.com>
 <20190505154325.30026-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190505154325.30026-4-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 05 May 2019, Dmitry Osipenko wrote:

> The FPS_PERIOD_MAX_US definitions are swapped for MAX20024 and MAX77620,
> fix it.
> 
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/mfd/max77620.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
