Return-Path: <linux-tegra+bounces-3306-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94860954726
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 12:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E24E1F23D72
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BFC1B4C5C;
	Fri, 16 Aug 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNASsJvh"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4A1AD3EF
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805699; cv=none; b=AJDNSebbgn8u6FwFRpU79Tlv3vck8qqlTeeMkOjIYdNkQRxvQsl8sdVGsuW3U5W2sLbw4WsY00R2ojEUxs62IL3OnRQlnZE+47ZFwxkAPZH6Ly4iPlOATVe+79KjRf5TvjadrrqCVgDAC5fdpp/y1Z9z35B8ED0iGxr4SCETb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805699; c=relaxed/simple;
	bh=wJWap3GNtDgLkBsWgnZ2oGeVybItqtjwJfBbYGyPlo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lml0xRZoOQSgAjTwgr56fn+Mpp82ATeOkAUmaGvQ6TH4MMwZJRjGlUfadNpK/7jdEWeOTiQ9qLVbstBKvs5RSHyUAAGr/WLBp2hxWX3LffMe3nRxtyBD+5lNjIC+MkyD00LPkWrp6DkKLK0fN7WcFS71jeNIN20Jk+eL+3bJGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNASsJvh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280bca3960so14309385e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805695; x=1724410495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3JBsocw3Kxo+E25kYGT4nJEc4iHDY8+0T+RDH3CrwQ=;
        b=KNASsJvhvt+HKjtbgO9AuANuHVCDrwSKHxzOYspKY9Szt3xkSbFdS65ri97KYp/hap
         Uss/s73AojF+iwaSTtFoR5sZtQmAUGtzFKGBXheEyAR/DiWnnfDc8jKAnUBQECZIul4h
         5Mn/AtxEjZauQDx9Uc6HiDKNTfEqWtcH0yIsKAl3pck9DnszmnAbIjWGorpZPnGwaB9v
         ZHwIbese/tYVxbNwqI4bcWKs2KG9pHzIrE19DfkRuHMQ4fjB1MaBLcf+3CCPtd8Bco61
         ZbDdQJ32tMhDPuCWSaopgpfR/aBv2da/hdsRBWE71FD+rVvmycPOgXOCT/xGjAw2T0PU
         0PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805695; x=1724410495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3JBsocw3Kxo+E25kYGT4nJEc4iHDY8+0T+RDH3CrwQ=;
        b=DMnLW6YHeqFgw1/BBUCBDZfMgpgs8+/VDr1SYW44yz0vO7EoorPDaWsgqw5s9opL4q
         odI6rJWXrLY17TfpIt+YzQiMGScmE1iqJf4jBhZyNVcC260PYxnu0aCQYneHabbgxN+M
         DSgHys23s2flGous1EQGLUDSiP86JPcC5jj+DjLzOmRqhdMalxt5ZPkOhD33d6jWcZhQ
         oEeWL4aOgmS7l/zaBy4KyVyz+mzX9Ogl+xrnOqmzBmoCg2ok3EPI2Kzglh6CfKoIMXGl
         dTX59ZiMJUW4hX5feyN6q36XizrvLOpOi7H3rPNk+GjjLXek11ABy4yA9e9AJW76XTw1
         rAIw==
X-Forwarded-Encrypted: i=1; AJvYcCXzjDEwL5CRfW+GUlRHg+asabb3d+QwvaUZuh86u8P+2eBbMOEGJ/SotmYGbm/iboKbc4iEthfMBzlFAZxTUtAdi6PsqYrdBmQlEMU=
X-Gm-Message-State: AOJu0Yze74q7ePZOsEIqM0JiMaN5bVuX89RnZkNPfo2U/NpSCGWZJWL1
	9vBMHMMmvk4ERbmFlDyD7BxC9ZYSxFSgrY5EigwplsxKQleT/j05NQ8nI63wxUg=
X-Google-Smtp-Source: AGHT+IGn24wROLCo//DeF9Mt4n5RqsRN4gzOTX6eoavLir3z179fbxoYWt2i3lJKrmfKXQrfoXgzyA==
X-Received: by 2002:a05:600c:5253:b0:426:5b51:109d with SMTP id 5b1f17b1804b1-429ed7db6cdmr13568165e9.36.1723805694621;
        Fri, 16 Aug 2024 03:54:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:30 +0200
Subject: [PATCH v2 06/13] memory: stm32-fmc2-ebi: simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-6-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wJWap3GNtDgLkBsWgnZ2oGeVybItqtjwJfBbYGyPlo8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/sa1xUY2YBbxWKQP1tRrbI7EqugouDoNZVC
 Bxnkk/Q3qWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v7AAKCRDBN2bmhouD
 14EjD/428b1j5rsiaZx68rdq6FjyH4n1esOcsNDQiNVBlR4beEtg6pbk2K+emMl87pLVexTc2tI
 Es+y1tj551HtjBN3PqK3+JqBC0trcXcilAiFzYScxywj6dzEmrD1gpMVj95qyaJSZQbemKTA+TY
 MKvjLPhQtIsoaNEOUWXyVoK4Q88HdIW6ZzKjEwnTi9cHljpxbOjpA6q5q3IT2pyzYTbzVHQzNpZ
 +3kg/GACYNB44ceLVjoCzujsdHfWY2VeIsO33kZMG3MYwjU7YqnCTUZsFOnSbvON74kB7tBW+i0
 HEWc9aH75+TQIRz/axO9yk/PymB31x5t/ClfslDUwoGvMui9XnVf4CF8XIk/3xjbykNxLXfrkJb
 DVpJvmhiHvF4+W1UZy6tEvIqvzJHMCogCGapsN8DsaPdCmDx5ipOy9RnxZ7PRKaU23KHA/9w/3w
 m5M14ycC5TG0e9cb9VoQaYKRftqHMIDDyUIHXXeC9IZuOCSPY9hyAxKvOLgpXL7itZU902JzVPy
 ZLT6/DluBzcv2jZTniQ20gHFVZzIvl14HMXmTlgYBJCruFV68W5nndXMCA84RyMLPHbNhTo1S0p
 YEllo27Ct2QdtJtan8MTc6dSbIgQ5UWchNtS38wgjjg9qRV9k1N3ZPaU+XRyViDL6FnJumJl+yC
 Xtov6VwsVHfu4Nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

dev_err_probe() combines 'return' and error code printing, thus code is
a bit simpler, even if it cannot actually defer.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/stm32-fmc2-ebi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 7167e1da56d3..566c225f71c0 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1579,11 +1579,8 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 
 	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &bank);
-		if (ret) {
-			dev_err(dev, "could not retrieve reg property: %d\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "could not retrieve reg property\n");
 
 		if (bank >= FMC2_MAX_BANKS) {
 			dev_err(dev, "invalid reg value: %d\n", bank);
@@ -1605,11 +1602,9 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 
 		if (bank < FMC2_MAX_EBI_CE) {
 			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
-			if (ret) {
-				dev_err(dev, "setup chip select %d failed: %d\n",
-					bank, ret);
-				return ret;
-			}
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "setup chip select %d failed\n", bank);
 		}
 
 		ebi->bank_assigned |= BIT(bank);

-- 
2.43.0


