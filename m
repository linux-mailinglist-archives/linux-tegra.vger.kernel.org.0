Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E512D6B666A
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Mar 2023 14:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjCLNPv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Mar 2023 09:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjCLNO6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3347951F8E
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:14:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id er25so10372589edb.5
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=CXU5Sft4Qo94NqQz3mPSkb9P2d9WUUzBRab27MBYfCDp4zAJtkVa4U2gt8ruuAK2fx
         bYmi5lZFbKvFh7jAiwga20LHYuPZuLJ6WwFDw37JcecknQr1EZ6tbXpKsSHrRFM6dH42
         G9jmlFKCdF2j0PJTIZv91TvmWvYmxJetJ5eGnZpcumSgmaLtlgm4+ONduSKLc+F6aFmS
         2wbtsxeM7XjreClsKD102rjyRJhh1sgoZRixqozGJ4sff/5C87OVnI8gkQkfEaJBXzHN
         PLG7p5dhHufbK/Jk1Kg16Rh8G+p1NrvtMOVierX90bJ5vpXVZA5+RMdYqOUEGm66DbRf
         t+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=yHXEMzwMMFOlboFzYDAh/mnQHwy41Ge5lNWptT+OVk9bUjL+5VN0HI7/RF7PtSAjYG
         e7bDLMeo00K8tbpVD7YIwtPN6XUV/JQx+MuCsZVoajMIXhghjMStJooSwMu9naLKcuj2
         A+r5FxaWnW+fL12Pp5LmaN6JJfqiSOdolI5z3L4VYTt9VevYLPGuLEoF+6FldU+sY/fK
         q4wpuPMF/2rI7XZUR6HFyL7h6RQXrozdsFKc4BK85Fpx5Ad7Hwx1yQAC7BUKgGiajGql
         +sdMa75wThx/ViI4jmVnxc8r+mZDNRZQKZXd36x+SeGUoW6frcedUPpEx6oWmVoO100u
         HfEQ==
X-Gm-Message-State: AO0yUKW4ztrCFzCpFoR7Tr2N5gVMKqyY9xMmMHr8SED2fQw6Smo3YMdr
        eHEzRU/JwxBCEeOlR98QDxYgiQ==
X-Google-Smtp-Source: AK7set9d5tKP82Jz7WZKOjVJ2kxKgLrUjVcq5llmdVffKX9VOgz87qa4igqTtbGBsn15XQe1Xo+erA==
X-Received: by 2002:a17:906:5ca:b0:8f6:ad32:cd51 with SMTP id t10-20020a17090605ca00b008f6ad32cd51mr35131755ejt.62.1678626854759;
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
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
Subject: [PATCH 26/28] media: i2c: imx290: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:16 +0100
Message-Id: <20230312131318.351173-26-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/i2c/imx290.c:1354:34: error: ‘imx290_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..3c9470fbfd53 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1363,7 +1363,7 @@ static struct i2c_driver imx290_i2c_driver = {
 	.driver = {
 		.name  = "imx290",
 		.pm = &imx290_pm_ops,
-		.of_match_table = of_match_ptr(imx290_of_match),
+		.of_match_table = imx290_of_match,
 	},
 };
 
-- 
2.34.1

