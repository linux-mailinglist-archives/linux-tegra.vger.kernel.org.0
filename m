Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6B7195597
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgC0KrD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:47:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41366 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0KrC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:47:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id z23so7454559lfh.8
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wU8Dfibnw+YTY5Ju+RmFsCxvCrwd0qkmqQMufVeyPLw=;
        b=QBPLIaNMoOcpMZQsVATdmdxE/wwRGqza8magxFu1Qw7kbiCc5hCzxKl5G9VRQd/tA2
         5prTY1VLKPgD02ssUEmf1usvCva3Fexhl5o2axAhR2wiH/jd5KZil4cFW+P5gnw7bL3U
         zDF8oZGVU5DhlSxaBsk4eKF81q5L4BWrNd6xGwglejhSbyfFX0o5NrXDaamns7y2kght
         ikkFxwWQSgTdDIqXDtU6rPYvvlPZQhesR7Y1sLHsusNQlYz3YuH7a/kIcdBmuZtEIcZt
         6TX94tvZgrDPgTqPT6C/ZMQyCjw4Edftej0rDPP6QBZEd29RxMX/JmEkDWI+o7Urs56m
         +UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wU8Dfibnw+YTY5Ju+RmFsCxvCrwd0qkmqQMufVeyPLw=;
        b=D3Z3mdoapMGLLGEye40cVNpTevS7c3J41QA24k3fP9QYZVcmJe2/5ukhwcpxQXG5AP
         2Yga9KjnjZXi0b+VPsqIGtsuYputFXeH4F7ncLaILdvm+N7J+HbIG63bb4oAS+e14AGp
         zt5dFI02wQ5fBs4sKerQumBZXSwOX6tNysaiwiWDCsAjAGlvwOJjxxOAWTr6nfur3S9L
         79FONB9kanENUwzv3rIGmOyUTi1niKb/QOJ/WXqQZBdy0cp1Ko4a47KUH1NpmCvIr8MY
         nbNHgihma9Rl5tusP/Vd1AvAmRmyirUuATydQty73E+03OWSFvNcpDmf9eT/cdJnyOKN
         N3Pw==
X-Gm-Message-State: ANhLgQ3iXUTNpQYnzRbI0BnEtccn+tbos8g4+irO32CckS/on3Xy1Hs6
        5oItsO9hJz0HN2PMV7shZGBwOFBGOlHuBSgtwx9ZJZxdrWw=
X-Google-Smtp-Source: ADFU+vv/p4JFrSNfSyE52YsXAXHGzg5C93Bdnn3K8+n5BSLIN+mgMXn2f50qZWsBMuasncx+q1mbB5Pix71eH/fZ8Vo=
X-Received: by 2002:ac2:5f75:: with SMTP id c21mr8572327lfc.194.1585306019131;
 Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-10-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-10-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:46:48 +0100
Message-ID: <CACRpkdZZgHm3ZqRdCoC4e8ef_Don0dSWans3=7K4cLDTGa5mUA@mail.gmail.com>
Subject: Re: [PATCH 9/9] pinctrl: tegra: Add SFIO/GPIO programming on Tegra194
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
> Prior to Tegra186, the selection of SFIO vs. GPIO modes was done as part
> of the GPIO controller's register programming. Starting with Tegra186, a
> pin is configured as GPIO or SFIO with a bit in a configuration register
> of the pin controller.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
