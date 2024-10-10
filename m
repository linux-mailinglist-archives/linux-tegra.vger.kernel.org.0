Return-Path: <linux-tegra+bounces-3919-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E191998F49
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 20:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42F2283A5E
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 18:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A371CCEF0;
	Thu, 10 Oct 2024 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f66KCI0E"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1919D898
	for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583598; cv=none; b=H/Xnw8MvfPvD6A+j+8EfL4Jvgtp8mZP0KSRV1G4VAisUUixoXVER43MwlcIRS0Cd8gc97R8RNiWkYzpPyBJDTHwVNgqvWxrXsnCmzFy/zydi1pY5IqURXTui5HT0HkV8yVvLacnh7+fey19/NJE1I+NHQt1fU0A1mPv5rlUMBtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583598; c=relaxed/simple;
	bh=21ObDeB7Uw+CZa7niRziQZGtHt4YzVv2qAEMDtifp+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Obs3yjiok52bOgAigWNORCaHUF/Lye5u8gJ2WPfDYZGLE3jXNQM+sqyeWr1/7qqn8KEqs826UVsz6HRZF2qxRnBRQ6A3O3JZMpZ03kdhtOrmEBXNDWed7SKZlKKsTSXsRfhxkQpheqNQBfi0KU6Ahh8VoYT57WP0lLIBE8lgRF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f66KCI0E; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a994df6bf42so13495166b.2
        for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583594; x=1729188394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVR/FvDP5mhKIoh1Y1kujnxSoI8PJE0vC17HhQCmzJ4=;
        b=f66KCI0ED/RW9AUI9gXWyzfhNMrARv9YV3j4Q5LVzVkZ+AO8W0vOfqjNKXWTqKBnao
         W6DjwWjzHM6ml8voRIRJenSlaQm/cFsWPu5/XKcMgryVuS1KkSwWhruLPKv/bOmtmeoA
         3eG8usTQKHx9iihBXkHVMY0hvqKMAwudI+2lZ6bwDDGprUAzlf5vQu2OVTXNuQrUSmP9
         y85RLgmJ+CgkeWetB25XK8UmVbD75jQuNqkgKYrj/FoNnzrFtdteEoXqpqLVi/umHjfY
         2cTYVUhEUAbshVmfEmUwKOeSCBv/sm+46RslQkoBt+4jV8aU4883dgsERrAL3opvAEcW
         M3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583594; x=1729188394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVR/FvDP5mhKIoh1Y1kujnxSoI8PJE0vC17HhQCmzJ4=;
        b=sUAorZUzQy3eKoObZ1h3UC0fRKcwRyZVGNUWZzYDulwykwwd9MdUwdspQ/Gpm5ylw1
         078fd8NOGF9FbA42dnulfnUYPaPFKNLC6Bj7Fjmq5iPPnKDLoItSBmS9jVLErmqcszBv
         m3FqUXh7YSo3ajr8+/ad1kqOuKSuYfKBH02ekJ8DyqxvSenLZ3n1diEzqkVu9kP2foiw
         1Xg4Wn/eKK18FGC8hvj14e3Tb/CVoOjQbi9kbshkQu3o1fHjiiyPZyVyGVgjLooV6Yh2
         odB9R7Xvvft7gYxFgOOxGTbN/fEBTj8bmqX5KG7ZA+8qhuBzCG9+l3ccIy93PBOcjrmH
         n7jA==
X-Forwarded-Encrypted: i=1; AJvYcCXwQ4IT3vgWAnciYg6pUMEm8FfJ6FGO5LNvSmULPxmTCLCPk3tulroATtlDZDWAUhTBb60yohI4UWZS6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMy6orp9Eorm0OpitPLIdDpt24frCOdW9JjdRhPD6rg+T0wy29
	Hgggc+xEBEa4TuQIqxi48ewOup2BYqnsXnmLZwvJiVUlBI4O49iv92y0umHt2ro=
X-Google-Smtp-Source: AGHT+IHpSo1bYpbQTRApH52ZLkx22//wr4+WM4NMb5T69enhQxaHE8oy4HxKVHQ9HPHYW4HoXxn5kw==
X-Received: by 2002:a17:907:2d8e:b0:a8d:4410:3bd6 with SMTP id a640c23a62f3a-a998d16a1bcmr285817266b.4.1728583594256;
        Thu, 10 Oct 2024 11:06:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Oct 2024 20:06:17 +0200
Subject: [PATCH v4 1/6] thermal: of: Simplify thermal_of_should_bind with
 scoped for each OF child
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-1-bfbe29ad81f4@linaro.org>
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=21ObDeB7Uw+CZa7niRziQZGtHt4YzVv2qAEMDtifp+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBegb1ST/vPn7ZbI4vbAm3dM40R8drrb7KNXe
 ium4Vc1Q5qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXoAAKCRDBN2bmhouD
 1wR/EACaO+1utPorr9k+KbMHdTtCwjgZJ0u+vdGMXRDDjW3QbIQfwJl/2brqpM6MmZv+QBLAhe3
 9E67zox8RRdjTRvyCyV4B4qXqA88p9tnj9iLBBgNt4I9aXXeYwpfIGaRk/FDZtVsG+kT9qRe5gW
 njBUzqQELD10L77i8aglLv7Wz2BZyLegcXh1RpiE/jBphdpydEfiG7zMT/gupnQ9uG946N9Hkzs
 rVXexntG66EPfAzg8fG6a/fTjnzwTwEYP3mfb644cLbAa0+Fq2BS1YdupOyRkuQEweVTeWQhM2u
 MGHBXwWcEULDqc9I///ZayC7rqIeSa0AEqyXt6IegYO9eNHWtbTOFk4L2Wsb6xiPflzQyvEECdO
 ubdTdXqDvabhRuvsl/xY4SLKqzzwhF1QY5FmyCzD0w42dLuzC0+4k6oKn7zGxt+yyn7VysLqJ1C
 LC/bNXi9OEVnDQpSVJoPPVn2PanSEBiI28SySUhmf8V9qUDUfsPzZpQUSbSCp0x6xS+ViWdVMt6
 tHFuaKM/rvM4RCYbTGPktSGmHKaFqetIeaheu51jTt6e0U9ts/rPeksEP3RC55+aUNH5FSOByhM
 zt4jqgBHUYsKZ4C7WvkKn3CixKM0yVU0uv3pFzg+0rs1d/CdnaO7JoqeGQoi25NfFG1jJvSPeUN
 p4g7KXqiXCwj83A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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


