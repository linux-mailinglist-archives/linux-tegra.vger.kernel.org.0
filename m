Return-Path: <linux-tegra+bounces-3295-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B27AD95431D
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 09:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 022BDB29A95
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 07:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FAF143C45;
	Fri, 16 Aug 2024 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGBXsM3y"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BC140E30
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794053; cv=none; b=GDz/bSKjUQE5kJsqm+m5trfxxuOgxYm9Mh3Y2rXt4bB8Ka36NNb1GGdbmheWqmVipKH8w4NHGDkEnfwm9urz5BSCPMnlKLMkcQFORPHFqjYpdlR+pLHiu3tQU+R5AkiD444gnY/n5Veu2D8+21oi9kDPK/fp6rbR6nVzYPL5hE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794053; c=relaxed/simple;
	bh=6s2gwWxKV3mqwXT+dwK4AlJBQic8xfrisA4opFVm0UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdLakRhPIN53uyZsKDQ5XTRmwGh0LQ4jqm8HjZXTJaILmyoWFO5Gj/gLwBigWvFivCxjAlKt3QruwWgDsWVAzPKYn2Aeqwn82mkiNQjY1OixMpBVBPhNNA2+fxZ+nzOb8HgxRWUer7eiAVWRBauyx4dppkF9e9I06Dd73U7k71E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGBXsM3y; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso16861745e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794050; x=1724398850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwBGzdvPQE1+PlP2CGFn94m3kIMhbJ1ppl7JVIwU/Xs=;
        b=NGBXsM3yz/RmUwBn8ckcxpg0oezJcRkKyfYCcab37HzqnMVeoLYjfKKYt++IDlxWYQ
         n8fGKkVdGTvYvJKF8vrEhp6bWWT9BeQKqDaSKhKdcq7lzhleva4wiBA3My2Lor5+SCsO
         poM+MuP0oIAvBSUJ04uf/WPgTvfX3uEz8mkRc8AF+iJ7C4mJ96hauaiFKqlqcz+qBs1e
         yM4t96i806WmQd5ecSnU434eKaLkDQ+0jkRj5Ldt163UyyeO0njqyV5EVFXSlLLon2GI
         chP5lbKzR04otvxDt5+x0uz1l5Hr5dXRKDCDTerUHRAQRSnTEPY8F3/dqvY/cYUIU9JG
         Rt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794050; x=1724398850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwBGzdvPQE1+PlP2CGFn94m3kIMhbJ1ppl7JVIwU/Xs=;
        b=HaSZQj1S8y9BjNfED3w4XrcDA2ebp68ZQSrEIagA5Nn9Xui0jXIYrlAH9/KVxI/x1z
         nejVSK3fdI/O4JeR30AM9HwJNV1sn4w+sGRm5P3bkR7n8qqSr2o9wfKO7IEzZABm963H
         HPFQ/cqasHo+HR55XImyE5bzDh5hHbOp8seHxVfKaqf6AmJg6bY8/tZcU6aV1Uf9UQXq
         0b0iJyvkzaNcD6XHXl4LKK8Pnj+eNSn5rnsNC0mVQjrsZpK3zesH7dMTeCzosOORUWvS
         DdL4pfvnwpKI7UxXfI1bLUKZg3O/RFyxvUSREyqqYe0typEJ2s2VgELM3JornwyKcaB6
         pLNg==
X-Forwarded-Encrypted: i=1; AJvYcCVV+/TcfIEAjofuV57AYsfHjcrojyqL74Mfr8Nn1oZvf5jApUhf0XyrDeeW3iCh3+6Z6blFvZxiiA92CSLRkSyNRvHYaOFy7O3Jfl0=
X-Gm-Message-State: AOJu0Yy1coLDaDer5DoRPSUefAlNTeiL2++t0Q3foNFsbKGZeefCHv6f
	46kRY6qI/luPczGtkS+zvXSQGnELl1+Y+3oopwumLAsIJOIrPy6OaXoNbkGhMyw=
X-Google-Smtp-Source: AGHT+IHDNoBVC9DJTAN7nMWLgAJqFIpeUDbPlSUB2QVzC6f0vvEYmRzQmwtSF9FAc0KhjOO6gOsnCw==
X-Received: by 2002:a05:600c:314a:b0:429:a3e:c786 with SMTP id 5b1f17b1804b1-429ed7d63efmr16437415e9.24.1723794049913;
        Fri, 16 Aug 2024 00:40:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:33 +0200
Subject: [PATCH v2 3/7] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-3-cee9fc490478@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6s2gwWxKV3mqwXT+dwK4AlJBQic8xfrisA4opFVm0UE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ2/xkGjrR2HLRRCkRnrdwrqzBDjdW9vwQDu
 1NHmeLLv4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CdgAKCRDBN2bmhouD
 14KYD/4j35A7vHJMVva9jFQ0cMzcZ6YdZMHe6OP0JJSb8mMlKA1s1B2BsZz+nMpVUWIY+2x0H3h
 sGzAoiG/OvTTlK7dxg73Z14uKEXLe/Nhcfpp31/tfPazE8Qt6Is9TEEwUcs1k9p6w2xsSnTnAi2
 splayRHNzbrKXwFOuZv3ZkT7j6pgxu0DClbPaZvmIx+gvOJUTX118gds8FK1oIP/ON2NfmOt6ni
 +x/AuGUdfVHzuk7xzuLIHLsAhAmhV/kj5IokJjSz5QZKCstDeoPDY5F9voMexvJinkW/I9znMq4
 YAfRZMm/g702PbGTzd8MGXn+Nit5dejzrm6DTn+k7RXZsCSStzsHL4KCHScpD/fxUkY0SzKRVPV
 +69zpM0F+mqxwlz4JPuCzUqQtfg5zvE2rHcQQrP0FitAQdciBV8jcPlJ68LpjClPOW6f711Kb0P
 pkUrptRVLQ02NqjvEhHsW4eGB3QBBX38GI4S8I45jHGFcw1XYgpinYeCq+SsyILyAM9ah0059VC
 QLPvv8lNHpqm4l66+odOdUugDwPSy3YGyfNn77ZpEdOOke7FGGNWRWFBFkofev2xJua7SqG4iy6
 cCcMy1kb+js5A6Y8XWzXLyZECp7oTRKQzg0whFvzwTBGjhWOTv9qlLW3ZhP1X/SWdF2fJ7z1CQv
 ImfcxuBeksGl/vQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

This depends on my earlier fixes:

https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/
---
 drivers/thermal/thermal_of.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 2a50910f35d3..94cc077ab3a1 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -155,10 +155,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
 {
-	struct device_node *np, *tz;
 	struct of_phandle_args sensor_specs;
 
-	np = of_find_node_by_name(NULL, "thermal-zones");
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np) {
 		pr_debug("No thermal zones description\n");
 		return ERR_PTR(-ENODEV);
@@ -176,8 +175,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 						   "#thermal-sensor-cells");
 		if (count <= 0) {
 			pr_err("%pOFn: missing thermal sensor\n", child);
-			tz = ERR_PTR(-EINVAL);
-			goto out;
+			return ERR_PTR(-EINVAL);
 		}
 
 		for (i = 0; i < count; i++) {
@@ -189,22 +187,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
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


