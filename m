Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907601F5086
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 10:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgFJIsG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 04:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgFJIsE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 04:48:04 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB35C08C5C1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 01:48:04 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z206so976423lfc.6
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tv9cLm6NrVEw+od9yE+yuCdvd9rQx1UMp3tOwcdNQ6A=;
        b=xLtjgtJ8Kq7VuUa8BbXEMYn+JDvsxigXSI5oo/wg1liD77Uvva30qb+Ue4DnxHtjam
         Elme55spXBwYx5CgDUeaml/cfsQ6LUZao9b16LKSlvxj+G3XM/yuoK3udquOLtevy+Er
         X3e38FLE+ZpA/4fIR+5OQTAwQDmiPRijmpAsDwGyCr0J2LItdBJDDaL9eH4cO7INk82q
         u6yPzASpg7nLl0pPg/QrXZEHd2naQGjDOEtaT7FGM09+z5sv5CgiZyW/HS6BA2EFJCjC
         1pPLZYV1z1UzaBQ6SXSQSAssU+Xs5qrn40m2JbMhlQUjEky8+UyVJs07RaE5BULZHY1c
         Swrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tv9cLm6NrVEw+od9yE+yuCdvd9rQx1UMp3tOwcdNQ6A=;
        b=bRhNt1oTUpWVcZ3th9ly91DWkdl2BOhK10Glld+GFgOOkD4d/j48m9E6l6x86uxw2a
         1U6uLDvFicRKAuiolXM8agxrrex8p3UyE9n0+cNjgg0QXWVO7NM3bJxpwiDPhh2BPUNh
         jkzg2auX5KOdMwI1su+sLInhC3EYLrPCdVYMud6G0RVy3Jmsh49z2LBJbtxhOGgwm03/
         1RWh0Ae7VltdLjNVgP3ZHhuu+O0xdUmRyuPJI2qDJKGX0PAa5L9unLQZ/t/RfCU2ljZl
         Ju9e0eTN6D02it7+G42hfAM/g7G0lhoXEydluN53jXh6nRA2fpppR9eSdfccexsjD9ca
         EAKw==
X-Gm-Message-State: AOAM531Luy3Lg8gaTGjHR+rcm58vQhvq2wLhWMQnCjHk21u6cACIef2W
        HZwoN+3PBSZyiw5VKSLLz8UitxwESKICEz5+rJDNRA==
X-Google-Smtp-Source: ABdhPJwB1YdVqyxgQzEn1jME2RfkT9tqX2deD1Fxk7xDGiza8EgLMKE2iE1rVqr0cl5GGteUcAmL6g68Mcu61Hc88ho=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr1123126lfn.77.1591778882313;
 Wed, 10 Jun 2020 01:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200604174935.26560-1-vidyas@nvidia.com>
In-Reply-To: <20200604174935.26560-1-vidyas@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 10:47:51 +0200
Message-ID: <CACRpkdYnwYFr2NEfGmCRYCEr7J0fdT1L5jkuPrkPQGJmudMgJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Use noirq suspend/resume callbacks
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 4, 2020 at 7:49 PM Vidya Sagar <vidyas@nvidia.com> wrote:

> Use noirq suspend/resume callbacks as other drivers which implement
> noirq suspend/resume callbacks (Ex:- PCIe) depend on pinctrl driver to
> configure the signals used by their respective devices in the noirq phase.
>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
