Return-Path: <linux-tegra+bounces-2674-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9C908826
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2024 11:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B916C1C24EB2
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2024 09:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845F1195FFC;
	Fri, 14 Jun 2024 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DmbKDmIE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D1195B04
	for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2024 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358404; cv=none; b=NKK9XMt7pcYHDubAkgg6a56tKpJlYX4KjzqzaxtagsFv6DO7ELTJ0pW+8qh+xe21zBXaq2GUu5HMIo0yZjXR7DVla1fg11dGiqrhGJq0U1mAsEIkebSrPQM25yPXpyGAs1/LYx8URLHDJye40mCMo3nbK0as/iOy07LqqnWVlxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358404; c=relaxed/simple;
	bh=4nD7nbG+x/aHIG3b41jcsj1A8FaFZMdyxJIm6u3+UCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QG8GRYTv3ruf551cMKuooBH1UsCnR3QAEFbGygBHYG5pAMbN6M9kZLjmmpN0ymtaR/oSNFaRSzhsm5PWMmniamp2qwfMvXZeRhnCHzvctmbkqS7oqp/o+s8ECB83/rsezMtTZ5kyYxMqIb8z9P3o/iMq8vJF2hHjQ6gO3QGusB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DmbKDmIE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c61165af6so2332559a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2024 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358400; x=1718963200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6wsm8Xx/pf44IU0fA2MjvK7doD5kwmYUud3XBVXDbs=;
        b=DmbKDmIEO2Xpcacaa1TkjNmeKnK4GQy8CeTo31tIsdI7BID95TmVT0vDLhnkWHarK2
         dNQix37E2vwgrgDjcXBcSmMfM0K4sRLeTN2rt+4Yb8sUE4P1b6/aU3IkN/qBa/ywBkOV
         fdqDaOyoUpIwydr4O9tBiQ5NbSyuWrYieYJuLvUrb77hdmPkAv5g6TryzzW05wulKSrO
         KFf2J8FAj6pIJGcELE46j+po1/Z4k9tD+ZuSl0PuoAjWdcDnzls1Zz3gve8eNHe5KaSv
         6aSTjkJlKjCPCPqx58sIIG4/Q6wCkCw5UqYwV+Ox8lLfqaITB6WPPwpYB+aRAyET2n+Q
         dkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358400; x=1718963200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6wsm8Xx/pf44IU0fA2MjvK7doD5kwmYUud3XBVXDbs=;
        b=LrXx/L70MbAUcgql7xpaTEoh28GmjM0PuLwKURixiUOTRCek6oOByie7JgcGUJ6ehY
         CrthCrfQ5yFINK2TlqMbLR1bDejg4dtbtdemvy4PdiGS8TBtwr6U6FKmS3a0caT5v5Lv
         QKvhprI4XA0R3eLMIQf4x0nzuWYNpGcRejfgmhU+DPmVzQjNqfK1w8dLs2NRO8tUoeqB
         tyg+qmmdrUZLjb44dQ3y+Xz/EpMXjD0ut2hD8XnoLfbMhBQae7Fm7/5hCOydQL0OlLaf
         vkD7JdzYMdh+bl0fqivMqsMLFMDdK1LI9+DaiKlEIIjxTjioGpuRHFRpObXLZ2i1KjDa
         Xy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpiV70oNMqFtY3WlF+VOAqo1tV3JWRrSl7vCcSY9pwQmfTh/gQvcn3wWDdbTCGz9o3SPxDBJmGhsGnLHC9MiWj4iY9Z9f7kP/Qisg=
X-Gm-Message-State: AOJu0YyT8J7oYipBuG5gs+yNo2fO/byygHrVjbFvYcDkgUyor1AFYmTw
	ErHZcY1qfkdAzwZT7N/CYk3d6CKBGecG3vr1BV6NhAbFRvXB9vhBxQyRHBdJkmY=
X-Google-Smtp-Source: AGHT+IEiXb3yGV64TEB9dXMpsLr2AVSRMLYNMjccShQyJiKLUI2XAj/tHwYBQihryGriZP6pQI+tWw==
X-Received: by 2002:a17:906:1754:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a6f60ced441mr137234066b.11.1718358400263;
        Fri, 14 Jun 2024 02:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:03 +0200
Subject: [PATCH 04/22] dt-bindings: thermal: brcm,avs-ro: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-4-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4nD7nbG+x/aHIG3b41jcsj1A8FaFZMdyxJIm6u3+UCQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFjXVOnPfxENiYSEd3PegskhPdMdIBD/C50x
 gmcTpA2YC2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYwAKCRDBN2bmhouD
 17PBD/9uYmV8ARyZjA4ebD50QHOJeOLukSI+7nYfdM7JguKmOozwbkqqMEEm4Y0hsTy4FKxfSQ6
 aX9Jlt2b4Eu8v6bt2h7qgbs5dwjMto/c9km1pndTva/76T6LheOsVIys7rKqu9I4WFycJAl9Z+R
 ITA4nfhIqHKcc5lMGo63EYIymwpGpRg0xPfhHMeBacHmuEO8+Ga19DYhegyzfmz/1IIfsMeIQyN
 /e/qMoh23oP0pX6rx1s4A5g2LrZXct4S3ThE3MAiFEwmLU8v517DS818NXn3ZkoiMZqddZUUuMQ
 73N7kWxS4DRg4tjiS2ySxTm+NrIh/EJs+xfeY3vfqprS8+JiDw2bstTnfTgpqtcK25xrKOAUKkA
 VQI2F4dPkZJGMgWSHgmrytDYs2AnwgO8IErRXB2cxcOMgSLA7ec8ERAg81qOC+YZk1BLqLkAoJC
 ie05pevMxHxxEnGk0eYwn42+Z4l3C4AjWGeU8AvPb7SVd91uFpLoxVbKLQ+pmo8WomhTlt6FQAS
 kzZl4sy/enWnW7jJcfB0L3NzCT4cpsXK1eWhHWk9wZ4SkbLTkCVjw9p+YF1GH+F1961ziJwtkXV
 XZXgbQItXtV6BKXx5DSa3sfi+vpztQdEOHa9eDA7BtuT4Z+8K7liyhWcIiwnW8+j/OQ21Q9tMWX
 LO1gAouP7lLNF1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 89a2c32c0ab2..0271a0bc1843 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -19,19 +19,19 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: brcm,bcm2711-thermal
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     const: 0
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


