Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11C868A797
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Aug 2019 21:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHLTy4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Aug 2019 15:54:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfHLTy4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Aug 2019 15:54:56 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 328352075B;
        Mon, 12 Aug 2019 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565639695;
        bh=8oChpRIvTfsj+w4ZpBWESjUuRD9O+b1lAUu2M62u87k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oBpoVbgMQ2YjlZ7eK74QftW2gv8IrbSzufok64QASQY7nsClM2ulunDzk0GU4xprZ
         BJ8j299QBJEyPxO+gG7bWy0uCu2jKpQ6BK6x37TUv/4LACEiGcOYr4WcYrHKxQ5OZo
         +cDUDF2Lmp+G2DoUkyIeHwYyIJIXL0pCsTqq37p4=
Received: by mail-qk1-f175.google.com with SMTP id 125so4876947qkl.6;
        Mon, 12 Aug 2019 12:54:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXtRHbiOQxxELrDKsypJ9Q0l8lIjkrW8H8aBO+yVnwIgjd12obd
        7n2AKilmu+B1N8WE/KNA+XNypalbWvTfOd09gw==
X-Google-Smtp-Source: APXvYqwQLnty85orIVM2REkf7O62X+/6pmbwpGGpvQ0w6xNXApvj+A0uWNxcGV5tGCJeoe8bWYlm6t4yVXGpa9zcF80=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr30538495qke.393.1565639694370;
 Mon, 12 Aug 2019 12:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190811210043.20122-1-digetx@gmail.com> <20190811210043.20122-10-digetx@gmail.com>
 <CAL_JsqJNwMOMyDaB=zqbCLwfn+ro6RcvXFkRbN_t-mEeUi3rVQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJNwMOMyDaB=zqbCLwfn+ro6RcvXFkRbN_t-mEeUi3rVQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 12 Aug 2019 13:54:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bcqwRvYK=3d0Qu8K-psxLGOgCazmV55bA=vz+5f573w@mail.gmail.com>
Message-ID: <CAL_Jsq+bcqwRvYK=3d0Qu8K-psxLGOgCazmV55bA=vz+5f573w@mail.gmail.com>
Subject: Re: [PATCH v10 09/15] dt-bindings: memory: tegra30: Convert to
 Tegra124 YAML
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

On Mon, Aug 12, 2019 at 1:53 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Aug 11, 2019 at 3:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> >
> > The Tegra30 binding will actually differ from the Tegra124 a tad, in
> > particular the EMEM configuration description. Hence rename the binding
> > to Tegra124 during of the conversion to YAML.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  .../nvidia,tegra124-mc.yaml                   | 152 ++++++++++++++++++
> >  .../memory-controllers/nvidia,tegra30-mc.txt  | 123 --------------
> >  2 files changed, 152 insertions(+), 123 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Wrong patch, but still R-by... :)
