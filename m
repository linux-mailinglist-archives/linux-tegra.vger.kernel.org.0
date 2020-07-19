Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA46224F79
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgGSFBl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:01:41 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4424 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgGSFBl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:01:41 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d3780000>; Sat, 18 Jul 2020 22:00:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:01:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 22:01:40 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:01:40 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:01:40 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d3ae000d>; Sat, 18 Jul 2020 22:01:39 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v5 00/11] Add ASoC AHUB components for Tegra210 and later
Date:   Sun, 19 Jul 2020 10:31:19 +0530
Message-ID: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595134840; bh=LGxf60I5XaGrX8yXXnY4xPzwYnkwqPT1C5uyrz62EaM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Jk1bZggFAUG0bbN8M36PxRZRaHCK2ZZfJ1xpaHXlgt+rWN25Vi/U1EpAA9qdxMCRa
         duKK8+IhzfJUaUaQHyEvTeMNRsGAEFM4sCcukjjSQcR7r+vVMZm/X0av9K2oaMFYyC
         XHdsW3RBRHDwY34CJ1HA5Ie5zJ4AyZ8J7Rnt3e1iedHVqIc7TARRmEIeSaLOioW0Ta
         WE+hBH7VQkpnxJJH1MxAV3evWRrCk19fcRnIxJSVivT/gnc9UikAAn4hVQ01ocrImb
         NawZSUcm374ocHygMDp01lZiXTb9qYzITHgtVdOuLfRVWmNS6gQeRvnOmCO3DutP3v
         r4+xsLNgtLHEg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Overview
========
Audio Processing Engine (APE) comprises of Audio DMA (ADMA) and Audio
Hub (AHUB) unit. AHUB is a collection of hardware accelerators for audio
pre-processing and post-processing. It also includes a programmable full
crossbar for routing audio data across these accelerators.

This series exposes some of these below mentioned HW devices as ASoC
components for Tegra platforms from Tegra210 onwards.
 * ADMAIF : The interface between ADMA and AHUB
 * XBAR   : Crossbar for routing audio samples across various modules
 * I2S    : Inter-IC Sound Controller
 * DMIC   : Digital Microphone
 * DSPK   : Digital Speaker

Following is the summary of current series.
 * Add YAML DT binding documentation for above mentioned modules.
 * Helper function for ACIF programming is exposed for Tegra210 and later.
 * Add ASoC driver components for each of the above modules.
 * Build ACONNECT and ADMA drivers which are essential to realize audio
   use case.
 * Add DT entries for above components for Tegra210, Tegra186 and
   Tegra194.

As per the suggestion in [0] audio graph based sound card support
is pushed in a separate series.

[0] https://lkml.org/lkml/2020/6/27/4

Changelog
=========

v4 -> v5
--------
 * Common changes
   - simple-card driver changes are dropped. Changes are migrated to audio
     graph card and are moved to a separate series as suggested.

   - '#sound-dai-cells' property is not needed for planned audio graph card
     Hence dropped from documentation and related DT binding of component
     drivers.

   - CIF and DAP DAIs are added for I/O drivers (DMIC, DSPK, I2S) to
     represent DAI links using audio graph card. Similary DAIs are added in
     AHUB driver to describe endpoints in audio crossbar. Routing is updated
     to reflect the same in drivers.

v3 -> v4
--------
 * [1/23] "ASoC: dt-bindings: tegra: Add DT bindings for Tegra210"
   - Removed multiple examples and retained one example per doc
   - Fixed as per inputs on the previous series
   - Tested bindings with 'make dt_binding_check/dtbs_check'

 * [2/23] "ASoC: tegra: Add support for CIF programming"
   - No change

 * Common changes (for patch [3/10] to [7/10])
   - Mixer control overrides, for PCM parameters (rate, channel, bits),
     in each driver are dropped.
   - Updated routing as per DPCM usage
   - Minor changes related to formatting

 * New changes (patch [8/23] to [18/23] and patch [23/23])
   - Based on discussions in following threads DPCM is used for Tegra Audio.
     https://lkml.org/lkml/2020/2/20/91
     https://lkml.org/lkml/2020/4/30/519
   - The simple-card driver is used for Tegra Audio and accordingly
     some enhancements are made in simple-card and core drivers.
   - Patch [8/23] to [18/23] are related to simple-card and core changes.
   - Patch [23/23] adds sound card support to realize complete audio path.
     This is based on simple-card driver with proposed enhancements.
   - Re-ordered patches depending on above

v2 -> v3
--------
 * [1/10]  "dt-bindings: sound: tegra: add DT binding for AHUB
   - Updated licence
   - Removed redundancy w.r.t items/const/enum
   - Added constraints wherever needed with "pattern" property

 * [2/10]  "ASoC: tegra: add support for CIF programming"
   - Removed tegra_cif.c
   - Instead added inline helper function in tegra_cif.h

 * common changes (for patch [3/10] to [7/10])
   - Replace LATE system calls with Normal sleep
   - Remove explicit RPM suspend in driver remove() call
   - Use devm_kzalloc() instead of devm_kcalloc() for single element
   - Replace 'ret' with 'err' for better reading
   - Consistent error printing style across drivers
   - Minor formating fixes

 * [8/10]  "arm64: tegra: add AHUB components for few Tegra chips"
   - no change

 * [9/10]  "arm64: tegra: enable AHUB modules for few Tegra chips"
   - no change

 * [10/10] "arm64: defconfig: enable AHUB components for Tegra210 and later"
   (New patch)
   - Enables ACONNECT and AHUB components. With this AHUB and components are
     registered with ASoC core.

v1 -> v2
--------
 * [1/9] "dt-bindings: sound: tegra: add DT binding for AHUB"
   - no changes

 * [2/9] "ASoC: tegra: add support for CIF programming"
   - removed CIF programming changes for legacy chips.
   - this patch now exposes helper function for CIF programming,
     which can be used on Tegra210 later.
   - later tegra_cif.c can be extended for legacy chips as well.
   - updated commit message accordingly

 * [3/9] "ASoC: tegra: add Tegra210 based DMIC driver"
   - removed unnecessary initialization of 'ret' in probe()

 * [4/9] "ASoC: tegra: add Tegra210 based I2S driver"
   - removed unnecessary initialization of 'ret' in probe()
   - fixed indentation
   - added consistent bracing for if-else clauses
   - updated 'rx_fifo_th' type to 'unsigned int'
   - used BIT() macro for defines like '1 << {x}' in tegra210_i2s.h

 * [5/9] "ASoC: tegra: add Tegra210 based AHUB driver"
   - used of_device_get_match_data() to get 'soc_data' and removed
    explicit of_match_device()
   - used devm_platform_ioremap_resource() and removed explicit
    platform_get_resource()
   - fixed indentation for devm_snd_soc_register_component()
   - updated commit message
   - updated commit message to reflect compatible binding for Tegra186 and
     Tegra194.

 * [6/9] "ASoC: tegra: add Tegra186 based DSPK driver"
   - removed unnecessary initialization of 'ret' in probe()
   - updated 'max_th' to 'unsigned int'
   - shortened lengthy macro names to avoid wrapping in
     tegra186_dspk_wr_reg() and to be consistent

 * [7/9] "ASoC: tegra: add Tegra210 based ADMAIF driver"
   - used of_device_get_match_data() and removed explicit of_match_device()
   - used BIT() macro for defines like '1 << {x}' in tegra210_admaif.h
   - updated commit message to reflect compatible binding for Tegra186 and
     Tegra194.

 * [8/9] "arm64: tegra: add AHUB components for few Tegra chips"
   - no change

 * [9/9] "arm64: tegra: enable AHUB modules for few Tegra chips"
   - no change

 * common changes for patch [3/9] to [7/9]
   - sorted headers in alphabetical order
   - moved MODULE_DEVICE_TABLE() right below *_of_match table
   - removed macro DRV_NAME
   - removed explicit 'owner' field from platform_driver structure
   - added 'const' to snd_soc_dai_ops structure

Sameer Pujar (11):
  ASoC: dt-bindings: tegra: Add DT bindings for Tegra210
  ASoC: tegra: Add support for CIF programming
  ASoC: tegra: Add Tegra210 based DMIC driver
  ASoC: tegra: Add Tegra210 based I2S driver
  ASoC: tegra: Add Tegra210 based AHUB driver
  ASoC: tegra: Add Tegra186 based DSPK driver
  ASoC: tegra: Add Tegra210 based ADMAIF driver
  arm64: defconfig: Build AHUB component drivers
  arm64: defconfig: Build ADMA and ACONNECT driver
  arm64: tegra: Enable ACONNECT, ADMA and AGIC on Jetson Nano
  arm64: tegra: Add DT binding for AHUB components

 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  83 +++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 111 +++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 136 ++++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  83 +++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 217 +++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 225 +++++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 140 ++++
 arch/arm64/configs/defconfig                       |   8 +
 sound/soc/tegra/Kconfig                            |  56 ++
 sound/soc/tegra/Makefile                           |  10 +
 sound/soc/tegra/tegra186_dspk.c                    | 442 +++++++++++
 sound/soc/tegra/tegra186_dspk.h                    |  70 ++
 sound/soc/tegra/tegra210_admaif.c                  | 800 ++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 162 ++++
 sound/soc/tegra/tegra210_ahub.c                    | 676 +++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h                    | 127 ++++
 sound/soc/tegra/tegra210_dmic.c                    | 455 ++++++++++++
 sound/soc/tegra/tegra210_dmic.h                    |  82 +++
 sound/soc/tegra/tegra210_i2s.c                     | 812 +++++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h                     | 126 ++++
 sound/soc/tegra/tegra_cif.h                        |  65 ++
 sound/soc/tegra/tegra_pcm.c                        | 235 +++++-
 sound/soc/tegra/tegra_pcm.h                        |  21 +-
 25 files changed, 5251 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
 create mode 100644 sound/soc/tegra/tegra186_dspk.c
 create mode 100644 sound/soc/tegra/tegra186_dspk.h
 create mode 100644 sound/soc/tegra/tegra210_admaif.c
 create mode 100644 sound/soc/tegra/tegra210_admaif.h
 create mode 100644 sound/soc/tegra/tegra210_ahub.c
 create mode 100644 sound/soc/tegra/tegra210_ahub.h
 create mode 100644 sound/soc/tegra/tegra210_dmic.c
 create mode 100644 sound/soc/tegra/tegra210_dmic.h
 create mode 100644 sound/soc/tegra/tegra210_i2s.c
 create mode 100644 sound/soc/tegra/tegra210_i2s.h
 create mode 100644 sound/soc/tegra/tegra_cif.h

-- 
2.7.4

