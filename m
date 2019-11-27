Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB7010A9AA
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Nov 2019 06:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfK0E7u (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 26 Nov 2019 23:59:50 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17880 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfK0E7t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Nov 2019 23:59:49 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dde02c70000>; Tue, 26 Nov 2019 20:59:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 26 Nov 2019 20:59:47 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 26 Nov 2019 20:59:47 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 04:59:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 27 Nov 2019 04:59:47 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.169.149]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dde02c20000>; Tue, 26 Nov 2019 20:59:47 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <allison@lohutok.net>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <mturquette@baylibre.com>,
        <horms+renesas@verge.net.au>, <Jisheng.Zhang@synaptics.com>,
        <krzk@kernel.org>, <arnd@arndb.de>, <spujar@nvidia.com>,
        <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/11] ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc
Date:   Tue, 26 Nov 2019 20:59:33 -0800
Message-ID: <1574830773-14892-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574830791; bh=qTvAji4nlSTfeFg4MTzoqwXKbO75ceIOy1l+c/njykQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DX9p2d4BWmAjL6PqXaAC5V0B7ZJSrOBVEfVYpIaH6fFGwVc4/MGUh0FR8doMo8Pv9
         efq5hILPLn0AoXC4W3eorlApWwRbltVOMTCZNRdMNblcYfMe+ei8anssrs6aD7JYGp
         9jXD+pPNUdJGfH2ONYbQHfpKVK28z0XeHtdlCO+6769wHlxBjeffcDD9L4ZjcWJXep
         b5EO2XZBetawG4l0TI/75+8uI621hJEQK9aa/opQiISsvTUFqiMlJ6I41OVjqWgDnG
         +dbxbv/jrEa0csUlpkY2ikavgb2zrhnIvOpBRsfB/samUV/QWiL4ZkTIfb3xXnmU9L
         Hn5uQ10ABgsUA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra clk_out_1, clk_out_2, and clk_out_3 are part of PMC block and pmc is
the provider for these clocks.

Update bindings document to use pmc as clock provider for clk_out_2 and
change id to pmc clock id.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nau8825.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
index d16d96839bcb..487eb9574ee2 100644
--- a/Documentation/devicetree/bindings/sound/nau8825.txt
+++ b/Documentation/devicetree/bindings/sound/nau8825.txt
@@ -101,5 +101,5 @@ Example:
       nuvoton,crosstalk-enable;
 
       clock-names = "mclk";
-      clocks = <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
+      clocks = <&pmc TEGRA_PMC_CLK_OUT_2>;
   };
-- 
2.7.4

