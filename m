Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431571242FC
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 10:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLRJZG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 04:25:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33135 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRJZF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 04:25:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so1469471wrq.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 01:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxxBLnXs2wxDSTTt5ry9UUE2q104oudYGhlQ5EWCdw4=;
        b=i+14rTbMI3oG6T1tbeFO0Z1LuUSscbFmUF28uG2xsjqS046qCpxMVoY1tHlRLgJ/4B
         6tlLrMITAUo5M2K4M9dSXKEj10PXzgzSqESqM63d9mGIa0pwiLl519sywkDbsL4LZ1To
         Xv4BKt+6ITyVZnH8+4nXDkMfBjIJrpMJp9Tly7NVCYk83/s5F4An8GIM4znE3/1fb5tN
         TkKb50/FkBiWCw4b6xorhNm8dAL0V2eu5y/Rm3/2979t8aJ1KyXSUnrhxSgCPjezIlh/
         D2fmfG9OX2KONh9KRTdAyPZ6C4uSiR9xJmqAxFpnR7HpAy66n+gxe5s9t6JqVAwuXmxk
         Ulhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxxBLnXs2wxDSTTt5ry9UUE2q104oudYGhlQ5EWCdw4=;
        b=KxZe9u7LiReJm+rMskg3Ge731Qa+JmYIYpPD0SlJpaEKapsUM5fWnOKGxxqSD13EVJ
         6mdyAo3hRosMS3j7relFjitcC9bMB++p9MVBkkVAbQkFXoUAVwGAqi7v6Ho4SeyuB9Bt
         JwEmgFoY9TEYKLKPS0BRh1A64MstIbKHe4FFt0H7YRa8qGLcNzGHNP9AmE2ltM+VP+FQ
         qs2Bt8GCg6WnJXgVuIUop6YsthHpCZyBycgeS/XyKnrjHVVZ0BLh75EmfMCw+k+gwoW2
         37qau1D2gXkZRtvXzau7W8jGYV+qjRbXgL/hcT4PPkkI/IMLnWz9f4hf0hKnWXyjku4r
         XUmA==
X-Gm-Message-State: APjAAAVlfSK4ClkHMBpJS2zkPCPdM+w9m1c7xwtln6xMLdnzWFp/rZVy
        rwd20LS4U32fefzs74rsNRs=
X-Google-Smtp-Source: APXvYqy7JkLJ/5EseADZGM9r+UJe8Mh2BckPv0AOiq3E2gQUSbsGHbma+fHLUih0bxMtU7JDxpJhmw==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr1609262wru.230.1576661103640;
        Wed, 18 Dec 2019 01:25:03 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id e18sm1814069wrr.95.2019.12.18.01.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 01:25:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Make XUSB node consistent with the rest
Date:   Wed, 18 Dec 2019 10:25:01 +0100
Message-Id: <20191218092501.1031832-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ordering of properties in the XUSB node is inconsistent with the
ordering of the properties in other nodes. Resort them to make the node
more consistent. Also get rid of some unnecessary whitespace.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index fdd6e74a5aeb..d64940b8e2e5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -563,12 +563,9 @@
 		reg = <0x0 0x03530000 0x0 0x8000>,
 		      <0x0 0x03538000 0x0 0x1000>;
 		reg-names = "hcd", "fpci";
-
-		iommus = <&smmu TEGRA186_SID_XUSB_HOST>;
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
-
 		clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
 			 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
 			 <&bpmp TEGRA186_CLK_XUSB_SS>,
@@ -581,16 +578,15 @@
 		clock-names = "xusb_host", "xusb_falcon_src", "xusb_ss",
 			      "xusb_ss_src", "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
-
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBC>,
 				<&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
 		power-domain-names = "xusb_host", "xusb_ss";
-		nvidia,xusb-padctl = <&padctl>;
-
-		status = "disabled";
-
+		iommus = <&smmu TEGRA186_SID_XUSB_HOST>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
+
+		nvidia,xusb-padctl = <&padctl>;
 	};
 
 	fuse@3820000 {
-- 
2.23.0

