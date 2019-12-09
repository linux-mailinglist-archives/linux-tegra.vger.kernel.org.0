Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C658116481
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 01:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfLIAka (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 8 Dec 2019 19:40:30 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33727 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfLIAk3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 8 Dec 2019 19:40:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so9332210lfl.0
        for <linux-tegra@vger.kernel.org>; Sun, 08 Dec 2019 16:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JWPPzGUxy600qT3nVozIqBBAbKVQhABD8sIYsMTNlAc=;
        b=oZoWY69BswrCKsIbIgt79QuxqjgV24TAFehsdHtK/O/44oR4w7iHbDnriwmKn6V6i8
         4hRgcToqBe5J7UZAa91Ex+dEzfTImi9fvT2begHeqSgAjnU+0u4zqr8fpFqyRcysQTF8
         9uQOzKpyCQWxRrpFGFoiTHGXz708xf4zn6FPD1/BQ1vL2IQHsDa/gCZ1MiS0kro/PBw1
         H4nGh72H8tXTVcJz2X/8T0NxqL6KEKns7wRVXfConjjHlOVFtd5J9ca6KNjMa8EsNqey
         lgzN+arsKGbUTQejmNKBmFD04dxfQicbA3ntwUqXQGzyr6QF78qn8yCNBAoNzQEq95p6
         D9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JWPPzGUxy600qT3nVozIqBBAbKVQhABD8sIYsMTNlAc=;
        b=nL0oml/bbStpYoKJWVDZKbt6o2AgGtO23YfMLlETbu6+X8jc9nepewTi8l1lPk/9W1
         lO58rHZy2rw8e93RzXnHFd6MoaPzuxWrHWuGG02Z3zGzCpoGP0jja0l1tDuitgtYdS8o
         NdyYwF8jxYdVibKsv/fYFxIBt7Qjp0NWkhObNj8A/4uyX4+isIPVOl2zbfRhHeCRFahW
         UPOPMbwioIwFuhIE7D5C4LZP5Sc83cq7DBgEO/d2Vz0LzCWnri4thqnlvWhfccY4j2Hh
         ppg+uu/sFA/GZho+F5I7Bsfkq5u7ZLIBJbIUlsUpvzhzQSn0sSErmY5oXuJwVMjfovVZ
         /OUg==
X-Gm-Message-State: APjAAAX38lFyvNnLwpQkXComu31r7VfUFSXvw1DjVtUZqgBSybQXjx+f
        MImGs7vRhebsFogVy4pe+jg=
X-Google-Smtp-Source: APXvYqyxhVDpkaN4A/YvGquWaQ+iAcunN55sePH4puGOEmcRK9wgaVR7jQJEul9WvNyGs5ucC7t0iw==
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr14235618lfn.150.1575852027918;
        Sun, 08 Dec 2019 16:40:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m21sm42743lfh.53.2019.12.08.16.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2019 16:40:26 -0800 (PST)
Subject: Re: [PATCH v2 5/9] drm/tegra: sor: Implement system suspend/resume
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
 <20191203161914.1312555-5-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b789b1c-c44e-f169-d0ca-fff333608c28@gmail.com>
Date:   Mon, 9 Dec 2019 03:40:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203161914.1312555-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.12.2019 19:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Upon system suspend, make sure the +5V HDMI regulator is disabled. This
> avoids potentially leaking current to the HDMI connector. This also
> makes sure that upon resume the regulator is enabled again, which in
> some cases is necessary to properly restore the state of the supply on
> resume.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 615cb319fa8b..2200f4cd397a 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3912,8 +3912,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
> -static int tegra_sor_suspend(struct device *dev)
> +static int tegra_sor_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_sor *sor = dev_get_drvdata(dev);
>  	int err;
> @@ -3935,7 +3934,7 @@ static int tegra_sor_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_sor_resume(struct device *dev)
> +static int tegra_sor_runtime_resume(struct device *dev)
>  {
>  	struct tegra_sor *sor = dev_get_drvdata(dev);
>  	int err;
> @@ -3967,10 +3966,25 @@ static int tegra_sor_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
> +
> +static int tegra_sor_suspend(struct device *dev)
> +{
> +	struct tegra_sor *sor = dev_get_drvdata(dev);
> +
> +	return regulator_disable(sor->hdmi_supply);
> +}
> +
> +static int tegra_sor_resume(struct device *dev)
> +{
> +	struct tegra_sor *sor = dev_get_drvdata(dev);
> +
> +	return regulator_enable(sor->hdmi_supply);
> +}

These functions should be annotated with __maybe_unused attribute.

>  static const struct dev_pm_ops tegra_sor_pm_ops = {
> -	SET_RUNTIME_PM_OPS(tegra_sor_suspend, tegra_sor_resume, NULL)
> +	SET_RUNTIME_PM_OPS(tegra_sor_runtime_suspend, tegra_sor_runtime_resume,
> +			   NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_sor_suspend, tegra_sor_resume)
>  };
>  
>  struct platform_driver tegra_sor_driver = {
> 

