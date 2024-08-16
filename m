Return-Path: <linux-tegra+bounces-3296-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5A954320
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 09:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 118C22833DE
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 07:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56C514D29C;
	Fri, 16 Aug 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb90VByx"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE366143C67
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794055; cv=none; b=NhgokGfQhBx/3yNR0CC6dWFl9JdHKucph+M7nOmAd6iDfFHP80vIW3wxt+1qmr0S9I4ycFpLts1xlv7HwUavEAD4xN1x66q62a1laqHCbfCXTZAMp08XMtomd9cCCJp8Ugfpqht3hurqfSLMjicRUPTq4nZbqESb3toV8BxoX3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794055; c=relaxed/simple;
	bh=9M5ntznKTX5NDEFACMt23t7+gXPt/dasJVMFbG8WF/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvEkGHFz8eLsX79SL1fbb0nRWaLb0BcmZM/HgKmOLoe3jNgPDkbRglENa+AS6CBIoLrfkzaad7FwYNW1rlAFcuU+lX21KBroa7+EtKJInOidFfkxUm5qduXMDXE7Xca/xb3HWWunMAH5KAkgXg4Bw+5aG4y1BbARqH4SU/S7M2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb90VByx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3b7aba3dbso18965071fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 00:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794052; x=1724398852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpiLIHd7RwewW+o/fTDGbmxF9iEJfCFxBRNxKUku6uc=;
        b=Eb90VByxzOuc3RJPVDMIkIywo54AUDWzqyw10c8rsYAgTbkoyCn3oMqcEZQgFThuU8
         cG9NIjFey05N119ActgiTtkoIU+BNOE8PoyNdkS+jMJVrU7QZor9+nEzwbhNgHyiDmPS
         zcYq3jba/8+XAFXBlGxcy36Z/d0T1zJjIbBcioG8hhcCgRTdEt+vgIBy9bIasKqxLejD
         1tH8hrCDOojaHF/L32Wv5fCqhNYUPbslXaC//G9UhlQ85PnRqjl3KKC0EYLLG7VH1xqV
         p/fBH6VbVoduWPNiSMdoIvCeZ+rHZbgJ1JDh1ylmGnrlpBF6gT3HjlwlMd2iZ6NqDh5h
         gmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794052; x=1724398852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpiLIHd7RwewW+o/fTDGbmxF9iEJfCFxBRNxKUku6uc=;
        b=dJBugjDeLggK2n+n4KTCpAEJIxfwbUHNgrWJU107WatXOgBPqXhr1vf/VnRKvbERnG
         dAp2CRcXliu3rMTOu1kw6UTg+1TxzEIMsKD5THiH21cEOYt694UrG7sNXdLaxYmAe1dk
         vjA4hSjdP0JBGjoDJ55ztyr36ItJuyfnRWMPMr6nrQdGOfEZ8PijnlesBIXvW4Fd5yvg
         afpVkNmBYvNiSQKhO3KO5KgLZys376rQHlc43T39hCLhibpnUiPYH1M6RlWeGMii/yjQ
         tfQtW4D7CFS2ygQ6eFlbZK29kOHxKkNwsjFEjVLaHpemYfz5GHiMCDc/LsUkvMecmX53
         lVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVx9lVq71BviTTCtcG7hIg3gAtSEsM6wvg7O2KR85NNmwSMb0Lg7zqQyWlxBfUkoPUC92d4a+mUWUd0eFRz4qOooajHjno+aa88S0=
X-Gm-Message-State: AOJu0Yy3Ky9ZdQhiTc/XIOVr0Z7kPvAvdCEf4rQ+w8e5Qoajoay9XELV
	XQxiJDDJzkINneUUK9kR/daGNaY1jTtHWyqGReoqtkkX/EfvNGFb6kNmsAmbJCM=
X-Google-Smtp-Source: AGHT+IELCc+OCzcJ/Js9NwPDwHfifOzvE4gl8BthiWmIBR2Eaem8CWHrHiKiF111j3uXtD+30pxdXA==
X-Received: by 2002:a2e:a99d:0:b0:2ef:2490:46fb with SMTP id 38308e7fff4ca-2f3be5f59femr14797761fa.37.1723794051688;
        Fri, 16 Aug 2024 00:40:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:34 +0200
Subject: [PATCH v2 4/7] thermal: of: Simplify
 thermal_of_for_each_cooling_maps() with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-4-cee9fc490478@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9M5ntznKTX5NDEFACMt23t7+gXPt/dasJVMFbG8WF/M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ3KbC+CIW/wgMP/qsQhWUwSxbE78dCD5pPL
 pLwIbQ3KvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CdwAKCRDBN2bmhouD
 1wEiD/9ZPNQh9CCdAjJ7tvBzsxq+KQKtvaWC/fQDIECn5V/X2lAA0i7fPqDihwYNGci0qdbP77c
 nGwvi5k79aqQ/K9EHna3OBQR343woYrPjcIQ/3kYcvzY9DdqIXbNaGVHtypT154nMeZysDY1jbd
 ZxM2XiVBivBQvsad9X21O6NKdbP3u6KvuLXNj6aaIJ0gPQYU9/PInP2wU/21gIYSAZTsVLEwxaf
 9Gb0c87Irgoq1zyV/6LIzngJVoJtQavHuWHgA66hTlAlYhZYAqq/TTUsJzNP2tWmEVUVz7qL8rw
 8nGc9pL64W+FFW2EvNgZNbFFT42DsghleR66MnBH/hMxcLpyg4lYtAt6Nzd6kHBYzexQzp2Tq3m
 dXNHetyc4N0Qg24s02eeR8eILN/iHrAKJAhYEPuLrRNODZs3yBDSk+ZxJJ78w2B/I7jRDiwTnaj
 fZxW9te26WMReCULmYh/TV3wBj/O2qgl8ZwEogLuB5xZ3fEqfBnHRfT5mIGSzJ4YG85T+K/hJMR
 ayrpjXDymP7W+xnSv8auBecvBDVuTBMeHWvoxaSIf7jqrathAKibinrv5qi8KU2uG4A2i6rQtZ+
 2QlPWRmMoyiFKZdF+ylcC+RC2TyCdKGZLQFkq7SwSQXMs2KTP358oSRs6MeyTky/OfRLPvq+Xy5
 52INWgb0WAFW/4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 94cc077ab3a1..ce398fde48bb 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -373,7 +373,7 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 					    int (*action)(struct device_node *, int, int,
 							  struct thermal_zone_device *, struct thermal_cooling_device *))
 {
-	struct device_node *tz_np, *cm_np, *child;
+	struct device_node *tz_np, *cm_np;
 	int ret = 0;
 
 	tz_np = thermal_of_zone_get_by_name(tz);
@@ -386,12 +386,10 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 	if (!cm_np)
 		goto out;
 
-	for_each_child_of_node(cm_np, child) {
+	for_each_child_of_node_scoped(cm_np, child) {
 		ret = thermal_of_for_each_cooling_device(tz_np, child, tz, cdev, action);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			break;
-		}
 	}
 
 	of_node_put(cm_np);

-- 
2.43.0


