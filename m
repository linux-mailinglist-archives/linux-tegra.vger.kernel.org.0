Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845A56B663F
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Mar 2023 14:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjCLNN6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Mar 2023 09:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjCLNNj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:13:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8CE24495
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so38493614edb.9
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=GnWL3jRt7rNHd4ypSq8umyqs1x7+0wYjNeYAKRv1DYI86Q1oa+IH8PWctC1Wn1hOy1
         y93TFuRwH5JaVlqiteoJQLpQ/TFWQauBKf6VIy3rgszMH7kuzi0S7xxTV/DUlNx6kGWz
         bHPb++v6s5Yugrzys+edgMF3SIe18dNXHurPcmVp+cQwX6OFWKlw6aENyrobhpJE+WzO
         oOjc55XzuJIQ+fjO7bGFVCQ9ieALrkOjivsIggJcLhUhMHqPqaqX/EMKpWTLFVuy6Hg8
         u77f9u6QLYp9a+86xO1rMpEyWn1T3CAZdJK+Kz82pdXVzRTthcPtlqhx5FyVWNv5poo/
         sGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=sYt/wKlFypzuph53/OMX064ixdApo+qeSXG+nGN4mKzy5lPJ2rWM9PlMedBhceEZSa
         9CFVUYFg6W2RLRhDWaDBD4W243VId+57/DTN8OW6VqsyT3aVpswnue5sP/KgRcijWi5O
         dzDmJ/J5v3LDUNE+EEuDKAA0myoxG5/jKzXENIBqzjiv6+/bV7LESd9b2BpM+fBp4KGE
         Sd93taX18V3Uq+yTZXvCMhOsAOg34Me/PA9M9EdclATHR8ypvrhZjZpCs0XYnWlJc8xj
         6/ehVbUGHd9z5ge/QdhEyxq1/1rTyCKPuMPuPLwJzCURV4Ld6KnBe5sBtjQdfkmWWkvQ
         aB3Q==
X-Gm-Message-State: AO0yUKXurPaCnXoXI6ZNPD+1h2E4ZBdUYwuYzDm8wSOFPmWreyomyfm5
        uQhCNHRAJwS0hh3NVgDF3Gk5SQ==
X-Google-Smtp-Source: AK7set8WaF2rUwXzajL4x+ub2degb8HIZtrdNRoJNVJTVfKoaxigWqj4b6PT5ae6Lxjnr++xATWHbg==
X-Received: by 2002:a17:907:9806:b0:920:388c:7cb8 with SMTP id ji6-20020a170907980600b00920388c7cb8mr6643262ejc.40.1678626815715;
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Joe Tessler <jrt@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/28] media: rc: ir-rx51: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:12:56 +0100
Message-Id: <20230312131318.351173-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/rc/ir-rx51.c:264:34: error: ‘ir_rx51_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/ir-rx51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
index adbbe639a261..13e81bf8005d 100644
--- a/drivers/media/rc/ir-rx51.c
+++ b/drivers/media/rc/ir-rx51.c
@@ -275,7 +275,7 @@ static struct platform_driver ir_rx51_platform_driver = {
 	.resume		= ir_rx51_resume,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(ir_rx51_match),
+		.of_match_table = ir_rx51_match,
 	},
 };
 module_platform_driver(ir_rx51_platform_driver);
-- 
2.34.1

