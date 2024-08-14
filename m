Return-Path: <linux-tegra+bounces-3259-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C515E952335
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Aug 2024 22:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BBDA28473A
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Aug 2024 20:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7161C822D;
	Wed, 14 Aug 2024 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISNCN99A"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C91C689D
	for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666691; cv=none; b=tj4z46KNiHNnkB95PXMMILMt9J3Qp9oRj2UJx64jgfbK/Bdv01xDzHN956RpVqqLPTE/DmgodyadC/HR7AWqqozPvZSbtndq4smUmeC3zCEOCwrFp1G4lPgUypjbEPtE7YQ/dmAQjoN2AZ1sKm42bdDKd1YsKyF/N/QiIWYqe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666691; c=relaxed/simple;
	bh=RFZ0W2aEzyo7qvNEznMOi4x7fvkwhw23R+553GKFwnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocL4RCWYZmaFh/H0uTvPOxo40Cbltwr1jue6/gPS7hUGcvTUCfESRyvKGqCVM11j5EMLRPZ4JheU3E4dTscwhRKX8MVcPUr6aHOCQEDSEFKgslbS3+dSSTy+1oOHY71yVDVNa3L6tgzpwgxHivp3jNseFrrdwjy0xhNpe16HKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISNCN99A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so1157885e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666687; x=1724271487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+1n3s2zX6xdpk3ZvL7MPliaB/tfVY+zMRhSsJd4xNI=;
        b=ISNCN99AKrnEpMGCfEg3xmo3tUnu8mNqpYgT/q53yvAeaqJx3FVVIrli4V0HdTsGjK
         KyeTLcWPi/tGeeq6v9NPsLCl/pv6bjk/So2mAFWSjEWiW45+SGMDO5/4X7uPtj5zWc1n
         tPNljGn79JXEZo/FHezZlqYOOoGNnh5ung3rvP1DMDY4RKwPS0yZRvkbBcK7FrYwEOT0
         2dz+quocV/OurX7A3Fhcv/g5AecrM7eYnhLdYhYvOn7OM2aGgj4+K7LFtodFjogF1wO6
         /JaEVsgCn3mhNiGYIX/iYCxXge/gl5p0zCd31/bUmov/P0ilPIAJXsLfKtuwbb/QbRKK
         09cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666687; x=1724271487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+1n3s2zX6xdpk3ZvL7MPliaB/tfVY+zMRhSsJd4xNI=;
        b=FiAQ2N0YyBNJIxD5Vt9z7nvs3vHIg9LZ3b+pONu2nFT8ZtdHC+C1NUbHxq+H8P8HwJ
         C4tBYg4PE024Uxz8zmRWQTo5g3RtO4Yh5NvBc6MpWqEu1O0nDDtSGMJdeS8GaqDacy8X
         ojDiaLu4N8T95vepOvnqrbW0xbRlRRyin+e6FtWKk4XXBx+y9JdyJzHjBaYxvhyoj036
         ac6PhSr3TsEceei5lFJMDbTirT8lNzUoWiTyvws41VFvMPjm55g59mPhoGhAbQp7obJo
         B2x2DiW2hsaPzX5z04FUmukIT6NQi3hwIDzRydwjAwoNu2UTtYX6WbO+GLaHyp01ZRzx
         TNQg==
X-Forwarded-Encrypted: i=1; AJvYcCVSPZcMbG8C5iy1XrPSQl5XXnJ15b/sEAI3CKfFoj4/P7l77/6DP5TZ4LFPUvDkzzsrKecY0Stz+kK7iuDh9/3DZKUTOXINUcML6dI=
X-Gm-Message-State: AOJu0YzC95HTjQCQHo6wS+oWCdvvH+S9xqQ8hjJ8jiJZRd6oc85vbEkb
	cLopGjfXiWgW385zFd5HDfS829SFkJTrZY6MDH+kOmRpXH7V1TFVyrc7F14ovbc=
X-Google-Smtp-Source: AGHT+IG4n49tsrR8OScJpRN4XgsLTLCrIDbgTVWLA8e+VO71vcZPvFOel1WkxQ1/4c3HXHM1sPIv4Q==
X-Received: by 2002:a05:600c:190e:b0:428:16a0:1c3f with SMTP id 5b1f17b1804b1-429dd26c6femr30355955e9.32.1723666686643;
        Wed, 14 Aug 2024 13:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:49 +0200
Subject: [PATCH 3/7] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-3-7a1381e1627e@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RFZ0W2aEzyo7qvNEznMOi4x7fvkwhw23R+553GKFwnw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDy3q5OsepdeTfJJj9k6orTJGFRZF1/guOFd
 aYAeE2h9VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8gAKCRDBN2bmhouD
 16ikD/sECNu5Kif9arWPRp0ZjOFAoqw/OIPurO5nyDcAb4WtSdbBmVnN6r+KS2TP+ILKGjRq4oh
 VVSiUMTzNLwVW6Nh22aHCvNpyodqWXR/zo82WBkPtT34PcjtA9OKGIz72Hf5wfVz42KQ483hYbr
 S7N0vN+kleySjh8OWCjgTREDkqk/00eo4TCMYF/pX2g2Bb/eochwYx2MxCNYYS15T+i/U+FiY1P
 sjA6z2+z7VyviQZbpo5AKZouIOohnijofx6UdTN3Xu941ch++gGQMSC8n7VL52pxTObRNxxMDJA
 lMsXzE7yMBFQIHGNkwC0wgYBDxGNM9TaRhpPan/h7X/VYSbHzRejqFQVqOu+q7m7R9fG/DVY9Yx
 sZcdf7HcZpFDBA7AH7jWr/EU7v1nUk5MbEKIJNnjV9qNri8i89WSb1CY4NPV23rafSoYN+BhBtc
 DPs13bbm+z+Q7o7MP0kQcGDAdDi9fDtaYl4rRQ8npLjnEjMrCFYYWRP54xSMxs4bVB9enR8q/77
 rvZu6pPSz7wu9g3zKZvEiDjF7o79+r43pdtO/aIShlIN1EhowovcFj/4/DsgWx1DCgBxXvo4TT1
 B5hzPDMtS73OAlAvXbYJCF30OQsHP5LQ8G23DG5YzvVVUPp8MLTJuYjE2aGcTXEry3sfO44tyWz
 sd6moH6jSSfdxiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on my earlier fixes:

https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/
---
 drivers/thermal/thermal_of.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index c8ded4462bb8..fb5472d6ffea 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -157,10 +157,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
 {
-	struct device_node *np, *tz;
 	struct of_phandle_args sensor_specs;
 
-	np = of_find_node_by_name(NULL, "thermal-zones");
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np) {
 		pr_debug("No thermal zones description\n");
 		return ERR_PTR(-ENODEV);
@@ -178,8 +177,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 						   "#thermal-sensor-cells");
 		if (count <= 0) {
 			pr_err("%pOFn: missing thermal sensor\n", child);
-			tz = ERR_PTR(-EINVAL);
-			goto out;
+			return ERR_PTR(-EINVAL);
 		}
 
 		for (i = 0; i < count; i++) {
@@ -191,22 +189,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 							 i, &sensor_specs);
 			if (ret < 0) {
 				pr_err("%pOFn: Failed to read thermal-sensors cells: %d\n", child, ret);
-				tz = ERR_PTR(ret);
-				goto out;
+				return ERR_PTR(ret);
 			}
 
 			if ((sensor == sensor_specs.np) && id == (sensor_specs.args_count ?
 								  sensor_specs.args[0] : 0)) {
 				pr_debug("sensor %pOFn id=%d belongs to %pOFn\n", sensor, id, child);
-				tz = no_free_ptr(child);
-				goto out;
+				return no_free_ptr(child);
 			}
 		}
 	}
-	tz = ERR_PTR(-ENODEV);
-out:
-	of_node_put(np);
-	return tz;
+
+	return ERR_PTR(-ENODEV);
 }
 
 static int thermal_of_monitor_init(struct device_node *np, int *delay, int *pdelay)

-- 
2.43.0


