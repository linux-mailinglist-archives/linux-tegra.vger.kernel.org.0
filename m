Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE40413260C
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jan 2020 13:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgAGMV7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jan 2020 07:21:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35088 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgAGMV6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jan 2020 07:21:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so53671480wro.2;
        Tue, 07 Jan 2020 04:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=shpceOEfdarRoqP11/e7Yq88J78Q+i/AvmABKRQXbbk=;
        b=UO3gKbQZAw31IfhCSSrraMTFNOphX9WnhMUHWpHSnxomgVWL82QkfE1vqMO5UlUctZ
         0+OB4FcpHTw9cqQXIujxE3QsD18PB10DClV6d6OQYbEU+lYUEYb+8fEUIdGwYSDaAvPT
         rhorBa/grCiV7cxSTDGqc5t80KJtDSg08LshY+lJdoml2v503DclN2UiDtIM6cMnR80F
         PfS4CUQS36Qc17TX9yXL0qb2QgkbNg3KTfuy362lW6/2BeP0aOTUWrd1Fy1dUVIHolDU
         d1jO4W0JSyJCA66WdLtoOVUgsVrzAmzdN0WEsSXBfOPN6/bbv24OtZeuZvemVbCjMXBE
         b/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=shpceOEfdarRoqP11/e7Yq88J78Q+i/AvmABKRQXbbk=;
        b=EVuvUc8IYIkaK3eionbko3WsvUnDxlXMhbUcJEcl0+xk35i933lXtBNxPK7hBVgzZH
         KVij5fjwaetloCP5s8KssUDvUilmhXAZRGrcg4tpLbyvJ6fbAhvBT+vDT+Ollt4SB+bY
         9qgMSqMWepyEciVpIscmrGDtqxQGcJRYKIVtLkbc81dudltQv8izJfTP3SFfMOZ10rmD
         bpYiNfRYoElQXlmFjAIDaUcMF32XzORHxQlF5Zpm/7rTVZPsbxtagc1tQGK9CHhQ9lfW
         XKNgAscTzqjbKzG3/TzO6D5sXkLrBp71wK1tQp3l/I6C9WnxCXhfDElsr5Ind2p2MDB4
         Qc0Q==
X-Gm-Message-State: APjAAAWwMqcIb4QuuRIUQaseNrMBrBlLnqkBI6kbbNWi30iKXeUJNrLM
        tv1DstrjaO3dbImeXQHOoww=
X-Google-Smtp-Source: APXvYqwm8Aw/NTMvaHnWXFzmw9jVcA4qr+JT5wrkagP44TnMQJVzxKRg3oEFRDZFWtSPtTBkdENsMw==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr107838653wrt.362.1578399714391;
        Tue, 07 Jan 2020 04:21:54 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id d14sm78455719wru.9.2020.01.07.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:21:52 -0800 (PST)
Date:   Tue, 7 Jan 2020 13:21:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, digetx@gmail.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/19] Move PMC clocks into Tegra PMC driver
Message-ID: <20200107122152.GD1964183@ulmo>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 08:13:59PM -0800, Sowjanya Komatineni wrote:
> This patch series moves Tegra PMC clocks from clock driver to pmc driver
> along with the device trees changes and audio driver which uses one of
> the pmc clock for audio mclk.
>=20
> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
> are currently registered by Tegra clock driver using clk_regiser_mux and
> clk_register_gate which performs direct Tegra PMC register access.
>=20
> When Tegra PMC is in secure mode, any access from non-secure world will
> not go through.
>=20
> This patch series adds these Tegra PMC clocks and blink controls to Tegra
> PMC driver with PMC as clock provider and removes them from Tegra clock
> driver.
>=20
> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru Tegra210
> and clock driver does inital parent configuration for it and enables them.
> But this clock should be taken care by audio driver as there is no need
> to have this clock pre enabled.
>=20
> So, this series also includes patch that updates ASoC driver to take
> care of parent configuration for mclk if device tree don't specify
> initial parent configuration using assigned-clock-parents and controls
> audio mclk enable/disable during ASoC machine startup and shutdown.
>=20
> DTs are also updated to use clk_out_1 as audio mclk rather than extern1.
>=20
> This series also includes a patch for mclk fallback to extern1 when
> retrieving mclk fails to have this backward compatible of new DT with
> old kernels.

Hi Sowjanya,

this looks like it's almost ready to merge. Can you highlight if there
are any build-time or runtime dependencies between the patches? The
audio driver changes seem to be mostly isolated from the rest by the
fallback implementation for legacy device trees.

Is there anything that I need to keep in mind when applying these? And
would it be fine for Mark to pick up the ASoC patches separately from
the rest?

Thierry

>=20
> [v6]:	Changes between v5 and v6 are
> 	- v5 feedback
> 	- Added ASoC machine startup and shutdown callbacks to control audio
> 	  mclk enable/disable and removed default mclk enable from clock driver.
> 	- Updated tegra_asoc_utils_set_rate to disable mclk only during PLLA
> 	  rate change and removed disabling PLLA as its already taken care by
> 	  pll clock driver.
> 	- Removed tegra_asoc_utils_set_rate call from utils_init as set_rate
> 	  is set during machine hw_params and during utils_init mclk is
> 	  already in disabled state and this causes warning during mclk disable
> 	  in utils_set_rate.
>=20
> [v5]:	Changes between v4 and v5 are
> 	- v4 feedback
> 	- updated dt-binding pmc YAML schema with more description on power
> 	  gate nodes and pad configuration state nodes.
> 	- update tegra_asoc_utils_set_rate to disable audio mclk only if
> 	  its in enable state.
>=20
> [v4]:	Changes between v3 and v4 are
> 	- v3 Feedback
> 	- Updated clocks clk_m_div2 and clk_m_div4 as osc_div2 and osc_div4.
> 	  Tegra don't have clk_m_div2, clk_m_div4 and they should actually
> 	  be osc_div2 and osc_div4 clocks from osc pads.
> 	- Fixed PMC clock parents to use osc, osc_div2, osc_div4.
> 	- Register each PMC clock as single clock rather than separate
> 	  mux and gate clocks.
> 	- Update ASoC utils to use resource managed APIs rather than
> 	  using clk_get and clk_put.
> 	- Updated device tree and ASoC driver to use clk_out_1 instead of
> 	  clk_out_1_mux as PMC clocks are registered as single clock.
> 	- Update clock driver init_table to not enable audio related clocks
> 	  as ASoC utils will do audio clock enables.
>=20
> [v3]:	Changes between v2 and v3 are
> 	- Removes set parent of clk_out_1_mux to extern1 and enabling
> 	  extern1 from the clock driver.
> 	- Doesn't enable clk_out_1 and blink by default in pmc driver
> 	- Updates ASoC driver to take care of audio mclk parent
> 	  configuration incase if device tree don't specify assigned
> 	  clock parent properties and enables mclk using both clk_out_1
> 	  and extern1.
> 	- updates all device trees using extern1 as mclk in sound node
> 	  to use clk_out_1 from pmc.
> 	- patch for YAML format pmc dt-binding
> 	- Includes v2 feedback
>=20
> [v2]:	Changes between v1 and v2 are
> 	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
> 	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
> 	- feedback related to pmc clocks in Tegra PMC driver from v1
> 	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
> 	  by the clock driver using helper functions from Tegra PMC.
>=20
>  	  Note:
> 	  To use helper functions from PMC driver, PMC early init need to
> 	  happen prior to using helper functions and these helper functions are
> 	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
> 	  clock registration which happen in clock_init prior to Tegra PMC
> 	  probe.
> 	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
> 	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
> 	  tegra_mc_init.
> 	  This implementation of configuring PMC registers thru helper
> 	  functions in clock driver needs proper changes across PMC, Clock,
> 	  EMC and MC inits to have it work across all Tegra platforms.
>=20
> 	  Currently PLLM Override is not enabled in the bootloader so proper
> 	  patches for this fix will be taken care separately.
>=20
> [v1]:	v1 includes patches for below fixes.
> 	- adding clk_out_1, clk_out_2, clk_out_3, blink controls to Tegra PMC
> 	  driver and removing clk-tegra-pmc.
> 	- updated clock provider from tegra_car to pmc in the device tree
> 	  tegra210-smaug.dts that uses clk_out_2.
> 	- Added helper functions in PMC driver for WB0 PLLM overrides and PLLE
> 	  IDDQ programming to use by clock driver and updated clock driver to
> 	  use these helper functions and removed direct PMC access from clock
> 	  driver and all pmc base address references in clock driver.
>=20
>=20
>=20
>=20
> Sowjanya Komatineni (19):
>   dt-bindings: clock: tegra: Change CLK_M_DIV to OSC_DIV clocks
>   clk: tegra: Change CLK_M_DIV clocks to OSC_DIV clocks
>   clk: tegra: Fix Tegra PMC clock out parents
>   dt-bindings: tegra: Convert Tegra PMC bindings to YAML
>   dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
>   soc: tegra: Add Tegra PMC clocks registration into PMC driver
>   dt-bindings: soc: tegra-pmc: Add id for Tegra PMC 32KHz blink clock
>   soc: tegra: Add support for 32KHz blink clock
>   clk: tegra: Remove tegra_pmc_clk_init along with clk ids
>   dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
>   ASoC: tegra: Use device managed resource APIs to get the clock
>   ASoC: tegra: Add audio mclk configuration
>   ASoC: tegra: Add fallback implementation for audio mclk
>   clk: tegra: Remove audio related clock enables from init_table
>   ARM: dts: tegra: Add clock-cells property to pmc
>   arm64: tegra: Add clock-cells property to Tegra PMC node
>   ARM: tegra: Update sound node clocks in device tree
>   arm64: tegra: smaug: Change clk_out_2 provider to pmc
>   ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc
>=20
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ---------------=
--
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++=
++++++
>  .../devicetree/bindings/sound/nau8825.txt          |   2 +-
>  arch/arm/boot/dts/tegra114-dalmore.dts             |   8 +-
>  arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   8 +-
>  arch/arm/boot/dts/tegra124-apalis.dtsi             |   8 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi               |   8 +-
>  arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
>  arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
>  arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   8 +-
>  arch/arm/boot/dts/tegra30-apalis.dtsi              |   8 +-
>  arch/arm/boot/dts/tegra30-beaver.dts               |   8 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi              |   8 +-
>  arch/arm/boot/dts/tegra30-colibri.dtsi             |   8 +-
>  arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +-
>  drivers/clk/tegra/Makefile                         |   1 -
>  drivers/clk/tegra/clk-id.h                         |  11 +-
>  drivers/clk/tegra/clk-tegra-fixed.c                |  32 +-
>  drivers/clk/tegra/clk-tegra-pmc.c                  | 122 -------
>  drivers/clk/tegra/clk-tegra114.c                   |  41 +--
>  drivers/clk/tegra/clk-tegra124.c                   |  46 +--
>  drivers/clk/tegra/clk-tegra20.c                    |   9 +-
>  drivers/clk/tegra/clk-tegra210.c                   |  30 +-
>  drivers/clk/tegra/clk-tegra30.c                    |  31 +-
>  drivers/clk/tegra/clk.h                            |   1 -
>  drivers/soc/tegra/pmc.c                            | 352 +++++++++++++++=
+++++
>  include/dt-bindings/clock/tegra114-car.h           |  18 +-
>  include/dt-bindings/clock/tegra124-car-common.h    |  18 +-
>  include/dt-bindings/clock/tegra20-car.h            |   2 +-
>  include/dt-bindings/clock/tegra210-car.h           |  18 +-
>  include/dt-bindings/clock/tegra30-car.h            |  18 +-
>  include/dt-bindings/soc/tegra-pmc.h                |  16 +
>  sound/soc/tegra/tegra_alc5632.c                    |  28 +-
>  sound/soc/tegra/tegra_asoc_utils.c                 | 125 ++++----
>  sound/soc/tegra/tegra_asoc_utils.h                 |   3 +-
>  sound/soc/tegra/tegra_max98090.c                   |  43 ++-
>  sound/soc/tegra/tegra_rt5640.c                     |  43 ++-
>  sound/soc/tegra/tegra_rt5677.c                     |  28 +-
>  sound/soc/tegra/tegra_sgtl5000.c                   |  28 +-
>  sound/soc/tegra/tegra_wm8753.c                     |  43 ++-
>  sound/soc/tegra/tegra_wm8903.c                     |  43 ++-
>  sound/soc/tegra/tegra_wm9712.c                     |   8 +-
>  sound/soc/tegra/trimslice.c                        |  39 ++-
>  49 files changed, 1192 insertions(+), 777 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra20-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra20-pmc.yaml
>  delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
>  create mode 100644 include/dt-bindings/soc/tegra-pmc.h
>=20
> --=20
> 2.7.4
>=20

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4Ud98ACgkQ3SOs138+
s6EhnBAAmCJGVRkP51O/g1hcpMO3AZqTUpz1Kutfyu1r47KF93K8/Tc4JgxT8CpA
h6ZC96DQDZX4YJ8FGNm/WlVm9gaLwArLfMOXwz/VMN6db0kATyiV1D4Gw1c4WVBB
3aDvs9T5E3qyUuM+5aUZ0ZFNRRbt40VFl/ICRD/uR+Q5i5+aRU2C0Kj5hFsCJL2P
+KjXyH/87lV/wSwAFVxPrdaFjkSWhBD0abRvvVex69XJk6jWQE9JN/sO6elrYBHh
jrjoL4a6qeMMq09XtQoKtkmwRi5FMHHVR3ZrEoMpSnRXdpd3W2X9XWYlvgAl78t7
pIfxIMdM8nSqdDi6DS58QgdJNJhU3R7fOSBEy3Lrb9/n2hx6SoEgPHFJQYBAwugq
lSEnirh/dfS5OMiN+lu0tPQadQ8qLNaLNEegiky6t7WPFQbvAdKaNka4O5UERD37
kAG789KtFbhjF93qIjScCvbKVhlYsfhAmu/y5W4JHAZU6YwLALkt5q8p8++OHsc7
+JgeHCy6Gc6eHpqvv9ASUmj8tGIH/SS3VjnagsO2JRxzeMZ5UPE0KitF/WKDMMcI
L6YLk4RMW09in7Z2/GOTrv1vR2hO9Cl/xymKWsfWzr3b6lcM7ZOuOBwHKICaFfb1
S79fsNEJjB0spwwVNtYTdXVZIxqyXSRwCp+A3lix60RAspBM7hs=
=8tEv
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
