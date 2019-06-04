Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B841F34CD5
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 18:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbfFDQHu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 12:07:50 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34713 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfFDQHt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 12:07:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so20279179ljg.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VF44+WYtB7En5GNeSO4eswVwBmaeX+wh57RI5M6cz6Q=;
        b=oFyRJLfRytrvPMZvCzvn5QO5LhmHtFBiaeLWsle1aw2B6kGF6xMd3QZ1LVBbl4hhkT
         9THLoZAIBA6txtQADsyeRz9W9yBg2fD40v5l8wfI0WXJhOpXjxBEIL0NpUWJIXI38y8G
         dD8TmR3OWNWUdrTk3SzmA6QES8VnpF7SSjaWqSnAe40aXyohMpdAn5Js35DXcecn2BVz
         NWsLzrYfA57kf2C/QLXBOyte42eJPbrtIAM2FWVN0WAwGXqFyj2OfaPkSkB2MQl4Lgac
         EfspCYV0Lp1hjBWoPXclHwqOGJNY90nYNu2UQcb51M+m/uv4OBiyFRInrtO0kuW6ZkNm
         KiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:newsgroups:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VF44+WYtB7En5GNeSO4eswVwBmaeX+wh57RI5M6cz6Q=;
        b=HXfSPtyZcFaraqvA+KHB23KbvmTKNx0g5CMwKbM4eHIy+tN/7cjdlpxyZ8yb4u+dR8
         QviZiTKHy22twRIXAy7LBN/hfdpsKHc4/LH9Qrl+WmOIPzTpRS4GEGqdl60UOFyaom7R
         iYwY8SUAUmuxfaKiyyiWx8zfVSu/CNpgW5EJ/m+Z8qXqioQ8FVxCuHbqzV0MRRfLrx9h
         y9JVWPFHSU2pOuQbOnb53Ja38Z5MpqIh2NLpKDZbZXZb9crKPa3jLxFy8vULIv1vy8J8
         3pMvYSIMMtkHCdprVIkQIiwMweb4VsA6FkrD4fH79zNh955z/RuxSv2fl/N6PtwUTwRb
         pNyw==
X-Gm-Message-State: APjAAAX8fk5AixgRGLRIw7s703Yxr9910mBOWcVwD9GQQBSiesbg/FXY
        0Vt2njdxRvl4YXiSTYqBrHo=
X-Google-Smtp-Source: APXvYqwcyYVSud5I4XEFwrZTha4GIe0mgcmUTecv6gTyyubTSfmBVu9KFIFcykfctoSbMo5peq3r+w==
X-Received: by 2002:a2e:9bc5:: with SMTP id w5mr17814995ljj.87.1559664467688;
        Tue, 04 Jun 2019 09:07:47 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id u13sm3812882lfi.4.2019.06.04.09.07.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 09:07:46 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Newsgroups: gmane.comp.video.dri.devel,gmane.linux.ports.tegra
References: <20190604153150.22265-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
Date:   Tue, 4 Jun 2019 19:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.06.2019 18:31, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> When deferring probe, avoid logging a confusing error message. While at
> it, make the error message more informational.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index c55e2d634887..5a3f797240d4 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
>  
>  	host->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(host->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
>  		err = PTR_ERR(host->clk);
> +
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> +
>  		return err;
>  	}

The clock driver should be available at the time of host1x's probing on
all Tegra's because it is one of essential core drivers that become
available early during boot.

I guess you're making this change for T186, is it because the BPMP
driver's probe getting deferred? If yes, won't it be possible to fix the
defer of the clock driver instead of making such changes in the affected
drivers?

-- 
Dmitry
