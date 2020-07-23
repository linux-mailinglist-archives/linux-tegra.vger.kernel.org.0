Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635EA22B48C
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jul 2020 19:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgGWRP0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jul 2020 13:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgGWRP0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jul 2020 13:15:26 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED820C0619E3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 10:15:25 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id t11so2911982qvk.1
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uxqgbT1xGWBNU5YbnWHoLn+2QzI4IjiCwjdiIwlOoYI=;
        b=D2kL3VW7zX669rdE7uTbTlP31fK7ZlJNSMl59TCCOG9B0rGjYvWYAiRRN5pQLhUbNj
         tH2ym7dLLWpp+iGDXG1Itn/y3VP6eMYC892FZkWwkvWFBoqoXh3IrzCcyqEXVl4yQ2ZW
         sVsPsE3lC5B9mY1OnExahBLRt5lbo3SXAbi4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxqgbT1xGWBNU5YbnWHoLn+2QzI4IjiCwjdiIwlOoYI=;
        b=Swn+dx+IBPoOsviRw0cuY071aJibIF3pOBjfdidbWrDenEa2D6WU5mFZ7Pwzb6dVDt
         Y6roHzu00mUcdrCeWRSz+8HFH31IkWa+dmy6NqN5F5bKMTFq5EPLFyP/JsaMJ29oml1N
         +mFZ0pRSTSfP4EJQPQ9jfr2ZXghKL1+/YEQtq+cnD4idmiDBxlkG3lblRQZdt4HEKz5X
         y+7f9liHPrTkLaFVlsH4f98Q8q5tF2+5KbpSELUitvFbf19/wy/lVx+AGpYTMBBbLqZV
         1SlyAcOuxxRPMPIt3cETeTFhqFsfRteD1hiFvjdB4/TYMrSQXc6CftfV2lUoF/Kg3Gr3
         P51Q==
X-Gm-Message-State: AOAM530Hiu6t4eMNorbMx2CbWgy4m12M7l0DrZA4/tLkKCQWsmn7NbxG
        ql0xkv2olrTKxJRtNHCL0XNfAD5n2unsMTjPqn8Dog==
X-Google-Smtp-Source: ABdhPJwLdD2kuuxmaYBIRerlmw2LPR4pPFv4tVkeSMizVI3cJusdEuI0jtB1kimBr9K4sbHmJZt3PpUJDk7hMkWdX3w=
X-Received: by 2002:a05:6214:851:: with SMTP id dg17mr5838866qvb.235.1595524524901;
 Thu, 23 Jul 2020 10:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-18-krzk@kernel.org>
 <e65d4ed3-3c01-acb7-f324-be99201815df@gmail.com>
In-Reply-To: <e65d4ed3-3c01-acb7-f324-be99201815df@gmail.com>
From:   Markus Mayer <mmayer@broadcom.com>
Date:   Thu, 23 Jul 2020 10:15:14 -0700
Message-ID: <CAGt4E5uRzPtgy54VvRMpoWMbFfY6evBSjmd4dfHO+=__fR+3kQ@mail.gmail.com>
Subject: Re: [PATCH 17/23] memory: brcmstb_dpfe: Remove unneeded braces
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 23 Jul 2020 at 10:11, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > Single statement blocks don't need braces.  Fixes checkpatch warning:
> >
> >     WARNING: braces {} are not necessary for single statement blocks
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Markus Mayer <mmayer@broadcom.com>
