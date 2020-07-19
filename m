Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B05D224FA6
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgGSFKy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:10:54 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4639 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGSFKy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:10:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d5a10000>; Sat, 18 Jul 2020 22:09:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:10:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 22:10:53 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:10:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:10:53 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d5d80002>; Sat, 18 Jul 2020 22:10:53 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple endpoints
Date:   Sun, 19 Jul 2020 10:40:10 +0530
Message-ID: <1595135417-16589-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595135393; bh=IQlK96/RLPdpEAiXfNPlP7nM1ld3WcJT6cego6KI2FA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=LIbzgJd2p1LajQMZBTEYpLmcVs0GFAoawdRHl4VRVjAeBxatmdM5Ue5Th8E4E1VtO
         0w1wxE16PmmQKIKDvLpYDE+Bk/euGPN65RgJv4A8yZkPDc9rLlfCfBmZJpo+7XJjzc
         3qKF3ujedOVaINW0M3+oOYc60Ta91FsBgBZq67an6si1pTQdpQbw7X7xmAaO6Uyb7F
         qRQ2JyyBim2xGdqtU4G3x6LA00pCGtG6/Ty+729AcZ45nKhYRl0wzLtXl1i2yoSEnr
         9DT0vaShq3QN7IqChWy+9RgbTm+WBYHaMxO47GZLsEaokhMnqVKEx0bGmUQEKR3YUg
         0GPanwvJla+Kw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If a Codec port has multiple endpoints, only first endpoint gets parsed
and remaining are ignored. This can be fixed by removing 'dup_codec' flag
passed to graph_dai_link_of_dpcm() and thus it loops over all endpoints
of Codec. Similarly graph_count_dpcm() is updated as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1e20562..b1903f9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
 static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				  struct device_node *cpu_ep,
 				  struct device_node *codec_ep,
-				  struct link_info *li,
-				  int dup_codec)
+				  struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
@@ -217,10 +216,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link_component *codecs = dai_link->codecs;
 	int ret;
 
-	/* Do it all CPU endpoint, and 1st Codec endpoint */
-	if (!li->cpu && dup_codec)
-		return 0;
-
 	port	= of_get_parent(ep);
 	ports	= of_get_parent(port);
 	node	= of_graph_get_port_parent(ep);
@@ -415,7 +410,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *cpu_ep,
 					 struct device_node *codec_ep,
-					 struct link_info *li, int dup_codec))
+					 struct link_info *li))
 {
 	struct of_phandle_iterator it;
 	struct device *dev = simple_priv_to_dev(priv);
@@ -424,7 +419,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
-	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	int rc, ret;
@@ -457,8 +451,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			if (dpcm_selectable &&
 			    ((of_get_child_count(codec_port) > 1) ||
 			     adata.convert_rate || adata.convert_channels))
-				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
-						(codec_port_old == codec_port));
+				ret = func_dpcm(priv, cpu_ep, codec_ep, li);
 			/* else normal sound */
 			else
 				ret = func_noml(priv, cpu_ep, codec_ep, li);
@@ -468,8 +461,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 
 			if (ret < 0)
 				return ret;
-
-			codec_port_old = codec_port;
 		}
 	}
 
@@ -532,19 +523,18 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 static int graph_count_dpcm(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
-			    struct link_info *li,
-			    int dup_codec)
+			    struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
+	/* CPU */
 	li->link++; /* 1xCPU-dummy */
 	li->dais++; /* 1xCPU */
 
-	if (!dup_codec) {
-		li->link++; /* 1xdummy-Codec */
-		li->conf++; /* 1xdummy-Codec */
-		li->dais++; /* 1xCodec */
-	}
+	/* Codec */
+	li->link++; /* 1xdummy-Codec */
+	li->conf++; /* 1xdummy-Codec */
+	li->dais++; /* 1xCodec */
 
 	dev_dbg(dev, "Count As DPCM\n");
 
-- 
2.7.4

