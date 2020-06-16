Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FB81FB2DF
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPNz1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNzZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A98FC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:25 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l10so20846140wrr.10
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H88x6vjpuSpzZHQlZkQcpEZG1CuEYDHzgnWI54VWfdI=;
        b=UIL/3uQu1mOuZeZy1jk8Xr/dmIFVxbxNQvcZvHrcocJxrXVigTf3Il9pyRRsNxi8D8
         Ps/yCXagsypaZ+ocjewOKtpfJkaFaveZO+DgBbDKcsJXw40T35WYtgFmgs0iCos3jMg0
         NL0cqyiJWUhthFeOJl36rS0z+a6/ONze71FUYDTeNoKJTOLQX3GDOB2+2IKRnhyukesQ
         dEd4YoBJdODLgN0mulnCUKOODwmIX8Cvs9VjelDfHiNxtlUUBD9+DBQnwuEcD4/a2Agk
         sv7DH/vKFQORQorpKZ5XGjNHu6HVoW/iZFaK+LcKZPCImeTplDr+48WoMjMqtQVJdg1h
         IeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H88x6vjpuSpzZHQlZkQcpEZG1CuEYDHzgnWI54VWfdI=;
        b=qbfK2A4rc1WDqsZ0HX3TWq0OSurwLoUXLD2OyYg/Z3QeKcbqq459aR7ORdtBMs8V7z
         bY2cGkrV1Qs8D+EPIiilk1BrPM9Ac2U99NhdY7Ojf4WvQ+pmCm3LtgoRoTH01T4kOlX3
         i38bsxu2RF7AXfMqRZGXCjEC5e0KEVhXm5TSaozWQ7U5Atih6mQqkNmn01MYEtQ7vgj5
         5KRDyPTP6VapJu6ZMdVEAgxXCtclbpzAPUzoJ5kMwnu93ZDuV1YPptluIHzju7LEcE5H
         s2z5JRHMvNRXAoAThn79EIvHIbBr/P2Jo6IQA6TzVofJKTXajgq1KeMDRxtbQuFaVHRP
         Nu0w==
X-Gm-Message-State: AOAM533LogukntqwbBMtP8reCNCdzW7rzIHidq8dkon8ckqak6QyjeaU
        OozZBsacARZPNT1OI1IhhsU=
X-Google-Smtp-Source: ABdhPJxtfNSOEILiVqh/qFM/nf/bExgvAibeoQa8jEe42UWA0sSe2bg3ikALt84AYI+GGaRuEInUvg==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3184108wru.211.1592315724035;
        Tue, 16 Jun 2020 06:55:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 185sm4084382wmz.22.2020.06.16.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 66/73] arm64: tegra: Use standard names for SRAM nodes
Date:   Tue, 16 Jun 2020 15:52:31 +0200
Message-Id: <20200616135238.3001888-67-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

SRAM nodes should be named sram@<unit-address> to match the bindings.

While at it, also remove the unneeded, custom compatible string for
SRAM partition nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 8 +++-----
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 3a41203deba2..d92eea1ddac7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1262,22 +1262,20 @@ gpu@17000000 {
 		interconnect-names = "dma-mem", "write-0", "read-1", "write-1";
 	};
 
-	sysram@30000000 {
+	sram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x30000000 0x50000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
-			compatible = "nvidia,tegra186-bpmp-shmem";
+		cpu_bpmp_tx: sram@4e000 {
 			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
-			compatible = "nvidia,tegra186-bpmp-shmem";
+		cpu_bpmp_rx: sram@4f000 {
 			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3089ebecfbef..2ecb80e1b09d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1803,22 +1803,20 @@ pcie_ep@141a0000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 	};
 
-	sysram@40000000 {
+	sram@40000000 {
 		compatible = "nvidia,tegra194-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x50000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x40000000 0x50000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
-			compatible = "nvidia,tegra194-bpmp-shmem";
+		cpu_bpmp_tx: sram@4e000 {
 			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
-			compatible = "nvidia,tegra194-bpmp-shmem";
+		cpu_bpmp_rx: sram@4f000 {
 			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
-- 
2.24.1

