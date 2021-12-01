Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9975B4655B6
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Dec 2021 19:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352598AbhLASpr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Dec 2021 13:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238768AbhLASpq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Dec 2021 13:45:46 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1555C061574;
        Wed,  1 Dec 2021 10:42:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id EF0C9CE1FF6;
        Wed,  1 Dec 2021 18:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAE7C53FAD;
        Wed,  1 Dec 2021 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638384141;
        bh=1LOTRJhz2P8AeylGY+jA5ktATF9L++RoZRuNXtlJvM0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DORQ8Hv8RSDzPJsHQPjurXHmSbUVGoGRDp7pZ62pisvgBrBsHeehtmB3ue9pWffxe
         rbqSXeFPi/RKHejh4udy5zYpxmVL6tw59FvoUq1lhY0OZ02MancrikNXkuWCtsiakV
         sT5cUS9KZ8vydo3VhP1DZKLH0ySXYEUsv7Yzs4Yh8YHCFK6/OvqnwI/9YzPRapoldd
         KnDqaheldlnIUw1v+2sFVf0wbSt6ZMA90G8HdKSCwCw4QH/xN/NEifD2FRgqGmB+0g
         z9tXFrzIXAu5NB1SXnKKHqZeAA23f3SPkiOnCROraUPeHnfizSlRod59N9/rU9pQij
         lAzGMC/60jtSg==
Received: by mail-ed1-f47.google.com with SMTP id v1so105583309edx.2;
        Wed, 01 Dec 2021 10:42:20 -0800 (PST)
X-Gm-Message-State: AOAM531yeN7yQGeboSnnPxtFm+VVzDiNKx65znz3pzQ1b6xI+CuJaSVt
        BFI3bxMuN70ra+o11MaakHNFt7jaL4Er+MSeYQ==
X-Google-Smtp-Source: ABdhPJxrw7Y71WgfxEdR2E7jgvWa2sOyp91kziTOgbgkRZrYF3PRhqYkgFc0BGKnndNNasWL+9W8Li6PY4YZJACbzoQ=
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr8876751ejc.363.1638384139234;
 Wed, 01 Dec 2021 10:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com> <YaWCAGQU0sjCwz66@robh.at.kernel.org>
 <Yae0DwCpFu8F/Gbw@orome.fritz.box>
In-Reply-To: <Yae0DwCpFu8F/Gbw@orome.fritz.box>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 1 Dec 2021 12:42:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
Message-ID: <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 1, 2021 at 11:42 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Nov 29, 2021 at 07:44:32PM -0600, Rob Herring wrote:
> > On Fri, Nov 19, 2021 at 03:38:36PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> > > free-form text format to json-schema.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - add missing additionalProperties: false
> > >
> > >  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
> > >  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
> > >  2 files changed, 42 insertions(+), 42 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > > deleted file mode 100644
> > > index ab240e10debc..000000000000
> > > --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > > +++ /dev/null
> > > @@ -1,42 +0,0 @@
> > > -NVIDIA Tegra186 BPMP I2C controller
> > > -
> > > -In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
> > > -devices, such as the I2C controller for the power management I2C bus. Software
> > > -running on other CPUs must perform IPC to the BPMP in order to execute
> > > -transactions on that I2C bus. This binding describes an I2C bus that is
> > > -accessed in such a fashion.
> > > -
> > > -The BPMP I2C node must be located directly inside the main BPMP node. See
> > > -../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> > > -
> > > -This node represents an I2C controller. See ../i2c/i2c.txt for details of the
> > > -core I2C binding.
> > > -
> > > -Required properties:
> > > -- compatible:
> > > -    Array of strings.
> > > -    One of:
> > > -    - "nvidia,tegra186-bpmp-i2c".
> > > -- #address-cells: Address cells for I2C device address.
> > > -    Single-cell integer.
> > > -    Must be <1>.
> > > -- #size-cells:
> > > -    Single-cell integer.
> > > -    Must be <0>.
> > > -- nvidia,bpmp-bus-id:
> > > -    Single-cell integer.
> > > -    Indicates the I2C bus number this DT node represent, as defined by the
> > > -    BPMP firmware.
> > > -
> > > -Example:
> > > -
> > > -bpmp {
> > > -   ...
> > > -
> > > -   i2c {
> > > -           compatible = "nvidia,tegra186-bpmp-i2c";
> > > -           #address-cells = <1>;
> > > -           #size-cells = <0>;
> > > -           nvidia,bpmp-bus-id = <5>;
> > > -   };
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > > new file mode 100644
> > > index 000000000000..351e12124959
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > > @@ -0,0 +1,42 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra186 (and later) BPMP I2C controller
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > +
> > > +description: |
> > > +  In Tegra186 and later, the BPMP (Boot and Power Management Processor)
> > > +  owns certain HW devices, such as the I2C controller for the power
> > > +  management I2C bus. Software running on other CPUs must perform IPC to
> > > +  the BPMP in order to execute transactions on that I2C bus. This
> > > +  binding describes an I2C bus that is accessed in such a fashion.
> > > +
> > > +  The BPMP I2C node must be located directly inside the main BPMP node.
> > > +  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
> > > +  binding.
> > > +
> > > +  This node represents an I2C controller. See ../i2c/i2c.txt for details
> > > +  of the core I2C binding.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: nvidia,tegra186-bpmp-i2c
> > > +
> >
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> >
> > Covered by i2c-controller.yaml. Add a reference and then use
> > unevaluatedProperties.
>
> About that: I've recently noticed that this doesn't seem to work
> properly. I'm using branch draft2020-12 from your github and my

Use dtschema main/master branch. That branch is likely stale.

> understanding was that this should give us support for
> unevaluatedProperties. And indeed, it no longer complains about
> #address-cells and #size-cells if I remove them from this binding,
> presumably because it gets them from i2c-controller.yaml.
>
> However, a side-effect seems to be that now it also ignores any
> properties that aren't defined anywhere. So for example if I touch
> up the example in firmware/nvidia,tegra186-bpmp.yaml and add a bogus
> "foo-bar = <0>;" property in the BPMP I2C node, then it'll blindly
> accept that as valid.

Do you have unevaluatedProperties within the i2c node? It only applies
to 1 level, and you can't have a parent+child schema evaluated with
another child (or parent+child) schema. This is why the graph schema
is done the way it is and why we're splitting spi-controller.yaml
child node schema out to spi-peripheral.yaml.

> The validation will flag if I set #address-cells = <2> in the BPMP
> I2C node, so validation of the schema still seems to work, but for
> some reason it won't flag any properties that haven't been specified
> in the schema.
>
> Do I misunderstand how this is supposed to work, or is there something
> wrong with the current implementation of unevaluatedProperties?
>
> Thierry
