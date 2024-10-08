Return-Path: <linux-tegra+bounces-3891-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBD994366
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2024 11:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478B228F6DD
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2024 09:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AAE1C9B77;
	Tue,  8 Oct 2024 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdUsiz2J"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3F1C242D
	for <linux-tegra@vger.kernel.org>; Tue,  8 Oct 2024 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378023; cv=none; b=pS41KvzfNW7wbfoc5/QAaybKC9aEIWiVaI6eOMugh5vzYxHuEcY68mIR61FqM0BV09I36m5M/87z17hE+COJOk5FGgMvUDe0gWxhploRlf5GIj7f+zuZj3EGiTMgFUS5Pz0u/wlJOUsgf8u3M6N6CBd7j3IWkdkwiRU4EjKDn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378023; c=relaxed/simple;
	bh=O8Lj1eetz/yrhGeWhSCrulP80O8gYR9QmbQcZv63r+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+etw5R9Pmbcx0ONf4tE+trr7zDes+Tw1sFYuhFY3iGr8pfrvukifmn9yHJU1l19Oi+vIcJcE0QUvztsXQ2+69iJFvhzBpZbdyOtlrK4jlWlDzOhqbfwPpx0r5GAkeXrNjTHhilVU1qvGaozC2/S76uMx5tY+LmrhWT0pxRQItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdUsiz2J; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a995d3cc619so19186066b.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2024 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378020; x=1728982820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhnMribWv3j37phbroM0tsC+LvVtWuj3jNkm9Yojs/E=;
        b=wdUsiz2JArv9kHPsOLY5/rReF7Ej7hhjPrcRF9d7y2pCysgIJsvSWGQToYaPSGfHs2
         JmbVGoywUc+6lbi7ziGYd+2vPIEvEqCUJCiN44dz+I73N99WADGurLw4SbZSK7s/quHI
         vzrhIlJ5d3Mh6SP2cmYa2ixz1GDHWjx8Skrhku1LNrdXEEVd2Zr2tfVZHOffNAGyFBYm
         lcu9z+rTs8Rj/m9oRl2YElxvbDwXvt35nREQ7XVEhUai4ElgbztlMvvE1xxo7FCYNACt
         U9OpaLFYPt5FS0dYMHE7TNB/9UKNnJx5wF9gDus9V4h2q/2vn2WPx/45KLsW6k0RJGgT
         ZnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378020; x=1728982820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhnMribWv3j37phbroM0tsC+LvVtWuj3jNkm9Yojs/E=;
        b=O/Ao11sK8DpZ8M6JNRo91kLaQ6AsiZNUalafmKMWEvKiv9uWQCK9UzB8yo5/+Z9C40
         TkBggXAi2DIUAIfWUyOktpT/GOWobZ8awi01kRCipW3JoftqrXMr5VJ9TWmLO0J26eK+
         Z0n2gFwYLcIf0Bct6f4VRMiG1PlxdGl1HT4Fs1YzITWefKENQPWJxj0yA5N/7NB+543I
         hSeUZHE6B8Nwo7Byv1DczAHbTHwJXA+h5vzeypcTnIgcug/RJ7zED1Nc3ANXcz/oKGV+
         6HrUPPa0ZeUB80U7gAx1kDTndeuN7QrbbJMaI+vlvo1AMtkJws0N2YAhrK4l6Gs/o1aR
         eniw==
X-Forwarded-Encrypted: i=1; AJvYcCVi8KpzoYZix5axSSQ9qlI2aJzHsRtZjEE82rn3kcMcMorIzhzE8WSM7TY+W9Nlhg3nr9N1ST3NJFoGrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxijGD1DIxgIkxoBCxqcGEVL9ovEAxn2EVUcK9BbJd7XOCrDqPt
	Q4ZW1w/iuN36kLIVqoerByKDzuZ8gF85dnnwg6/OA1vRiK2/PRIgtfRa4mc6R4A=
X-Google-Smtp-Source: AGHT+IGoeQaPcBnN254hi6TPgYzKLQXhpimbmfSA3A3nGgS1sxK2mD1XE9GMOjplQH3EBO+qMZSWDw==
X-Received: by 2002:a17:906:fe06:b0:a8a:93ce:d252 with SMTP id a640c23a62f3a-a991bd1d16bmr678141566b.6.1728378019795;
        Tue, 08 Oct 2024 02:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:01 +0200
Subject: [PATCH v3 1/6] thermal: of: Simplify thermal_of_should_bind with
 scoped for each OF child
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-1-825122398f71@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=O8Lj1eetz/yrhGeWhSCrulP80O8gYR9QmbQcZv63r+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSbZ8YaUgCU2m21zzswmGFg8FNILw7sZbEcZ
 5bVpN1Bs56JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0mwAKCRDBN2bmhouD
 18a2D/9sDXBUfU0ZcIObHORU6mvM2qGTl/54it8fLk4jaTUn/ItOOFLVrWgKHLT3tWk9P9l8tMf
 iXljprk+xbme7PDZFPYES31h3bjF9v+81xcuJM8YyC/qBMm7RMn0PtOpv1UQO0N4cefWFujYLay
 5YWw45RaXK6W3jK202Tm400nWTQ3+bzazZdpAbxwNDlA0SwsyWWodwgNM5aB2pMJUo4imXyVmwT
 WhcQroeTRZfvEusL+mjukqFZSKm1vAu1cZcMNP1pBr1LhNsjwUxyOEJOs2hOM3Is7CY8R/36kh2
 kKYust5Hzt6ypzZJa+M1x5N3jnxV2ud9nNtJ/jwJnqc5fCkUw2y/H5euR5KdBPlNsWZNv39tNzC
 uxJ8EGkspuin5wDdbylRhfztP1MfWy71iijuDHuwH+X08spYTUxr/uR6pIZ6vMdGAtp+G+rb0db
 JhkedK4n35XkvRGAfSZHrvx9TT7jX5sqW6Wv5KzHREGd05oTnr1nMUQWPNia1rgYMTd3Qd/G9eB
 tHHttQ7ZuL+LexkhaBdkloD7z/Kftr9ZHSWt3FfthbdU/Ksf3+0hAZP/ekq8TupL5OC/s7sqvtu
 SN3fU2I59MuaWKYliQyDBHq9xN6dyV6syU1lg+BhtggWg++gY69HzrO2ORqbVkBtGEyQNopiu90
 RTHcc7aGAX3dZ9Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch
---
 drivers/thermal/thermal_of.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a4caf7899f8e4a5f3422e4c02c66502b5050fd6d..f0ffc0e335ba9406f4fd858d6c561f9d23f4b842 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -301,7 +301,7 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
 				   struct thermal_cooling_device *cdev,
 				   struct cooling_spec *c)
 {
-	struct device_node *tz_np, *cm_np, *child;
+	struct device_node *tz_np, *cm_np;
 	bool result = false;
 
 	tz_np = thermal_of_zone_get_by_name(tz);
@@ -315,7 +315,7 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
 		goto out;
 
 	/* Look up the trip and the cdev in the cooling maps. */
-	for_each_child_of_node(cm_np, child) {
+	for_each_child_of_node_scoped(cm_np, child) {
 		struct device_node *tr_np;
 		int count, i;
 
@@ -334,7 +334,6 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
 				break;
 		}
 
-		of_node_put(child);
 		break;
 	}
 

-- 
2.43.0


