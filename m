Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCC123C5FD
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Aug 2020 08:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgHEGfZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Aug 2020 02:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgHEGfV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 02:35:21 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416D0C06174A
        for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2020 23:35:21 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id o25so13555508uar.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2020 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TRgCHKisb1WQYwUfqfppcbFhz6bMpaA6f/4VF6YibyE=;
        b=yklXSdFp445ZERM6oRjoN7UqKcwnC6QI8nkwgVExbkUSeoci18duLrHPfXXMUCJ4bd
         prE94lWqDR+YDBVux29xB/qOO8GbvyhvMbtMWoPU7hpPlGinCzFJPyBd8XtPh/935gMs
         uDkLj7dtTTHzw20gjRFKTj3kqLizxh6JHim6IXFCXjCFXd3Hyyu+hg+qeZkiZKmr/0I1
         vhcseR8cB0ERTi/rgme3akmGD8LQJzS0zwad+9yKimqsOQNtcZse1yUlOzWBA/lhAv5S
         9Z8ZowvYE6CDb7pZaWLffiUYAawURQpp/aM4z9pYYh5S/YOtkU01TxjuWWczd2TBePAg
         FcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TRgCHKisb1WQYwUfqfppcbFhz6bMpaA6f/4VF6YibyE=;
        b=B1UAyFOA6Efj1jgwSWJFkHSxboVKy3fb3lt98MC4+Vz8/tw1+AWcscS2eMayuvx/2I
         A5cQzI/lvMkIZoQnryj78wd2G7z5T83h0QRMGBWzzUJzeqxjQgXQgHZ9PzXwKA2pfeai
         XS/qxZ7qvMkaRT/gF1StYaCSBcLhR513x2+xH/TGZe2dEKbkChugCSU+0azRY//431Do
         Os+1HauYtgud0yaqHvush1ShC67y6+aG4uySH9HZm4hqB1ZEFElsGODwysDQv1WrhJe1
         jdYNC2sN5Z8uYYdKdmQUptOTXXba3RqA3wde9nraSa2eEpyIJDOMPevxt8iN0fYKEbcR
         GUsA==
X-Gm-Message-State: AOAM5332Svwj3LBSjAMaF67XqOZre54F7dHIaN4qhz5TFUJRo79HUjSW
        gLoAFBZ8BxFMCMzXE5GpZQPDJivL5VPfBaCxUXWuyA==
X-Google-Smtp-Source: ABdhPJzElO7vtg79uDltd6lqvfyytXKZEg6JRaHzzjpkrOb5TCi+dFCYJVPioPdesMrX8Nxr3m4X1+R0dD2mH1ObVH4=
X-Received: by 2002:ab0:1c14:: with SMTP id a20mr1015543uaj.129.1596609320274;
 Tue, 04 Aug 2020 23:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Aug 2020 08:34:43 +0200
Message-ID: <CAPDyKFq7CV5h86rYeAXsaVii68By8c1jN6AgdURQEvbsQ5pM2w@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] mmc: mediatek: add mmc cqhci support
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 20 Jul 2020 at 02:42, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> This series provides MediaTek cqhci implementations as below:
>   - Refine msdc timeout api to reduce redundant code
>   - MediaTek command queue support
>   - dt-bindings for mt6779
>
> v1 -> v2:
>   - Add more patch details in commit message
>   - Separate msdc timeout api refine to individual patch
>
> v2 -> v3:
>   - Remove CR-Id, Change-Id and Feature in patches
>   - Add Signed-off-by in patches
>
> v3 -> v4:
>   - Refine CQE bindings in mmc_of_parse (Ulf Hansson)
>   - Remove redundant host CQE bindings (Linux Walleij)
>
> v4 -> v5:
>   - Add Acked-by and more maintainers
>
> v5 -> v6:
>   - Move CQE bindings back to vendor driver
>   - Add mt6779 mmc support as an individual patch
>   - Error handling for cq_host devm_kzallo()
>
> v6 -> v7:
>   - Select MMC_CQHCI for MMC_MTK
>   - Remove unnecessary option MMC_CQHCI in mtk-sd.c
>   - Add error handling for cqhci_init()
>   - Use native cqhci dt-bindings 'supports-cqe'
>
> Chun-Hung Wu (4):
>   [1/4] mmc: mediatek: add MT6779 MMC driver support
>   [2/4] mmc: mediatek: refine msdc timeout api
>   [3/4] mmc: mediatek: command queue support
>   [4/4] dt-bindings: mmc: mediatek: Add document for mt6779
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt |   1 +
>  drivers/mmc/host/Kconfig                         |   1 +
>  drivers/mmc/host/mtk-sd.c                        | 160 +++++++++++++++++++++--
>  3 files changed, 152 insertions(+), 10 deletions(-)
>
> --
> 1.9.1

Applied for next (a while ago), thanks!
Kind regards
Uffe
