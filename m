Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB058420423
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Oct 2021 23:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhJCVzb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Oct 2021 17:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhJCVzb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Oct 2021 17:55:31 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA57C0613EC
        for <linux-tegra@vger.kernel.org>; Sun,  3 Oct 2021 14:53:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so63489599lfu.5
        for <linux-tegra@vger.kernel.org>; Sun, 03 Oct 2021 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQuxP1MZok62PVOHOixX2gK9b5pmOmj0zPtylyLISBM=;
        b=YnNPejGcLDR7PYwmNMrJheHemalLMCIn66/M6TwmlLLLkgYZcrcwtjy0l4qcgH6Bgj
         BBKR+UQFdAmPbAVWfyfmh4upW+tvmYvfG0WaZ3elMPCz59YeRYB4RZ9yC+Gw0q1rz5Jj
         Xiu3Nfk/BTAElHPOMtMrMJgthcxdQ2Idm539gPTIhtl50BYdmEjZV6RPYwM11bULYgZt
         NLhhfe8ViFOGwDShqp6tXhxDuS513CuQHzcYLUSZChctTf07IaSixIAK36BOqffUy/wN
         0RdgZhBEhMSv1WOTeECuxqFbKoV7Q9JNc5JUAuolLZGZ0evheWjkIo6WSxcZS3z4X0Ri
         CzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQuxP1MZok62PVOHOixX2gK9b5pmOmj0zPtylyLISBM=;
        b=yV9CNf8XjvCGdGqg5AW5LluMiqgFJs/yDhgmZ85HbO3a90IXWlzlsogXBE87838eDs
         71HxPD5tqJNcSApJnbSfVsmaje4TmTinhwQl/0AwHDW+bNY5izfhmAO8FBuZ5jnA7SaY
         Nsvlvcq+LG4S1A0meuz9LAOzkIzQsZ9wzh+iMN3Ykid5W3zVIUns1Wm+bVop0pY8KBOT
         dlGbEed/M2FVMP0Iwn/ulSs4QlwwN1oGegmuIWFOLHcvkSiIuezcLIeHLoPLrGhYZzbZ
         gaBMWSVXJDUCbLpoXh5B81Nrud1azimQm5o/fSWxnjMSfEgSfCwqHdW7N+iWqR01yyz5
         6J9Q==
X-Gm-Message-State: AOAM531lbBfzyCAr+uk+0x3+N9X+cVRjw06F2kJS993PjLNp6cO2Mvrp
        //Q3NTSHwzOTRqX3JIT+zn6CV2ZNqXwbwJej05fBow==
X-Google-Smtp-Source: ABdhPJzTky9Q+kSzk8fgBuakm+p/fp3fkzIRW/8cdw08f5Vs1MDiylFigiyMY+e+LqXTbVslY4OftBBNQyeuL78bcOU=
X-Received: by 2002:a05:6512:1303:: with SMTP id x3mr10928432lfu.291.1633298021551;
 Sun, 03 Oct 2021 14:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-5-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-5-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Oct 2021 23:53:30 +0200
Message-ID: <CACRpkdZudrH2oigFqiAAS0wZPdWAd8tpeH==3snsG7pSD8QQEg@mail.gmail.com>
Subject: Re: [RFC v2 04/11] dt-bindings: Add HTE bindings
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> Introduces HTE devicetree binding details for the HTE subsystem. It
> includes examples for the consumers, binding details for the providers
> and specific binding details for the Tegra194 based HTE providers.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> Changes in v2:
> - Replace hte with hardware-timestamp for property names
> - Renamed file
> - Removed example from the common dt binding file.

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
