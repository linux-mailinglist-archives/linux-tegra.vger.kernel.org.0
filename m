Return-Path: <linux-tegra+bounces-3297-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B7954326
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 09:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE2491C2284F
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 07:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E31527AC;
	Fri, 16 Aug 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJi0EE35"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975814A0B7
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794057; cv=none; b=H0m23g070BMcuz9ZP92oaqwyzPVPb6ArkGrMnHHsjxAjYCQvcDvCJ6R7liCYdI3vGibr+yEzxdL8MsW0S4JgzkQh3uWCLas4wYbCIScnhkhbwB1Fyp3ssmSJ56d4Dh9+ExLkbMyaeZYcZ5P9pEYqaAvc9rfLKy3GltliIQE0ggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794057; c=relaxed/simple;
	bh=PbJeEGZU3UpmozZSCe3r0DvMlYlbAp7Fh7CGsGwwTnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxLw8MeyVfwAj3Th8/akwpOkqigRdFwEia1GxyAxEBoUyi75ZICBkjT5LtxSlLCcfsDJtHm61COBe1M7NUR/XO65lsdttwG2rZupVDhdmJ4L4/SiVrKCKtw3BFNfO7uNqInIbCn+nTsxy0Wqjeb2LBgda7bf2QvW+Hhr0p82E+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJi0EE35; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42808071810so12091845e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794053; x=1724398853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wMpDkMtET/7aAM65Zz2/Kcs6PKgOPihE5IRKM0OVVc=;
        b=DJi0EE35vju7zEq3P8l1XDiXS5LlurXhoN3F5GfKoZRfOTA1hittAGKXflAPhDBr9I
         +DMsl2j90UOMZ1qdaTkm8uX2gNZiDx4yg8nu0lrHrzqbfXhUraKtdZs76ejDNEkBfbV6
         HNcHkAWz6C+M9St7BBh8cqW8zZmUBn0p82qdihOteK9aLflAf7SvnJJdZt1inP6ZI5jO
         QvKjnUzVoF2LR7cs+mbJDt1eO0vOd1eLavUW3c86ScsTB1u55Ck1iPL9VrbakiLecovi
         vz1+iPWCyYiFcXLzji+geuEnnBd4AjXHC7KZ/NHUhKEoaPwj9nnlhl6sB30luGaKm/OV
         lGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794053; x=1724398853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wMpDkMtET/7aAM65Zz2/Kcs6PKgOPihE5IRKM0OVVc=;
        b=O3bmJ7KqvXyUSkAwe048HiJiWiKpGdjdwiGz7B8Q4qXt3nZD/UvCdmI6tbW6/a69q6
         +3oEhX5pFLKRMW7qJPwBKTCVEOJsZdEA2jkHc0jVve9f8m9FkKc8tWVbCyQewkfKW/oc
         j8+fysTWLfptam/UeMDYGGzZ3cJDEmT3aw5LghRwE9FoMR7EsmpdH04t0oYp4TnJr+Ju
         jtFn39uXx+on9Hu+0DvexP5JIWI1T5IVQRrYPrq7pWR4TKyXO2OparXztiQST81rIiNl
         lSWjjUJrnUOSjSJcVkKAoMnjHOOilP+NBlakyY4HipLJJXVEoiWiwmQFwBEDlSImcw4Q
         1FMg==
X-Forwarded-Encrypted: i=1; AJvYcCU71w7gqbJzg8cgXzaiuPMofVP+YXI8zIQONtiZAy7p21VeOFyDlxEVDizXQKOkFSg/EgoBmXUd6YqNbbmd4iXfh4eo4IieoG9YK0I=
X-Gm-Message-State: AOJu0YyH4lHlp93gUMx9F042qLNStZe5PJm/YZtOdp/K50AW9znzKiff
	OunbG/N+eeH28Ljb53itNVMbaw+QriIZLIEYXZ1hUQt7X0RlCkh8XMsGAJ4+WvU=
X-Google-Smtp-Source: AGHT+IEnXbQO9mmtyvuxjzYjdXQUi2maQz0qIi0DaT7l9WqGJwLWdeuDft0i/qsT1e/F2DXQfswARQ==
X-Received: by 2002:a05:600c:4f48:b0:426:5b84:86d2 with SMTP id 5b1f17b1804b1-429ed7b9391mr16384705e9.20.1723794053471;
        Fri, 16 Aug 2024 00:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:35 +0200
Subject: [PATCH v2 5/7] thermal: qcom-spmi-adc-tm5: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-5-cee9fc490478@linaro.org>
References: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
In-Reply-To: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PbJeEGZU3UpmozZSCe3r0DvMlYlbAp7Fh7CGsGwwTnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ4R960iiX78E9nbSk6rU3XcRyumrrr+WNwm
 b9uWv5JL4uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CeAAKCRDBN2bmhouD
 117ID/9EACqKFcFO6/LOiwiOQBgFhDpNJAh5abY1rYNUwH6civPjvKo7M1pZANYtvFOAb1NcY+K
 L0XUBZ1qUwcnHA4TEelwGC0qKPEU2delRJzqiitq/NS84JtEIZN3EXedyZAEvaGMr8kY5sAQ2Lj
 ezGPzEZRdSmWeBFbR3R6HgVKuZTmLfXO8g3yCatnh1PQyomIywfLrFk60IFFqiIS2cafdrsv8Wm
 qSUw2PK2e0cM/4dc4HptXcs+fr/zCC+sSICFfCKZ5LWia8XVwXxopYBK3NHbpD2ndfaFJRamXhA
 cLqeLQXVXxmTSt4sy2bEMQb/SJRE8Adi6sNdoxQoB2xxCWpRTYRgQmkHmu4qZvfsy5b2DoUg4WA
 qiWVWtqt8Cfn8i/UHVqlJ7+idqLMCACVEw/6v3LxwJQ0nrQ93wmRHqwiR5QmK/8ndrgBnNPjb5b
 3JsQaU8mlC1O/ZHGA34DuII/fv+D8b4cHHSP0IMAR6m6JqIMCmnlNWNWSrxgF31Lgk+D5z8rpYM
 auRMmfihug05VxVXVoYJ27RBVuRpmN+Rkrp2rvAXYHuddV0DmEL06/ZlF0psI/X7TgNCjWbjPeX
 bBpNobaS18uO01FwmZbRdjVzYV6G40GYDQT1rbs32LG/aL36N8DPRrkSTdgySwNFEsu5VprtL7J
 +fC+fPiASEAIR0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 7c9f4023babc..19cdb98c310e 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
 static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
 {
 	struct adc_tm5_channel *channels;
-	struct device_node *child;
 	u32 value;
 	int ret;
 	struct device *dev = adc_tm->dev;
@@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
 		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		channels++;
 	}

-- 
2.43.0


