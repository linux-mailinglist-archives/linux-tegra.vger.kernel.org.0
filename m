Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004301F79CE
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgFLO3s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:29:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLO3r (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:29:47 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 354BB2074B;
        Fri, 12 Jun 2020 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591972187;
        bh=C4QmiIGwBQ3kr1+m50jVdAtC1bDqp+f5aW77ojz3CNY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JPoFwBqEpGPLj0QT5ZyacU56yu9aa2E4FYCP/7WL+gr9ppvQvBdr3gMjjBROtIQKQ
         8EHDO8q6BZG0q8l282xgdhKdLWIuse9BG3UQnHRCMSJdCXs9JRqcUBDR48zOBXzXPt
         4qo+QpWJIY1mcOgOAJRw9KLVckOOo8yBOO2JOSgs=
Received: by mail-oi1-f170.google.com with SMTP id t25so8836016oij.7;
        Fri, 12 Jun 2020 07:29:47 -0700 (PDT)
X-Gm-Message-State: AOAM533VHHI99FrjXi8OrFcRRby+1eKGgSexod+4EZx24M7dxljydzC4
        7qZCHEp7v/WYyhRSoLz1fuT+pvGQmOwZt7Uz+A==
X-Google-Smtp-Source: ABdhPJz0QlzIsC22tvGPSganueNoXi8rW5oiHx2735/OAfq24fn6WuKneaKnVFDoJMgGQaEGYuW66ruR2bmueYCYFn0=
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr670030oic.147.1591972186628;
 Fri, 12 Jun 2020 07:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200612141903.2391044-1-thierry.reding@gmail.com> <20200612141903.2391044-31-thierry.reding@gmail.com>
In-Reply-To: <20200612141903.2391044-31-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 12 Jun 2020 08:29:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
Message-ID: <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
Subject: Re: [PATCH 30/38] dt-bindings: panel: Allow reg property for DSI panels
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> For DSI panels the "reg" property is needed to represent the virtual
> channel of the given panel.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index d6cca1479633..34fe3d42b829 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -267,6 +267,9 @@ properties:
>          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
>        - winstar,wf35ltiacd
>
> +  reg:
> +    description: virtual channel for DSI panels
> +

panel-simple-dsi.yaml?

>    backlight: true
>    enable-gpios: true
>    port: true
> --
> 2.24.1
>
