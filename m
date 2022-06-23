Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BE3557C06
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jun 2022 14:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbiFWM4O (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jun 2022 08:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbiFWM4N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jun 2022 08:56:13 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0084B1E4;
        Thu, 23 Jun 2022 05:56:12 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrH011978;
        Thu, 23 Jun 2022 07:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ywxDxyPYvrEKuL+MgnDui0khdcCuhp+qKYexP3Zb2Og=;
 b=kgQdfvml6vNlK7I4SolDV0dZCd70xzu5KYKxlszTFbG9gw/p2Z0ikusWw0nyZ+iNUFbd
 Z2uLW8oYM683WcAc8mifm2XfP28bRLrLrp09NRfaGNCofhui4wElhTxO5Y/KyTLeWTt5
 C5eu0R8ZZPd5SBvGkjGIrD5aY1DmdjnmvBw0vGNga0YaMcD4ORzq4nbhm4BJB8wInK/G
 1Ls/+eDAO6IJEIwipluwicV33ehV4JfxREIw9/mxNiAttdum4kh/gxw1nfxtKf6GuegG
 kZMcaNABq3KC4MezE9Cjz1lK7MnbAiXTXhnvbWEEbIeQyODJgh+FmC71ksuzfT7uqNUl 6w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 840BA11D1;
        Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 31/96] ASoC: ti: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:45 +0100
Message-ID: <20220623125250.2355471-32-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uE_-9GLACIYYUOTGbMgZX2cy_035BnIV
X-Proofpoint-ORIG-GUID: uE_-9GLACIYYUOTGbMgZX2cy_035BnIV
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/ti/davinci-i2s.c   | 3 ++-
 sound/soc/ti/davinci-mcasp.c | 3 ++-
 sound/soc/ti/davinci-vcif.c  | 3 ++-
 sound/soc/ti/omap-dmic.c     | 3 ++-
 sound/soc/ti/omap-hdmi.c     | 1 +
 sound/soc/ti/omap-mcbsp.c    | 3 ++-
 sound/soc/ti/omap-mcpdm.c    | 7 ++++---
 7 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index fe572b720b094..e6e77a5f3c1e7 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -640,7 +640,8 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver davinci_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static int davinci_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index e2aab4729f3ab..45ffcc7aadc93 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1765,7 +1765,8 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 };
 
 static const struct snd_soc_component_driver davinci_mcasp_component = {
-	.name		= "davinci-mcasp",
+	.name			= "davinci-mcasp",
+	.legacy_dai_naming	= 1,
 };
 
 /* Some HW specific values and defaults. The rest is filled in from DT. */
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index f810123cc4070..36fa97e2b9e22 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -185,7 +185,8 @@ static struct snd_soc_dai_driver davinci_vcif_dai = {
 };
 
 static const struct snd_soc_component_driver davinci_vcif_component = {
-	.name		= "davinci-vcif",
+	.name			= "davinci-vcif",
+	.legacy_dai_naming	= 1,
 };
 
 static int davinci_vcif_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index f3eed20611a3f..825c70a443dad 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -453,7 +453,8 @@ static struct snd_soc_dai_driver omap_dmic_dai = {
 };
 
 static const struct snd_soc_component_driver omap_dmic_component = {
-	.name		= "omap-dmic",
+	.name			= "omap-dmic",
+	.legacy_dai_naming	= 1,
 };
 
 static int asoc_dmic_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 3328c02f93c74..0dc0475670ffe 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -275,6 +275,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 
 static const struct snd_soc_component_driver omap_hdmi_component = {
 	.name = "omapdss_hdmi",
+	.legacy_dai_naming = 1,
 };
 
 static struct snd_soc_dai_driver omap5_hdmi_dai = {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 58d8e200a7b97..76df0e7844f8f 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1317,7 +1317,8 @@ static struct snd_soc_dai_driver omap_mcbsp_dai = {
 };
 
 static const struct snd_soc_component_driver omap_mcbsp_component = {
-	.name		= "omap-mcbsp",
+	.name			= "omap-mcbsp",
+	.legacy_dai_naming	= 1,
 };
 
 static struct omap_mcbsp_platform_data omap2420_pdata = {
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index fafb2998ad0df..0b18a7bfd3fd7 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -524,9 +524,10 @@ static struct snd_soc_dai_driver omap_mcpdm_dai = {
 };
 
 static const struct snd_soc_component_driver omap_mcpdm_component = {
-	.name		= "omap-mcpdm",
-	.suspend	= omap_mcpdm_suspend,
-	.resume		= omap_mcpdm_resume,
+	.name			= "omap-mcpdm",
+	.suspend		= omap_mcpdm_suspend,
+	.resume			= omap_mcpdm_resume,
+	.legacy_dai_naming	= 1,
 };
 
 void omap_mcpdm_configure_dn_offsets(struct snd_soc_pcm_runtime *rtd,
-- 
2.30.2

