Return-Path: <linux-tegra+bounces-8443-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64CB28AEB
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Aug 2025 08:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BD0E1C803B3
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Aug 2025 06:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416351E7C34;
	Sat, 16 Aug 2025 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO3eBnOW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402519F135;
	Sat, 16 Aug 2025 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755324213; cv=none; b=EoWntbEf6GUmTQRqe0F+4cYE0Un3QjtVny00xI/D1w/JsRYAwQgXwEidfgG6RwgkctBL35IH7dq9MlhBVrcwEoZFUufoIvZNPDOJYKVTqf8A521A2IGBXoZgyiIK+SCYQYet13X6dWAMN/UgHhSsFKBnaDVxE9CzgqzsWs/ml4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755324213; c=relaxed/simple;
	bh=bChP3J47dHEf9bbVR2keDXRP13zArhu+avHf2gZS4o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qStmL+rhhrN/XD5BKc+bmMz0RIHtfgD6JmKVk/f0PAMAOMakpQ6TjzE7/pQpihSbmDvUIwX1Khve7h6Ip6vWQQpZin9vvyXl4NOGn33GNJ3kT6ROvQOwyZd3wADzQqZVF7izdPwW51Z+EPG3buw4xhMCtvC5toY1SOiIkvozAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO3eBnOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D774C4CEEF;
	Sat, 16 Aug 2025 06:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755324211;
	bh=bChP3J47dHEf9bbVR2keDXRP13zArhu+avHf2gZS4o4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SO3eBnOWKMA/DxZzR4uS5T+oRNm9HzJMvtHfiSQIWwuKZm6UzfNLEnv9UACB7FvTE
	 Aj+6yPrLEjLnWE5e+p1/Hznjyj9O5wsri8kpUV1ghit+x8V2f8Bh+JOX8K2ZC0OTZ1
	 KlxotEjupmuguvc8yZHWAZL0bJEMZ5q2MfKFhMJMluYAaZKpwjiBcfbiNYLLvIQaa2
	 qmiH4HNP96sE4NKNOPSXbDjGhnrtmpmb44oW1XCpw3l+S7pMNDU6bSLE3w8wEzlUTf
	 2aRS05lwLZne3JbCyLbqCNbpFBghBMs4ourTTl5oREUDACcTkayOpQYhkSteQTAkGE
	 E+FDpKQFBJJ8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20CCA0EE6;
	Sat, 16 Aug 2025 06:03:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 16 Aug 2025 01:03:21 -0500
Subject: [PATCH] arm64: tegra: Enable NVDEC and NVENC on Tegra210
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
X-B4-Tracking: v=1; b=H4sIACgfoGgC/x3MQQqDMBBG4avIrDuQRGOLVyldTPTXDmgqSRFBv
 LvB5bd476CMpMjUVQclbJr1Fwvso6L+K3EC61BMzjhvXrbhP6YkzhpeMKgwooQZ7J9tCK3UTfA
 9lXZNGHW/v+/PeV7Rh4PlZwAAAA==
X-Change-ID: 20250814-tegra210-media-enable-576bb6a34b5c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755324210; l=2019;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FBhRZXiIPTHOUSFEUddsbuop3pvSiuDmwcrMPsGiLyM=;
 b=EjnvL0KmoI3A2wSMUAvnWqw3XeIalqm2Jr2reVDXWjpc186wnONzAPqQ9B5CBRQN18IK3LZZk
 RabPK1Y4JM3CqWlsUUk1cQEiFn3d87FtcaifaVf9Zq01itwKQ2seRFL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The other engines are already enabled, finish filling out the media
engine nodes and power domains.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472af625d9d9e811f5af306d436cc98..80d7571d0350205b080bcf48b8b8e2c1b93227f2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -277,13 +277,25 @@ dsib: dsi@54400000 {
 		nvdec@54480000 {
 			compatible = "nvidia,tegra210-nvdec";
 			reg = <0x0 0x54480000 0x0 0x00040000>;
-			status = "disabled";
+			clocks = <&tegra_car TEGRA210_CLK_NVDEC>;
+			clock-names = "nvdec";
+			resets = <&tegra_car 194>;
+			reset-names = "nvdec";
+
+			iommus = <&mc TEGRA_SWGROUP_NVDEC>;
+			power-domains = <&pd_nvdec>;
 		};
 
 		nvenc@544c0000 {
 			compatible = "nvidia,tegra210-nvenc";
 			reg = <0x0 0x544c0000 0x0 0x00040000>;
-			status = "disabled";
+			clocks = <&tegra_car TEGRA210_CLK_NVENC>;
+			clock-names = "nvenc";
+			resets = <&tegra_car 219>;
+			reset-names = "nvenc";
+
+			iommus = <&mc TEGRA_SWGROUP_NVENC>;
+			power-domains = <&pd_nvenc>;
 		};
 
 		tsec@54500000 {
@@ -894,6 +906,18 @@ pd_audio: aud {
 				#power-domain-cells = <0>;
 			};
 
+			pd_nvenc: mpe {
+				clocks = <&tegra_car TEGRA210_CLK_NVENC>;
+				resets = <&tegra_car 219>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_nvdec: nvdec {
+				clocks = <&tegra_car TEGRA210_CLK_NVDEC>;
+				resets = <&tegra_car 194>;
+				#power-domain-cells = <0>;
+			};
+
 			pd_sor: sor {
 				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
 					 <&tegra_car TEGRA210_CLK_SOR1>,

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-tegra210-media-enable-576bb6a34b5c

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



