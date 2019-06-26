Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 156E255DFE
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 03:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFZByc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 21:54:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46224 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFZByc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 21:54:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so419694ljg.13
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z6VBucdKxKHrVhZM6PcmyKrMoCL4LfIzgNE/Pfs7Mx8=;
        b=eJ7JU99EbhjX4WAgvwzVmAP8i1dAxKxB7gEOB9j27N0/0fj6QQSxBG0cv2ssINi+ME
         AfCO7cW7oUtUPep+OjkdldB7ctNfdFMaFXEVtgUmmWleJpFayMu9aYH4wFEnBsXTKIDK
         +21UpwcM/qxCj/eXdxri0+HhL9ILDaMSNsyFwki5RtctwyYfY0ZOE/4mD7irys60Vsz8
         8XlVI9tyDJq42L+ifhdFsKev4e6q3yugc+mi7uuA3wLdrZcrw62naFsArERgArsn/sb+
         gihLhg/qjFtem0VAkeAaOLdBdTetYiBL9BlMeShHOyZ5jsweNrbhBS3A3JhR3iFGvmhw
         aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z6VBucdKxKHrVhZM6PcmyKrMoCL4LfIzgNE/Pfs7Mx8=;
        b=Q+3Y5ciHUZgS2Q1cPu3+twE0VzEdbgDDI5lBfP5WSuKEaKwOM48+NoXNg6rsJ8vwLk
         OIkr++v9F+SgeTPBOGreJuvmZKeF/Tg3GlmA8gTqMxSv6VeimJCHpCmaYtX7UDRbPjt5
         cf8x/1VUDE0deR40BIlPidSb8pGOZ/Pyu7AjWKMHkHU5uHgjL98gRs0tzIXzIC8uf8+i
         /8jTALRzKig0UQzC0kx5SuZXNBAP/8l2qmxI6Tsfab7GlsLCn7T6uXuD1cUE27gJ8KOJ
         d9WmKAM6EUW+Fu4wXbhebpO3Z3iHoN6Iyc1Zt8k9pu4aj01Lo6BZWM4JD6ZRhQ0r+kDC
         JIHA==
X-Gm-Message-State: APjAAAU5+FnL22gUQIMTTXHce2FR83aOGGFGx/4syduSilRsBtR95jHe
        dnJ2YM4gWrgO3sXAg8iN3HZiwYy9
X-Google-Smtp-Source: APXvYqzCQrEk2rp9lnn+wcIqMON/h7Slh8Fg3hT+QJpgd3RQOYQdP/xeEtOHvZ0FLPyw6AEFp6qvnw==
X-Received: by 2002:a2e:85d4:: with SMTP id h20mr964418ljj.142.1561514070167;
        Tue, 25 Jun 2019 18:54:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id y10sm2164862lfb.28.2019.06.25.18.54.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 18:54:29 -0700 (PDT)
Subject: Re: [PATCH] ASoC: soc-core: don't use soc_find_component() at
 snd_soc_find_dai()
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
Date:   Wed, 26 Jun 2019 04:54:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.06.2019 4:40, Kuninori Morimoto пишет:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() at
> snd_soc_find_dai()") used soc_find_component() at snd_soc_find_dai(),
> but, some CPU driver has CPU component for DAI and Platform component,
> for example generic DMAEngine component.
> In such case, CPU component and Platform component have same
> of_node / name.
> 
> Here soc_find_component() returns *1st* found component.
> Thus, we shouldn't use soc_find_component() at snd_soc_find_dai().
> This patch fixup this it, and add comment to indicate this limitation.
> 
> Fixes: commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() at snd_soc_find_dai()")
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 358f1fb..8ccaf63 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -786,6 +786,14 @@ static struct snd_soc_component *soc_find_component(
>  
>  	lockdep_assert_held(&client_mutex);
>  
> +	/*
> +	 * NOTE
> +	 *
> +	 * It returns *1st* found component, but some driver
> +	 * has few components by same of_node/name
> +	 * ex)
> +	 *	CPU component and generic DMAEngine component
> +	 */
>  	for_each_component(component)
>  		if (snd_soc_is_matching_component(dlc, component))
>  			return component;
> @@ -813,8 +821,9 @@ struct snd_soc_dai *snd_soc_find_dai(
>  	lockdep_assert_held(&client_mutex);
>  
>  	/* Find CPU DAI from registered DAIs */
> -	component = soc_find_component(dlc);
> -	if (component) {
> +	for_each_component(component) {
> +		if (!snd_soc_is_matching_component(dlc, component))
> +			continue;
>  		for_each_component_dais(component, dai) {
>  			if (dlc->dai_name && strcmp(dai->name, dlc->dai_name)
>  			    && (!dai->driver->name
> 

Thank you very much!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
