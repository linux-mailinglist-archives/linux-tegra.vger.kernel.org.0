Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC043553B
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 04:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfFEC0t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 22:26:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1183 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfFEC0t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 22:26:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf7285a0000>; Tue, 04 Jun 2019 19:26:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Jun 2019 19:26:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Jun 2019 19:26:48 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Jun
 2019 02:26:47 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Jun 2019 02:26:47 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cf728660001>; Tue, 04 Jun 2019 19:26:47 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2] arm64: tegra: add CPU cache topology for Tegra186
Date:   Wed, 5 Jun 2019 10:26:40 +0800
Message-ID: <20190605022640.17837-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559701595; bh=nGio2hQPbyPHgpqdlNlX34h2VN8FwpEwywSzKj95xdM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=giG6I0zU08LjgT8xnkca9bVZepXcoNPXquIAJBn3gNTjEbwifCj2ulmkfqMgaKLvO
         m6pvTwqzjk9B9qGFmufOO700FAppYpEG72Y/VMu45K3Q+n2U+f7IisLIrB3QMyXNRI
         hDamYNhb8sIe8yoeMaRoRHGgNRdP3p+d3AsuEujNa3wRKj+QlAc5040UfTHDQ9Sp+a
         pOj44C5AXwiw2QgndKmG41gHdUdOHVz8rjbT8s1CwV9AA7K+BgD/Iiz2hosG5NfJqZ
         vnjHOQwGczFkf02VAu4AK2G6kG3rLsv6JE1hpVUazkiTI390Tz+Mhg/l3ZO0+cTkPD
         2/mrMq7M7NeDw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra186 has two CPU clusters with its own cache hierarchy. This patch
adds them with the cache information of each of the CPUs.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v2:
 - add detail cache information
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra186.dtsi
index 426ac0bdf6a6..8759fcfaf4ed 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1128,38 +1128,98 @@
 		cpu@0 {
 			compatible =3D "nvidia,tegra186-denver";
 			device_type =3D "cpu";
+			i-cache-size =3D <0x20000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <512>;
+			d-cache-size =3D <0x10000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_DENVER>;
 			reg =3D <0x000>;
 		};
=20
 		cpu@1 {
 			compatible =3D "nvidia,tegra186-denver";
 			device_type =3D "cpu";
+			i-cache-size =3D <0x20000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <512>;
+			d-cache-size =3D <0x10000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_DENVER>;
 			reg =3D <0x001>;
 		};
=20
 		cpu@2 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			i-cache-size =3D <0xC000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <256>;
+			d-cache-size =3D <0x8000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x100>;
 		};
=20
 		cpu@3 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			i-cache-size =3D <0xC000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <256>;
+			d-cache-size =3D <0x8000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x101>;
 		};
=20
 		cpu@4 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			i-cache-size =3D <0xC000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <256>;
+			d-cache-size =3D <0x8000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x102>;
 		};
=20
 		cpu@5 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			i-cache-size =3D <0xC000>;
+			i-cache-line-size =3D <64>;
+			i-cache-sets =3D <256>;
+			d-cache-size =3D <0x8000>;
+			d-cache-line-size =3D <64>;
+			d-cache-sets =3D <256>;
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x103>;
 		};
+
+		L2_DENVER: l2-cache0 {
+			compatible =3D "cache";
+			cache-unified;
+			cache-level =3D <2>;
+			cache-size =3D <0x200000>;
+			cache-line-size =3D <64>;
+			cache-sets =3D <2048>;
+		};
+
+		L2_A57: l2-cache1 {
+			compatible =3D "cache";
+			cache-unified;
+			cache-level =3D <2>;
+			cache-size =3D <0x200000>;
+			cache-line-size =3D <64>;
+			cache-sets =3D <2048>;
+		};
 	};
=20
 	bpmp: bpmp {
--=20
2.21.0

