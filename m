Return-Path: <linux-tegra+bounces-3311-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5C95473B
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 12:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA2A280624
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 10:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3368E1BC08B;
	Fri, 16 Aug 2024 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcFf8g50"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748EA1BB691
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805706; cv=none; b=EODa1ZBbN0jtFKPyYfNSW5KBgIV1n96SFHCSNLaZBJwQ+KR0VWpSHTy0cGGEJAjkVwzcDVAtCBGSbtXHDKrQ4HHds6NlooA8CyePDZAq/q19sezTYwrNmJT6wmAGdpU4nFvyw5Q5/Tu2S9T/9XrXwFdRQka11Mzos21P1fXx+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805706; c=relaxed/simple;
	bh=VDRAiPcP3Nj5IaFsGnt2Bd0rnGw6XleemS6wXHO20gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3gUspkBlv+11SAfATCOFbH8Z4+p7/uYNMoqzdDNUbN+5PsNx/Efa9hTq6FAnyw5j3K3/o+3WH4UVyC/j00VfDSVVhg67TbqzmHLEF/70s+O1lX3tn9Mi9gBkxdcCUnLlvN7rFAX2wQOD+OlwJtoUqTmDkkkSVcICDLpu87zYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcFf8g50; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso13463395e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805702; x=1724410502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/iamU9GEr5KdpKg86o77KhrKhRKzAxdW+GEgZ6rSGI=;
        b=DcFf8g50+eY8QrVxM5vrms9NQwmJyJEdcsNWWi1Yug2Uv4KSTahkdiNh5x2nzGKxUE
         ij/C/TfkVj4kT/NrMrtr8DxGsnX8l4ruyqMczjCFDsljKEebPMhwdDaGBKTXcWpTp6yZ
         OiLDffdHwdaV7YFEbLLJ2zPsvr2RLuAuLviFZ+Nhxfa7VosVqaW1tLdXhhQiBsPpdJWs
         CfgfCyxLajeG3ko0D51tyEiWjKISj4oyKzf1MHom+2uiltXeMOtfOzuW//dIRh4/mHCh
         mkwrfqeYDVQk2Qc0/K9RdUIg4+iadgt2D3r8j5w/+oV2KGtCdeEc+pJ3WXvCuXCm3fsC
         UgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805702; x=1724410502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/iamU9GEr5KdpKg86o77KhrKhRKzAxdW+GEgZ6rSGI=;
        b=tyaoIddxlzNMs3hztabelqI3QXVP34COZnT2zMHFgBdeRwjQUr9sYHvkdcd4ym35Tk
         iDKmhymjpL5GfIsXgprSqPwszZSIRPxV5r3gvn2nBnG7wcePuKXslQ2pp+3aE4m5X3Pe
         L1pKSlsdaYLsQ50JkfgL2A7joztOXMTdMVSbMhgP7QnZGTW72THgvP7TwbMmK1k/1MuJ
         rFt6de79roBsJbEPU2OiWI8aj+2Ts0dTrCHkUoKl01Bqn9UTzFoFZiLwccXEoFTy7In2
         8fop7w7ctoGyQM/7gULVLGcBGPMJadvY8e1z96trbHGY+bOSSr0Fv6ry46N1Xq/9izlj
         wUPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4CuE7SkREdiGPC9hURlwuiPJvrWhyg65Y9KIrYsmzZjyBCQdAd14ZEes2CXKe8ivAjCEyxU+FjtNrB3pEMGCE7Dh6y14NczGHSSo=
X-Gm-Message-State: AOJu0YzCpZicT/JajzydeMaLiFMt0cLN9e6oNevAaNRpVwOybPKpjCj/
	jdmkRV+fWMf2nupoEkdbLOLodPLSBb81TJ+fy5CqRt5OWs4ohIkc2x92Ymf6jiJK79WBEb2wXjO
	Z8Dw=
X-Google-Smtp-Source: AGHT+IFqPUcKioelayo+oH3fVDDKVUXmOzw5MuZiD+mM3WrmH/wV11bVb9kfp9ex06bAss09/vs1xA==
X-Received: by 2002:a05:600c:4688:b0:426:6ed5:fd5 with SMTP id 5b1f17b1804b1-429ed7a5f5dmr16488295e9.6.1723805702352;
        Fri, 16 Aug 2024 03:55:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:55:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:35 +0200
Subject: [PATCH v2 11/13] memory: ti-aemif: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-11-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VDRAiPcP3Nj5IaFsGnt2Bd0rnGw6XleemS6wXHO20gA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/wrCSs8PTy9a+acv6ve1DhHDKLl614GOqhd
 SLF3vaqGJuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8AAKCRDBN2bmhouD
 19QTD/4ph7Rh9kOERlKeQFJlMtStsZ/eIUNcyB0K1URSMda/NtsfAfnuC/k29h6RvyDDcqr8xlU
 4XTcEwCMwQ1nBxT7XwQosn1m7gZ0xyPyfstMv2PIQ4dlIutMxCGBsUUA9XUiKnVr5Z3C+ifWmVs
 hiCR6YfmrmHZfjvpidFRdVOhblMIxh7DEwIV8WTCeMQBlm79y3Ah4KYJtwZrjMnnC5Y3roYoOEp
 FKnlAjPZuA76rEN8IrNHYMKtm+G1yAKENn2PtnYN7Fl/JtRFPjhS5jz1QZ+svOcTVrUTb1oBBwh
 8O8Rwtppmn+QM6HXf6B766Qs94/nbBi0B61hffqHUDWqAYbcQcw3uHydhMv2vIFyskftpsIjlCv
 iz5SDKPf5wpdk0t8K7FRVMAGAMtDCgeCi4ncPmwW+lnJp3AmiZp21UWGHROnv3cRo7bU3de+WGy
 lV8Kqsp2Yrl9qRYA0I21p4fKoMY8E47YKHjbZ6d4EL/7ADBxSrAWDosifQkJXVrSNWp5xhoMA7O
 uzrobE9b0fbPc1tPdhHj9rq9uog9sq6xmJOthMwvkmCNwWUrDCya6BUOkeQ8OAfA6Ax53z/WQG9
 ADoxcmY3NwxxKo3ClqYQRpvaRA8CgXN4mBgz95fJty1IUKESCJ+a1idDrbVjqLVO3i8cgccxA2T
 bGuzLnFPy3XU9CQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/ti-aemif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index e192db9e0e4b..360f2705b1ff 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -345,10 +345,8 @@ static int aemif_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, aemif);
 
 	aemif->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(aemif->clk)) {
-		dev_err(dev, "cannot get clock 'aemif'\n");
-		return PTR_ERR(aemif->clk);
-	}
+	if (IS_ERR(aemif->clk))
+		return dev_err_probe(dev, PTR_ERR(aemif->clk), "cannot get clock 'aemif'\n");
 
 	ret = clk_prepare_enable(aemif->clk);
 	if (ret)

-- 
2.43.0


