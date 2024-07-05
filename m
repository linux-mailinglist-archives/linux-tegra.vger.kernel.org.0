Return-Path: <linux-tegra+bounces-2931-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AFA9285EC
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 11:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C121282956
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 09:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB04157460;
	Fri,  5 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pf86Wqf5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213C155342
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173140; cv=none; b=TCmjVknnji7+kl2niElbCm8+6WU+Vjy2G5kiG+8zqmduReibE8TkIDZDD95Lh6qmvcMlZ+ZZUyxvCmG4E3a8zD/I9Ac0kaZPDt8ZzY37uhNT5YP9+JGlOS/f2TQFfqXtltEfTy/J7h6ylV/ood81Ua9bBxwfda7+cyY7IRORtrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173140; c=relaxed/simple;
	bh=PhqeVWb5AhUZ+TVjiuEbVKHXnMtFrrz3lDWQEgW3GKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcjUwa0NQsXd9ZLCbViwDuzv2SUImTvcovitUrNgX+NC4i5O7u0+GniUOmGyzSsKcCgNtS2NCPkDiSJl3Q/Hb2Q6WUcR6cWzhwCENf8qeXzyDPc+XUKmh7b3kMs9/nYnf5YMHpWA8BNhwC67HE4T7tP1UJCQHVz0voSaBhIilBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pf86Wqf5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4256788e13bso9674065e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173136; x=1720777936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKqtRkIKZziWtjCTznIKCd63AloZp1nyjQT6Dz4Kf10=;
        b=Pf86Wqf5hs9aC5LFToMR0ifRV5FTEc9IBoI4buFraPt2R8C0p8GoJhZ1PP/A8Hx5rW
         kIccP4GOVC2V8rhMUT9qtoqj6OZLG2yNLH0hgREtZsCv8J2yxTiD/XsTGSt9IRBtopV5
         UfaX/FgXChIfIOAXiUFlRg33/bBGvX/L1GYtQKhVthF0z77dCTAOdn75fDfL0QjDTxHp
         w5P/eHZcqFTeeWgQqHLT9GtRe6t7144MR1iZ+H4iJNXMSCFD1KijXJdcich6UkHyGRYC
         pcZDlo4XGamSx1T800YubsIHYOkC8OQKtqZ5vNhsjloNJUhqtJOhUGlDQOdNBOaL56mk
         XAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173136; x=1720777936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKqtRkIKZziWtjCTznIKCd63AloZp1nyjQT6Dz4Kf10=;
        b=rhyQEdHz+EFwqh4UP0nInfvmpM0p0Q8PATavWT/U3pg/Il3jUIXZ9k7mD4HL+mR+AA
         yHwe47cFA6I6K9SGffQotoyNxisalS5AFVqag0e3JdOEh7NaFnThZ0J3lHcM3u+HSYrd
         s98bZblU6qrtDezdndaT62DZLxhS10CDFS1vPVPW8S6MU9mEbDS6hbew3GjQpa6kJ7sY
         V0hJ1Q1CMNLsIcT9vquTN8rV7jTpcJX1kYVz8ow3bjA7O+5LUPzKrubnRKOJ8hjc8jp/
         Hw9SYAFTjQp5rS2Y6wwQNQ0lzaCT/Huoa0Icnsi9ZGnU7LADwgNx4fDLn+CBqDGCR5yq
         5Bhg==
X-Forwarded-Encrypted: i=1; AJvYcCUmNIuzUxJb/4tx5dOu0xUU+ANAFA1AUqtuHsIenwLDfvFKV8FXbDpkclsy4tIfgAc46Rm0SoC3un1f6EjgWGgM1spfB3Oa566w2HY=
X-Gm-Message-State: AOJu0YyCW8G9p0mhG3fWLebWgYoPdis38aivUA4N0hLUn5LNz/RHusNb
	VCOZRbSipRM+ciiDmNOcTimG9O5Hue2rPGYsKhMLpVfs2BF2l1IMNQUGJVpfay8=
X-Google-Smtp-Source: AGHT+IG2nfyfOFODsINFapnK4EjwRmiLFuS6mdyQ2tPZgE4KKTOjRXzWDUhHtaXzjuKiXh1Thk8Mag==
X-Received: by 2002:a7b:cb42:0:b0:425:8bc2:d01e with SMTP id 5b1f17b1804b1-4264a48cf6amr29090245e9.39.1720173136370;
        Fri, 05 Jul 2024 02:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:31 +0200
Subject: [PATCH RESEND 12/22] dt-bindings: thermal: qoriq: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-12-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PhqeVWb5AhUZ+TVjiuEbVKHXnMtFrrz3lDWQEgW3GKk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IuHb0/nwwqjF9F3MLHILARJPYIbjhma9l0l
 qDg56q1paGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLgAKCRDBN2bmhouD
 15TJD/0aeAqus9TFN3iLADtrOOXAjfXurNxC8IOzekRzSUrjGIPfmsTBEN+H2ihJJ8nb5gIB2b/
 aoxTJtTjZGW4gzOnPRjnNXeLmAvN5KJpIX/SIFjbEmKWGtfvpe8X+iU+fh6GBgOU9wxBWJoTUEB
 njWiPmqXoXKEkLWgDQ0G6je56VfUdhZ6Q2ir/rtc1isLlmbK9z7S7pMZfqHc8MhXZpXP6b0nihF
 cuEvZZ8ij3zH9au1OAAyzfFLyXuEJqz2u1984v7ZEFBHNzRbVDazlcyJ0mHLhpZoBWbv2NB6tLv
 HG2DN8HbbZcF3sQm9rMbjBnhfrq0XbUtXCOKaNnhhdHy+RpCOGf0l3SgjMqr++Z3aeQScUaY+MO
 JPXotMYhRzvNIZHqajFeQdD/5wODGrtCOKdmh6jEJ7Xo0zn9nAZq4AEV2ylawLSB5C+MmizlPcI
 iGcEPpNONXWbXjamNLpB3WeXfUa3uUm7++dSr8su4E+CrdTfyu/4EWXVuIEv9fzSdgtr4XaoChp
 2xIiIjUWtPDi40cVNTNx4/mHKT5WzTvcMGgUaUwmFB7G8t39blPh9yP0EbPw5bFmE14HM2+cILi
 Kx0UQLsvY77pmwpZ8Jpn0+vkZlAprB7MgOoOunxeRs/Qu4WOmnouk0/PJr7FZ2NRByZt8pw5hwU
 p5UjlqLismlHSRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index 66c4972d5072..aa756dae512a 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Sascha Hauer <s.hauer@pengutronix.de>
   - Fabio Estevam <festevam@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     description: |
@@ -70,9 +72,8 @@ required:
   - interrupts
   - fsl,tmu-range
   - fsl,tmu-calibration
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


