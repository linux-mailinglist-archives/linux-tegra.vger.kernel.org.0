Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C79D30F437
	for <lists+linux-tegra@lfdr.de>; Thu,  4 Feb 2021 14:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236124AbhBDNvo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 4 Feb 2021 08:51:44 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10667 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbhBDNvP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 08:51:15 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601bfba90000>; Thu, 04 Feb 2021 05:50:33 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:33 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:30 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 1/3] ASoC: audio-graph: Rename functions needed for export
Date:   Thu, 4 Feb 2021 19:20:10 +0530
Message-ID: <1612446612-32613-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
References: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612446633; bh=jcj/sWYDH6F6INwt5+Upmxiy3TusPMPo5cYStrLeSR0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=pY3N+yBR18UC2whKUbZxUK1JDJdz43+tmcqPLntNqjO+WSomloNfQCbBAEegNIPM/
         3IIWMh1JxOC/59hpXaLyt+cTR2Y6hVhj7sitXGmPeIyPV50LK9VYRiDeuf1qHxDmV3
         F+itQrU6wgn8Ii69WEC4Oc/u1SjtLFlz9kKIDmMllIGH9Q+N8R73sin8kPzt9So0ye
         LJ6/HJVbjeFFi95N02GEXHcgjAdwW6fFB3tEVDz0xBuJ7d1/JEkltHyB6qSU4vH2jh
         gMhp1cRCAZYYAyffm2e8FWs13Z9V3+aTY+nLEHzfOs7UHG0pw+WLV8ULu8XS7MvNrd
         UMVsbyR0FckuQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following functions are renamed for a better global visibility.
  graph_card_probe() --> audio_graph_card_probe()
  graph_parse_of()   --> audio_graph_parse_of()
  graph_remove()     --> audio_graph_remove() [exported as well]

The references in header and source files of audio graph are
updated to make use of above.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h           |  6 ++++--
 sound/soc/generic/audio-graph-card.c | 17 +++++++++--------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
index bbb5a13..0137844 100644
--- a/include/sound/graph_card.h
+++ b/include/sound/graph_card.h
@@ -9,8 +9,10 @@
 
 #include <sound/simple_card_utils.h>
 
-int graph_card_probe(struct snd_soc_card *card);
+int audio_graph_card_probe(struct snd_soc_card *card);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+
+int audio_graph_remove(struct platform_device *pdev);
 
 #endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 16a04a6..8c5cdcd 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -532,7 +532,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 static void graph_get_dais_count(struct asoc_simple_priv *priv,
 				 struct link_info *li);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info li;
@@ -608,7 +608,7 @@ int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(graph_parse_of);
+EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
@@ -705,7 +705,7 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 		li->link, li->dais, li->conf);
 }
 
-int graph_card_probe(struct snd_soc_card *card)
+int audio_graph_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -720,7 +720,7 @@ int graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(graph_card_probe);
+EXPORT_SYMBOL_GPL(audio_graph_card_probe);
 
 static int graph_probe(struct platform_device *pdev)
 {
@@ -736,20 +736,21 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= graph_card_probe;
+	card->probe		= audio_graph_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
 
-	return graph_parse_of(priv, dev);
+	return audio_graph_parse_of(priv, dev);
 }
 
-static int graph_remove(struct platform_device *pdev)
+int audio_graph_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	return asoc_simple_clean_reference(card);
 }
+EXPORT_SYMBOL_GPL(audio_graph_remove);
 
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
@@ -766,7 +767,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove = graph_remove,
+	.remove = audio_graph_remove,
 };
 module_platform_driver(graph_card);
 
-- 
2.7.4

