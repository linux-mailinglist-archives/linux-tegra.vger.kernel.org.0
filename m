Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D31B255247
	for <lists+linux-tegra@lfdr.de>; Fri, 28 Aug 2020 03:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgH1BMT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 27 Aug 2020 21:12:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6745 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbgH1BMN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Aug 2020 21:12:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4859df0000>; Thu, 27 Aug 2020 18:11:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Aug 2020 18:12:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Aug 2020 18:12:13 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 01:12:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Aug 2020 01:12:09 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.101.4]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4859e70000>; Thu, 27 Aug 2020 18:12:08 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 07/12] arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
Date:   Fri, 28 Aug 2020 09:10:51 +0800
Message-ID: <20200828011056.1067559-8-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828011056.1067559-1-jckuo@nvidia.com>
References: <20200828011056.1067559-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598577119; bh=ULNJL432P9gTH+qGQQEOhfds0zQ9eDoNC9eYcP0k/AM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=TF6l2YFWFo+kbP7Gy0fnvBNTSIxfbX96sVWoXGOpU3pzBqjOn0+IYYVrJKjmFFsJx
         0vlS/i6CzML1vJ0F9jfoD7fH+VbntBEgA1iYYk7yvEBBRM+TKfNvDinfQtPbGDOw7J
         BaajsNDQZ4gpuIiSJbjyRsH6hEHMkFVsQiFtYy98j06YWPC2KXfeRlRI2xblqxn0sN
         PTvJC2fiqrXMbG+csZnUPifZx9zeE5bAiNhemSDU+3a3UPFnGwIBEZZlgHsgM4ykpt
         2koX/8hnbIlGB06x2m2hI5KRGMml4z3cV6zURnHwW+uFPm6QeRP5SxTrwkFuEP1bKo
         Mz0fmuiO0ZMTQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PMC driver provides USB sleepwalk registers access to XUSB PADCTL
driver. This commit adds a "nvidia,pmc" property which points to
PMC node to XUSB PADCTL device node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index 829f786af133..67c90a0ea32e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1040,6 +1040,7 @@ padctl: padctl@7009f000 {
 		reg =3D <0x0 0x7009f000 0x0 0x1000>;
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
+		nvidia,pmc =3D  <&tegra_pmc>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

