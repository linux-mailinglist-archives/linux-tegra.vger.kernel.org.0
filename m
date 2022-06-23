Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9590557B41
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jun 2022 14:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbiFWMyF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jun 2022 08:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbiFWMyE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jun 2022 08:54:04 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA7241321;
        Thu, 23 Jun 2022 05:54:03 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeY013924;
        Thu, 23 Jun 2022 07:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=SrABh16h3tGxB1yv98FDK9mGxjpUcpJfHk25js15UBw=;
 b=bGFTo1A3U3+TFxMwz7u/b1vKxG1+2CNOmGsEDTmpDPyKm8ziRDwfJvpxIQzggR7/CLLc
 oYQJgSfLeMb5G5BhLVzQn+2ydZg5mro7ruviNwvodWtrOUZPA73Jl5G38bBp4yLcNiIT
 D/kxVZLG7k+2/vrt3BYdomBziyDQQqE8ZVtMo+kJ1Z/SfmJkwDNygBaAWHQoIuqvjiu5
 A4lKP17PQMGV3XcTMruywCMJw0/w9cm6oQWCQL8Jxo7TskOjXkofHwDcruA0lN5K/KpU
 OxBhsH41qFFwQxtC2ZKGHA4vD+T/GxyntiSqCGOPSkkKjqVGUgq+sAP4hxXJujc2Mf1X bw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B176A11D1;
        Thu, 23 Jun 2022 12:52:57 +0000 (UTC)
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
Subject: [PATCH v2 78/96] ASoC: hdmi-codec: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:52:32 +0100
Message-ID: <20220623125250.2355471-79-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MtCncSoXQqkeNMtMFSVTvaxfeze7GvIs
X-Proofpoint-ORIG-GUID: MtCncSoXQqkeNMtMFSVTvaxfeze7GvIs
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/hdmi-codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 7d1e351f863a4..5679102de91f8 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -977,7 +977,6 @@ static const struct snd_soc_component_driver hdmi_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 	.set_jack		= hdmi_codec_set_jack,
 };
 
-- 
2.30.2

