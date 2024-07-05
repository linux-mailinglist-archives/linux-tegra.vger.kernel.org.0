Return-Path: <linux-tegra+bounces-2929-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49B9285DE
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 11:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3169B284520
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370D0153598;
	Fri,  5 Jul 2024 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXtg7t4a"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF114E2D4
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173137; cv=none; b=IuBhk3+rlrh2Q9ONBRLOIXlqG+3ItLJ02xtUHIVDdFKpoMq9KCYqUy+lsq9Ac66c4NOw4KpcmhpxnMtJPK0ZvrGYoFrdBaTzKyIAdC+UYfEbov0Zb4aDUCsQDa5AQGJr4m8d6suxsoC2MrctatjswdmGQdkuq99TSiYhrVpIwDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173137; c=relaxed/simple;
	bh=nsdQLuN+SQydv/zvdmA4FzqEJl/eMf90B93Xt2y2vFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgYoXKe6QSW3TkyOU7Q4v4FFegHF3uuxipQkGnD89EMWnPjuug0cBS8ZSuBaP+FoPEkgK4eBIKkdCDFZRrvKrqrcEtkv1Zc/VUzuH754+vs0/Wm45N+087NzPREgMarzkG56S9JW9HIQlRDu126yJUaLCxrKNhkWNynq63tR8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXtg7t4a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so9749685e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173132; x=1720777932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
        b=VXtg7t4apBLJqvCST7Tu3jx6QmovkoT96Bc5CkxHSNZ1bPH8UKw5KxitRiBa1N+CBF
         5/190mAmm18wpMHluACKrWkYxMPcaocvoE8YFcpVoueCRM6eZoLTMKrdPrYpIhnp9SJc
         5Aop0ZRwCP81+GWdxY18wMRWu0ZHXoQBWHFcmTJ8r7DueSlP/53ufc0OULWg6BJFBHFs
         0+e9jm+niOBxGiJbJ3pX8R87KioxFeWk3tG9+HaGKW42zGNCRYe7WDQvvg3/odXbRREj
         z6oE/ObUYMfHofYHmtORJDEhAcLwiGmCdIQwCTHyPNCYLmA+dmPnbzLoQ3uzNMeJdic+
         IoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173132; x=1720777932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
        b=A3BRNgvyL9nxoVt7VZm9ilpXtu6qxLQvwuJYDs9D2pP8J9pPtdWXxTzjHA3WnB8vzf
         OTTh6FVR3NZi+ILG6xOdeRzSAU8RTmnEJXwcF+vzq2ByyOT/SEW9Ww3UmSgBPlUECv/H
         +JIbJVKInxNDAmSbKPa4AC3IWHteC4sCj5f0eYmWuL4fJtbPnZnwYLzKiQ8pL4c7rr5p
         HFKx/vvxtJU2unts441lX6sVNSllfHFok7GkadVD+MEmbPP7NANUXLkUjtRaC4F1uN3m
         l6kYroHOPw8oKdcr5/Rxj5u++iA8TOoOiY/hNI1UMRD8tNjpHkSWjTg0hed1biOwwxeP
         Fp2g==
X-Forwarded-Encrypted: i=1; AJvYcCUQx6vn5+YqtSTiswcwFgThnoOGF51HlTLDa8jjp0S+TTs+uXHPyy2b7h/aD4606OK72zvYNQ7OJ2g2NqkYJEIVQRdlWPGdzua8tHg=
X-Gm-Message-State: AOJu0YxQNal3Pzxlm+47A0EPVLtzLalLlpe0ao03dssLeY2jrd8aiX7U
	OSweZbv9vUYj9lOdUyjcQj9yXBXmnzFBxLE32AMtT9tKwD2WZAiJe+YLWKOikt0=
X-Google-Smtp-Source: AGHT+IGkEaOGS3SEXQ2doYjoak+87kIZOp+NhiPnICsEeJe+OnkfTqVvU7x0phLNiFA/Cnmkm/jPpQ==
X-Received: by 2002:a7b:cd05:0:b0:425:7c29:7480 with SMTP id 5b1f17b1804b1-4264a48cb74mr33010955e9.38.1720173132598;
        Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:29 +0200
Subject: [PATCH RESEND 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-10-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nsdQLuN+SQydv/zvdmA4FzqEJl/eMf90B93Xt2y2vFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Is5nr18957M3S5EaFoQLgXcr0SMWBi7Ve0P
 mBnPLk+fdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLAAKCRDBN2bmhouD
 153BD/9X2T5QDXnPLqN8Gj/7SoVTWByJdN1lmjyIS2Hn9aXBhpXIgaARl93vDJP44E1LktOdGEr
 uNrptTktREtD52QtzNPMfBICj4LoiDlGNnajUM0eaP5UQgVM6thw7ho3mUkJM0Lh5YJKbxlpxKQ
 AzQFA3TPII6BhbFTLMMs+shIkI3PGMD7SSs4koEk6SI3BjThUeHqiZwPfKfpTW+K9f+CjXQ5O8d
 grI3ChmVLvxJdL63sbWOIVqrSHaQysCArD8TYdznl/qsnPXcNE/4AGsnYb9y9Ku39ftH7O3+2yE
 Et3LxCpzwfsD9fNL5bJslIFnBZoT6t6YQUBYM+npfEtATLmtmFG9vl/QpojEyaGttF3LApp7ZWJ
 XXQatmPnIiq71nGTMFZkoXVmdcRUvJfnNfwXwG3XXwtQpWjQ2ivFAo9EXmB+DmX0YGioiMwJn1l
 2LrG2ricYNcfYIgjsbEYpAT6q1DKm07JO4LAWHm2vXHj7kz2dZZ5dJbYWjlpE+4yXCvkn7tOasf
 BKfNaHHwTEb/biqkgpXZ97JpdyT7GJ6mNAB3Yu49N9uF6DiSg4EhB5C8D0uW05lPHSpZoOyXDje
 cHcvcqnUcgcuZ0hFlyfT0RxWJ5r/bJ4VAbZBM+fM1fKktjUniAZQnjl5B+8JM3CxFabmecjYyT9
 QEtxnJkZLgEptOQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
index d9d2657287cb..4470a5942fb2 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -23,9 +25,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -159,9 +158,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


