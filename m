Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743821FED96
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jun 2020 10:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgFRI2j (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Jun 2020 04:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbgFRI2h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Jun 2020 04:28:37 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73E5C0613EF
        for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2020 01:28:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so922062wmm.5
        for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2020 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pNtXBIvU5TL09qsEeDfkPWacil/hALuNwYF0M4VqVIA=;
        b=s8BNjNGF1UTKkjVDS8nWIdgDRjlFSXgMAcIi75k+nM41dr3jATR3IzMMp0joVXktiF
         WfFxvjaUbCtc4l4lwbnZBCYJNYXEdV0b08HTjKy8RwmC/H54jxGYXY44sO4moMFcFVzH
         +avE69VbK06HsLaoeqHXueOof2z43MmEh4BME2CRgKsP0plFGt3WhU7DDq1vC7bu6jrU
         N469wRpA5We3mztUXKE93mihM9/6Q68YyqfzYe2Qn6KqETb8SJbHHBOoqbq3kXDaXQgG
         PuW6LF5HO9W4P2gufa6mQgD2fP4muGjfl/rJgP/2Ll7fhBinj6vWOZFHSHU8nMKzrg1+
         ll1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pNtXBIvU5TL09qsEeDfkPWacil/hALuNwYF0M4VqVIA=;
        b=ofSRwmnUxEdlr+zrmERnXW5Gnm/lrSRXjg880APVeDq3H1GZej3aVSCl7TDXwSECXu
         b9JqglQCiWYGdGh4TD6UjW0fRj7tyDei6j1njaeiVN+PSmB+VovkOWjGVVkl6UbwjcA7
         SL50IzyZ9Dqnz6MYbk9KYM7aiymjBOtMPgNcakZ5NCa6uWHqwtvVix2ftaFAgJQYONHu
         06vPNCvmFHBuz24Ka1UAXG0ziJ0JCu9dbUmny37FHkW4cgCLUgTD9LByMC5naZfgc5Wc
         GRWoEp5wq54njFa34A711nWsCWFJBqzVsdT3fdOUCjLwdw+p/o1oceBD1F1rebHtF8+R
         O9wQ==
X-Gm-Message-State: AOAM533J98nnfCksS0nZYAf7Lfsl6lwlTwoGw+5wfQFLqz2waZqC9SOT
        wIF6Azqgvy59zvtXb9W5H9n4Vw==
X-Google-Smtp-Source: ABdhPJx0bssLzs0IUMEdhcrZYDyS44UMQ45eyj2LaifO2XUGoS2al0i8+FuiMCxAwozRQz4kCay5Gw==
X-Received: by 2002:a1c:ddc1:: with SMTP id u184mr2658284wmg.115.1592468915449;
        Thu, 18 Jun 2020 01:28:35 -0700 (PDT)
Received: from dell ([95.149.164.118])
        by smtp.gmail.com with ESMTPSA id j5sm2501138wrq.39.2020.06.18.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 01:28:34 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:28:32 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Convert to json-schema
Message-ID: <20200618082832.GA954398@dell>
References: <20200609162621.1769610-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200609162621.1769610-1-thierry.reding@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 09 Jun 2020, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Maxim MAX77620 PMIC device tree bindings from free-form text
> format to json-schema.
> 
> This also pulls in the GPIO, regulator, pinmux and thermal bindings for
> the corresponding subdevices into the top-level binding so that it can
> be described more consistently.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/gpio/gpio-max77620.txt           |  25 -
>  .../devicetree/bindings/mfd/max77620.txt      | 162 -----
>  .../devicetree/bindings/mfd/max77620.yaml     | 662 ++++++++++++++++++
>  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ----
>  .../bindings/regulator/regulator-max77620.txt | 222 ------
>  .../bindings/thermal/max77620_thermal.txt     |  70 --
>  6 files changed, 662 insertions(+), 606 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt

Wow, what a beast.  I can see why Rob is putting this one off!

Changes look okay to me, but Rob and Linus should review.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
