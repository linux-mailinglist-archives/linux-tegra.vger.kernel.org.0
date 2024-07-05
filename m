Return-Path: <linux-tegra+bounces-2935-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D38928606
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 11:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9841C20DC0
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305FB15F308;
	Fri,  5 Jul 2024 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHvXtJqd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E415B135
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173147; cv=none; b=aOFzRAxGXRd9gbiqsa5PWLOpzSq/KbfEeVZJQfqsW8dTeev1rij6wc8G1ae0YtjP6IXXEr5PLLYeqJzOrbrYod4kwW6qMnF3tt/0eY9xrJx/6pXHlRnjDI7lqzgrpn03tbYLyJaXun0p7GlNdRW74P1spS1rrmdip2oit4ADRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173147; c=relaxed/simple;
	bh=si2bJQEgzVX4jfFVEf5JmA55vCTdu/cw1/y9G1B9Kew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehe7Qz6tSCB2bqF9bbzYUy+i/6U/JYKtWBrhelNCFz9OgEcA92lEsOGJwdokc396ehIN/2DNIraRSs1uK+QqO4QjI3C8dpWjHNGc74/uoRJEx83wJOUk50xmsqZEkYeWThC5+Zv220Bcv9hBfanOohsaTt172ZXy+QDKts4pxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHvXtJqd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42562fde108so9801595e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173143; x=1720777943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bstSQhKvxmuwrV0beseHHMsTJE+y25nZMICfRlMCizw=;
        b=qHvXtJqdQG6OsyCZ22sEp5KvnBoeVnBctg3AgZudhaOJNIoQnn5JsvM7j8R9AkbvUE
         PF+LplrsBJ6KM7uTA9AkMkvPITCL8oge8E1CWYLA13dPb4XU9TOG0hSAvPbQds+i09sU
         39rqqeQcFf3JGcPwAPgZPFAEo3IWA5k/u1xtwyeOPbvhsJ7RBFfS0/By1f6flZEpMKkv
         rfgNlS1QnbdhVJPqH1uMs2XtI43cqYoBbSeQzFiaVoUgytvDCPSvWIerqeudKYvC1Z7r
         B40UGa42jt3TULA699x+CRcFnnBBD071eGjRh6+0Wn8adl9NQAKj4LQFOENqwq2yMm42
         Vw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173143; x=1720777943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bstSQhKvxmuwrV0beseHHMsTJE+y25nZMICfRlMCizw=;
        b=uFVQrQDrjmNPOJxn+MrmBlNXCuH6uSd84YBeEXHThklT+E4rcfSMgdP2fVlRJYza7L
         Q7LFqVmNA6Ufm7ynyCSzx9QekLZaMrlmltS8+jBebaVm0uvGCqPlQdTQDzmspYicRl8T
         r8QRetKrmdlBdAg5sLyLmaWplBP63LCpmm5BiJ1PdZem3Krw86JQ4z0k+70Cy2LrfTNA
         qhdynlIIrTPDso7CjID64FzWjDmh2YEVmQtThRe5/+2KABpRTDcImcfzpIj0GNzhjFDT
         ZfixokIRUOvkdqjwXJZuh0NCwOmsUEdr9wBaOYSgWJnWlvlTCSj7nXectIrOUCZPRLK8
         XJDg==
X-Forwarded-Encrypted: i=1; AJvYcCVo8+QmBfbwWEguRy76I9TjTdUIAd4K6I0+1RbjKKDUo5iLfrDsZLPAnoy6MJY+3Z7anG4JsR6ZEfmOTOxZrEMVuJLbRQKKkrxr1FI=
X-Gm-Message-State: AOJu0YzW4HUwDELlhimDml6vb5u0IutlmJF388pkY0cpCw3+Q1MFT4v8
	FlPxOr/yTTisOam13pngQLpwOqhGLK+EBHwNN4wFT01xhCWjBE7ocSnC8SPKf8Y=
X-Google-Smtp-Source: AGHT+IE+7hFlWSSNNj6V7A/r+oVZP3hlLitatReMoXRA78Q+rKYFzfRvhRRfOjAfAfsDJU6sCvm+RA==
X-Received: by 2002:a7b:cb02:0:b0:425:7974:2266 with SMTP id 5b1f17b1804b1-4264a3e9bd8mr27878605e9.24.1720173143512;
        Fri, 05 Jul 2024 02:52:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:35 +0200
Subject: [PATCH RESEND 16/22] dt-bindings: thermal: socionext,uniphier:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-16-554061b52fbc@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=si2bJQEgzVX4jfFVEf5JmA55vCTdu/cw1/y9G1B9Kew=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IxxNUITRJQNWWD31lsLoHRxWZKzNP1/Scpa
 JkXTROLtiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMQAKCRDBN2bmhouD
 177SD/9KfCnR5+YCyaf9vqOWwRRgh6JAUmPgTo6+EWPO2CLvl9sNWgoRsz7nLdiPlK66023ESBb
 cWG6inuNQkkDXN4vSfDO7J/DyJiMpoouAu+J3TyVB0/rA7rfqVDKgSd7u2OJi4ViqFHddbuXc5/
 1WSApDkDJ88cWpqyEFRwSWyBrEKrRM+2Fg3xdQaRtdJ9UfMXNuU9dHZE2H+Zqsxo3+RKjOXloiZ
 gISeE5E8u0HVd75V9b9eZLbCxrrIzUs3LdN/wg3Lh6K3DCl6lhOo0Wc4jRuJUUMV5LmfuGvfz8i
 Z2G2+/VBUJDkbyN0ahPuaQ+DBX+9uxflvE++E8lBnO/HDiOdBpkIZQeXf9FXGwT1PuHcSyJIK1n
 /aqp1GjAIUDor1YPyBbExKC4hsJr2tEu6drstDUwcsua4T3oz5XzWiax5GspfKuPHGCo4P3G14v
 JDtG+GwVc4MdPrTZI7nTq6FgxLeOV4q03ExF5G1mAVm63QOWBnCm/4QLDjQB+HgsRYe+41mGgi6
 BsEqXEP1wRQoZvSJMmLPh4mjsVV47qOCShPt7DqqDvHTRUOosRPOlbyxZFXYkfdy0OcBib78n4j
 Bud4w3XLuyRn4q6Fm9hCj2KHTJlQbZh8+ba/Ru/PlnsapiKC5HRW/YFQmfh2w2vK0M0l3M+mmU+
 NxWI8eUXYhiy10A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/socionext,uniphier-thermal.yaml      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
index 6f975821fa5e..8210b7079721 100644
--- a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
@@ -14,6 +14,8 @@ description: |
 maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -38,9 +40,8 @@ properties:
 required:
   - compatible
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


