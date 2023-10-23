Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F087D2F1F
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Oct 2023 11:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbjJWJ4M (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Oct 2023 05:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbjJWJzj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:39 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205291BC3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40790b0a224so24135195e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054907; x=1698659707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=DuW7m69MJUZyDMMaLEHKeDXQ6wD+G61sC8fZ16YyymVEqlNXVe7AnBKFDSmXP3XCKH
         JRnr9kpslZm7Gf3TeA98V+nyedTM85hSGzi9FGY/m21Sr0YhyOgCZReGf8p61anwclUI
         qG8i/WBSKvflG3tTFFfL+cF+y0z5ZOsvrSdJiLTNXfvqy4p8Uf3f4ds0lx4CE4RdddSy
         Dp9CisqOqmN5feVp6vZiQ7dIDLiNt89GWe2mJ/8XnnExPhPoRcjfCaQekjALMW8ImDii
         sos2+sb4/AvUpJkJE7YmjSKT6puWXianmfGI2yHny1CeWfsWEEAcJjR1keoI4T7D1mF/
         Gpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054907; x=1698659707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=ssmscN3n0AnS+V1aUw/nNrtyl8ycY5x/9kwFG68C23heoHbJqP2gs6dkIR0t1KVCRR
         Rl5QcQS8aI4EaOH4GlPN7Ezjwy51ZrT5Y6IxR1tDYk6nbBOQbiyuBEXI5lX7YKZdZ8Qf
         vilBmxgUs1FoG20eFCwShzgb1vC11E0TB6wpK7oGqb9/v6/BizhbMi2I3XmR/RIApOfV
         jXNCItK/12U55GR9dQQqlMBefeXFEXxgHH6tD4p8k7/01BWjQW9gFq1buKYzWcU9i9H4
         8b1MdYkmyHh1Ge6SuDYTChCMUjAcr7KK2NdCOlBht3Mc1PbqjgQml8Ep43crvoKvrMZt
         C1jQ==
X-Gm-Message-State: AOJu0YxfhwlDuD30nMPq0gc2Z2Suyd4F7a9rDCdlai57KZtaVIdlzNky
        btK0rye8LOPa1ujtpTl6ewbajQ==
X-Google-Smtp-Source: AGHT+IG0DaJTatBkYQl759RhB3DEXbNMmxDZLlPU/SGS2hOJRk1TRuMc/RVGopj7Uuqttkf+UNyBLw==
X-Received: by 2002:adf:cf11:0:b0:32d:967d:1baf with SMTP id o17-20020adfcf11000000b0032d967d1bafmr5476727wrj.1.1698054907228;
        Mon, 23 Oct 2023 02:55:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 15/17] ASoC: mediatek: mt8192: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:26 +0200
Message-Id: <20231023095428.166563-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 4919535e2759..36d33032a37a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -435,7 +435,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 			regmap_write(afe->regmap, AFE_ADDA6_MTKAIF_CFG0,
 				     0x00010000);
 
-			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0 &&
+			if (snd_soc_dapm_widget_name_cmp(w, "ADDA_MTKAIF_CFG") == 0 &&
 			    (afe_priv->mtkaif_chosen_phase[0] < 0 ||
 			     afe_priv->mtkaif_chosen_phase[1] < 0)) {
 				dev_warn(afe->dev,
@@ -444,7 +444,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 					 afe_priv->mtkaif_chosen_phase[0],
 					 afe_priv->mtkaif_chosen_phase[1]);
 				break;
-			} else if (strcmp(w->name, "ADDA6_MTKAIF_CFG") == 0 &&
+			} else if (snd_soc_dapm_widget_name_cmp(w, "ADDA6_MTKAIF_CFG") == 0 &&
 				   afe_priv->mtkaif_chosen_phase[2] < 0) {
 				dev_warn(afe->dev,
 					 "%s(), mtkaif_chosen_phase[2]:%d\n",
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index ea516d63d94d..47dc7ec4cae7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -623,13 +623,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_enable(afe);
 		else
 			mt8192_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_disable(afe);
 		else
 			mt8192_apll2_disable(afe);
-- 
2.34.1

