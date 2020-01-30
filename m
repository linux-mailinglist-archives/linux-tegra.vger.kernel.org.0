Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70AF14E034
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 18:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgA3Rqm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 12:46:42 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:45724 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbgA3Rql (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 12:46:41 -0500
Received: by mail-wr1-f54.google.com with SMTP id a6so5132197wrx.12;
        Thu, 30 Jan 2020 09:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8YFSV1UMcHX5MWpZxlmifQcwoNkgbD9ulIjnldAWQ2s=;
        b=nOl6tLxYjkztd4T9fajOX/DrG+B8mRy5wWGPnom3XtmorVvqIjpm3Avq0sLWgmmVBa
         9wO1je/7z6JAKBgsEWtjJn54c9aHxxwO/bgFfzAbXjBBJFyVDII9NyMXf4Habd0ooPeG
         bRcAM0vyO1V3zP48GD4+ZO5bhE5TfY49Mw+3DEpk7yRnSIo2bZUYQwFy4n8ewLI+GGzf
         mrNK60vBcy3Bjnjhx/HTWuoxd9q1EyZy9glkwsDS+dnhbmNq3woDYW5Y2unlfpYSsAz4
         90Ha5MERP/xLAqQsxikSAP/J7KHT7iNfms/4QCgOfBSCR8OyOM3jZRHXjRn0hBTHr9Rz
         mhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8YFSV1UMcHX5MWpZxlmifQcwoNkgbD9ulIjnldAWQ2s=;
        b=KTaHVGwbf/FSsVLRenVxhhNH+UQ/5MV1XpZ9ro3m3Hp20gykMwQgd29G5mN0JQf8rr
         f2+zycJAlQFfFiuFlcNqG/TmhMMFe7Bij9by78M4bub7gs7S+g/C7+ff8AUGkP/Mf7nJ
         v/jwur6IQkvcPAdFBjRcXE6yhvAUjWda4Noba4k7jALw2x7KTh3dsfbxiGLvgITeP5Zo
         /mnLPgGNk5v58A5DaKdAkl/MF/11zc9dzwJ81LBqh3y+iUVcmC4GRlmBfPF+ZJYGoHqt
         lDLdJ7zKntZknXMMeL7Mf2JOAPFR9s2W5LKyiEFghrjiIAYFVsLCelZe9mhw2zzclb6s
         cqHw==
X-Gm-Message-State: APjAAAX6uiWWXrobleM4lmcwzTLRre2SXoIIQb04P+HXl9JsbqvQR992
        Q9wAT1hO9g6rbR9PrXHIUPnW0y36
X-Google-Smtp-Source: APXvYqyc3xN8TC/HWFyhgE/KiXuxo1AwPTs74Hw3d9pOpLxfdGaKtNwntd5vlM53HO6Wmu2PAvpIJw==
X-Received: by 2002:adf:e58b:: with SMTP id l11mr6736151wrm.402.1580406398947;
        Thu, 30 Jan 2020 09:46:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id v14sm8410752wrm.28.2020.01.30.09.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 09:46:37 -0800 (PST)
Date:   Thu, 30 Jan 2020 18:46:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC] dt-bindings: display: Convert Tegra host1x to json-schema
Message-ID: <20200130174636.GA3154793@ulmo>
References: <20200130174006.3154922-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <20200130174006.3154922-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 06:40:06PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 487 ----------
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 884 ++++++++++++++++++
>  2 files changed, 884 insertions(+), 487 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-host1x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-host1x.yaml
[...]
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.yaml
> new file mode 100644
> index 000000000000..26b2325813eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.yaml
> @@ -0,0 +1,884 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-host1x.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra host1x controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The host1x top-level node defines a number of children, each
> +  representing one of the host1x client modules defined in this binding.
> +
> +properties:
> +  # required
> +  compatible:
> +    oneOf:
> +      - description: NVIDIA Tegra20
> +        allOf:
> +          - enum:
> +              - nvidia,tegra20-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra30
> +        allOf:
> +          - enum:
> +              - nvidia,tegra30-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra114
> +        allOf:
> +          - enum:
> +              - nvidia,tegra114-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra124
> +        allOf:
> +          - enum:
> +              - nvidia,tegra124-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra132
> +        allOf:
> +          - enum:
> +              - nvidia,tegra132-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra210
> +        allOf:
> +          - enum:
> +              - nvidia,tegra210-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra186
> +        allOf:
> +          - enum:
> +              - nvidia,tegra186-host1x
> +          - const: simple-bus
> +
> +      - description: NVIDIA Tegra194
> +        allOf:
> +          - enum:
> +              - nvidia,tegra194-host1x
> +          - const: simple-bus

Hi Rob, all,

I've been trying to convert this to json-schema, but I'm running into
weird issues. What I seem to be seeing is that the above schema for the
compatible string ends up matching various device tree nodes, such as
the top-level "regulators" node which has just:

	compatible =3D "simple-bus";

The intention here is to have one (or more) SoC-specific string and a
"simple-bus" in the compatible string. Here are a few examples:

	tegra124.dtsi: compatible =3D "nvidia,tegra124-host1x", "simple-bus";
	tegra132.dtsi: compatible =3D "nvidia,tegra132-host1x",
				    "nvidia,tegra124-host1x",
				    "simple-bus";
	tegra186.dtsi: compatible =3D "nvidia,tegra186-host1x", "simple-bus";

For some reason none of the variants I've tried (such as items: instead
of allOf: in the above) seem to properly match.

Any ideas what I'm doing wrong here? There are a couple of additional
errors flagged when I run this through the checker, but I think they are
all follow-up errors from the mismatched compatible strings.

Quoting in full for reference.

Thierry

> +
> +  interrupts:
> +    items:
> +      - description: host1x syncpoint interrupt
> +      - description: host1x general interrupt
> +    minItems: 1
> +    maxItems: 2
> +
> +  '#address-cells':
> +    description: The number of cells used to represent physical base add=
resses
> +      in the host1x address space.
> +    enum: [1, 2]
> +
> +  '#size-cells':
> +    description: The number of cells used to represent the size of an ad=
dress
> +      range in the host1x address space.
> +    enum: [1, 2]
> +
> +  ranges:
> +    description: The mapping of the host1x address space to the CPU addr=
ess
> +      space.
> +
> +  clocks:
> +    description: Must contain one entry, for the module clock. See
> +      ../clocks/clock-bindings.txt for details.
> +
> +  resets:
> +    description: Must contain an entry for each entry in reset-names. See
> +      ../reset/reset.txt for details.
> +
> +  reset-names:
> +    items:
> +      - const: host1x
> +
> +  # optional
> +  interconnects:
> +    description: Description of the interconnect paths for the host1x
> +      controller; see ../interconnect/interconnect.txt for details.
> +  interconnect-names:
> +    description: A list of names identifying each entry listed in the
> +      "interconnects" property.
> +
> +  # host1x clients
> +  vi:
> +    description: video input
> +    type: object
> +    properties:
> +      compatible:
> +        oneOf:
> +          - const: nvidia,tegra20-vi
> +          - const: nvidia,tegra30-vi
> +          - const: nvidia,tegra114-vi
> +          - const: nvidia,tegra124-vi
> +          - allOf:
> +              - const: nvidia,tegra132-vi
> +              - const: nvidia,tegra124-vi
> +          - const: nvidia,tegra210-vi
> +          - const: nvidia,tegra186-vi
> +          - const: nvidia,tegra194-vi
> +
> +      reg: true
> +      interrupts: true
> +      clocks: true
> +
> +      resets: true
> +      reset-names:
> +        items:
> +          - const: vi
> +
> +  isp:
> +    description: image signal processor
> +    type: object
> +    properties:
> +      compatible:
> +        oneOf:
> +          - const: nvidia,tegra20-isp
> +          - const: nvidia,tegra30-isp
> +          - const: nvidia,tegra114-isp
> +          - const: nvidia,tegra124-isp
> +          - allOf:
> +              - const: nvidia,tegra132-isp
> +              - const: nvidia,tegra124-isp
> +          - const: nvidia,tegra210-isp
> +          - const: nvidia,tegra186-isp
> +          - const: nvidia,tegra194-isp
> +
> +      reg: true
> +      interrupts: true
> +      clocks: true
> +      resets: true
> +      reset-names:
> +        items:
> +          - const: isp
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra186-host1x
> +              - const: nvidia,tegra194-host1x
> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: hypervisor
> +            - const: vm
> +        reg:
> +          items:
> +            - description: physical base address and length of the regis=
ter
> +                region assigned to the VM
> +            - description: physical base address and length of the regis=
ter
> +                region used by the hypervisor
> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: physical base address and length of the contr=
oller
> +                registers
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra20-host1x
> +              - const: nvidia,tegra30-host1x
> +    then:
> +      properties:
> +        epp:
> +          description: encoder pre-processor
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-epp
> +                - const: nvidia,tegra30-epp
> +                - const: nvidia,tegra114-epp
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: epp
> +
> +        mpe:
> +          description: video encoder
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-mpe
> +                - const: nvidia,tegra30-mpe
> +                - const: nvidia,tegra114-mpe
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: mpe
> +
> +        gr2d:
> +          description: 2D graphics engine
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-gr2d
> +                - const: nvidia,tegra30-gr2d
> +                - const: nvidia,tegra114-gr2d
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: 2d
> +
> +        gr3d:
> +          description: 3D graphics engine
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-gr3d
> +                - const: nvidia,tegra30-gr3d
> +                - const: nvidia,tegra114-gr3d
> +            reg: true
> +            clocks: true
> +            resets: true
> +
> +          allOf:
> +            - if:
> +                properties:
> +                  compatible:
> +                    contains:
> +                      oneOf:
> +                        - const: nvidia,tegra30-gr3d
> +              then:
> +                properties:
> +                  clock-names:
> +                    items:
> +                      - const: 3d
> +                      - const: 3d2
> +                  reset-names:
> +                    items:
> +                      - const: 3d
> +                      - const: 3d2
> +              else:
> +                properties:
> +                  clock-names:
> +                    items:
> +                      - const: 3d
> +                  reset-names:
> +                    items:
> +                      - const: 3d
> +
> +        tvo:
> +          description: TV encoder output
> +          type: object
> +          properties:
> +            # required
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-tvo
> +                - const: nvidia,tegra30-tvo
> +                - const: nvidia,tegra114-tvo
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra20-host1x
> +              - const: nvidia,tegra30-host1x
> +              - const: nvidia,tegra114-host1x
> +              - const: nvidia,tegra124-host1x
> +              - const: nvidia,tegra132-host1x
> +              - const: nvidia,tegra210-host1x
> +    then:
> +      properties:
> +        dc:
> +          description: display controller
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-dc
> +                - const: nvidia,tegra30-dc
> +                - const: nvidia,tegra114-dc
> +                - const: nvidia,tegra124-dc
> +                - allOf:
> +                    - const: nvidia,tegra124-dc
> +                    - const: nvidia,tegra132-dc
> +                - const: nvidia,tegra210-dc
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - const: dc
> +                - const: parent
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: dc
> +            interconnects: true
> +            interconnect-names:
> +              items:
> +                - const: XXX
> +                - const: XXX
> +            nvidia,head:
> +              description: The number of the display controller head. Th=
is is
> +                used to setup the various types of output to receive vid=
eo
> +                data from the given head.
> +              $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          if:
> +            properties:
> +              compatible:
> +                contains:
> +                  oneOf:
> +                    - const: nvidia,tegra20-dc
> +                    - const: nvidia,tegra30-dc
> +                    - const: nvidia,tegra114-dc
> +          then:
> +            properties:
> +              rgb:
> +                description: Each display controller node has a child no=
de,
> +                  named "rgb", that represents the RGB output associated=
 with
> +                  the controller.
> +                type: object
> +                properties:
> +                  nvidia,ddc-i2c-bus:
> +                    $ref: /schemas/types.yaml#/definitions/phandle
> +                    description: phandle of an I2C controller used for D=
DC
> +                      EDID probing
> +
> +                  nvidia,hpd-gpio:
> +                    $ref: /schemas/types.yaml#/definitions/phandle-array
> +                    description: specifies a GPIO used for hotplug detec=
tion
> +
> +                  nvidia,edid:
> +                    $ref: /schemas/types.yaml#/definitions/uint8-array
> +                    description: supplies a binary EDID blob
> +
> +                  nvidia,panel:
> +                    $ref: /schemas/types.yaml#/definitions/phandle
> +                    description: phandle of a display panel
> +
> +                  # XXX
> +    else:
> +      properties:
> +        display-hub:
> +          description: display controller hub
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - allOf:
> +                    - const: nvidia,tegra186-display
> +                    - const: simple-bus
> +                - allOf:
> +                    - const: nvidia,tegra194-display
> +                    - const: simple-bus
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - const: disp
> +                - const: dsc
> +                - const: hub
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: misc
> +                - const: wgrp0
> +                - const: wgrp1
> +                - const: wgrp2
> +                - const: wgrp3
> +                - const: wgrp4
> +                - const: wgrp5
> +            power-domains: true
> +            ranges: true
> +
> +            display:
> +              #$nodename: display@[0-9a-f]+
> +              description: display controller
> +              type: object
> +              properties:
> +                compatible:
> +                  oneOf:
> +                    - const: nvidia,tegra186-dc
> +                    - const: nvidia,tegra194-dc
> +                reg: true
> +                interrupts: true
> +                clocks: true
> +                clock-names:
> +                  items:
> +                    - const: dc
> +                    - const: parent
> +                resets: true
> +                reset-names:
> +                  items:
> +                    - const: dc
> +                power-domains:
> +                  description: A list of phandle and specifiers that ide=
ntify
> +                    the power domains that this display controller is pa=
rt of.
> +
> +                interconnects: true
> +                interconnect-names:
> +                  items:
> +                    - const: read-0
> +                    - const: read-1
> +
> +                iommus:
> +                  $ref: /schemas/types.yaml#/definitions/phandle-array
> +                  description: a phandle and specifier identifying the S=
MMU
> +                    master interface of this display controller.
> +                nvidia,outputs:
> +                  description: A list of phandles of outputs that this d=
isplay
> +                    controller can drive.
> +                  $ref: /schemas/types.yaml#/definitions/phandle-array
> +                nvidia,head:
> +                  description: The number of the display controller head=
=2E This
> +                    is used to setup the various types of output to rece=
ive
> +                    video data from the given head.
> +                  $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra20-host1x
> +              - const: nvidia,tegra30-host1x
> +              - const: nvidia,tegra114-host1x
> +              - const: nvidia,tegra124-host1x
> +    then:
> +      properties:
> +        hdmi:
> +          description: High Definition Multimedia Interface
> +          type: object
> +          properties:
> +            # required
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra20-hdmi
> +                - const: nvidia,tegra30-hdmi
> +                - const: nvidia,tegra114-hdmi
> +                - const: nvidia,tegra124-hdmi
> +                - allOf:
> +                    - const: nvidia,tegra132-hdmi
> +                    - const: nvidia,tegra124-hdmi
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - const: hdmi
> +                - const: parent
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: hdmi
> +            hdmi-supply:
> +              description: supply for the +5V HDMI connector pin
> +            vdd-supply:
> +              description: regulator for supply voltage
> +            pll-supply:
> +              description: regulator for PLL
> +
> +            # optional
> +            nvidia,ddc-i2c-bus:
> +              description: phandle of an I2C controller used for DDC EDID
> +                probing
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +            nvidia,hpd-gpio:
> +              description: specifies a GPIO used for hotplug detection
> +              $ref: /schemas/types.yaml#/definitions/phandle-array
> +            nvidia,edid:
> +              description: supplies a binary EDID blob
> +              $ref: /schemas/types.yaml#/definitions/uint8-array
> +            nvidia,panel:
> +              description: phandle of a display panel
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra124-host1x
> +              - const: nvidia,tegra210-host1x
> +              - const: nvidia,tegra186-host1x
> +              - const: nvidia,tegra194-host1x
> +    then:
> +      properties:
> +        sor:
> +          description: The Serial Output Resource (SOR) can be used to d=
rive
> +            HDMI, LVDS, eDP and DP outputs.
> +
> +            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for informat=
ion
> +            regarding the DPAUX pad controller bindings.
> +          type: object
> +          properties:
> +            # required
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra124-sor
> +                - allOf:
> +                    - const: nvidia,tegra132-sor
> +                    - const: nvidia,tegra124-sor
> +                - const: nvidia,tegra210-sor
> +                - const: nvidia,tegra210-sor1
> +                - const: nvidia,tegra186-sor
> +                - const: nvidia,tegra186-sor1
> +                - const: nvidia,tegra194-sor
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - description: clock input for the SOR hardware
> +                  const: sor
> +                - description: SOR output clock
> +                  const: out
> +                - description: input for the pixel clock
> +                  const: parent
> +                - description: reference clock for the SOR clock
> +                  const: dp
> +                - description: safe reference clock for the SOR clock du=
ring
> +                    power up
> +                  const: safe
> +                  # deprecated
> +                - description: source clock for the SOR clock (obsolete,=
 use
> +                    "out" instead)
> +                  const: source
> +                  # Tegra186 and later
> +                - description: SOR pad output clock
> +                  const: pad
> +            resets: true
> +            reset-names:
> +              items:
> +                - description: module reset
> +                  const: sor
> +
> +            # Tegra186 and later
> +            nvidia,interface:
> +              $ref: /schemas/types.yaml#/definitions/uint32
> +              description: index of the SOR interface
> +
> +            # optional
> +            nvidia,ddc-i2c-bus:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of an I2C controller used for DDC EDID
> +                probing
> +
> +            nvidia,hpd-gpio:
> +              $ref: /schemas/types.yaml#/definitions/phandle-array
> +              description: specifies a GPIO used for hotplug detection
> +
> +            nvidia,edid:
> +              $ref: /schemas/types.yaml#/definitions/uint8-array
> +              description: supplies a binary EDID blob
> +
> +            nvidia,panel:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of a display panel
> +
> +            nvidia,xbar-cfg:
> +              $ref: /schemas/types.yaml#/definitions/uint32-array
> +              description: 5 cells containing the crossbar configuration.
> +                Each lane of the SOR, identified by the cell's index, is
> +                mapped via the crossbar to the pad specified by the cell=
's
> +                value.
> +
> +            # optional when driving an eDP output
> +            nvidia,dpaux:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle to a DispayPort AUX interface
> +
> +        dpaux:
> +          description: DisplayPort AUX interface
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra124-dpaux
> +                - allOf:
> +                    - const: nvidia,tegra132-dpaux
> +                    - const: nvidia,tegra124-dpaux
> +                - const: nvidia,tegra210-dpaux
> +                - const: nvidia,tegra186-dpaux
> +                - const: nvidia,tegra194-dpaux
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - description: clock input for the DPAUX hardware
> +                  const: dpaux
> +                - description: reference clock
> +                  const: parent
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: dpaux
> +            vdd-supply:
> +              description: phandle of a supply that powers the DisplayPo=
rt
> +                link
> +            i2c-bus:
> +              description: Subnode where I2C slave devices are listed. T=
his
> +                subnode must be always present. If there are no I2C slave
> +                devices, an empty node should be added. See ../../i2c/i2=
c.yaml
> +                for more information.
> +
> +        vic:
> +          description: Video Image Compositor
> +          type: object
> +          properties:
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra124-vic
> +                - allOf:
> +                    - const: nvidia,tegra132-vic
> +                    - const: nvidia,tegra124-vic
> +                - const: nvidia,tegra210-vic
> +                - const: nvidia,tegra186-vic
> +                - const: nvidia,tegra194-vic
> +            reg: true
> +            interrupts: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - description: clock input for the VIC hardware
> +                - const: vic
> +            resets: true
> +            reset-names:
> +              items:
> +                - const: vic
> +            interconnects: true
> +            interconnect-names:
> +              items:
> +                - const: read
> +                - const: write
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:
> +              - const: nvidia,tegra30-host1x
> +              - const: nvidia,tegra114-host1x
> +              - const: nvidia,tegra124-host1x
> +              - const: nvidia,tegra210-host1x
> +              - const: nvidia,tegra186-host1x
> +    then:
> +      properties:
> +        dsi:
> +          description: display serial interface
> +          type: object
> +          properties:
> +            # required
> +            compatible:
> +              oneOf:
> +                - const: nvidia,tegra30-dsi
> +                - const: nvidia,tegra114-dsi
> +                - const: nvidia,tegra124-dsi
> +                - allOf:
> +                    - const: nvidia,tegra132-dsi
> +                    - const: nvidia,tegra124-dsi
> +                - const: nvidia,tegra210-dsi
> +                - const: nvidia,tegra186-dsi
> +            reg: true
> +            clocks: true
> +            clock-names:
> +              items:
> +                - description: DSI module clock
> +                  const: dsi
> +                - description: low-power module clock
> +                  const: lp
> +                - description: input for the pixel clock
> +                  const: parent
> +            resets: true
> +            reset-names:
> +              items:
> +                - description: module reset
> +                - const: dsi
> +            avdd-dsi-supply:
> +              description: phandle of a supply that powers the DSI contr=
oller
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +
> +            nvidia,mipi-calibrate:
> +              $ref: /schemas/types.yaml#/definitions/phandle-array
> +              description: Should contain a phandle and a specifier spec=
ifying
> +                which pads are used by this DSI output and need to be
> +                calibrated. See also ../display/tegra/nvidia,tegra114-mi=
pi.txt.
> +
> +            # optional
> +            nvidia,ddc-i2c-bus:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of an I2C controller used for DDC EDID
> +                probing
> +            nvidia,hpd-gpio:
> +              $ref: /schemas/types.yaml#/definitions/phandle-array
> +              description: specifies a GPIO used for hotplug detection
> +            nvidia,edid:
> +              $ref: /schemas/types.yaml#/definitions/uint8-array
> +              description: supplies a binary EDID blob
> +            nvidia,panel:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of a display panel
> +            nvidia,ganged-mode:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: contains a phandle to a second DSI controller=
 to
> +                gang up with in order to support up to 8 data lanes
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +
> +    host1x {
> +        compatible =3D "nvidia,tegra20-host1x", "simple-bus";
> +        reg =3D <0x50000000 0x00024000>;
> +        interrupts =3D <0 65 0x04   /* mpcore syncpt */
> +                      0 67 0x04>; /* mpcore general */
> +        clocks =3D <&tegra_car TEGRA20_CLK_HOST1X>;
> +        resets =3D <&tegra_car 28>;
> +        reset-names =3D "host1x";
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        ranges =3D <0x54000000 0x54000000 0x04000000>;
> +
> +        mpe {
> +                compatible =3D "nvidia,tegra20-mpe";
> +                reg =3D <0x54040000 0x00040000>;
> +                interrupts =3D <0 68 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_MPE>;
> +                resets =3D <&tegra_car 60>;
> +                reset-names =3D "mpe";
> +        };
> +
> +        vi {
> +                compatible =3D "nvidia,tegra20-vi";
> +                reg =3D <0x54080000 0x00040000>;
> +                interrupts =3D <0 69 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_VI>;
> +                resets =3D <&tegra_car 100>;
> +                reset-names =3D "vi";
> +        };
> +
> +        epp {
> +                compatible =3D "nvidia,tegra20-epp";
> +                reg =3D <0x540c0000 0x00040000>;
> +                interrupts =3D <0 70 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_EPP>;
> +                resets =3D <&tegra_car 19>;
> +                reset-names =3D "epp";
> +        };
> +
> +        isp {
> +                compatible =3D "nvidia,tegra20-isp";
> +                reg =3D <0x54100000 0x00040000>;
> +                interrupts =3D <0 71 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_ISP>;
> +                resets =3D <&tegra_car 23>;
> +                reset-names =3D "isp";
> +        };
> +
> +        gr2d {
> +                compatible =3D "nvidia,tegra20-gr2d";
> +                reg =3D <0x54140000 0x00040000>;
> +                interrupts =3D <0 72 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_GR2D>;
> +                resets =3D <&tegra_car 21>;
> +                reset-names =3D "2d";
> +        };
> +
> +        gr3d {
> +                compatible =3D "nvidia,tegra20-gr3d";
> +                reg =3D <0x54180000 0x00040000>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_GR3D>;
> +                resets =3D <&tegra_car 24>;
> +                reset-names =3D "3d";
> +        };
> +
> +        dc@54200000 {
> +                compatible =3D "nvidia,tegra20-dc";
> +                reg =3D <0x54200000 0x00040000>;
> +                interrupts =3D <0 73 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_DISP1>,
> +                         <&tegra_car TEGRA20_CLK_PLL_P>;
> +                clock-names =3D "dc", "parent";
> +                resets =3D <&tegra_car 27>;
> +                reset-names =3D "dc";
> +
> +                rgb {
> +                        status =3D "disabled";
> +                };
> +        };
> +
> +        dc@54240000 {
> +                compatible =3D "nvidia,tegra20-dc";
> +                reg =3D <0x54240000 0x00040000>;
> +                interrupts =3D <0 74 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_DISP2>,
> +                         <&tegra_car TEGRA20_CLK_PLL_P>;
> +                clock-names =3D "dc", "parent";
> +                resets =3D <&tegra_car 26>;
> +                reset-names =3D "dc";
> +
> +                rgb {
> +                        status =3D "disabled";
> +                };
> +        };
> +
> +        hdmi {
> +                compatible =3D "nvidia,tegra20-hdmi";
> +                reg =3D <0x54280000 0x00040000>;
> +                interrupts =3D <0 75 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_HDMI>,
> +                         <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> +                clock-names =3D "hdmi", "parent";
> +                resets =3D <&tegra_car 51>;
> +                reset-names =3D "hdmi";
> +                status =3D "disabled";
> +        };
> +
> +        tvo {
> +                compatible =3D "nvidia,tegra20-tvo";
> +                reg =3D <0x542c0000 0x00040000>;
> +                interrupts =3D <0 76 0x04>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_TVO>;
> +                status =3D "disabled";
> +        };
> +
> +        dsi {
> +                compatible =3D "nvidia,tegra20-dsi";
> +                reg =3D <0x54300000 0x00040000>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_DSI>,
> +                         <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> +                clock-names =3D "dsi", "parent";
> +                resets =3D <&tegra_car 48>;
> +                reset-names =3D "dsi";
> +                status =3D "disabled";
> +        };
> +    };
> --=20
> 2.24.1
>=20

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4zFnwACgkQ3SOs138+
s6FhlxAAslAK/CkDeCC0gOkq9HC5Srl6MsBuh//Pqah2aNYyf/X8WMjnok/iKEgx
8Kn9jxZpLrXw1KB7Z/7GUQJEyNoGZfl+W4fIfP5Antxp97gA4tUj/LiErc8F/Umd
xhDPsWeiPS8JPz5r50HUbuoazedTwkot3jeSGhZBaMzkoU0F2O3mmnUOzIFXN+t/
EltYIuOG7GVGZGcw25N8/WcMY41MeBbcvPF7q6Z3xDcGvfTAVGxmTkGfLsWC3peU
GpeoBTlTqaViwOYOaj1o39B+lOkPoPlRmJ0Y6BbOjCVkKKv5XvHtcwbVMZ9Ngi5s
vGOt1ft0TibJr1bwp1Xsd+ROwM0blXbLhLZhORlqPgYw1D8I5Ed21qfyWjbxrsOW
12pa8IGy9738ElNho/nJH5S4wHAkvc6FDWg4xn3uZqYgN6OejlTpzc6Mr8zvCXFg
ClpxUmygBSqIg4mSc6g/z3eqDaKmK1kPhxlYp1fj0I4JREeCe5wGyzTcnYAc4tR4
cdg+nsPLXjAYJdKLbeGLjDUODYnNxrRE3x5WiXarFYTqhQOwDj87ip+ZNyje7mBY
6LiHwPoQHIGZ1wffl3vC5uTB+whNiZ/SqJhPDneB3vH7fKm8eOQyiN5c6pmW44bi
gjgbn3UQGjcFd5VSXqRivGwqndK50TxP4sXOQnQ0wcUA6hO6vHg=
=Reyc
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
