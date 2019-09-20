Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1ECDB9382
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Sep 2019 16:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfITO42 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Sep 2019 10:56:28 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:53088 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfITO41 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Sep 2019 10:56:27 -0400
Received: by mail-wm1-f54.google.com with SMTP id x2so2854429wmj.2
        for <linux-tegra@vger.kernel.org>; Fri, 20 Sep 2019 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aU0z+hVMkgc1yYEfSV2tujiKTM9NHwFgDr72hAtaZng=;
        b=N2gojDcyOylCYEFUPtUNp53P65Yn+FGUYdFE7J4i8AY9bLT7yskXhVoX15hwXiP1Pt
         LRnmguaOaOBnK3VjdMlW9B7Yj6JV01wHeN6h3A1Zc2r+eUOx18VQZsOBxLl+TmuRh3fq
         YyRWaht89M4dlqy3C4wYbVu8iamwQByd7zeo74vZdti/8yOEtkw1LeKeXL4IdIgJygpm
         4+Sr2XMok05FoP5/HnpFb6IMpZtkqs4aj2iizHCNxUk7WUZbtBJVim44JjDjy0MExfjg
         9b9caLR5uA3c+sRZCZ4osphdzreYRj+TrxpL1Bfu3rfB2iny3/v7kN214GuaTbQoh+83
         lDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aU0z+hVMkgc1yYEfSV2tujiKTM9NHwFgDr72hAtaZng=;
        b=DVrmYdFP8mZGxA7MfHEQPzcERWwEBcU0v9k6fEaEe+6vdtfsInMVDfSfw+HnBX2CSC
         nJPu6rEwU9dJv9oExrZ79Sk+ZkkFzPkGbBoCJaUXlOACVR7jB7tLp0JsDc7YfYRm3Bb4
         mMOiz6xFTdx1GOX6BQxeZcmqBcb8IluJ3AOnVf2IIx9eL9nia7EuXB+ugr5tl2txbYHS
         BRb5O3v2Kft1s7zK8wK5v44rrjaNAntXmRgGou919hplS7ua31XkfLqUbhKnlFbN+Ok7
         uFiG7WUpjdGQgmZfhgKACOmSYFfLJW9Dg3ohi9xMn3YcM57ZtZb876i8XnHjw6DYnRf/
         XEQw==
X-Gm-Message-State: APjAAAWxZusKTqyzLVsTorwPTsg/SxeFi2fyO6spQyZwRFyhCk6urz9W
        f8bHWZO99VrAk6cP2d5tHFE=
X-Google-Smtp-Source: APXvYqwU3IyibrsNr/lVlhmE1NmKj2Klw+JUR9QQ5IM2nYJv3ZJQ65XH3s6yv5c5W+DZ1jh0v2wrfw==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr3828121wme.41.1568991383811;
        Fri, 20 Sep 2019 07:56:23 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x129sm3065115wmg.8.2019.09.20.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 07:56:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: tegra: Add CPU and cache topology for Tegra194
Date:   Fri, 20 Sep 2019 16:56:21 +0200
Message-Id: <20190920145621.12527-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has four CPU clusters, each with their own cache hierarchy.
This patch creates the CPU map for these clusters and adds the second-
and third-level caches and associates them with the CPUs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix reg properties for CPU nodes and update unit-address to match

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 156 +++++++++++++++++++++--
 1 file changed, 144 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index adebbbf36bd0..27bf0b7c3f6b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1442,60 +1442,192 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0_0: cpu@0 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10000>;
+			reg = <0x000>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_0>;
 		};
 
-		cpu@1 {
+		cpu0_1: cpu@1 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10001>;
+			reg = <0x001>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_0>;
 		};
 
-		cpu@2 {
+		cpu1_0: cpu@100 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_1>;
 		};
 
-		cpu@3 {
+		cpu1_1: cpu@101 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x101>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_1>;
 		};
 
-		cpu@4 {
+		cpu2_0: cpu@200 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_2>;
 		};
 
-		cpu@5 {
+		cpu2_1: cpu@201 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x201>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_2>;
 		};
 
-		cpu@6 {
+		cpu3_0: cpu@300 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10300>;
+			reg = <0x300>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_3>;
 		};
 
-		cpu@7 {
+		cpu3_1: cpu@301 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10301>;
+			reg = <0x301>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_3>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0_0>;
+				};
+
+				core1 {
+					cpu = <&cpu0_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu1_0>;
+				};
+
+				core1 {
+					cpu = <&cpu1_1>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu2_0>;
+				};
+
+				core1 {
+					cpu = <&cpu2_1>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&cpu3_0>;
+				};
+
+				core1 {
+					cpu = <&cpu3_1>;
+				};
+			};
+		};
+
+		l2c_0: l2-cache0 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_1: l2-cache1 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_2: l2-cache2 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_3: l2-cache3 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l3c: l3-cache {
+			cache-size = <4194304>;
+			cache-line-size = <64>;
+			cache-sets = <4096>;
 		};
 	};
 
-- 
2.23.0

