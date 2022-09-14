Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22675B8A90
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Sep 2022 16:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiINOcf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Sep 2022 10:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiINOcd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 10:32:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9941260683;
        Wed, 14 Sep 2022 07:32:31 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id y17so30132275ejo.6;
        Wed, 14 Sep 2022 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=obpBL4tXH1sXCwB3znFS3ftnJpOfWHD1vlSgHE1sTO0=;
        b=RnY/da2khSpx9SztG92dT3sDg2Um5lICTU07D7G7jQ4qr3kqCxc5BsHiB/nniNzNlO
         clKhEQgk8YkPi+sovxHlLkgaoJZ2PTGxE5yT6ntcQJRDWUVoUoRnkacGodvsa66P+vUd
         JUMUKcxgwtIaNdKoRiKRBYsLUu9f18SA5CwuLvwI+k4j+N7bfvuQWP/65JYoqPmyv1lb
         UdMA1vNjPN31erst3B0svx2HA2OIJDAkH4+1c/aObjCq+y5N6q1UuBR2iG9UjUP74MVO
         8DQ2Z+Bn+Gqm3QEbhvJ5ga20IL8URZ6do9eEuCaUgGpLUdqPPGSVKNPf/3/GAzpCTNoS
         ZNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=obpBL4tXH1sXCwB3znFS3ftnJpOfWHD1vlSgHE1sTO0=;
        b=sSm9yQl/MwsQqNlz7RPYdVVBAZAN2FF9b1OM8D/dCj48QR2RZkVUWdTjo6Af54wAdt
         nKQbWIgkhCHXdTz8B1f484NetCOMBes/ipe8VpJVgzytzZAlxAiRi5n+PITTJg0q99e4
         NFPfzlbwRdhuhmFPXCiPfs1tZ0/4ULdTZv9SScQhb+f+k8EUUtBPgKED599RnLdQK+e8
         3Xx3tNTJxVnGfuU70FSmRpOn/wAqygb28LqtYpB32zBqk4E79LE4uA6fnOEX1qPZMZNl
         PP84bZHD0kBjA41ZvPLcpWh2pTBcPBhhmXq+8jB3FOWQVI1b5UxxahyatnXC3kzpCYRd
         eJqQ==
X-Gm-Message-State: ACgBeo3PpM26qo0BIRZsTLVAxXwP2oSnfEynOUPmrSO34VA/fLd4g62y
        kB5hWJdHpgG/kRBbn0NSnmY=
X-Google-Smtp-Source: AMsMyM7Aq5Newj4kYD2Qa2UorKNFzxZO+0quOY6nNHKjVPm3cy8fDTs82LcImRO0vhWj5Sg/KcHqXA==
X-Received: by 2002:a17:907:160d:b0:780:3d10:97a1 with SMTP id hb13-20020a170907160d00b007803d1097a1mr1558714ejc.346.1663165950003;
        Wed, 14 Sep 2022 07:32:30 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cx24-20020a05640222b800b0044ec3285b23sm9974358edb.58.2022.09.14.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:32:29 -0700 (PDT)
Date:   Wed, 14 Sep 2022 16:32:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Message-ID: <YyHl+4O56brs1Pik@orome>
References: <20220913131447.2877280-1-cyndis@kapsi.fi>
 <20220913131447.2877280-4-cyndis@kapsi.fi>
 <20220914120840.GA1837218-robh@kernel.org>
 <6d739e27-c41c-e18f-8d13-0c38b912aa86@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aiVZA/HUjMlRw8xz"
Content-Disposition: inline
In-Reply-To: <6d739e27-c41c-e18f-8d13-0c38b912aa86@kapsi.fi>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--aiVZA/HUjMlRw8xz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 03:19:01PM +0300, Mikko Perttunen wrote:
> On 9/14/22 15:08, Rob Herring wrote:
> > On Tue, Sep 13, 2022 at 04:14:41PM +0300, Mikko Perttunen wrote:
> > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > >=20
> > > Update NVDEC bindings for Tegra234. This new engine version only has
> > > two memory clients, but now requires three clocks, and as a bigger
> > > change the engine loads firmware from a secure carveout configured by
> > > the bootloader.
> > >=20
> > > For the latter, we need to add a phandle to the memory controller
> > > to query the location of this carveout, and several other properties
> > > containing offsets into the firmware inside the carveout. These
> > > properties are intended to be populated through a device tree overlay
> > > configured at flashing time, so that the values correspond to the
> > > flashed NVDEC firmware.
> > >=20
> > > As the binding was getting large with many conditional properties,
> > > also split the Tegra234 version out into a separate file.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > > v2:
> > > - Split out into separate file to avoid complexity with
> > >    conditionals etc.
> > > ---
> > >   .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 154 +++++++++++++++=
+++
> > >   1 file changed, 154 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvi=
dia,tegra234-nvdec.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegr=
a234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra=
234-nvdec.yaml
> > > new file mode 100644
> > > index 000000000000..eab0475ca983
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nv=
dec.yaml
> > > @@ -0,0 +1,154 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec=
=2Eyaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Device tree binding for NVIDIA Tegra234 NVDEC
> > > +
> > > +description: |
> > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > +  and newer chips. It is located on the Host1x bus and typically
> > > +  programmed through Host1x channels.
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <treding@gmail.com>
> > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra234-nvdec
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: nvdec
> > > +      - const: fuse
> > > +      - const: tsec_pka
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: nvdec
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  dma-coherent: true
> > > +
> > > +  interconnects:
> > > +    items:
> > > +      - description: DMA read memory client
> > > +      - description: DMA write memory client
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: dma-mem
> > > +      - const: write
> > > +
> > > +  nvidia,memory-controller:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      phandle to the memory controller for determining carveout info=
rmation.
> > > +
> > > +  nvidia,bl-manifest-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to bootloader manifest from beginning of firmware. Typi=
cally set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> > > +
> > > +  nvidia,bl-code-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to bootloader code section from beginning of firmware. =
Typically set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> > > +
> > > +  nvidia,bl-data-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to bootloader data section from beginning of firmware. =
Typically set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> > > +
> > > +  nvidia,os-manifest-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to operating system manifest from beginning of firmware=
=2E Typically set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> > > +
> > > +  nvidia,os-code-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to operating system code section from beginning of firm=
ware. Typically set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> > > +
> > > +  nvidia,os-data-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Offset to operating system data section from beginning of firm=
ware. Typically set as
> > > +      part of a device tree overlay corresponding to flashed firmwar=
e.
> >=20
> > I don't think DT is the place for describing your runtime loaded
> > firmware layout.
> >=20
> > Rob
>=20
> The way I see it, from the kernel's point of view it's not runtime loaded
> but a contract with the bootloader. Bootloader sets up hardware in a cert=
ain
> way the kernel doesn't otherwise know so the bootloader needs to tell the
> kernel how the hardware is set up.
>=20
> The fact that the information is supplied through an overlay is accidental
> -- equivalently the bootloader that sets up the firmware could adjust the
> device tree like we do in other situations, but in this case an overlay is
> an easier implementation method.

I think the key bit of information to know here is that the kernel is
not permitted to load this firmware. It's a bootloader early in the boot
process that sets this up in a secure context and then needs to convey
that information to the kernel.

Perhaps a slightly more idiomatic way to pass this information would be
using a reserved memory node? That could span the entirety of the secure
carveout (therefore removing the need to query the memory controller for
that information) and be identified with a compatible string that would
allow custom properties for these various offsets. Yet another way would
be to have each of the bootloader and OS regions (manifest, code and
data) be their own reserved memory regions. But given that this is one
chunk with different regions inside makes that seem excessive.

Rob, do you have any other ideas how this information could be passed to
the kernel if not via DT?

Thierry

--aiVZA/HUjMlRw8xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMh5fsACgkQ3SOs138+
s6GUdA/9FYMasTSyIsmqzEkVvTBY4hSR6IFHJUAM8BCGeKD4iPjMG4b8AyzK/p8W
6mI/8czyDPSXbd532BztgwUld3bOYgpORPz7EJzuNZ4GreHMLPj0Kg91LuwZKVw/
p2P4/KkqhaAzfoR4QqpX8YjZCzvAD/0vP3VXDyLEY0zf68wJ0AovRBrwmxyzRqEA
7KH+M2PMB2I6gJViLXLWFYGK3oqtwnFx0Knv5/6Wtcv2R9AnkBJdLYQ2hjvpWb5u
BHXqy8xONScYFNlqgqR7a8aqQswLy4/WiRYFd6bQRHDcnlQtQIdkMXLFYVFlis6V
Vi36rs+Blkud1K0SUp6ulq5+HxDf3pjk3eyprztwUYjsLGDZ5KxZ/6A87euToj4m
NBtwq0lo3QRxSd6blac+5Qe1hcRdTU+pD1jW62JQT0N/mVqsGF0Poqf46900VO6n
WMgAfYjisWl9736bV4l12ADxbo4gT/ImElJvTXhoH8vdw4iVz5Ztk9nPG4S+3oo+
bvEv/hWyrLbdxY1yBkMZHN7Jbvxxwl+5Y3VlnaT0pqhdtTVRrT28Uf4Nz/qRGeHv
5zz1l9pCZvi0kh2yCAHGVloRrqurF/krxt7xZRrUua+k3leRHwYs4YCwk1fnJwgp
NU1uKKnAOPlE0eQvXn/DIpY3+FaEhOA2SnMlRW+v3IlmrjS0/Ok=
=OaCY
-----END PGP SIGNATURE-----

--aiVZA/HUjMlRw8xz--
