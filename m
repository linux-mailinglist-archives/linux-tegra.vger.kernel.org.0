Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645B2308C79
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Jan 2021 19:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhA2S3W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Jan 2021 13:29:22 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14403 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbhA2S2u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:28:50 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453b90000>; Fri, 29 Jan 2021 10:28:09 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:09 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:05 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
Subject: [PATCH v2 4/9] ASoC: rt5659: Add Kconfig prompt
Date:   Fri, 29 Jan 2021 23:57:41 +0530
Message-ID: <1611944866-29373-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944889; bh=F/BW7PY5izzMMJY0fLuFBv2E9jr38z5576WRI7J2fI4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=nHr8zObCaCY6pG1yyuNQjsFsK4HACEtNZlOEi+9wFF+5YeulwGrvqumXM3dKSTu0y
         j8dKgOt7hm7jV0t2JGxZLGbW2fk4n2srPAlwHhuT081rRHLsafHByHjj7/C/wIYNYs
         yA2wbM5gUG1OgNMmNu+cVxW/cwgpef2vTQCYrRc7z3SOQpfQZ6uqevHEgDopyRmrch
         SwDmps+lFqyyJZvXoqm/wn4AsuYA+mf9E8Z6uui/pmRtSxlYzo3MI3IjYiNQi+Pr3F
         G8BYUSrzzt9omitztdGp+x9Npznp6J2S5rdRImZHJnVWIfIZKNtqqOGTp8lVHuEAi3
         US7ukp7XQzn4A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add tristate prompt to allow codec selection.

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9bf6bfd..df34b3b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1162,7 +1162,7 @@ config SND_SOC_RT5651
 	depends on I2C
 
 config SND_SOC_RT5659
-	tristate
+	tristate "Realtek RT5658/RT5659 Codec"
 	depends on I2C
 
 config SND_SOC_RT5660
-- 
2.7.4

