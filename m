Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0303721C892
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Jul 2020 12:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgGLKbV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 06:31:21 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6171 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGLKbV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 06:31:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0ae6090000>; Sun, 12 Jul 2020 03:29:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:31:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 12 Jul 2020 03:31:20 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:31:20 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:31:20 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0ae6750001>; Sun, 12 Jul 2020 03:31:18 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Date:   Sun, 12 Jul 2020 11:31:14 +0100
Message-ID: <20200712103114.24825-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594549770; bh=sVsp9NEI2yHkCiuTe8nZj3sXB1jPhquWQ/oDMQIOy4I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=aJ0kI56IYx7V3Bhyd0SzjAvu8E8inFaIFFQ5ZKYgg6AdNj8hekIFILHvs7P9eoonY
         Zj3diTdPzisVPJyp9iQe8KC2RnFZ2Fb8qnTpNO6i0gFdyj8DTRohYcdD1p1Guygtm1
         WeFUAIlcKivetQLg2d4dvJFvBgG0fAnJg+oIxmNq7RNuHVYAZzp5RFMuDZfwgCJ33W
         tNoFUr0O711m3mqBXXckA0SgXERbf2tJzg8ovI4q0Qms5NtTW2V8ozBepfKAW39/6g
         qbaRatFyHq4r8ym7WMfm1yorQwsQ4KVnzXRjXzeO1YTVoU/wa9MhIF8jMTM0QrcVVF
         4OcyKKAtoVv7A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the CPUFREQ userspace governor in the tegra_defconfig so that
we can test CPUFREQ with the userspace governor with this configuration
on 32-bit Tegra devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 The_Yellow_Theme_24-192.wav      | 0
 arch/arm/configs/tegra_defconfig | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 The_Yellow_Theme_24-192.wav

diff --git a/The_Yellow_Theme_24-192.wav b/The_Yellow_Theme_24-192.wav
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index aa94369bdd0f..f70600bdedd6 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -23,6 +23,7 @@ CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_TEGRA_CPUIDLE=y
-- 
2.17.1

