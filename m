Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752DF6B2782
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Mar 2023 15:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjCIOpL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Mar 2023 09:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjCIOo3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Mar 2023 09:44:29 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520187F033;
        Thu,  9 Mar 2023 06:44:03 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id F0C17FF810;
        Thu,  9 Mar 2023 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678373042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LS5vomXjVpVy5vUxgvr9Snjb35gKgVrb13Y7ThCyles=;
        b=aTNXawSudwJXUBEVv8IBeXw9QvwJkyslNX6e7Ii/uQ2juNLIb79AsGJrB27tb0nM9toA5A
        976vUN8BeBkfa008O35gNoe2nVji1QZbhaolZ6+J0C4O+4gD+lXVIz8gPHT5FNn9xWvfwT
        3ZdRJHN+0LkDRmBFOyWG7AQpkgB1NXvvoxOQRCUm91++dmvHgHQ7dO+plPJ11Yl0QV3yIh
        xllhBpgL8pUbhvyT7jSYBn5niBu9s1obli4nIphL32aRPheWEUEA0Eyl5hFIYvWo0YYkcR
        B6R34l2s4mGfw740Mx7KXa4hRIw28+nbTLx/l2Y2bdqm9rc0XxV3urWD7zXh1A==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [RESEND PATCH v4 12/21] staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
Date:   Thu,  9 Mar 2023 15:43:11 +0100
Message-Id: <20230309144320.2937553-13-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We are about to add support for the Tegra20 parallel video capture, which
has no TPG. In preparation for that, limit the VIDEO_TEGRA_TPG option to
Tegra210 which is the only implementation currently provided by this
driver.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index df1b2cff2417..c53441822fdf 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -15,5 +15,6 @@ config VIDEO_TEGRA
 config VIDEO_TEGRA_TPG
 	bool "NVIDIA Tegra VI driver TPG mode"
 	depends on VIDEO_TEGRA
+	depends on ARCH_TEGRA_210_SOC
 	help
 	  Say yes here to enable Tegra internal TPG mode
-- 
2.34.1

