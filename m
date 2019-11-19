Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4079510193E
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 07:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKSGTj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 01:19:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35581 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfKSGTj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 01:19:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id 8so2056419wmo.0;
        Mon, 18 Nov 2019 22:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Y16BhLULcOtGMPtYQ52r24bj5/HpTJlzyrhWuM90EM=;
        b=KsGKUQ1D6nqNBYAPEizVeiv/SW0HZoAEC6OwIqwYp09gsfDBJ0hIqe/KvPUuylYDTM
         pwkUDq0bg8vVn5yc48rKQ6joqBEVT7VCLWlSg4LcL0FjT384Iq6fS08aCwg1+32aSM9b
         pXkRZzG165p3h4EYRJB1bf0a9vo9v1Jv+bEs5wUKdyv49lMo44Igmc1P5bToRSdcyonN
         hZSIFIXBAQ+FP6phldI7f0R+g/rrf/azI3SF/F2BwPaeCdPAG5NMh22DCdPvl5VgWBO9
         zl3wDTbBqCR0fcKreKYqt7rPZ6q4Afzena8tYDahHqVCtbj+GX41HwlOVpYEYVDSeeJy
         7VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Y16BhLULcOtGMPtYQ52r24bj5/HpTJlzyrhWuM90EM=;
        b=DUI/xVaAjch5X2SP4yUxuNA5iZhB3+lwenkh7oIcG6oQUS/8Hs/6gtdxMekWZW3kPS
         YhJu09HBuKNL7XeUYo+9TAc4gErY592UbNunuv0YvwhqDI7LSNDxWL0+DZYZI/1dM7nO
         g2qxnJkpXuTGwuDOhFsMuDc2QdF3tNyBwzR8I2T0ZVEtuaBZTtkMHecRuifdYOMvA2OT
         zsbcxl7WcmYwRHK4ajJ5e9rZjEnVyrZtQfGKiOM7pItcfad/ItgED338IOcxS38XayuR
         YkLKVFLogvrrhcRprkRowPIIyDCv4mUhpH6XJ/7PXJtHXmMVwCRCJz+qEIAfAWfpG737
         jkdw==
X-Gm-Message-State: APjAAAUG+gMzdNcddYn5YFYYNhZoa6IQ5miptPyl5mlnQgDwSd993M9p
        nBUAWA3yGaH3B7Wsv9i+Osk=
X-Google-Smtp-Source: APXvYqx21sXQQ8g4ISoycByGsMvouGWkG4MQt8tz740Kt5vTF2TEAGgm3IY7xMv7p2WNWSjg68ObEg==
X-Received: by 2002:a1c:9e58:: with SMTP id h85mr3558241wme.77.1574144374251;
        Mon, 18 Nov 2019 22:19:34 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 62sm29112172wre.38.2019.11.18.22.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 22:19:32 -0800 (PST)
Date:   Tue, 19 Nov 2019 07:19:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 00/29] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20191119061931.GA2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:18PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20

I like this, thanks for looking into this.

> This series brings initial support for memory interconnect to Tegra20,
> Terga30 and Tegra124 SoCs. The interconnect provides are quite generic
> and should be suitable for all Tegra SoCs, but currently upstream kernel
> has EMC/MC drivers only for those three generations of Tegra SoCs.

Tegra186 and Tegra194 should support this out of the box because the EMC
frequency can be scaled via the BPMP. Tegra210 support for EMC scaling
is in the works, so hopefully we'll be able to extend this in the near
future.

> For the start only display controllers are getting interconnect API
> support, others could be supported later on. The display controllers
> have the biggest demand for interconnect API right now because dynamic
> memory frequency scaling can't be done safely without taking into account
> bandwidth requirement from the displays.

Agreed, display controllers are where we most immediately notice when
there's not enough bandwidth. I think it's fair to start small and
extend interconnect consumers as we progress.

I've got a couple of comments regarding individual patches, but on the
whole this looks pretty nice.

Thierry

> Dmitry Osipenko (29):
>   dt-bindings: memory: tegra20: mc: Document new interconnect property
>   dt-bindings: memory: tegra20: emc: Document new interconnect property
>   dt-bindings: memory: tegra30: mc: Document new interconnect property
>   dt-bindings: memory: tegra30: emc: Document new interconnect property
>   dt-bindings: memory: tegra124: mc: Document new interconnect property
>   dt-bindings: memory: tegra124: emc: Document new interconnect property
>   dt-bindings: host1x: Document new interconnect properties
>   dt-bindings: interconnect: tegra: Add initial IDs
>   ARM: tegra: Add interconnect properties to Tegra20 device-tree
>   ARM: tegra: Add interconnect properties to Tegra30 device-tree
>   ARM: tegra: Add interconnect properties to Tegra124 device-tree
>   interconnect: Add memory interconnection providers for NVIDIA Tegra
>     SoCs
>   memory: tegra: Register as interconnect provider
>   memory: tegra: Add interconnect nodes for Terga20 display controllers
>   memory: tegra: Add interconnect nodes for Terga30 display controllers
>   memory: tegra: Add interconnect nodes for Terga124 display controllers
>   memory: tegra20-emc: Use devm_platform_ioremap_resource
>   memory: tegra20-emc: Continue probing if timings/IRQ are missing in
>     device-tree
>   memory: tegra20-emc: Register as interconnect provider
>   memory: tegra30-emc: Continue probing if timings are missing in
>     device-tree
>   memory: tegra30-emc: Register as interconnect provider
>   memory: tegra124-emc: Use devm_platform_ioremap_resource
>   memory: tegra124-emc: Register as interconnect provider
>   drm/tegra: dc: Use devm_platform_ioremap_resource
>   drm/tegra: dc: Release PM and RGB output when client's registration
>     fails
>   drm/tegra: dc: Support memory bandwidth management
>   ARM: tegra: Enable interconnect API in tegra_defconfig
>   ARM: multi_v7_defconfig: Enable NVIDIA Tegra interconnect providers
>   MAINTAINERS: Add maintainers for NVIDIA Tegra interconnect drivers
>=20
>  .../display/tegra/nvidia,tegra20-host1x.txt   |  67 +++++
>  .../nvidia,tegra124-emc.txt                   |   3 +
>  .../nvidia,tegra124-mc.yaml                   |   5 +
>  .../memory-controllers/nvidia,tegra20-emc.txt |   4 +
>  .../memory-controllers/nvidia,tegra20-mc.txt  |   4 +
>  .../nvidia,tegra30-emc.yaml                   |   6 +
>  .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
>  MAINTAINERS                                   |   9 +
>  arch/arm/boot/dts/tegra124.dtsi               |  10 +
>  arch/arm/boot/dts/tegra20.dtsi                |  11 +-
>  arch/arm/boot/dts/tegra30.dtsi                |  12 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +
>  arch/arm/configs/tegra_defconfig              |   2 +
>  drivers/gpu/drm/tegra/dc.c                    | 252 +++++++++++++++++-
>  drivers/gpu/drm/tegra/dc.h                    |   8 +
>  drivers/gpu/drm/tegra/drm.c                   |  18 ++
>  drivers/gpu/drm/tegra/plane.c                 |   1 +
>  drivers/gpu/drm/tegra/plane.h                 |   4 +-
>  drivers/interconnect/Kconfig                  |   1 +
>  drivers/interconnect/Makefile                 |   1 +
>  drivers/interconnect/tegra/Kconfig            |   6 +
>  drivers/interconnect/tegra/Makefile           |   4 +
>  drivers/interconnect/tegra/tegra-icc-emc.c    | 138 ++++++++++
>  drivers/interconnect/tegra/tegra-icc-mc.c     | 130 +++++++++
>  drivers/memory/tegra/mc.c                     |   4 +
>  drivers/memory/tegra/tegra124-emc.c           |  28 +-
>  drivers/memory/tegra/tegra124.c               |  16 ++
>  drivers/memory/tegra/tegra20-emc.c            |  91 ++++---
>  drivers/memory/tegra/tegra20.c                |  14 +
>  drivers/memory/tegra/tegra30-emc.c            |  34 ++-
>  drivers/memory/tegra/tegra30.c                |  14 +
>  include/dt-bindings/interconnect/tegra-icc.h  |  11 +
>  include/soc/tegra/mc.h                        |  26 ++
>  33 files changed, 883 insertions(+), 58 deletions(-)
>  create mode 100644 drivers/interconnect/tegra/Kconfig
>  create mode 100644 drivers/interconnect/tegra/Makefile
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-emc.c
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-mc.c
>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h
>=20
> --=20
> 2.23.0
>=20

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TiXAACgkQ3SOs138+
s6EuaQ/+MUUOndULQxHywop4nsOWK9DRosUwostChC/0Wes+FgxTVYg8Ej8ljQuJ
PXJOT0fNi4TC2LulaK31tbg5Rip1UjXXuNg83sDnapdhPxQ2hSKBjEz/QhrnFU+C
CEQbmyDPcUnG9LiuF4wAyrBQ8z/WRw7WG5kG5VaglDpxKuBfjMJ+jJT3awYZe0kv
Q+2iSWq/vU/T+lDyTvzNrYEAwYG497wCHWt06sREMxZ/udIMg7JNefwm1SxNL0sP
ew9mcbx6fdgOt+tRD5CkKAf6gsEQ9imNIp1AsawQVeWWMPvhf5+8xNwho6YD932l
7abgKgITlnuW5PU2GrktfygeYMP+agUlQ3ZoE/324vycZcrxEei5wDCHZuzMEACb
1LlrLZAFBY0SsHQv/qO/i30IKnEbVGL5+taF0JVGBpx8nnWC46hVqYVQOOd+tFI6
rAHYk5Bs45S/kS3UmJA06JUOfFUCODLW0AwcRHPuMJ19SP9esgTlkztAPNHRNbtc
6h/uKv6RwYG29flTEx3hAnfZ/8xH4LMbQApfy/dlEhjkYfN9Sjwl7PhQsV0KYXFt
1CJTvmhsnm8CexjGlyCZFVY+sD8hiOLeQyyhNucIhcEj4tGRk4Q9A7N0BqTY4MZv
Dvjrn1VxJH/7K6XgtFmEUH4jAyypcGWgWKjVWgHuPhd+EiFMgEg=
=XE+S
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
