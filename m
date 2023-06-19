Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BE4734ECF
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Jun 2023 10:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjFSI4S (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 19 Jun 2023 04:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjFSIz0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Jun 2023 04:55:26 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67AAC5
        for <linux-tegra@vger.kernel.org>; Mon, 19 Jun 2023 01:55:09 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso3456938276.0
        for <linux-tegra@vger.kernel.org>; Mon, 19 Jun 2023 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164909; x=1689756909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ft00l+B0S41zwgia7w9UlSVKseJXy/VlgNeabdK8/w=;
        b=tqrj4QM+V+4XvszlmFkNx3twtjmwRb3RCyqygXoi+BFpO+2dvyefbsmXNS8zTrF5MM
         QjCoLK+SPOTHY+AoDJbkhSQzvxJNBCBWrGQrS1dpAUxNv7LSXW4qFGDIFw8iSqDDWut9
         j9oqwUUVSQBK5tdk+Um3uh5k7BT+pjLVmYBPeRQ5CXqPS2Tgj+nix37iR1iFlBZ0KbjK
         7zrSS9gOhuioNWaX2CGpCE6MwisuDCm1voP64JbFJ4rbBoUko2sMovMLtlY/CqEpjJmP
         3UjMvBe8RnC5Lz1wiO+1NO4194YqGHksRw/Xuqhvq31sYzfbWJonjyncj5+5taBdk9cb
         6xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164909; x=1689756909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ft00l+B0S41zwgia7w9UlSVKseJXy/VlgNeabdK8/w=;
        b=IQE6GQrGn40kvmH6HT5OHdkUxWIpcNKXIUxeq1i4d2w20a+le+WzoUT4K0hL+5hRM/
         u5em4L4Ma2g63mwqzQMcqwGIz+hFtxaKfic0FXBYGS776YUdsLr+t3p4WduWPnVht5ua
         8DiqUw2XLHhghiE2q5d0bpT8u3pp5eNhPgI6ixKIHMOlJtrgUIhDM+gSv11k80qWHRwo
         rSlMa3RjYmCGjnnmA2GW++mqB6pFHV0e8kugrTHpfwfT5Bx6/Y7cCmEUcqdnf4dV/MAo
         S9GxuIHTPRRBjTAdN+p444eSRrHoloLIMt9NDerVcKLvXQqZtvAPIfNgwy8TkTYTJUJ6
         ZHng==
X-Gm-Message-State: AC+VfDwuNfGMVae1u20/3nhq8AfO+/YQzm0Acw5E6PRxU0TioXXhTWUH
        r8vKZscOc24/ubD2DM4B7jeRvBCWstSpjfpvxlBtrA==
X-Google-Smtp-Source: ACHHUZ5Gi3nydI31ECdsLbHHgh5S+9BWsb+nq/JajVzy6/jg8nkrVJHfSVbJkywNJ8EGpBtD/iKD3axOoL+1n2zfA6I=
X-Received: by 2002:a25:cfd8:0:b0:b9d:8613:6936 with SMTP id
 f207-20020a25cfd8000000b00b9d86136936mr6097091ybg.50.1687164909140; Mon, 19
 Jun 2023 01:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230616161603.1127687-1-arnd@kernel.org>
In-Reply-To: <20230616161603.1127687-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:54:58 +0200
Message-ID: <CACRpkdYyGFAJMKh+7KMKBjL+brGy+Co4B8WvJfchPEiUUp9r8w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: avoid duplicate field initializers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Prathamesh Shete <pshete@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 16, 2023 at 6:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The drv_reg field is initialized both in the DRV_PINGROUP_ENTRY_N/DRV_PIN=
GROUP_ENTRY_Y
> macros and in DRV_PINGROUP_Y. Since each pingroup expands both macros, th=
e are
> always duplicate and turning on -Woverride-init (which is disabled by def=
ault)
> causes a huge amount of warnings like:
>
> drivers/pinctrl/tegra/pinctrl-tegra234.c:1384:27: error: initialized fiel=
d overwritten [-Werror=3Doverride-init]
>  1384 | #define DRV_PINGROUP_Y(r) ((r))
>       |                           ^
> drivers/pinctrl/tegra/pinctrl-tegra234.c:1397:28: note: in expansion of m=
acro 'DRV_PINGROUP_Y'
>  1397 |                 .drv_reg =3D DRV_PINGROUP_Y(r),                  =
 \
>       |                            ^~~~~~~~~~~~~~
> drivers/pinctrl/tegra/pinctrl-tegra234.c:1447:49: note: in expansion of m=
acro 'DRV_PINGROUP_ENTRY_Y'
>  1447 | #define drive_soc_gpio08_pb0                    DRV_PINGROUP_ENTR=
Y_Y(0x500c,    12,     5,      20,     5,      -1,     -1,     -1,     -1, =
    0)
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~
> ...
>
> Remove the intialization that is never used here.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
