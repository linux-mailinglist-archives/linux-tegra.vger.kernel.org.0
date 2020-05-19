Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A101B1D9B3C
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2020 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgESPaj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 May 2020 11:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbgESPah (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 May 2020 11:30:37 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60EDC08C5C0
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2020 08:30:37 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id p7so3469788vkf.5
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2020 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rnSyU5f4PrzmexMJlgXOLUxtZCdHxKJvdv/zUlkAcrA=;
        b=uFDIdf1+QUnCUyeb3hS0KTf1RU83RdK39E8uD55PKtjZVNtGka7FbU96itQXslCa3v
         DBf1jMaS0xKuLCHFJcuI7M8Mg9AkIPcrVFepYErgEehXvkrtxdty6I1QwJXnoAcmTNg0
         AVHL3RW8MyuTnQLz/F0B+CkFXCjFj3IMVZZKMReDU7+GoMDGHD1R/XSzfjUizPauPxG5
         YyffwHfYRRQ86kbn0GzRL0AI98LNK2SIx4AI9Fdb/faRU6JCpYcjuSxfyPrVp1FjwR+E
         qNuH4yOtO3RNGh73/dQW5BHCznhU0oV1R8GElfWHP1z620/sPMHAJtS3/c1QwkteKu7q
         eEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rnSyU5f4PrzmexMJlgXOLUxtZCdHxKJvdv/zUlkAcrA=;
        b=B/ryRKVw3XHGoTZ2LxkY9Wn42FuohT0YDFDHj2qiFYsHvONa8yoLm3BEP1KHzvwlQ1
         LCgni4V4r7IfWuukXMZZsaVm+L/4axenS0cIc3JtpLvoFSkjmThKtWeMd+BQHTJsIla6
         2tyC+RryHLz1ayUhPqjP55tupg8ruG5EH6ENObEJSlmxnDX2MJtqMBVe8JGXCuDDMnER
         0FgGamY/lKc0sZi/tFA4ZPjL5+k5lZcQcO7VE/gGWUUqX7udTeC74YevzmQ1zVn3DT1d
         XAH8SfQqC+TkVY/cZSrMox/vYS9Y41ZYHw6A2hdtEHgscy1AE5DsS3a1ptBgtGu/FBdE
         WvOA==
X-Gm-Message-State: AOAM530KiEcoy/MwASEAOW5fsu4Hi6lNOHbzUEEqo8WptFt+DFBfLbg0
        uZ8XzOUYCFrMf1N6KVTmIDbLQvxODGtJxMbit4CTUA==
X-Google-Smtp-Source: ABdhPJwaSFdjHczLXzH9xCa6keZ5wUU3dU1twsfttZ1EL/Ani+DZymqchdVlLIbyjUH+aWh/LxEzie1suQrANmZB0Dk=
X-Received: by 2002:ac5:cded:: with SMTP id v13mr222021vkn.59.1589902236878;
 Tue, 19 May 2020 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200516154314.14769-1-digetx@gmail.com> <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
In-Reply-To: <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 May 2020 17:29:59 +0200
Message-ID: <CAPDyKFq4MoEzLr3Mgk0-4JWeB3khKawMC+bCEKDNiNKn3tUarg@mail.gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 19 May 2020 at 16:05, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> Several people asked me about the MMC warnings in the KMSG log and
> >> I had to tell to ignore them because these warning are irrelevant to
> >> pre-Tegra210 SoCs.
> >
> > Why are the warnings irrelevant?
>
> That's what the DT binding doc says [1].
>
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidia%2=
Ctegra20-sdhci.txt
>
> Although, looking at the driver's code and TRM docs, it seems that all
> those properties are really irrelevant only to the older Terga20 SoC. So
> the binding doc is a bit misleading.
>
> Nevertheless, the binding explicitly says that the properties are
> optional, which is correct.
>
> >> It should be up to a board's device-tree writer to
> >> properly describe all the necessary properties. Secondly, eventually a=
ll
> >> device-tree bindings will be converted to YAML, which allows to valida=
te
> >> board DT files, giving a warning about missing properties. Hence let's
> >> remove the noisy warnings to stop the confusion.
> >
> > Yep, makes sense. However, perhaps we should do this conversion then,
> > rather than first drop the warnings?
>
> I don't mind to postpone this patch. But again, IIUC, all these
> properties are optional, and thus, there is no critical need to verify
> them in DT right now, it could be done later on.

Ok, fair enough.

Applied for next, thanks!

Kind regards
Uffe
