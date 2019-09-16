Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC8CB3A71
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 14:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732673AbfIPMgp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 08:36:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41810 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732625AbfIPMgp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 08:36:45 -0400
Received: by mail-ed1-f65.google.com with SMTP id z9so32918481edq.8
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vob9lcdcRaSmKVh/xs3npgI8r4WLNXKNo0lU+m6q5w=;
        b=fMQgF9XPpNyXc4gjg9fCSZ+oZZ5PNtQnhOYhDaGFAbZX621eAz60KTANyp/cx3ZBJX
         g9LXZ5XCe8qK0CtrzAm7SY+sfDAMUfBJN/uMuUWyZ+Koe3COpShG1JVpjBGahGgUD9n7
         rQwcyti9OPI5v9BsRU8rvj4ds/P2zkzXqXrlQU+Pcjuc1HGGu6PIvhlYp5eR/QmETIMH
         SaT4ov0rVghON8IyWTmCdJbQ9DAwniAYkMYct8uSkKWRjs6oIDNYwdSAReXtNMdJAD2H
         rugo0ts6JN3lxD/2JIZRzl8L9vpZzUttXeCtWtVCDoZL6lqOXyJo3cnVbvNv6Y6J/C3r
         Oa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vob9lcdcRaSmKVh/xs3npgI8r4WLNXKNo0lU+m6q5w=;
        b=sJn+TNyV3nnYE1Nkk2C73JTzPIEOydRDpYHWBN6mk8ysdalyAoJJbAYluqfGlFWqdZ
         Q3KleXs3+5eT39aI7F0m5iVIR8XFDY5IqBpeVWtroVlthWynmJNTDfSBBw7V5rOiE4iX
         IQCmPrK6rEL9HyW8B/XE/bfYEOj3E9tHT6PmbLzn1xm54V53DdXiAw/FLkg56CkiPlQb
         OyaKiN6s/vpQ+RfzosqejIUlzFWXrCEJbO79/SgySt1k+1xqk7iooyEzJEwl5rJq1qN1
         QfoblyxQYAlW6d9wNzSm1x4ZruJpcoTZic2g5TOYRQufuOdZKZ3dyeW1dUSC6Z6ZaWY6
         0CSQ==
X-Gm-Message-State: APjAAAXHV0QfQeSPnQd3T3+V+KwzJ+aRMieXiQrHHMq5QQJ01lIEtVyS
        /j+vbUbBgL9uWnx+nRhkZZI=
X-Google-Smtp-Source: APXvYqwyH5Gz6kelr/FZmOwvinKWGrHhFfqtHx2klJWKxQu7X0iz+AiJiqGWU/y3jMP6ngaLYG+KgQ==
X-Received: by 2002:a17:906:2ec8:: with SMTP id s8mr1773950eji.275.1568637402597;
        Mon, 16 Sep 2019 05:36:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w26sm4335677ejn.66.2019.09.16.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 05:36:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Add CPU and cache topology for Tegra194
Date:   Mon, 16 Sep 2019 14:36:40 +0200
Message-Id: <20190916123640.1894-1-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 148 +++++++++++++++++++++--
 1 file changed, 140 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index dc2e3cc71558..177e1240c081 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1583,60 +1583,192 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0_0: cpu@0 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x10000>;
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
 			reg = <0x10001>;
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
+		cpu1_0: cpu@2 {
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
+		cpu1_1: cpu@3 {
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
+		cpu2_0: cpu@4 {
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
+		cpu2_1: cpu@5 {
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
+		cpu3_0: cpu@6 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x10300>;
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
+		cpu3_1: cpu@7 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x10301>;
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

