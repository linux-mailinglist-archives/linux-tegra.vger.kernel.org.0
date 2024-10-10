Return-Path: <linux-tegra+bounces-3924-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F69998F5C
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 20:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35DD1F25D38
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 18:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7118E1CF28C;
	Thu, 10 Oct 2024 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWHk5IC5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8681CF5F2
	for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583607; cv=none; b=EJVD7p0JJAhS+0Xf5+5X7bdGcoa6+CVfRjgBy1UfcE+QFH15qpJaYrtGbAVALGPGBbkIOzD6W9vgWmbozUHacYlRbJiGUZinnLe98dL8RPYmmE2kwEiE7XKjz5bq7HZydgH/jtM20E2VJMVuTvygbDo1Dn3YW//SQ8NSecjZ3Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583607; c=relaxed/simple;
	bh=wYClXJKWHiD7HQHxTZ+cA0c/iCEus3r1K31L8rg0g5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seWEeznC/34DkHEf+ux3snGsU20gLv2IArjLrNfPbw4iXuMVU8GScXSdrnW4YRak3A7vpROo+43BXMOgtCfjn5gp7Q/jNaUkZBxfq/C7nLx1Kx64aG9lAsDRAuPYvFzC90JEmMaEE9ROO5xcJdCNNkfX03XP4MSpCXkQZlJ8z9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWHk5IC5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a995d7b37ddso17990266b.0
        for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583604; x=1729188404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNHd9uOUFYMvCAXebRo/fjYtsxyYPOLWHoAaGWoy1tE=;
        b=nWHk5IC5HdSoGnlWGLsrvwI+TxX5BcP9e4naSk9yw2kclbmyPY0Qp6k1k1UlM1rAM3
         1WAfX/vvKjbLhtICBPZneOXouH7U+nbWBGsadNEJEKJ+7h6f6zk+40fVdhQCB2uHec1z
         6B6Ibl65q5tegbgm6RLk5cdtzCbDvR9gjJmFwlpyJHB7/w7AHHJzHfcN/d5anGintbju
         N2Iut4g0uuv5ZmO3BmL8EYqIcfYQ8xEDQhcK01MP93dbbCl6JeVqoDQJ3g9x8CjKDC96
         mtEVRwHJzQQhOhaNvt61hr7fFsqw8scIo2olyp84MR5iIuxHddlGkiir1VhFBQaoLnpC
         o4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583604; x=1729188404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNHd9uOUFYMvCAXebRo/fjYtsxyYPOLWHoAaGWoy1tE=;
        b=J6y7od5+is9dvB8GbKy2kwX9Jh6IqNefEvYd173ueRaUngSUnyXgYydnhXOTvJfyH0
         QUVU+WJU/b7mzsuvglmWC3rVZ4SSD51otBe2deWdq53uDAjAtZ087GanPTkbvEb2b1Xr
         nx/2oR1QGMh4qwxSxveSncuNkwS/X42e3iHldh/CRKtzTYH0jCbIBoPLeAT0mYA8R2LV
         XKaRqt6X3Su3K1nLmasROC43k7l0SJfKXR/xWbxOxlMCjWRsAgTnkBfFE3MySvzs9l1+
         48Ry3B9fjIDcAzAq3VVuXplSHWnnkTbYsgk0aAy0rjiUeO9jphwqGFeIYNd+ZvShrVIg
         W3qw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Fk0om+81Y1pFainson54PRqYzjjcYa+IjnutXk7tmGdnQ3LKcgEJZ4uACPJsc4FaQfEjV/46NI/4RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgB7gJSOmA9HFDCaFDJcKkJIgbbKARwgUz5aK4eeLzgj5/t6SB
	9EkiPHL6wUvFv47BHEpbkwg8ZxlB3V8fd0L9B5iOXBPELKXABRs8pwwB721QHio=
X-Google-Smtp-Source: AGHT+IHXG8VaZInUUFAvxb002JlgmJFHrC3mhFZJAVtrcbAFOAxaAouRcGLkivAX5NM5oRoVFuCHnw==
X-Received: by 2002:a17:907:d24:b0:a99:8cd3:5810 with SMTP id a640c23a62f3a-a998d1f64c8mr283223566b.8.1728583603840;
        Thu, 10 Oct 2024 11:06:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Oct 2024 20:06:22 +0200
Subject: [PATCH v4 6/6] thermal: sun8i: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-6-bfbe29ad81f4@linaro.org>
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wYClXJKWHiD7HQHxTZ+cA0c/iCEus3r1K31L8rg0g5w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBekdByvAQz7PIlOWkUvsQ+WBs5zS53VgUcf0
 2GuMObk5cuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXpAAKCRDBN2bmhouD
 1/yKD/410uKcFyGlvzO15ze4hOKRpWLw5V67Kx5zo8B43YJaHxuSHUBpoOJeBWXrAQgdtP2GXzE
 l/qxBeSvhw3/GFyFCDOYDyG6HtkW3qO5tIqx8fVOCxHTiB0yf1+boloOALHg6vBDKdpzDHOBUNK
 b1YDa8X9+f1mk6f0pxvVyfKWfO5Uviy/aQHM1dc5Ccm4dZo8U3j7EQH4upqTCjjavpifP3MY3oT
 HuInbdw5jbjjlFdpo/ol4J4bSkwdH/4nj3349zrPrfnZ7SQOapQwexeoXfSXuKCdR8CgZDAb3cp
 O6LB80/4qxIJeiIbZZtgaGrBLXKSGT1g+T8er0tzcd+tA1SyZK6ZPB0wDH0pT7CdWrIhdpovTEM
 hRfI9tQsU0s5vI6wuU3DiNNP6KGsVqTJ6HgqBpCnQT2SeeJb7/Yn/rHj/+H5rPV61vr+8hNj8Lu
 qPy0HtHZAK+Cc76xRkB493/Z1IYRLJy6P5Pqumw+2e2OrmnG2A8q+IiwbWFOZ27DwwAfh1F1rjk
 QrLJV7lq513bxJLg9IFDzSO4lp4ZeaZH5wAmI0CM2u3/AAkkcZSblw5syk2ZrqWBdHDWtr4Vdnq
 l1jmQTDe1UvwKHwTbNvQBUJswCUTUtCcGKAadL/Hpd3Zo2rxZxtBcYQyKvZAHwIKsBif/rgIoTx
 pIR+Lgn8zsIoDqQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/sun8i_thermal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 3203d8bd13a8fc2a9e5a59b3547cefc2440542c6..22674790629a7b549d1ce618998ff51f6553613e 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
@@ -348,19 +349,18 @@ static void sun8i_ths_reset_control_assert(void *data)
 
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
-	struct device_node *sram_node;
 	struct platform_device *sram_pdev;
 	struct regmap *regmap = NULL;
 
-	sram_node = of_parse_phandle(node, "allwinner,sram", 0);
+	struct device_node *sram_node __free(device_node) =
+		of_parse_phandle(node, "allwinner,sram", 0);
 	if (!sram_node)
 		return ERR_PTR(-ENODEV);
 
 	sram_pdev = of_find_device_by_node(sram_node);
 	if (!sram_pdev) {
 		/* platform device might not be probed yet */
-		regmap = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	/* If no regmap is found then the other device driver is at fault */
@@ -369,8 +369,7 @@ static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 		regmap = ERR_PTR(-EINVAL);
 
 	platform_device_put(sram_pdev);
-out_put_node:
-	of_node_put(sram_node);
+
 	return regmap;
 }
 

-- 
2.43.0


