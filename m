Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2B419DFD8
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Apr 2020 22:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgDCUwD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Apr 2020 16:52:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44113 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgDCUwD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Apr 2020 16:52:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id p14so8349062lji.11;
        Fri, 03 Apr 2020 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qKOt4yBSCllXkvMmG1P7+ZC9P/wmCYf6URwjXF+xxWs=;
        b=Dstpa5L1bZINAQiQRnj+ZrsSpB1JeHuUnX9cdpzn3iIlGfsVQq1rLfDWfUVFbMmSm6
         0Tspp6K3Q41MViBz+qTujtpa5LGQ3KgdeechVXuKk64s//xLhuH5sSaIF2WCui8h0K0W
         w4oHp35pd33NxUltUJULIFXBnXkU01+SXNuWSIg1UCOtuEdU8dGkIqQXn5oZZIhEEO4E
         x70xCUR1YZXpBonbtCnd+BkX++BH6EnCYayT7fwFzNLKAnhyCQaNKOPCFpFeB9MzS70l
         mWWHEwytBu3a2Tt4bFK7/3rMZ/7XfOtqO2V9wyYTHk0hlliVI0LKKTDvsBZtrdU06qKw
         lcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qKOt4yBSCllXkvMmG1P7+ZC9P/wmCYf6URwjXF+xxWs=;
        b=CegfGX3sKUjLSf7h0r/c6Pij0MA0hQeRINzsuy6IjCyKfsxmJ0mVF61sLz2DpEhv/y
         4TijAF1ChASS2E2pl7CEWZBRtaTWM2wEqO1/az1++NMLnL2SbQVge+jypVGxD2o0attT
         85LZqSnlu9n96IOiHpfm44aBCufWsuk0R1+i49oHNn8k5tLR769qH3vUKQiSiYIv12El
         lgIzb1bXHc9xsB+HXY80y9fL6nKP/fF8dxUMeC/nAYPGc4CTPS1koTN3zSqRA88hKHg3
         MaxzrgpiVIrqGd7jGT5nixsRT5xFwg0y4qbDprzDr3AVgHeSIMuhfvQNtc4yirJVEDCd
         6m2w==
X-Gm-Message-State: AGi0PubPxKxh9C7dH1obfCl9GbZaI57a3vt2ORZiXAmHf0EqEDi3XKDF
        0jbY1v9yQS3wnbrFj9/veiOInXmB
X-Google-Smtp-Source: APiQypKKAJ3W2STdZnNykcSQuCh88YvTmB+Ene5ktA+FJ/bnLn8nL/i2KQMRk6kyX9pF+dUf2QKrHw==
X-Received: by 2002:a2e:a176:: with SMTP id u22mr5995272ljl.84.1585947118705;
        Fri, 03 Apr 2020 13:51:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b17sm6700767lfa.15.2020.04.03.13.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 13:51:58 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] clocksource: Add Tegra186 timers support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200403202209.299823-1-thierry.reding@gmail.com>
 <20200403202209.299823-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eb2a848f-9a4f-7c06-aff0-86d5087fe053@gmail.com>
Date:   Fri, 3 Apr 2020 23:51:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403202209.299823-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.04.2020 23:22, Thierry Reding пишет:
...
> +static irqreturn_t tegra186_timer_irq(int irq, void *data)
> +{
> +	struct tegra186_timer *tegra = data;
> +
> +	if (watchdog_active(&tegra->wdt->base)) {
> +		tegra186_wdt_disable(tegra->wdt);
> +		tegra186_wdt_enable(tegra->wdt);
> +	}

Shouldn't this return IRQ_NONE if watchdog is inactive?

> +	return IRQ_HANDLED;
> +}

