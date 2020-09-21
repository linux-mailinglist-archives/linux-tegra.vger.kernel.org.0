Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB77D2726A0
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Sep 2020 16:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgIUOIO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Sep 2020 10:08:14 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38462 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgIUOIN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 10:08:13 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 10:08:06 EDT
IronPort-SDR: n8pD20GNLffWzboRLDbRzCVNE4W4pLX6WaB7dZcD9UZ4veeAqCMWjSQzRpOB3maAWYIoD0tXmj
 0zcPqVIe1Fc0HTfVH7n4fiT1kWGB/KhPJRf78RnMPV0cNZidjPBWgILW9poFu52NlQtxcS8Avw
 P0T8Ge6gTIQ+pgZ9GA2/rSDeuKhdOidm/qMoO0y0+Zna18HKDzL+XMF9Nld/BE0wfVqOsX0u4t
 sFSM87J+qn6ec/uiV7VPmJFaOkFtQwirGGrVrZUnwV6CwM8I3U9r7RrhwNyf6lIMboqC+EefJG
 gOw=
X-IronPort-AV: E=Sophos;i="5.77,286,1596528000"; 
   d="scan'208";a="55324410"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 21 Sep 2020 06:01:06 -0800
IronPort-SDR: 6EZw5DvP9srZuzLxpq1xgqQ8Ucli4Lwnj9bIiu2OAO5DMPI5q2bKomkfweljQfQaMOto63AbBs
 quYizmIEq6xgNsBkdhY0kQFanejCQldWSiZpmfRI/qiv14qHd8sVq4OgnsNToXOGI8KNvyEJSv
 /mCCpCWcq+y1BYW7g+nXXR0AqY0WwEvB53FwmIoHkXW2bf5O1fT+V/5qQ8vAQ3icbM0d8FBiDa
 kuz+CVZfqAP/E6qoLMrJNn0n+HkIYN4N+YGpNRd8Ua8zOxEKsv6DGyRMPjCMCA4qhWNFpgI+oy
 gts=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v1 3/3] ARM: tegra: add mXT1386 compatible
Date:   Mon, 21 Sep 2020 23:00:54 +0900
Message-ID: <20200921140054.2389-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921140054.2389-1-jiada_wang@mentor.com>
References: <20200921140054.2389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add mXT1386 compatible for "touchscreen@4c".

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 2d683c9a1a5d..7915b6e9190e 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -428,7 +428,7 @@
 		};
 
 		touchscreen@4c {
-			compatible = "atmel,maxtouch";
+			compatible = "atmel,mXT1386", "atmel,maxtouch";
 			reg = <0x4c>;
 
 			atmel,cfg_name = "maxtouch-acer-iconia-tab-a500.cfg";
-- 
2.17.1

