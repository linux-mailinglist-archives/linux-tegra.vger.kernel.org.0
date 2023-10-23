Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC76F7D2EF7
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Oct 2023 11:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjJWJyh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Oct 2023 05:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjJWJyg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:36 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD868D6
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2082792f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054873; x=1698659673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=BQ04f7DMLqnlNsZCpxx8cNMpmargO/kTa4BlVArpZSnsagzMVk57237PEawIuyljmS
         FhKYEVqQilaNv1vIb0nfZEEKW9yV9rhwU/Ro2uHR3hyLXWY6S3ViSTAqdt7Ndrs98wSE
         aO6YBnoWNZnhdaxdza/SmKoxZ+lcURlPCpTspvNQ2vvMBkfgV131BwmLK5WHY5LpMHw7
         7zbiDmRxegKPY1TeROoIC/+6U7WePUq++IZuSsGX+TEBhIVfTSC1afALEL7kH6x+By+a
         g5l0yO0OMrUb5YmZZSYQ7prUfgvLPBZS8Dsoh+HLKObaxe1qDdHyobYOqmjlF9/VMITU
         F43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054873; x=1698659673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=Xbm/006m2S116tIQlOQSU45k95xsHcCmmQQ06JC5zAuTApZaVBeSW+v9KOtXIg9JmD
         AjtFKo6zIiFBNVEKqQsAcrdPTp4QUG1JevM89LD3izeKnecvRfwrrU4sydTDb/pApfUG
         sNYoQjhXZdcezHH3HStXhA5zGMZCS2z8lbXfbHhG+erM/VM13Q9z/JPmfNB31GUJ8/Sb
         2M2/uzYahhrgnzxbVM64P7o6dWv0BzAfGKgrY8z2r6drbvym/STf4g9dTKf7t9PFkDsr
         TyjeTHSCHjxxJ4sbRCqrpf6KtLe3zCo8bxhddj97v8k77eaW9wEUeg2KJPFadSjQw19b
         Qxdw==
X-Gm-Message-State: AOJu0YxJWmo1uIl+z/0P73HypPR7kOn0M5HgI4PjfkQ1/gJ8fkEcx1dt
        qlHqOjVsR022jLifwhmGGf1AZQ==
X-Google-Smtp-Source: AGHT+IH4YMgo74ZZgvJQJgKdwM3SfC8BbUD6h8XrLpB46b2XDtd+ZKDWDharijaoUjIIgua9r87kug==
X-Received: by 2002:a5d:4ccf:0:b0:32d:8cd1:52e4 with SMTP id c15-20020a5d4ccf000000b0032d8cd152e4mr6670616wrt.6.1698054873279;
        Mon, 23 Oct 2023 02:54:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:32 -0700 (PDT)
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
Subject: [RFT PATCH 00/17] ASoC: fix widget name comparisons (consider DAI name prefix)
Date:   Mon, 23 Oct 2023 11:54:11 +0200
Message-Id: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Some codec drivers compare widget names with strcmp, ignoring
the component name prefix.  If prefix is used, the comparisons start failing.

Except Qualcomm lpass-rx-macro, none of the patches were tested
on hardware.

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  ASoC: codecs: 88pm860x: Handle component name prefix
  ASoC: codecs: adau1373: Handle component name prefix
  ASoC: codecs: adav80x: Handle component name prefix
  ASoC: codecs: lpass-rx-macro: Handle component name prefix
  ASoC: codecs: max9867: Handle component name prefix
  ASoC: codecs: rt5682s: Handle component name prefix
  ASoC: codecs: rtq9128: Handle component name prefix
  ASoC: codecs: wcd9335: Handle component name prefix
  ASoC: codecs: wm8962: Handle component name prefix
  ASoC: codecs: wm8994: Handle component name prefix
  ASoC: codecs: wm8995: Handle component name prefix
  ASoC: mediatek: mt8183: Handle component name prefix
  ASoC: mediatek: mt8186: Handle component name prefix
  ASoC: mediatek: mt8188: Handle component name prefix
  ASoC: mediatek: mt8192: Handle component name prefix
  ASoC: samsung: speyside: Handle component name prefix
  ASoC: tegra: machine: Handle component name prefix

 sound/soc/codecs/88pm860x-codec.c              |  4 ++--
 sound/soc/codecs/adau1373.c                    |  2 +-
 sound/soc/codecs/adav80x.c                     |  2 +-
 sound/soc/codecs/lpass-rx-macro.c              |  6 +++---
 sound/soc/codecs/max9867.c                     |  8 ++++----
 sound/soc/codecs/rt5682s.c                     |  4 ++--
 sound/soc/codecs/rtq9128.c                     |  6 +++---
 sound/soc/codecs/wcd9335.c                     | 18 +++++++++---------
 sound/soc/codecs/wm8962.c                      |  4 ++--
 sound/soc/codecs/wm8994.c                      |  2 +-
 sound/soc/codecs/wm8995.c                      |  2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     |  4 ++--
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c     |  4 ++--
 sound/soc/samsung/speyside.c                   |  4 ++--
 sound/soc/tegra/tegra_asoc_machine.c           | 12 ++++++++----
 21 files changed, 53 insertions(+), 49 deletions(-)

-- 
2.34.1

