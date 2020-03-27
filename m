Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69FF19558B
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgC0Kpt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:45:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45476 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgC0Kps (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:45:48 -0400
Received: by mail-lf1-f65.google.com with SMTP id v4so7408548lfo.12
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2TsegT46o+YsTZ4EzI2YXjEmwluDOByprFHR+cDCkI=;
        b=ZTWz5dpQylffMWFm/wgYKPI0MxKw5KRzJDYSBNPCF169MHIRvtVW5Q1JQ0uCSEonIX
         BV4Fnj5Sf8qidBuY0nxkHHWqoBqOg4XX3CPPOu59mQZM8rBoVSvXuSennLWrpo6cz24d
         fsu71qlx89c+Cph05DiaFkTVAh5lKoLx6cxUTPzOZX4bLMrkJUijQF5RoNbVP4Qd0TRa
         Usys5eOZzKZt7C2IREa9yhbO4R6kK+T/YB3k7GE990Xi167Jvpn4olGvX++azwxWpurH
         ks9LZxzvj6RUvi4PoOXeR89R/JHSdBP4SuZQM8EbLdy2pXyDBuHOlvipvpRPv7Q/MRdi
         D/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2TsegT46o+YsTZ4EzI2YXjEmwluDOByprFHR+cDCkI=;
        b=nG/a0OyZpgqq9uKtgMZIj1m433BjR10aAQvlporklfB/puTh5V331WDNMosiJde4iv
         jedO2WJFQpJSo8PUYYHAVF7WtcqE6pdFSfMj3sdDEdJo8dZ7zWdVIuUr98m6YTntdzPP
         JgMjLAH35Bgr0HL25hhYP3m5zDcx7CNNJ+aLz+X9rGpWDxq3DSVog8VBjiXVGupkR/Zz
         ADW3G5A8XCsi5KLlmgV5yxmAKLyoIdnIpccBSAuCd5Cea1D466W+5Yc1hn80nMnGKI32
         b5aPdBkzdI5w/pLjXdWFXTu7u2ypgRxuwkpnlJG1CNEIh6KIrkXPoWKadYI3VnGtU+wD
         n3FA==
X-Gm-Message-State: ANhLgQ0KSRyij6kQfcsUNnDjQnXtipl7UnQX/nk9ihD40fQBWYvrSVeL
        KXDXLmqMMrY4BoxkHuEnHA9nqh5l3/CRxsjexUJzcQ==
X-Google-Smtp-Source: ADFU+vvb3BrNyYHEljyVoinbD8L6G/WPpOVtggCK+KKn/SiyAyuPGHe6jVivB+G9ewWj4unIjv9+MO9Q0VOocNuKnoI=
X-Received: by 2002:a19:6502:: with SMTP id z2mr8587527lfb.47.1585305946583;
 Fri, 27 Mar 2020 03:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-9-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-9-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:45:35 +0100
Message-ID: <CACRpkdbZuEHbMO6Pow0anKWLXbo-EBSRPpXmebDxgdSe2pL23Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] pinctrl: tegra: Renumber the GG.0 and GG.1 pins
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> There is no need to define these at a specific offset since they are the
> only pins defined for this SoC generation. Begin numbering them at 0.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
