Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704768A79B
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Aug 2019 21:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfHLTzu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Aug 2019 15:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:58462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfHLTzu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Aug 2019 15:55:50 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F0D62075B;
        Mon, 12 Aug 2019 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565639749;
        bh=H8Xhv7Khckzt74jzeAnKWMsHKHbCi3pvdlb0pyoVMsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iLsz6UUaYG5QbWLuPF2JtmBkmkoQ7l+toi21t5vIO3lSwhkUMDCjhMMOym52ASmqL
         J035G1vQNk7G9sIOrPPWgAI9WnpC4hCd5b/zCQvFggvu8dnQAr/L6tUeNNGyCgpkpW
         HGMeH2mDyz+xEUOzrohi0fBgJ7515DL+C7uP4i3g=
Received: by mail-qt1-f170.google.com with SMTP id u34so4806782qte.2;
        Mon, 12 Aug 2019 12:55:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWzfbrBIOmGnpcK4d4mhjB2RrgaMO/O8/h/HDq9Q4gaYqHnkY31
        KgeZSWOofJKdooP2a1kt3y7AotLmS7KOFXav3Q==
X-Google-Smtp-Source: APXvYqxgrrQuxdjUAHwx+8y57Y1oC0lJZolGDWhss4A9td5L2Unq6eY4QpFEBS+YVZTAYINYoOF6GE3N6Z5S1sLW8jY=
X-Received: by 2002:ac8:7593:: with SMTP id s19mr23762694qtq.136.1565639748468;
 Mon, 12 Aug 2019 12:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190811210043.20122-1-digetx@gmail.com> <20190811210043.20122-11-digetx@gmail.com>
In-Reply-To: <20190811210043.20122-11-digetx@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 12 Aug 2019 13:55:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLPAQ19UL4ZcRZBo+Zp3rLrOBC7O3u2kPZntzJMNwfOww@mail.gmail.com>
Message-ID: <CAL_JsqLPAQ19UL4ZcRZBo+Zp3rLrOBC7O3u2kPZntzJMNwfOww@mail.gmail.com>
Subject: Re: [PATCH v10 10/15] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 Memory Controller
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Aug 11, 2019 at 3:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add binding for the NVIDIA Tegra30 SoC Memory Controller.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra30-mc.yaml | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
