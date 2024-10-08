Return-Path: <linux-tegra+bounces-3892-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA64994369
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2024 11:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B61D28FCFB
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2024 09:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9949D1D0DE7;
	Tue,  8 Oct 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQaDwyb/"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB11C7B95
	for <linux-tegra@vger.kernel.org>; Tue,  8 Oct 2024 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378026; cv=none; b=NcIhnabriDtqofl/sE8hlfBRmrea8eVGjUxc8RvdGLAEq2r+ntOlSgwP0fMfR3T3JlShXfeTm/4Kwt7KdXuXLqI3ARs6o67aOvXtZWLBlMBjRT+gH6umIikLr/2WiUaDqFCeGj7CIVMR4oFrTj7PBXV717O8yo2YclaymgV4Yqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378026; c=relaxed/simple;
	bh=r5aPI6Cjn0TQVJCWexA1Rya/HBg2dq+HlU8Qr2gItOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsAos2Ybo/3Y0DEgBehBSOH/FdopDmmrERWf+WWNekM/l2/I0ecT5kJSXLbNJiktKb/KwN0o6ubZ2T/lZl6ppDg+G9sdf/wL1NHyUvP6cLHenU93AeJHrAmVupqG27wH1y0cUelWqnL9H8kX47xsWSn+DnyR4xIGL3mbIMax6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQaDwyb/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a995d3cc573so17115666b.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2024 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378021; x=1728982821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adCWIIzBDnCRS+ya+uwdE4DOJNV+C/EsMYDSwCJFffY=;
        b=XQaDwyb/8GmP0gjHsZvRQSSxztSP9bAbKlFZV7XhF0C2PItkhAB4AAhdyU5a58BUAp
         zEjR9aF++7ftaSq8ru1qV/m8RRIdnSfnoWrUlLTxVJ7CmQAYu2aNNEQQRgsxu6zXXmMt
         an2DFFVhDnbu9sAFQET9doPiZ8dIzPaZaMjok2vTtVQU5jSmxB25/ThyvF9VogJMMOnq
         jI9lOmA/G0dxwNJfStICBoOrTpW2HojRYRszezpXUPvx1XqmbN0UAuJEW1Yb3MuEe2Xt
         oDWqNtE1S+4QW0FoXccOWZtDBfO/mwnb5efYjTGxF8vmT1lJTC4vRC21sPOXACieYby9
         K9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378021; x=1728982821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adCWIIzBDnCRS+ya+uwdE4DOJNV+C/EsMYDSwCJFffY=;
        b=Jy12IcSmaZXglWP4MlOavw4lrfBdg9V8IYwwawM4Rz9u/FRdPnW/hB3v3L5rXX6oTR
         v5fm34jqL93NX22ywqRKkUM+RelDC9Dgvp1U+JRaQwbzET9EwAYX1pFBijaQLLlyuNZ5
         uTSBZxSNJ7Si3256fo5vycTOD79rGNxh1vky2lJxAMpzlWVosUNumYmHoun7jLOaP34B
         DacQJURV7E6+Z2G2f8RJjXvo+MW8AxgUTZJI0GARIcKd9Ah9RQFx7c0TgPYBdaQAWv3V
         QuYubN4EfzBfptLvBcXS/vYp6IfEvDQbbG2AewvqAp7xb4kEdTb5PW/J+RYI30mvXF/z
         ndPg==
X-Forwarded-Encrypted: i=1; AJvYcCWkvf/C7IWkiQkQ8T8ktqyqnarK8yyBzbDlo8nwY6N79WcdwGvyn9GOehmahfnQsft35wQskSEvsaoI1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3OP1U9cOYQAnPhVPOo3xEF94yhHRFUt8byIuKT9W+37brMY7
	XluFlh8u01yCveE2SdYCD8wPAfBxly78Y4WoWPAeVQu3zCRBzBDli61vXA8rpkI=
X-Google-Smtp-Source: AGHT+IFyV5YlbliLB9Sn5wjUH6COxSzrncdb5qLhEV2J0ae0yBBiwgw0xI+8Arc8blW6t7WRxnafRg==
X-Received: by 2002:a17:907:9443:b0:a99:482c:b2cf with SMTP id a640c23a62f3a-a99482cbc1emr374351766b.6.1728378021503;
        Tue, 08 Oct 2024 02:00:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:02 +0200
Subject: [PATCH v3 2/6] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-2-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r5aPI6Cjn0TQVJCWexA1Rya/HBg2dq+HlU8Qr2gItOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSceSnEJp2lwlWByHAa/bugTQ/6DRWAT9fJb
 uGRxYnCYsqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nAAKCRDBN2bmhouD
 17qJD/oDEDMG+qPpZYnaeRaztl0WT4abQ4WaCF2e5zgAu1S4llK2iQRYU0KB6Ddesl0KwXgMASd
 lmhBMg7VnYj8ZVR1cKExnTlws7HzVniO1HtKucpHlVo/1w9q/4nF5qusN2cj5/1NRIWgPA+U4CM
 GixsfXrDqjN7X2TaZ1eD9alLmIWjLXzyCiC2Hv4/E87ml31QZI8BM61nDrC23BRD9QnYUqkJMcU
 +j0H+99j9zNVohXBZrjDt/Nv6e6R1/tw/vgZgsomtaoO1Q6K2XYkl03q0ceZQS4jjqEq0Gmi0xV
 v0u2ZQlDTkKdB0oCeTuBwOqRsI62HW2J8tSnS6be7Otj2SDBNKEMT+D5O/6Dn3x1U2U81G9kZ6T
 6EQQ8wQLExZprKqb89dkvyNw1gbBo5hKIaM+2PSXbxat3Jv+WpGq5mxrC2LfhzmFJmBqqjguyB/
 k5+i9d46I76NJz63ak0t2QV8I+zn+aC10/+1CPDRO3V1laC+Zj3uoelmnA3gvgPYv+oFFOR1VyN
 q27M4IGIzUPAAl2t3IKzEqO9qFpl/Ba7gIHqUVDEWXzxbhd2ylR+H1sPz57KliloCQZmRJR+Q0W
 1XqAaqaIAiFBXYKdSz/CZziyTsQTwHfi6k22ruGEkOWSbFJKBuyWMiQkDaWkCSH+YgwtHlvT2gw
 YynUKo3nC3wtIng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop left-over of_node_put in regular exit path (Chen-Yu)
---
 drivers/thermal/thermal_of.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index f0ffc0e335ba9406f4fd858d6c561f9d23f4b842..d7d6f62caa13d545e5f7fae4c8ac1e737bf4c4b1 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -96,10 +96,9 @@ static int thermal_of_populate_trip(struct device_node *np,
 static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
 {
 	struct thermal_trip *tt;
-	struct device_node *trips;
 	int ret, count;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return ERR_PTR(-EINVAL);
@@ -108,15 +107,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	count = of_get_child_count(trips);
 	if (!count) {
 		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
+		return ERR_PTR(-EINVAL);
 	}
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
-	if (!tt) {
-		ret = -ENOMEM;
-		goto out_of_node_put;
-	}
+	if (!tt)
+		return ERR_PTR(-ENOMEM);
 
 	*ntrips = count;
 
@@ -127,15 +123,11 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 			goto out_kfree;
 	}
 
-	of_node_put(trips);
-
 	return tt;
 
 out_kfree:
 	kfree(tt);
 	*ntrips = 0;
-out_of_node_put:
-	of_node_put(trips);
 
 	return ERR_PTR(ret);
 }

-- 
2.43.0


