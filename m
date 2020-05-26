Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07021DB7D9
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2020 17:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETPN2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 May 2020 11:13:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12583 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETPN2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 May 2020 11:13:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec548c90000>; Wed, 20 May 2020 08:12:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 20 May 2020 08:13:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 20 May 2020 08:13:27 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 15:13:27 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 15:13:27 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.44]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec549150002>; Wed, 20 May 2020 08:13:26 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra210
Date:   Wed, 20 May 2020 16:13:17 +0100
Message-ID: <20200520151318.15493-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589987529; bh=QGwdxLviP/l+bdVuaJlzsUL4fMWcBhpCkeQe+bGHGC8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=kEl7UXjAJeUndHt7xgWWNcwMh4z2XIlvzfErAN5G/ObpYh7/LCWiXh+ySCz2ekSI/
         KDLEwg+TNArfKb9wQh3kSvYjatCc6oExvMb0IOeSZVxRZtXKmtqPRSKknBzY4leleO
         6rz/ImwC+Bl7yMFnmlGTLv6/Khvo2RC5L9mksFU67uUOTojxNJU/1sLPzRkQzox/e3
         OwVu7c6MwWEl53mgup2wSQc7djyCAbBKFVNWM9OXmIUHR1yUF0KHcUsdDhE9X9t5tm
         Ah5FzoHG5JbinSftoB3u+DSD/POQ+qmxgf9S2ZVc+OtNF3acFcQziZ9/pDX7O/71Fk
         l7/W6V3Kqzj0Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The PMIC wake event can be used to bring the system out of suspend based
on certain events happening on the PMIC (such as an RTC alarm).

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8169737c3252..42cf37a0556b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3063,6 +3063,7 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 
 static const struct tegra_wake_event tegra210_wake_events[] = {
 	TEGRA_WAKE_IRQ("rtc", 16, 2),
+	TEGRA_WAKE_IRQ("pmu", 51, 86),
 };
 
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
-- 
2.17.1

