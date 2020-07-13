Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A477321D8B9
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jul 2020 16:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgGMOli (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jul 2020 10:41:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9322 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbgGMOli (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jul 2020 10:41:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0c72320001>; Mon, 13 Jul 2020 07:39:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 13 Jul 2020 07:41:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 13 Jul 2020 07:41:38 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jul
 2020 14:41:37 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jul 2020 14:41:37 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.72.101]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0c72a00000>; Mon, 13 Jul 2020 07:41:37 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Date:   Mon, 13 Jul 2020 15:41:34 +0100
Message-ID: <20200713144134.24444-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
References: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594651186; bh=mM9gb2It2Ql/4cdC12oeHDABc63hqi9cLyEWULsCK6Q=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=j/lMUKyEhgrF2KDTSAOxPh0RolNsR5LC8fv6K4+cK26t1QdjlXxiLRN/h/koeBWfU
         qfoqjvJM87D04PVhY2GUQ2otlXxV77ok8hvZs4f80afzykPuOXqEA9Pm9CHcCYWp1p
         gfcBXOlzkxUCDDv+6/ZjWSs+gwSGyVUglEoDchtoKDUzef7k44Xzif2kHtPu6S1UXs
         sgPyhScCEqczP09pCEZl8bY1tozvnzmA0KarhS2ScCLe/IXVGz2R+brlseSQFL3ZA8
         g8C5Mmmw2omk12OOGZvgpZPBlFeCkqNCpuGT17cQW6HMaqsAsMyBlTz+WWDWEzafeC
         4TgzO44TkwI0w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the CPUFREQ userspace governor in the tegra_defconfig so that
we can test CPUFREQ with the userspace governor with this configuration
on 32-bit Tegra devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

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

