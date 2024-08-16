Return-Path: <linux-tegra+bounces-3313-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F5954742
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 12:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFB71F20F28
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6001BD02E;
	Fri, 16 Aug 2024 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZRn6+op"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC51BCA00
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805709; cv=none; b=jV1rgYpxUZF5bv9MhVxRwND4MwdP6kA6lO/MEYqKtQrjsCBSWg3MVHfL7qPKyPhLsXMbekgkvETV3DsZtGwjITcTbTj359eTpQOB6Z8t0QzQubBPLsGIckYdhttAOpgJgOaUeGFA5LMF+oouHAAuRwN0WNSrnwejLyFSZThdjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805709; c=relaxed/simple;
	bh=XVq1bAp1DPzbReC84gkm7B7jCsUc7V7wiEW2r5jKKFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXm/1xcGw3rkfiaPhMn8lCDmJmTbq/LZvUKGs+wredMo+oZF+sskSsvRh3XX2EJ8U3QTsn0H3fL50aJ3frxRPSkOJXLBPvaxjH1KxSkdPL4Lo96eFchJJOdvYhtJtgIlw1pTtZmd8nA1XfFeHH83gX9lQkMIB/TP3ATlUKlJsfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZRn6+op; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso18465455e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805705; x=1724410505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzZC0M9EYFXrRYfn9TDzsNDqOMCKTr68cWUMx7V2XT4=;
        b=KZRn6+opKv1rX7QwuZfaN4+JWsagBSk88vsI8bSJKVWdhq7c3t4ZPl7bP8tY0hBLD4
         DCp+KtbrPX2T1aMxr1jKu3Puhb5ff8wOlktdaMHaw32efycibL+qIrib0d3lOdHqhS7X
         dCSVLTnVTB2Hu7NenfuSE1aKGEXzCHsbvbvHeh3gUWmkMhZCKY178wbxH3WR++hgb2Bz
         7PwRfg7b3Z3uMYueQBXjArkvvedfAO5LKkUvaX7DG8KgDCafC7ol1eP726Dhy7RYrN9A
         +TL70pDSmHuz/dtjMxJ44g5nDFuvKS289LbfyInfY4ik/eyXSdg21QaiZfHDbfkpTOLO
         JpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805705; x=1724410505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzZC0M9EYFXrRYfn9TDzsNDqOMCKTr68cWUMx7V2XT4=;
        b=AC10FYuSR/BNvTaMmZlA2y2n9Weab81pHqHvIupZK2Kqf8xW+W7gM0r/ewEyh/21su
         esn/B//RuKEO3iD6+3WFqOSiEQ0fhghhdVd9ktySEgZSMCyergH01ojy3pDHZY+5lKRy
         HkgdJXP39Ap1lpqqdYnCcnHwl48wAayytObovhG6eJifxK0eR43yUbomIACsLQvC63Sp
         tU/V2URCWHC1aQSrete/twnxT+PGk57nzxnZQs0wW9xijfc0urUZuEfxFb3kUcd0BCbM
         xtzQIE5x1ABS09MGVgdXdDbHksjSaxR4vcai+6TOf5TCRQSG+jc+v4Y79CKgkOUnBYfd
         NhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz0eUebQkrfAewp5EcT4KmW+3MPN2l4oX8R2w7N+VhHogPwOcI/fzZBVQj/FFCKd7fkaCa/zGWnKb0YS5cvAr1qEKzFPy6CXecMmM=
X-Gm-Message-State: AOJu0YyiuO/76bV9kDTq8UPU15G/2+f7zfjvLYG0pAVM0iTX52BtsRdv
	7EobwhkmxqGw42eEPOuFnYY3+Y9lZTtHRaSC7+ejFKKSQBn/PDV4RqP24bQjvLDd6MlstC7DzNH
	tEl0=
X-Google-Smtp-Source: AGHT+IHjZHJdqi78iF456VbGb6wR7RxT96NknEiGEFoYeO6BRf1QVX7lFBSfHR9ooukIBdApMHs1NQ==
X-Received: by 2002:a05:600c:208:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-429ed7d6481mr18549855e9.26.1723805705202;
        Fri, 16 Aug 2024 03:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:37 +0200
Subject: [PATCH v2 13/13] memory: ti-aemif: simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-13-9eed0ee16b78@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XVq1bAp1DPzbReC84gkm7B7jCsUc7V7wiEW2r5jKKFs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/yjJOSs+fjUCguca37Fmp1Np6bS/o8AycYV
 q1DSeQLoR6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8gAKCRDBN2bmhouD
 1z3+D/4vIO8HONcnYaJfvUTePd6DMbBbn9F/+h5JlkVZ9zuC6/FNYFAdsOVvol0buCd7GaQWZvB
 xkVBikxYPZ/SpZ/juDJ1odkOaVuG+6NFpphe6DNYNdwhio6ejIUqUcPYrgF88Lkc315GuP4WaHh
 LQrpEtjlApG1WaiWbwIyWH2Pe6aYg6XG2Qt5641TUI4xcOu9mdemiA6giWEpFo8OS1fA3vgDolp
 YQWUT5h/oXmzvUoFRt6nTrOWpdPc0cUcectO/1sJxCzVAn6+idbkM/UCEF6dxovgd0Xq1rbtS8Y
 HSlVMFGLgkJ1ujF1QHVdPYR8Ms0Qgsk3cJUMNbvRKw4BWCyPBa9GM+1gp8V+5O4ozHdWYpNwdNJ
 WTVSTv3lSokPa/71tY2WlqDaLwd5Wz/5Cd3NxPrCYKSIti5jI5aF2DkO5fF1NES8LHwVKhwiBPh
 1GDrE73cb3PgoZQaGrPa8bA6QZNnFoZ0Isw68JLrfs8DvnyGnS0kJmGZsxZvO10+6iu7fv3BMeP
 /yJ5siDXH5HJP4f8bqPef8kK6KkDxp25JKag4raVN91XG1UeuBdgU+0dIOlTfpGHsfvIgcvemJ6
 N8nBHo+dkh0vyPbMITPZEbJASGRHeSS++0db3mzSmkBWtUYQx4Abnd2BV8WH1C0z24W+pTT3FS9
 U08Yg6h2nsqgtDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/ti-aemif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index bb9c8132d8c0..7b48303f183b 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child_np;
 	struct aemif_device *aemif;
 	struct aemif_platform_data *pdata;
 	struct of_dev_auxdata *dev_lookup;
@@ -366,12 +365,10 @@ static int aemif_probe(struct platform_device *pdev)
 		 * functions iterate over these nodes and update the cs data
 		 * array.
 		 */
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_aemif_parse_abus_config(pdev, child_np);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				return ret;
-			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
 		for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
@@ -394,13 +391,11 @@ static int aemif_probe(struct platform_device *pdev)
 	 * child will be probed after the AEMIF timing parameters are set.
 	 */
 	if (np) {
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_platform_populate(child_np, NULL,
 						   dev_lookup, dev);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				return ret;
-			}
 		}
 	} else if (pdata) {
 		for (i = 0; i < pdata->num_sub_devices; i++) {

-- 
2.43.0


