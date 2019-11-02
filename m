Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1DBECF42
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKBOpg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36753 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id w18so12467558wrt.3
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GTGCNNiwKlBZVXsP21r2PDJNhcrsvyHQEwunsy6fCNY=;
        b=rcWEGveY6X709tbXwN6s8SvMz7ml0y6EsmqVmxGvSRPQ8hfntrn9VUEvJLHdtQDWxk
         coLNwUc8KZXOI47qMn9wY8dfENBn0a0eP4kp4n5y1kJxnVO8lIBojpOEd9mN7yKtLp7i
         pyJY3deugA+ttt9dBn61tHtPE61yS/9Rou5TNlRy4FxwjG+P0/8DwzcpJSfUR6ZfPKmv
         al3SV/T8k6LJc7dX3RGDu6QVsq9Clj6sfWFfHz1oB7/uDGFEzyvQNASqdEXCdLO1D4Vt
         qNyR7HKPc4MncuPa9EpWORwhxL/ldISBCvcYfzou6oLF753jVk3UHxTHn1A5DSnNSzMa
         RhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GTGCNNiwKlBZVXsP21r2PDJNhcrsvyHQEwunsy6fCNY=;
        b=cl0Ly7hSNNHndWBFZJn55X+Ws85i6X3WcE5trhebsbabFuYlKw8eLc02drkvDjTDjh
         BpqW6Eg2kwujHUBky3Y+oJmp0wKdkj9JxJQiLLLDW75HLhe56eJbg0x9bE61cshjnQiI
         Zy0aIQhuFBp20scHJc+kAMBX3S2xnin9xEdVYrvo414SPMXQGba0waHEyaC8YI5UAE4h
         inoxDO3711THaQbiGnaO95OnQpoVnRaokR8/v5YzIdsBiRIUkyDhCoWratrv+h5nTE6r
         RNT+UakkQpQMjFwGOpzxOY06z1k4PP6leNQDdx62XpqpITEln3m0okhwRkcjM9b3CVXq
         U8RA==
X-Gm-Message-State: APjAAAUvPh2+Qne6r1PgSGnsDUhqNHyi55ARLNDeo4OIcmtRKHJ3DCFz
        GcKgHM13wgMAXfjJbbe6cK8=
X-Google-Smtp-Source: APXvYqy+xYvA/2HeaYAIKYtmDkGGWTh5MMXnEgwk/5eFijrAmPS+e9HTtim0QbkJme1uOSomo+YgFg==
X-Received: by 2002:a5d:4982:: with SMTP id r2mr9656465wrq.254.1572705934336;
        Sat, 02 Nov 2019 07:45:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id o81sm2119190wmb.38.2019.11.02.07.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:19 +0100
Message-Id: <20191102144521.3863321-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-dt

for you to fetch changes up to 4053aa65c517fba954af05e826bb97b2eaefe92a:

  ARM: tegra: cardhu-a04: Add CPU Operating Performance Points (2019-10-29 20:29:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.5-rc1

Adds support for CPU frequency scaling on Tegra20 and Tegra30, EMC
frequency scaling on Tegra30, SMMU support for VDE on Tegra30, the
STMPE ADC found on Toradex T30 modules as well as fixes for eDP
support on Venice2.

----------------------------------------------------------------
Dmitry Osipenko (12):
      ARM: tegra: Connect SMMU with Video Decoder Engine on Tegra30
      ARM: tegra: nyan-big: Add timings for RAM codes 4 and 6
      ARM: tegra: Add External Memory Controller node on Tegra30
      ARM: tegra: Add Tegra20 CPU clock
      ARM: tegra: Add Tegra30 CPU clock
      ARM: tegra: Add CPU Operating Performance Points for Tegra20
      ARM: tegra: Add CPU Operating Performance Points for Tegra30
      ARM: tegra: paz00: Set up voltage regulators for DVFS
      ARM: tegra: paz00: Add CPU Operating Performance Points
      ARM: tegra: trimslice: Add CPU Operating Performance Points
      ARM: tegra: cardhu-a04: Set up voltage regulators for DVFS
      ARM: tegra: cardhu-a04: Add CPU Operating Performance Points

Philippe Schenker (1):
      ARM: tegra: Add stmpe-adc DT node to Toradex T30 modules

Thierry Reding (4):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT
      Merge branch 'for-5.5/dt-bindings'
      ARM: tegra: Add SOR0_OUT clock on Tegra124
      ARM: tegra: Add eDP power supplies on Venice2

 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi     | 7869 +++++++++++++++++-----
 arch/arm/boot/dts/tegra124-venice2.dts           |    3 +
 arch/arm/boot/dts/tegra124.dtsi                  |    3 +-
 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi |  201 +
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi           |  302 +
 arch/arm/boot/dts/tegra20-paz00.dts              |   41 +-
 arch/arm/boot/dts/tegra20-trimslice.dts          |   11 +
 arch/arm/boot/dts/tegra20.dtsi                   |    2 +
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi       |   22 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi            |   22 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts         |   48 +
 arch/arm/boot/dts/tegra30-colibri.dtsi           |   22 +-
 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi |  801 +++
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi           | 1202 ++++
 arch/arm/boot/dts/tegra30.dtsi                   |   14 +
 include/dt-bindings/clock/tegra124-car-common.h  |    3 +-
 include/dt-bindings/clock/tegra210-car.h         |    3 +-
 17 files changed, 8914 insertions(+), 1655 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp.dtsi
