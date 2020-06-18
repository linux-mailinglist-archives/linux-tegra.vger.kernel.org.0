Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361591FE846
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jun 2020 04:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732620AbgFRCrZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 22:47:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42616 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387877AbgFRCrY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 22:47:24 -0400
Received: by mail-io1-f67.google.com with SMTP id x189so5334545iof.9;
        Wed, 17 Jun 2020 19:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QRZO0p1S/TZyIxm27KirPnxEPk9KFFLztxOs5Nfy3I=;
        b=twqHcQx0agJbMVtgHi3A3qBPILD1kScarMOMNFh3eMAKdNoMSGphiVS/mRne62YM8B
         41WHzW+Ql7zoQTfNZqQWfE6f54RaH+oGW9M1tw7gAKMCeWZQb7d57FmjBZBv27UUnrx3
         JDZu0RaIbLKwqcvB++KUcqM4sC2N85N9t9VyHgohWDtQ5keti55vl4WVPwJqVjDs1KiW
         V/nysC5umk33pWOLDRKFrNLeDqXkF+FzLslGc0gXyAEuTuiC64PvhW5mT+zKJH3NjDSd
         fYdkvTcSFAuk4Sqx287/AFsRhPeX7D6568/Wx2tsyiBuvc4KyLuhJfBdw+fsxaf9YUOF
         JN0w==
X-Gm-Message-State: AOAM532fMXUQxmb9uV9rcwvncFdFGWZxpdwWWo3DkNdc+7kvzThecYVf
        jlnESE5lDNnEcLy7ILuTDA==
X-Google-Smtp-Source: ABdhPJxHsQlXF/93wL8nTFoLoVXH/u6pmds+JtsdnfUfHNeKWFHdU9c2HXDGqXc13dHxSSi/eSQmiQ==
X-Received: by 2002:a05:6638:272:: with SMTP id x18mr2366174jaq.122.1592448443093;
        Wed, 17 Jun 2020 19:47:23 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e25sm949562ios.0.2020.06.17.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:47:22 -0700 (PDT)
Received: (nullmailer pid 3383625 invoked by uid 1000);
        Thu, 18 Jun 2020 02:47:21 -0000
Date:   Wed, 17 Jun 2020 20:47:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 38/38] dt-bindings: serial: Document Tegra-specific
 properties
Message-ID: <20200618024721.GA3378010@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-39-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-39-thierry.reding@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:03PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> On Tegra the UART is described using additional properties, such as
> clock-names, reset-names, dmas and dma-names. Document them in the
> bindings so that Tegra device trees are properly validated.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index c1d4c196f005..9c8fad27c3f3 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -28,6 +28,32 @@ allOf:
>            const: 2
>        required:
>          - reg-shift
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-uart

Can use 'const' here instead.

> +    then:
> +      properties:
> +        clock-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"

Don't need type.

> +          items:
> +            - const: serial
> +
> +        dmas:
> +          $ref: "/schemas/types.yaml#/definitions/phandle-array"

How many?

> +
> +        dma-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"
> +          items:
> +            - const: rx
> +            - const: tx
> +
> +        reset-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"
> +          items:
> +            - const: serial
>    - if:
>        not:
>          properties:
> -- 
> 2.24.1
> 
