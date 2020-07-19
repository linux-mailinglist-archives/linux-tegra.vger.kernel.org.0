Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5D7224FA2
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgGSFKo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:10:44 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6632 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGSFKn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:10:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d55d0000>; Sat, 18 Jul 2020 22:08:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:10:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:10:43 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:10:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:10:43 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d5ce0000>; Sat, 18 Jul 2020 22:10:42 -0700
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
Subject: [PATCH 01/10] ASoC: soc-core: Fix component name_prefix parsing
Date:   Sun, 19 Jul 2020 10:40:08 +0530
Message-ID: <1595135417-16589-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595135325; bh=5y7aZKckpYdh2GS8YUFzzQYZi2h0v7YK3voGlENG0MQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ByEz/6BE7eJm2OFQa6CL2MPwS/fluhiCesbfw2n9XrsFvDGjY2W6UNBaUAX3a++Qs
         kYrdjldoOctwjLA7psAqQMSHMoUYwvHYVrM0PIWC0pd2Llh3Co1b7tqATkbXqn54UF
         hSMpmxMA/YHH0LPSYeVC/6aRShbQva6tasPFl1eff1K8IvvM448PWgYGd53uhuhJsU
         v7HoJEgv0hPFqNjE4Q84jOK0jpCvLnxCEBr6BkNFrFW7G/TQTf4ZzUYZGLL5+JROuP
         5mgSci5XZsLqd71aJKqDo0ER+A5Cjka3jArfzEeI+fTgxB/feud3RZFNaFHQzMQFAK
         C/XMg618Lw5Ow==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The "prefix" can be defined in DAI link node or it can be specified as
part of the component node itself. Currently "sound-name-prefix" defined
in a component is not taking effect. Actually the property is not getting
parsed. It can be fixed by parsing "sound-name-prefix" property whenever
"prefix" is missing in DAI link Codec node.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7c58e45..a4efcbe 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1110,7 +1110,8 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
 
-		if (snd_soc_is_matching_component(&map->dlc, component)) {
+		if (snd_soc_is_matching_component(&map->dlc, component) &&
+		    map->name_prefix) {
 			component->name_prefix = map->name_prefix;
 			return;
 		}
-- 
2.7.4

