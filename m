Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E7D1F79CB
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgFLO20 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:28:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:43160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLO20 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:28:26 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75A6D20835;
        Fri, 12 Jun 2020 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591972105;
        bh=pfvcHafRtoStjYZYQPm86F3vnWbbDleWgNAM2Y2KWfg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zZNWNAHryRij42ZQs8sorg7pGvOuK78NKdqUjO/6tVoqxY3U5XjDWVBaG97ox9vlO
         W0IqNCnj6UIq/rmDMiKIEHE3MxVfILCjzeBSVrZ9Ry5xBPXOt5ynSCe8McmO8q+Joy
         LEd/aEbNGRT1/Moqjzidrhb3gyuh3q9bMTups+zI=
Received: by mail-ot1-f45.google.com with SMTP id b18so7447164oti.1;
        Fri, 12 Jun 2020 07:28:25 -0700 (PDT)
X-Gm-Message-State: AOAM532Lgxr8Z+zYXWOX34vdcIEPvFAoOIipLuJ0Ys6qSyztymAU0oZl
        yXiBA/2Ufa5G4YXR1citVacnm5slYEPPChLGwA==
X-Google-Smtp-Source: ABdhPJybkHbAScwpesYWSZpW80zK7MV/Z2fxh5HCjuFrDX7f1fqyJTQ1qQeP+4F0rc4Myf5HcbVKHtIfxEVk4j9/RKE=
X-Received: by 2002:a05:6830:549:: with SMTP id l9mr11132724otb.129.1591972104732;
 Fri, 12 Jun 2020 07:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200612141903.2391044-1-thierry.reding@gmail.com> <20200612141903.2391044-32-thierry.reding@gmail.com>
In-Reply-To: <20200612141903.2391044-32-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 12 Jun 2020 08:28:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
Message-ID: <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
Subject: Re: [PATCH 31/38] dt-bindings: panel: simple: Use unevaluatedProperties
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
> Using "additionalProperties: false" results in rejecting any of the
> properties defined in panel-common.yaml, whereas the intent is to
> inherit the common properties defined in that file.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 34fe3d42b829..c58bc90ffd43 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -275,7 +275,7 @@ properties:
>    port: true
>    power-supply: true
>
> -additionalProperties: false
> +unevaluatedProperties: false

But we've listed the properties we use here. Some of the common ones
may not be applicable. Maybe they are and if so, then you should drop
all the ones listed with 'true' with this change.

Rob
