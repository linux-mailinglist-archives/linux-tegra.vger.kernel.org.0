Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BB320BE8D
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 06:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgF0Ezd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 00:55:33 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17397 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgF0Ezd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 00:55:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef6d1370000>; Fri, 26 Jun 2020 21:55:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 21:55:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:32 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:32 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:32 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef6d13f0000>; Fri, 26 Jun 2020 21:55:31 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 14/23] ASoC: soc-core: Probe auxiliary component before others
Date:   Sat, 27 Jun 2020 10:23:36 +0530
Message-ID: <1593233625-14961-15-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593233719; bh=kupu78+RlIzVp6swUHdt7ySzHcwXFYGpxZH6mlh5V08=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=ODeC6E/pm6bVQyWRVxz1At0w/yx8+MIF7i+jrqRFkq2WnVRWV6lPmZx0tn89UKOY+
         /4jE47M6aV81IX45h0fFvYKxX2p/hTik1PueRQZ5ywJlMg5Iy6ZgGBnzskMxrJ0R38
         RfSy0fbpnNILRMK5kC9v5JbIWaWtjPfeOtMB8ElKsjqeyaXXTa3rC/LKscMOBMWj80
         p8C2f5DrPr1k76GJNuoYOl4s+nPgPZ30ZE14egl7JSfKFImCk71pg5ny0uUIx41FQj
         xcXfv6V2sgZLlt+rrXRJ0roeynemEaBNXgWaliiutHM5JaeOtl1q0sYJ31EXSU9uHK
         11aqOCJFRpY4g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A router component can be added as an auxiliary device to the sound card
to help with audio routing across multiple components. DPCM dai links
use CPU<->Dummy or Dummy<->Codec style of links in simple-card driver and
hence do not have required DAI connections by default. Usually machine
driver can do the necessary mapping.

But if there is a crossbar switch HW which can connect multiple components,
it is expected to provide required user space configurability via MUX
controls. In such a case the crossbar can be represented as an independent
component and can be added as an auxiliary device. The exposed routing
interfaces can be used by other components in the system, thus probing it
first can avoid probe failures.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8faca60..9041a03 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1850,19 +1850,19 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	/* probe all components used by DAI links on this card */
-	ret = soc_probe_link_components(card);
+	/* probe auxiliary components */
+	ret = soc_probe_aux_devices(card);
 	if (ret < 0) {
 		dev_err(card->dev,
-			"ASoC: failed to instantiate card %d\n", ret);
+			"ASoC: failed to probe aux component %d\n", ret);
 		goto probe_end;
 	}
 
-	/* probe auxiliary components */
-	ret = soc_probe_aux_devices(card);
+	/* probe all components used by DAI links on this card */
+	ret = soc_probe_link_components(card);
 	if (ret < 0) {
 		dev_err(card->dev,
-			"ASoC: failed to probe aux component %d\n", ret);
+			"ASoC: failed to instantiate card %d\n", ret);
 		goto probe_end;
 	}
 
-- 
2.7.4

