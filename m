Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCEE77458E
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Aug 2023 20:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjHHSnb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Aug 2023 14:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjHHSnL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Aug 2023 14:43:11 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35621341B7
        for <linux-tegra@vger.kernel.org>; Tue,  8 Aug 2023 09:36:36 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d299ed34bacso25209276.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Aug 2023 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512565; x=1692117365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=vIKp/Z9csBtkktk3DkJUe8AIOzqnrSH48YFF0LPGMrbJTPCYmqIG7JZg0TinXqBBTR
         pv9vjwmriLmlmIGnIqMIx0RvM6HRNaJXJvPIOPWeFTlF0ph8hz89yIyR4ljI0LX7qm8K
         vE64Ik/v7Dhl+Wa80pKfBr0n1qDu03IGoTgd59QgIg4GNO+1AOzSUeLjnn4GmSWeKanM
         yoWXmZIdg5lqg6FzRHuKTLx5yPTM+1Zjam/s2uuVt6Io4MytX8gCPL030EmeYYa9mueV
         D1b7Se9C48NPAWcyM77XPF7uc/eTAkYchXA52O4VV59EFU+mKmwUKJkcH5n79C/lJnP7
         dWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512565; x=1692117365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=ZmNaE4xvnsU8g4T4tH2EORp5zb8nXhBrgrRjJgxD86NUEse4uF4UDIV/ChBkwAzYu3
         n4hKkweWcoANWxPhDmLEiTv0ctqhKCiVCq+qMZzvRk/OeEauYY7lAFYvxS1D/rO2mosH
         ydcNt0+loUysKeuXqfSVlBJW0C+rXEoXqPIzk8T0FgMKqpD1QKuyMXIYW36eU6eY9NGP
         r/QgqMQ8J7Qt/NWSvPoZdg4/1txg2tyc+LI8w9kCAbgU9BVuAMDFbgfjU68ltdkWc+ef
         PpA66pg7s0WQxWegh85FoTQteRZOEWma1uda8ZHoHHEOJ+PBJlJ0lRSFkgDqDmMKSWek
         xQ7w==
X-Gm-Message-State: AOJu0YwaAb4h/t9RVVSuOWYRfNUlZWblQ1o1nRa5APy1zjmg82BUqxXy
        MUW0aqfR6sjtPiinDnki+Zc0YKJ/YC4IBLUpG+lh0TcMsKLakpSN
X-Google-Smtp-Source: AGHT+IGCQegfute4wq8vuctRCNyh2F9D25HtOrYRCxA1KPyHbK9gB5btAs+lYOVd+Us7kHls2/CFh6KxK9tgT70dyU8=
X-Received: by 2002:a25:d14e:0:b0:cee:80e:23af with SMTP id
 i75-20020a25d14e000000b00cee080e23afmr3349036ybg.11.1691500721596; Tue, 08
 Aug 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Aug 2023 15:18:30 +0200
Message-ID: <CACRpkdZ4OqLywBhCkDmA6bEkf3rfHpCODba9Rhx36fuP8ywt6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Walle <michael@walle.cc>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sean Anderson <sean.anderson@seco.com>,
        Michal Simek <michal.simek@amd.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 4, 2023 at 4:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> (implicit) v1 of this series can be found at
> https://lore.kernel.org/linux-pwm/20230803140633.138165-1-u.kleine-koenig=
@pengutronix.de .
>
> Changes since then only affect documentation that I missed to adapt befor=
e.
> Thanks to Laurent for catching that
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (2):
>   pwm: Manage owner assignment implicitly for drivers
>   pwm: crc: Allow compilation as module and with COMPILE_TEST

Clearly the right thing to do! Nice patches.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
