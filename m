Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4DE315FA1
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Feb 2021 07:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhBJGok (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Feb 2021 01:44:40 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5336 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhBJGoi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 01:44:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B602380ae0000>; Tue, 09 Feb 2021 22:43:58 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 06:43:58 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Feb 2021 06:43:54 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh@kernel.org>, <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Date:   Wed, 10 Feb 2021 12:13:39 +0530
Message-ID: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612939438; bh=oIcJTkF8o+UyabRBM1FZyyLrleEGr1F64S3BfjTrJu4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=JZ6Lg0QEYSGJplep/7/CxpyzFKty52rnRXOW0aZ9E2ZrWjSFfJRKhhJSU9wA73UwW
         58e/wbdB3IqtMpNyaZ7LjHhMz9rJp/Kil7ujR6oRlVpSJlfWq5yXim9zxhcMUqGecf
         iGMVGdPGhxjVcBqOJby6WqIEYlPnZ+d2NSz5a/huC83zAJuR6kaHM3xo8akbzwDzIF
         sORp+eNOTV25o5AUwMkZR7L8qk09+xcnVF2Mk6HOrLklxgeEzScbmR/yTv8pnrA3Aw
         yJHx/6O2r3lZuPYCR3nuC4WSFzcypWi+8lg1qzGrvvAmDHCL7NXsAxSuNwi2ADPvFx
         voXJQ1bdmKx8g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If "clocks = <&xxx>" is specified from the CPU or Codec component
device node, the clock is not getting enabled. Thus audio playback
or capture fails.

Fix this by populating "simple_dai->clk" field when clocks property
is specified from device node as well. Also tidy up by re-organising
conditional statements of parsing logic.

Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add asoc_simple_card_parse_clk()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card-utils.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bc0b62e..0754d70 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
 	 *  or device's module clock.
 	 */
 	clk = devm_get_clk_from_child(dev, node, NULL);
-	if (!IS_ERR(clk)) {
-		simple_dai->sysclk = clk_get_rate(clk);
+	if (IS_ERR(clk))
+		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
 
+	if (!IS_ERR(clk)) {
 		simple_dai->clk = clk;
-	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
+		simple_dai->sysclk = clk_get_rate(clk);
+	} else if (!of_property_read_u32(node, "system-clock-frequency",
+					 &val)) {
 		simple_dai->sysclk = val;
-	} else {
-		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
-		if (!IS_ERR(clk))
-			simple_dai->sysclk = clk_get_rate(clk);
 	}
 
 	if (of_property_read_bool(node, "system-clock-direction-out"))
-- 
2.7.4

