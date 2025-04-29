Return-Path: <linux-tegra+bounces-6214-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB682A9FF3A
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Apr 2025 03:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65ADE920791
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Apr 2025 01:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31289201035;
	Tue, 29 Apr 2025 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN+6dw/6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F71EE004;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891539; cv=none; b=l6g0+XVXn5mdiwaicL7NvjVDkj3yamhotdwFsQcF/5YvC6noFdXeyVv35LaVVOUK3xkI7iUEDPysVMV121X0MrxQ+wy1PL4jBy/aZoExikVKBzrEa535V5gcGWSPJp6Ra9Lvn6itaibl5E0YNzEU5YQHC1nNd9cC1I6xVnWjGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891539; c=relaxed/simple;
	bh=nnL4ddiNBoyWlhDf+waEkqScUkyWl/v/4bK4TZyuUgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yihc2hbWEi1gl5nHBTL3JPzCvZ/dUMFwndz4RIydJw9WrsKMLAWjfCjuCmYRnw0G/Nmv7R3t5PretlIOeFfras0EAesVTfcyN+aGJ6IFn89V+ZRMI8jDxuhBxo0QldweNj1ZvSUF6gCQSzxkZ5KvSSX3WG1FscnvjG1pJT0ti8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN+6dw/6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7262C4CEEC;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745891538;
	bh=nnL4ddiNBoyWlhDf+waEkqScUkyWl/v/4bK4TZyuUgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IN+6dw/6eCvhLxSfLnAl9J+zDkWGO11d2XwQ8KKv2sYaqlBOjFP5DIZ5TquC+64Eq
	 2Q8FKb8CUW2XpLu/RaBPsuc3kHNVqX7wU4uEibEBLD3KvbV+7olufSR8yWlm38rZ57
	 Q/lJk0m+eXdJZBLv4dQzQA7IXdEEQOZo4TlIKm1/cfkRp4NZK1t7Voi1PRf6z/+t9Z
	 tSCYs/yRH4YRqk/f2JxpeLpLOrU5PlOTVhIURJue46hb659qTs/x2VFj7wyO91YP4k
	 XaC2wBU3rhZsv0bZctzwPqgoRLy017HYc6HMTXYNTFDKgqlXDREvXWZvbzfcxFEcjd
	 0s1JOR3plj0xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFDDC3ABA5;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 28 Apr 2025 20:51:48 -0500
Subject: [PATCH 2/2] arm64: tegra: Add DMA properties for Tegra186 and
 Tegra194 UARTs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-tegra-serial-fixes-v1-2-4f47c5d85bf6@gmail.com>
References: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
In-Reply-To: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745891537; l=7476;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=kIbRwwQ6NkG3Q/wnT2TcqC2fubu1xbzoPWMpzAr4Sdc=;
 b=r/hH53Qt6oDqb9jr5JCWqtf13SS1UwSJW/ALNCAHCdYv0/bmXvGCiraurrfO4tLCFQhVul7Mf
 NMcNvZuWkuWB899i08YsdQbcg8dWu109fvPbur2Kpr46K7vJj0Yx8RO
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Adding the missing dmas and dma-names properties which are required
for uart when using with the Tegra HSUART driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi           |  2 ++
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts   |  2 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                 | 14 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi           |  2 ++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi           |  2 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi                 | 16 ++++++++++++++++
 6 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index e2d6857a37097c5acc38dcbfd12800d59510f1c6..51ced62cd42be27f837832d8033766c1050b4b39 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -61,6 +61,8 @@ memory-controller@2c00000 {
 	};
 
 	serial@3100000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 26f71651933d1d8ef32bbd1645cac1820bd2e104..4ab66ebd874d05407373f98d7f76ce4b338ed089 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -549,6 +549,8 @@ timer@3010000 {
 	};
 
 	serial@3100000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index f0b7949df92c0583d0e710e5e2b93818434a913f..f0c9295f55e77cd0733ec0ad0c05967fc1bdced7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -612,6 +612,8 @@ uarta: serial@3100000 {
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTA>;
 		resets = <&bpmp TEGRA186_RESET_UARTA>;
+		dmas = <&gpcdma 8>, <&gpcdma 8>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -622,6 +624,8 @@ uartb: serial@3110000 {
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTB>;
 		resets = <&bpmp TEGRA186_RESET_UARTB>;
+		dmas = <&gpcdma 9>, <&gpcdma 9>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -632,6 +636,8 @@ uartd: serial@3130000 {
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTD>;
 		resets = <&bpmp TEGRA186_RESET_UARTD>;
+		dmas = <&gpcdma 19>, <&gpcdma 19>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -642,6 +648,8 @@ uarte: serial@3140000 {
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTE>;
 		resets = <&bpmp TEGRA186_RESET_UARTE>;
+		dmas = <&gpcdma 20>, <&gpcdma 20>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -652,6 +660,8 @@ uartf: serial@3150000 {
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTF>;
 		resets = <&bpmp TEGRA186_RESET_UARTF>;
+		dmas = <&gpcdma 12>, <&gpcdma 12>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -1229,6 +1239,8 @@ uartc: serial@c280000 {
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTC>;
 		resets = <&bpmp TEGRA186_RESET_UARTC>;
+		dmas = <&gpcdma 3>, <&gpcdma 3>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -1239,6 +1251,8 @@ uartg: serial@c290000 {
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTG>;
 		resets = <&bpmp TEGRA186_RESET_UARTG>;
+		dmas = <&gpcdma 2>, <&gpcdma 2>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index e8b296d9e0d3e66a6739ad085ee38cc73f86e0fe..43942db6eac9a9b10b61eb1af82df34c759657ec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -104,6 +104,8 @@ input@2 {
 		};
 
 		serial@3110000 {
+			/delete-property/ dmas;
+			/delete-property/ dma-names;
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index 59860d19f0f6a5a32719dcdb7f868b60c2551a1f..a410fc335fa3bb8d9961b2e8aa8681e4b6128afe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -78,6 +78,8 @@ input@2 {
 		};
 
 		serial@3100000 {
+			/delete-property/ dmas;
+			/delete-property/ dma-names;
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c3695077478514708933934f06f25ef7dbe6f923..3a4e086dcc8c5e9bd2b40f54eda6a7b935c81c77 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -747,6 +747,8 @@ uarta: serial@3100000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTA>;
 			resets = <&bpmp TEGRA194_RESET_UARTA>;
+			dmas = <&gpcdma 8>, <&gpcdma 8>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -757,6 +759,8 @@ uartb: serial@3110000 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTB>;
 			resets = <&bpmp TEGRA194_RESET_UARTB>;
+			dmas = <&gpcdma 9>, <&gpcdma 9>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -767,6 +771,8 @@ uartd: serial@3130000 {
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTD>;
 			resets = <&bpmp TEGRA194_RESET_UARTD>;
+			dmas = <&gpcdma 19>, <&gpcdma 19>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -777,6 +783,8 @@ uarte: serial@3140000 {
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTE>;
 			resets = <&bpmp TEGRA194_RESET_UARTE>;
+			dmas = <&gpcdma 20>, <&gpcdma 20>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -787,6 +795,8 @@ uartf: serial@3150000 {
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTF>;
 			resets = <&bpmp TEGRA194_RESET_UARTF>;
+			dmas = <&gpcdma 12>, <&gpcdma 12>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -812,6 +822,8 @@ uarth: serial@3170000 {
 			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTH>;
 			resets = <&bpmp TEGRA194_RESET_UARTH>;
+			dmas = <&gpcdma 13>, <&gpcdma 13>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1609,6 +1621,8 @@ uartc: serial@c280000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTC>;
 			resets = <&bpmp TEGRA194_RESET_UARTC>;
+			dmas = <&gpcdma 3>, <&gpcdma 3>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1619,6 +1633,8 @@ uartg: serial@c290000 {
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTG>;
 			resets = <&bpmp TEGRA194_RESET_UARTG>;
+			dmas = <&gpcdma 2>, <&gpcdma 2>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 

-- 
2.48.1



