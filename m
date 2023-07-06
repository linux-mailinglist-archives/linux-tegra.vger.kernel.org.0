	by mail.lfdr.de (Postfix) with ESMTP id AF431749DF2
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Jul 2023 15:39:36 +0200 (CEST)
        id S229880AbjGFNjf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Jul 2023 09:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        with ESMTP id S229693AbjGFNje (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 09:39:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544CE102;
        Thu,  6 Jul 2023 06:39:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so999729e87.3;
        Thu, 06 Jul 2023 06:39:33 -0700 (PDT)
        d=gmail.com; s=20221208; t=1688650771; x=1691242771;
        bh=lnoW9dapqU1FLEIWUnMNR+MFKc6AR6egbFCkc5lKtKo=;
        b=G2YlmsaM3sKmZ/ZIpYOZCa5ETswkNiMadXP4bu7rIS7bcn8cMTpMNW8kAX5XJuqKrs
         Kt/4KjhKt9YwZs0YEIb/+MZ5WRSqMPTmDZCVJVv+9PDeHdfJw3ljdvYQbXH9PrdY9b6Y
         3LGgyRdXEyEkjRTtv1yYOWeUYjKfTTdEfQHLlbnP4vcfNba/GBq45hBHJcXi0SgCeWz6
         Veejmn+FhmG8dmCETTfW1rZB62moEcVHA2MdXlwu8uBc0VWzqHQqVkdAf3IuHlCL02rz
         C2ZxqImMktkW/nB5z+wIjTvGsPKuv1dZYTNYHryd+np8xHLxpm8AuTXvScA+kQpXwcQm
         E2BA==
        d=1e100.net; s=20221208; t=1688650771; x=1691242771;
        bh=lnoW9dapqU1FLEIWUnMNR+MFKc6AR6egbFCkc5lKtKo=;
        b=Yg7khA0QfqhOWbEMV6ppHIXYdnd3u4+qnDOfNXulAOIJN8E63EDr9zXnk/ZEI4IB0o
         nTuM0Vjk9/1KAenD5w8wExgnfmHXHvltji5Ee3aehRKOW9D1gQKCKWT5nkz2pHQYFn74
         DNQqloIDeU/iXgoAHDCZw8FZuh/YnKUireN0w9p9rmDh+TThuYQsXhqXrTLnV5EHz5ut
         0aWhjtMWqPYOJtQoydJ7dZlN1ww5TNCp+Q73srgcpJ65BXBl9FWxWOArMFC/MQ1B5OHd
         Stg6zeQwapNDrZ+xK6xfzztaxkB8VQlFiI88AuuolXFyCRw48D1/R6HkcQ7nFTBb4yMF
         3osA==
X-Gm-Message-State: ABy/qLZ95Zr4aT3dLjeK+MJ8eyXrs5X9E/D2GF1MVOl7/yt2sD6LjiYl
        6u3phIKZELWmmj2dUXrCDWo=
X-Google-Smtp-Source: APBJJlEk4iUPzhAn3DztDfDFTsnK1NK0WFycKMEHI9dL+hm1leT9f5EugicMjKt2pefDWjqwPRLy/Q==
X-Received: by 2002:a05:6512:2103:b0:4f8:66a1:a31b with SMTP id q3-20020a056512210300b004f866a1a31bmr1384718lfr.30.1688650771128;
        Thu, 06 Jul 2023 06:39:31 -0700 (PDT)
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003fbacc853ccsm2133606wmk.18.2023.07.06.06.39.30
        Thu, 06 Jul 2023 06:39:30 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:39:28 +0200
To:     Rob Herring <robh@kernel.org>, Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: tegra: nvec: Convert to
 json-schema
Message-ID: <ZKbEEDWg5N8r8s-b@orome>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
 <20230705155222.2519728-3-thierry.reding@gmail.com>
 <20230705205013.GA1871916-robh@kernel.org>
        protocol="application/pgp-signature"; boundary="TNY2OiA2P2/M9rMa"
In-Reply-To: <20230705205013.GA1871916-robh@kernel.org>
--TNY2OiA2P2/M9rMa
On Wed, Jul 05, 2023 at 02:50:13PM -0600, Rob Herring wrote:
> On Wed, Jul 05, 2023 at 05:52:22PM +0200, Thierry Reding wrote:
> > Convert the NVIDIA embedded controller bindings from the free-form text
> > format to json-schema.
> > Acked-by: Marc Dietrich <marvin24@gmx.de>
> > Changes in v2:
> > - drop $ref for standard clock-frequency property
> > - use 4 spaces for indentation in example
> > - move to soc/tegra directory
> >  .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
> >  .../bindings/soc/tegra/nvidia,nvec.yaml       | 92 +++++++++++++++++++
> >  2 files changed, 92 insertions(+), 21 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,=
nvec.txt
> >  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,=
nvec.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.tx=
t b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
> > deleted file mode 100644
> > index 5ae601e7f51f..000000000000
> > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -NVIDIA compliant embedded controller
> > -
> > -Required properties:
> > -- compatible : should be "nvidia,nvec".
> > -- reg : the iomem of the i2c slave controller
> > -- interrupts : the interrupt line of the i2c slave controller
> > -- clock-frequency : the frequency of the i2c bus
> > -- gpios : the gpio used for ec request
> > -- slave-addr: the i2c address of the slave controller
> > -- clocks : Must contain an entry for each entry in clock-names.
> > -  See ../clocks/clock-bindings.txt for details.
> > -- clock-names : Must include the following entries:
> > -  Tegra20/Tegra30:
> > -  - div-clk
> > -  - fast-clk
> > -  Tegra114:
> > -  - div-clk
> > -- resets : Must contain an entry for each entry in reset-names.
> > -  See ../reset/reset.txt for details.
> > -- reset-names : Must include the following entries:
> > -  - i2c
> > diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.ya=
ml b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> > index 000000000000..0b4f898b2a1d
> > +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/tegra/nvidia,nvec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA compliant embedded controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,nvec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: divider clock
> > +      - description: fast clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: div-clk
> > +      - const: fast-clk
> > +
> > +  resets:
> > +    items:
> > +      - description: module reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: i2c
> > +
> > +  clock-frequency: true
> > +
> > +  request-gpios:
> > +    description: phandle to the GPIO used for EC request
> > +
> > +  slave-addr:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: I2C address of the slave controller
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> You don't have any child nodes defined, so these 2 properties are=20
> pointless.

Good point. Looking at this a bit more, I think perhaps we should also
rename the node representing this to i2c@7000c500 because this is really
only a repurposed I2C controller, which is probably also where these
stray #address-cells and #size-cells come from.
In DT we basically duplicate i2c@7000c500 and nvec@7000c500, but we can
probably also reuse most of i2c@7000c500 and just drop some things that
NVEC can't use (such as dmas and dma-names) and add the slave specific
bits (such as clock-frequency, slave-addr and request-gpios).
Marc, any thoughts?
>=20
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - clock-frequency
> > +  - request-gpios
> > +  - slave-addr
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/tegra20-car.h>
> > +    #include <dt-bindings/gpio/tegra-gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    nvec@7000c500 {
> > +        compatible =3D "nvidia,nvec";
> > +        reg =3D <0x7000c500 0x100>;
> > +        interrupts =3D <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        clock-frequency =3D <80000>;
> > +        request-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
> > +        slave-addr =3D <138>;
> > +        clocks =3D <&tegra_car TEGRA20_CLK_I2C3>,
> > +                 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
> > +        clock-names =3D "div-clk", "fast-clk";
> > +        resets =3D <&tegra_car 67>;
> > +        reset-names =3D "i2c";
> > +    };
> > --=20
> > 2.41.0
> >=20

--TNY2OiA2P2/M9rMa
iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSmxBAACgkQ3SOs138+
s6HuwA/5AY8WXKTgilVpbpAmoPa8jxQCFh746DK4YqJkLFwhzPo4LdJxxdSr48wW
/NONOCDyKR7UjGVuKChxIN4i86huuRmv4YyIoS0oXRjiwYLNUV7JKWVKIOIpPg+v
26aI93Spevfp1Zdo6amDNad+KYD+Dbk6L79Ax/PhvxCjscluzKDyN96E8sytp4e4
JgTd1nEYcsSgreoz7fk8kdJa8yhOJKPiSj5iXpAPl4y2UFF1NScf76ylmdrgsL8r
bCAmhVL6wfEgESVW7uEmla4VxW3irhese3cJ1KU8IyqEUFVwSirrAQUZvEl1YsY2
Yu57f5HSMp8ypsUcUNAKGigcP7ycyWUEjEMSZ94BjFEfWVY2jSD3KSXXMVRT56NL
+18hk7eYJuxAJzTSaMUO9pNQ8a6/qu1Rnw8LPmAnohGAYZ9wT1DgTS21Dui1ZcAA
2/vpJR4eTr6kQOP8AJGJiQiMLoJgKUmd+437uOCTZfj4SfEg4corLLataDBFmiWf
7UVxgH9DIyCLTiZp5+vYvX4tQ1e551TtzFJc0Lpknna+grxm7nM9+olpsO/dypHt
Daxt4xhBRK9B93Kd3HQIRiVhc/gUqoqxbrZB5xrirwBPjrRLUqt1BV8TP7uqfiOv
VT1Y0UY6d7p21/zWReiRiTujnegA8spKHZsXnCLUue2rhSH5L1s=
=VL3D
--TNY2OiA2P2/M9rMa--