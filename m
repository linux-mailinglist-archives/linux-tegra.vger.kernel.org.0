Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D0F2B8E33
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Nov 2020 09:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgKSIyc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Nov 2020 03:54:32 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13030 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgKSIyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:32 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632d30001>; Thu, 19 Nov 2020 00:54:43 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:29 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:27 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 09/16] arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
Date:   Thu, 19 Nov 2020 16:53:58 +0800
Message-ID: <20201119085405.556138-10-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776083; bh=k0DbokiEe6Zg3apVTHJW/DhxUgnbrD/2dwXeH5+NX0U=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=QDkJkCDULAk983nSafHdwJcoiLzM75uh0DuSbKlYBXjzMb8kvUG0QQ36yk2op1hp7
         lgXgnfr5dv7e8xx92zoFzYTlKLVpNnt2pB4DfWfqOj830CQqOdOioOk770Fa3pVi8E
         NtBH7hqwHpBFGa9RAfOeLO7tmx/f2jfTmJDWYZHcoS2FFmbLLbRJhq9YH8yG7MS7dm
         eqbh34xOVe8ubEzQPGwYonlsf1U1C2o0yDbiDkyYha2Aj06QTq/FaDu462b7DspLf7
         HDQue0PSjQnfLs3+rwS2n8ngy5AvYxhtu9+fL9ZQdwJg76JN8tK7cg67Uo+oMGEWFW
         fD9F5aFfZ/IxQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PMC driver provides USB sleepwalk registers access to XUSB PADCTL
driver. This commit adds a "nvidia,pmc" property which points to
PMC node to XUSB PADCTL device node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v5:
   no change
v4:
   no change
v3:
   no change

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index d41eb12a2c92..88e778655e99 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1042,6 +1042,7 @@ padctl: padctl@7009f000 {
 		reg =3D <0x0 0x7009f000 0x0 0x1000>;
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
+		nvidia,pmc =3D  <&tegra_pmc>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

