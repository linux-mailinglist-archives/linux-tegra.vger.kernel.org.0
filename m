Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4198C1C866B
	for <lists+linux-tegra@lfdr.de>; Thu,  7 May 2020 12:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEGKN7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 7 May 2020 06:13:59 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17306 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEGKN7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 May 2020 06:13:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb3df1f0001>; Thu, 07 May 2020 03:12:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 07 May 2020 03:13:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 07 May 2020 03:13:58 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 May
 2020 10:13:58 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 7 May 2020 10:13:58 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.75]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb3df650003>; Thu, 07 May 2020 03:13:57 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra194
Date:   Thu, 7 May 2020 11:13:48 +0100
Message-ID: <20200507101349.14118-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588846367; bh=t9gTwozOHgg3m7gBcwlx21hE4YpD6u1BNNY3CUGg+k4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=MR64uQqkBuww9e31bIAcVAfkIszmx0unZ6qP2Y4tVT4z5WHIDbubGOcuD0RoXJZGo
         HUq9pdKyq9PzD3PivQO7EwjccQ8vFNgX9xwXHGKLRkZvZhiPj+WU3AXME7UERozqxt
         MpbbASiNwXUmVrSjChp1kNtpMAzPXevlgtu2J0NtW24OXz23Yk5e/b8nEmpZFUzMYO
         +HZN0vxVeet6rjNfxTkHtlp3qJTjgQiUm8K1eey1SWqsyvBhhltykyiryvFqEl16NH
         ioAzshbYVZc+8O6sDALx/YKPkF0++UCvIhm7Od3GyGYzD4sawWK+OhsBJFdOkrp9+U
         M+Pf83yOAL7Ig==
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
index 72cfda7305d5..8169737c3252 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3326,6 +3326,7 @@ static const char * const tegra194_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra194_wake_events[] = {
+	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
 };
-- 
2.17.1

