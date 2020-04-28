Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D561BC117
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2020 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgD1OXL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Apr 2020 10:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727883AbgD1OXL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Apr 2020 10:23:11 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B432CC03C1AB
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2020 07:23:10 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so17048444lfg.9
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2020 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e82wrxH8EFgI5d69qDWjt/I8rjbTFp6+0zndATZdTvM=;
        b=ePMdkQkoTfFK+4coY0fnsrGdh2XVrFCg3MRcjHaXYFtBJde4EmsOwmiQMDNbc83Utk
         DtnqX52tdKAnDuLcE8xgCN+ZRkOCsYR5PnNjoAVtRzcSpZkJ/QWirgU2nwENiN9LaHKT
         cky0aj2mwB7g4DVs7vNhD0llKkIuffrZr5xR0M4q5QG3S8P08axzpUXGb2WvYLhOmv0q
         jIZfAXplKOZz56/jesOBK9wEasMhkjBODXTJg2W78lZ/vfjRDVqwLn7f6gUGQJ1ewJJw
         O1OuJowxs+H1svNIFAZA6oj3+zI+4blvZSRno9AUKLLAcKf1qgPKpm3sb6DjpbAeU1os
         8A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e82wrxH8EFgI5d69qDWjt/I8rjbTFp6+0zndATZdTvM=;
        b=oSNJAff2UZRhD9XvqAPYANZSwkY3+Qt4+Vp6zb29OEuz+j1TwabrKPrYImrUN9iR8v
         epzgFzediTzaJ3OPS+YOCZGIfTE60w5OxakxAzZ+gRzq0bygAA6r+SSbQhPuvzFkd+6L
         u9kSQpeBSWQ0W31fukBdM4CHwmGraLMRtg/GQyzKzwEPi4TTsab+6dPguJxGqsnA4/KH
         YXnLNGbmpJf61+v4A92Sz+OXK/zYu61QX3INTNI8aY6c+fXGGnqtWZCBaH4knWpkRqVZ
         1/Ng1ydEQfwQoVwL7ho2aPmUUpnz1t2ZqGvo2rKjSJZjh6EoRcJWchd787DmUPmKZHzH
         jv2g==
X-Gm-Message-State: AGi0Pua9sHfTV37KOOU7Bb2p95aDehnU87Ans3AuT/4Ae3qQhCgc/8ot
        8DObORn/VZG2GZfF2Eu+88PTmfWLNyDvE9FTjwWyMw==
X-Google-Smtp-Source: APiQypJC8bIv/Sn8VoOVg1N3jSzATmQtowcWVRLdelQP+LWb50FFE1SxRsk72d7horaMs4takiRtaRBj8vEXZBFodqI=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr19578339lfg.21.1588083789059;
 Tue, 28 Apr 2020 07:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200427232605.11608-1-swarren@wwwdotorg.org>
In-Reply-To: <20200427232605.11608-1-swarren@wwwdotorg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:22:56 +0200
Message-ID: <CACRpkdY6nU4DW-cadbo8+LTsCbL08nrZM4e9DXz2Nxp0PHj=qQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: mask GPIO IRQs during IRQ shutdown
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 28, 2020 at 1:26 AM Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> The driver currently leaves GPIO IRQs unmasked even when the GPIO IRQ
> client has released the GPIO IRQ. This allows the HW to raise IRQs, and
> SW to process them, after shutdown. Fix this by masking the IRQ when it's
> shut down. This is usually taken care of by the irqchip core, but since
> this driver has a custom irq_shutdown implementation, it must do this
> explicitly itself.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
