Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2012133D3D
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 04:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFDCfk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 22:35:40 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7721 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDCfk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 22:35:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf5d8fa0000>; Mon, 03 Jun 2019 19:35:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Jun 2019 19:35:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Jun 2019 19:35:39 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 02:35:39 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 02:35:38 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 4 Jun 2019 02:35:38 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cf5d8f90000>; Mon, 03 Jun 2019 19:35:38 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH] arm64: tegra: add CPU cache topology for Tegra186
Date:   Tue, 4 Jun 2019 10:35:35 +0800
Message-ID: <20190604023535.7115-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559615738; bh=AmoNdluQeX3k2IWG+5yEa3tuSV9eSMqeTaMre8hA2sc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=PfvFfsYvBjBPMBICFj850oIPuFNbI+4lWuy3JTXDpYALRFPTyW/PZ/WDU963aAheJ
         u2iCEl8UH+19bNRUw0MAtChrQxGT05vSGpCEu3ZgrrpcnUL8qhmQi0ULJwyfYaDG67
         IQiHUSkkiTdsras+StyU/9LCszNZDqYfrYBmBvYp3ejS9I9fihALc+lVOFq7k9eNxi
         rMIpAZcnX75/LpfmobhOoQzjJQhn/+oYzocXBuk3WEItxQvyDQUAVLLA3piwJ4ayIv
         Oniz63K1DF+i4p80F7ljwuOWa2wZQFF9121SrWOANPQEHcj3GrezYPmVaC+7hKGMPW
         CelZgORJksfWw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra186 has two CPU clusters with its own cache hierarchy. This patch
adds them with the cache information of each of the CPUs.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra186.dtsi
index 426ac0bdf6a6..26055c7f26e7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1128,38 +1128,52 @@
 		cpu@0 {
 			compatible =3D "nvidia,tegra186-denver";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_DENVER>;
 			reg =3D <0x000>;
 		};
=20
 		cpu@1 {
 			compatible =3D "nvidia,tegra186-denver";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_DENVER>;
 			reg =3D <0x001>;
 		};
=20
 		cpu@2 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x100>;
 		};
=20
 		cpu@3 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x101>;
 		};
=20
 		cpu@4 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x102>;
 		};
=20
 		cpu@5 {
 			compatible =3D "arm,cortex-a57";
 			device_type =3D "cpu";
+			next-level-cache =3D <&L2_A57>;
 			reg =3D <0x103>;
 		};
+
+		L2_DENVER: l2-cache0 {
+			compatible =3D "cache";
+		};
+
+		L2_A57: l2-cache1 {
+			compatible =3D "cache";
+		};
 	};
=20
 	bpmp: bpmp {
--=20
2.21.0

