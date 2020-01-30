Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F101714D8F9
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 11:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgA3KeE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 05:34:04 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13016 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgA3KeE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 05:34:04 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e32b10c0001>; Thu, 30 Jan 2020 02:33:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 02:34:02 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 02:34:02 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:02 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:02 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e32b1150001>; Thu, 30 Jan 2020 02:34:02 -0800
From:   Sameer Pujar <spujar@nvidia.com>
To:     <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 0/9] add ASoC components for AHUB
Date:   Thu, 30 Jan 2020 16:03:33 +0530
Message-ID: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580380428; bh=ukRTCkA68Znw7y1TQhSgd6vl+HkHAVkoEOQfKSoJrSk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=TNcEmZxXB9PQsS3cQQt4VmtKeUtW6hngC8MJHtUh42xHHFCioBLJhR3tXtC/eUk9M
         I5ZhJFpWTLrQIZzuRU2zun+DF5qkgs9t6bdtPhTjoUPrBhAZZ6fsyOqMDvGg0VrCDz
         +E+Mawdt3NqS6YARAAEHvWKzrbhovHANC0lz8iFwCJXR+eerGkZlLOgb8MQjNhqTRe
         AdssyH3NTjc4LuffFI3BRukYE11eympMGZa/zKmVIlc9h25SyqOH11qGEq2e4gi17v
         B1Z8FqAcLeRGVEf1nPASDdnWuo6flfPlNxYB0j51BQukml0HKLGfX2bjqxpmPzyDME
         Eyd7/vc9PDZZQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Overview
========
The Audio Hub (AHUB) is part of the Audio Processing Engine (APE) which
comprises a collection of hardware accelerators for audio pre-processing
and post-processing. It also includes a programmable full crossbar for
routing audio data across these accelerators.

This series exposes some of these below mentioned HW devices as ASoC
components for Tegra platforms from Tegra210 onwards.
 * ADMAIF : The interface between ADMA and AHUB
 * XBAR   : Crossbar for routing audio samples across various modules
 * I2S    : Inter-IC Sound Controller
 * DMIC   : Digital Microphone
 * DSPK   : Digital Speaker

Following is the summary of current series.
 1. Add YAML DT binding documentation for above mentioned modules.
 2. Helper function for ACIF programming is exposed for Tegra210 and later.
 3. Add ASoC driver components for each of the above modules.
 4. Add DT entries for above components for Tegra210, Tegra186 and
    Tegra194.
 5. Enable these components for Jetson-Tx1, Jetson-Tx2 and Jetson-Xavier.

Machine driver series will be sent separately.

Changelog
=========

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

=================

Sameer Pujar (9):
  dt-bindings: sound: tegra: add DT binding for AHUB
  ASoC: tegra: add support for CIF programming
  ASoC: tegra: add Tegra210 based DMIC driver
  ASoC: tegra: add Tegra210 based I2S driver
  ASoC: tegra: add Tegra210 based AHUB driver
  ASoC: tegra: add Tegra186 based DSPK driver
  ASoC: tegra: add Tegra210 based ADMAIF driver
  arm64: tegra: add AHUB components for few Tegra chips
  arm64: tegra: enable AHUB modules for few Tegra chips

 .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 ++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 +++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 +++
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  48 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 231 ++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  36 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 239 +++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  40 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 145 ++++
 sound/soc/tegra/Kconfig                            |  56 ++
 sound/soc/tegra/Makefile                           |  12 +
 sound/soc/tegra/tegra186_dspk.c                    | 512 +++++++++++
 sound/soc/tegra/tegra186_dspk.h                    |  73 ++
 sound/soc/tegra/tegra210_admaif.c                  | 886 +++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 164 ++++
 sound/soc/tegra/tegra210_ahub.c                    | 653 ++++++++++++++
 sound/soc/tegra/tegra210_ahub.h                    | 125 +++
 sound/soc/tegra/tegra210_dmic.c                    | 517 ++++++++++++
 sound/soc/tegra/tegra210_dmic.h                    |  85 ++
 sound/soc/tegra/tegra210_i2s.c                     | 939 +++++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h                     | 132 +++
 sound/soc/tegra/tegra_cif.c                        |  34 +
 sound/soc/tegra/tegra_cif.h                        |  47 ++
 sound/soc/tegra/tegra_pcm.c                        | 222 ++++-
 sound/soc/tegra/tegra_pcm.h                        |  23 +-
 27 files changed, 5832 insertions(+), 4 deletions(-)
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
 create mode 100644 sound/soc/tegra/tegra_cif.c
 create mode 100644 sound/soc/tegra/tegra_cif.h

-- 
2.7.4

