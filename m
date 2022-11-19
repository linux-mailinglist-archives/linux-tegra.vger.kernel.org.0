Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E5E6308B8
	for <lists+linux-tegra@lfdr.de>; Sat, 19 Nov 2022 02:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiKSBs1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Nov 2022 20:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbiKSBsG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:06 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CF85D69F
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:33 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s12so9400758edd.5
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acEsYiXCoqV1GznAxKVHxkzg29M8YO7XPSSAAJC1GdU=;
        b=avBtfSj1RtG+PfH63iyJ1ukNNlKKBsocTZxjZzL3BPSo2sz7+bA1JAskIRGFUcYtKO
         kVpru/5n8/+sbZN+Tznn5s3+vyEF3G87ocjePWqvXCssYG2nkdEzVXSdWKTKiQrK6vGn
         gE2TUmnZ+Xgi/LrOR9TQNidGMudS2pIRg8DMVHBhgmmj5O3ffxSNQnM9gcVzYzF0SQJh
         dQ0GugmnjRnhwsr1viRtlfVsQsoLFsCK5r6lmdCDU+xEtOOy+Lh5C5Y6on77MmqyMToK
         VEMAFIvRcn9x80YpzxOmYAKkxW23oaJm21mI3tIWZibanCqz4BDAn4WeKaREL7VEXaLW
         1jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acEsYiXCoqV1GznAxKVHxkzg29M8YO7XPSSAAJC1GdU=;
        b=oJRhh06I8nbpWOrC8XxcOMvQpD/10tQ0g020ATmoSLGapmkvDEohZ0QryJ2h8y2KeF
         plnMuBa6NGjxWxmrwQRzojT3vs8W1Pq1p1VDO6YgGWcrtIvkHl9dNDG/zgufkS5bc+uM
         NLlcpUkSaBjD/Tkn9k2cPLUVE/6ljM/sVfpONZRDMSfCkMRppvAYOKZe/3Z0G7tMeTqw
         miMDb7FfrmeRrgrvDeqBO22md/cDngnS1/PTiNS5tj0lDFfn3BmqkE8+Bzo70JwXUaxz
         gwd3j7p9JjAeHS5Y50fd3NfZKP3HE42/B/lyVcQUTLfdX48+EYbDd7WLcvYmUeaUIw8J
         RqKg==
X-Gm-Message-State: ANoB5pmbLROiME1qkz1M/hzImXLdnvkvGlw2y4zk6/NAfdZVZ/uTQp+9
        tzJagg7FuFGTyYbS2ap3FSo=
X-Google-Smtp-Source: AA0mqf4OZ0Dzxyh8YmaV9rUzLT+rL5j3QeUyourkO/VhGMNzW/qOXNx61xaanjqg+LgymbbgMs0Vjw==
X-Received: by 2002:a05:6402:b81:b0:45c:a651:8849 with SMTP id cf1-20020a0564020b8100b0045ca6518849mr8363214edb.209.1668820832263;
        Fri, 18 Nov 2022 17:20:32 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7d6c7000000b004623028c594sm2427254edr.49.2022.11.18.17.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:24 +0100
Message-Id: <20221119012025.3968358-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm64-dt

for you to fetch changes up to db78f7ce427aa4be45d0e95daaa6e2cd73c7cd6c:

  arm64: tegra: Remove unneeded clock-names for Tegra132 PWM (2022-11-19 00:01:20 +0100)

This also pulls in a partial for-6.2/dt-bindings branch to satisfy the
build dependency on the memory client IDs.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.2-rc1

This contains many new additions, primarily for Tegra234, as well as a
slew of cleanups for issues flagged by the DT validation tools.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Add dma-channel-mask in GPCDMA node

Dipen Patel (1):
      arm64: tegra: Enable GTE nodes

Fabio Estevam (1):
      arm64: tegra: Remove 'enable-active-low'

Jon Hunter (7):
      dt-bindings: tegra: Update headers for Tegra234
      dt-bindings: memory: Fix typos and definitions for Tegra
      arm64: tegra: Remove unused property for I2C
      arm64: tegra: Populate Tegra234 PWMs
      arm64: tegra: Add PWM fan for Jetson AGX Orin
      arm64: tegra: Add SBSA UART for Tegra234
      arm64: tegra: Update console for Jetson Xavier and Orin

Mikko Perttunen (3):
      dt-bindings: Add headers for NVDEC on Tegra234
      arm64: tegra: Fix ranges for host1x nodes
      arm64: tegra: Add NVDEC on Tegra234

Pierre Gondois (1):
      arm64: tegra: Update cache properties

Prathamesh Shete (1):
      arm64: tegra: Add Tegra234 SDMMC1 device tree node

Sandipan Patra (1):
      arm64: tegra: Enable PWM users on Jetson AGX Orin

Thierry Reding (15):
      Merge commit for-6.2/dt-bindings into for-6.2/arm64/dt
      arm64: tegra: Sort nodes by unit-address
      arm64: tegra: Add missing whitespace
      arm64: tegra: Remove clock-names from PWM nodes
      arm64: tegra: Separate AON pinmux from main pinmux on Tegra194
      arm64: tegra: Add missing compatible string to Ethernet USB device
      arm64: tegra: Restructure Tegra210 PMC pinmux nodes
      arm64: tegra: Use vbus-gpios property
      arm64: tegra: Use correct compatible string for Tegra194 HDA
      arm64: tegra: Use correct compatible string for Tegra234 HDA
      arm64: tegra: Remove reset-names for QSPI
      arm64: tegra: Fixup pinmux node names
      arm64: tegra: Remove unused reset-names for QSPI
      arm64: tegra: Fix up compatible string for SDMMC1 on Tegra234
      arm64: tegra: Remove unneeded clock-names for Tegra132 PWM

Vidya Sagar (3):
      arm64: tegra: Fix Prefetchable aperture ranges of Tegra234 PCIe controllers
      arm64: tegra: Add ECAM aperture info for all the PCIe controllers
      arm64: tegra: Fix non-prefetchable aperture of PCIe C3 controller

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  12 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   2 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  70 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  61 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |   8 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  21 +-
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |  14 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 666 ++++++++++++++-------
 include/dt-bindings/clock/tegra234-clock.h         | 639 +++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           | 440 +++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h     |  15 +
 include/dt-bindings/reset/tegra234-reset.h         | 111 +++-
 18 files changed, 1751 insertions(+), 326 deletions(-)
