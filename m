Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BEE12605C
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2019 12:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLSLBx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Dec 2019 06:01:53 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35551 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfLSLBx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Dec 2019 06:01:53 -0500
Received: by mail-qk1-f195.google.com with SMTP id z76so4654420qka.2
        for <linux-tegra@vger.kernel.org>; Thu, 19 Dec 2019 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r4FrNo5LLEspvU9m0EiGD3eytJBEaYUVyq8SH3ZcE3o=;
        b=C0W0Svkg0Llp9ZQuiZFYuGlJcklhQKzim592wdhPRyuZfzvO6Sy8GmgRlXLBdYyg8M
         CnrXmmjidsnz1OPlJ7lXISjmdDSwrtPul+4xso+ezWUJxWZKbQLz/mVUb+ZLF+eH9bTQ
         u75sjyRdj/GEuKHBsLnLOh9VFM4yqIFq36tZDoF6mvyeqaatSfPS9TCEk4HMmDsOFcz0
         WNHxhb1zWXDPywtVLafp3q4kuWplraaVjhNkKR/AiGQMnOon2GZ66zSaq0dyvqUj5U8D
         WAhrOKJsCtgkz2d5eRKxlVtMQKHP0XMUdWi5RzJITjwMjKCCJmwKqBNgL0SfgwQBAczw
         lsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r4FrNo5LLEspvU9m0EiGD3eytJBEaYUVyq8SH3ZcE3o=;
        b=K/7XkZoiA/aahBeLdLffG3y9J4On6ogWeIzECdLq3e2X37BDVz7JLs6FZmVDdNR9om
         QIe3lkzICQaJZqy/xAhwx198GhguHve1e5Qgsab3Uk1JHNgCrtUhsuHXkNzMTRLhzxoM
         O1mbk8wN/S+WlAMug51VF4nM119pIV/qrxFjeq3d7/Jz3Z5+sAeBJiQeU/UEtw6NdjYe
         C2mOQj2Et60eoKTiv3LNG6Zx5nn8+Pl9rlxPlWzg2Rd1+XCe9ZpIe57TDwROPYNRB/bE
         aYeoMH38rOK/yP864reMZyEl9emDih1gbX2ZkwNRJb5s3dWVEI8XLoxKw/8yHC7p3x0r
         hdkQ==
X-Gm-Message-State: APjAAAVy686+JS/2gaMCC7xNPu/j/+l3MroFBBiff1t943zcl6v5KFk9
        sxm2ycTr2yje8cEhfObqRsgQBtgBxVCkeKj9ZOTmGw==
X-Google-Smtp-Source: APXvYqy4PaZdM7lBnMAneYnTWwRA+ttNw2J5709a9anujnDKaPB/StYNQhpvIdo1lY7WcNj00iKtDkcKHWISHo02XbM=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr7098160qkc.21.1576753312007;
 Thu, 19 Dec 2019 03:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20191215183047.9414-1-digetx@gmail.com> <20191215183047.9414-2-digetx@gmail.com>
In-Reply-To: <20191215183047.9414-2-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Dec 2019 12:01:41 +0100
Message-ID: <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic readl_relaxed/writel_relaxed
 accessors
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com> napisa=C5=82=
(a):
>
> There is no point in using old-style raw accessors, the generic accessors
> do the same thing and also take into account CPU endianness. Tegra SoCs d=
o
> not support big-endian mode in the upstream kernel, but let's switch away
> from the outdated things anyway, just to keep code up-to-date.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 6fdfe4c5303e..f6a382fbd12d 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -96,12 +96,12 @@ struct tegra_gpio_info {
>  static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
>                                      u32 val, u32 reg)
>  {
> -       __raw_writel(val, tgi->regs + reg);
> +       writel_relaxed(val, tgi->regs + reg);
>  }
>
>  static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>  {
> -       return __raw_readl(tgi->regs + reg);
> +       return readl_relaxed(tgi->regs + reg);
>  }
>
>  static unsigned int tegra_gpio_compose(unsigned int bank, unsigned int p=
ort,
> --
> 2.24.0
>

The entire series looks good to me, but I'll wait for Thierry's acks
just in case.

Bart
