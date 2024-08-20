Return-Path: <linux-tegra+bounces-3364-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51582958148
	for <lists+linux-tegra@lfdr.de>; Tue, 20 Aug 2024 10:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E944E1F2462C
	for <lists+linux-tegra@lfdr.de>; Tue, 20 Aug 2024 08:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1351818C331;
	Tue, 20 Aug 2024 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APusk8G3"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790118C00B
	for <linux-tegra@vger.kernel.org>; Tue, 20 Aug 2024 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143481; cv=none; b=FHPoEvH2RneuPF24djPsl7lMeJ7h15yIcSo41bJ/CefOORXxp4lSQVwk7T/v9C4c4EXXCkHZDFSxlMVs9dM0K4XU7EilV1Ce9eK2hmcQzD1BxRLnEH777Y+eUTgmwqfuZpDKr0i9UWM3X0RBjU7GWgvzMjCCCP9ZEU2+xPPErww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143481; c=relaxed/simple;
	bh=tuavY8B+K9C97HunEmyoljvzjotXaTEWqYBTIU/UZM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNTEa01Z68b7W9y44iHixv9jWzxhzEcvQffh4MR+N5KdYNEj1XoYxRLF4A2qmRcumSJz3FyTfNAhkEyGC+WwXKd+kOEdvogRqhYdtZ9OIu+jinYqCZzHiBdXv+zwxutMSPrtzke/77ieuYuJSMaYVsJEL4cK/OuQXFIRBnyTRZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APusk8G3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so4338233a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 20 Aug 2024 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143477; x=1724748277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLlU3+TlFuBxRVx2lzjivm2ZIQexem+IzXNKgKlDOlg=;
        b=APusk8G35ZTj4ux5atL7HpkrLNFNHB0NxBK0X0nalqYNMzr++TEm56FwUOezG+BG6u
         hzsIv5C+XWhmyFCuAz7gVP+3xkoZDEZ2sIlWdmJ1MMItbwSnAjavnTEAG7jIA6TKvTA6
         iQAKaILgdEsCgKRCYd1TTKkR9uzFuxvu45d0oIFF6/70flAhbAxuhSJpyDr/2tbuc2L+
         u6hQ5wBJYkv9RcAUBM0X6h7+07gjCSq6cIuUbl6BcybrGwNvURqA0Hhq1d0eZSa0+pYr
         Eiw+fntAzGUHyNutvewi8Oa48zprlUSN0k9aCsZMpgZZ6vPR0tJ6urt53sGRtnXWjuUe
         wmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143477; x=1724748277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLlU3+TlFuBxRVx2lzjivm2ZIQexem+IzXNKgKlDOlg=;
        b=hUdQqn5rcDkPt7lNSm+eLX+291TSA6NL7uBMnKTULcQolCVF9Oc+DHluBE4rIWWlwT
         A8sMnZTc23gEaHbRQwpAM7rgZLGP3h0uR47LuNnuxpgn4QydgJeMvTwLigpdDLxDcHRW
         03XJuVl7fwF9d+RwgXFBiHDz51lgQA8GbFRenw5d5fzZUeBz6racnswiJpYMQK6inLlD
         b/d65oYz4J5e4ydvwjTKrUMrrdNipFLP5/cbmNm1kHaqOCCguaIiqJMltnpbGLo9gZU1
         3GZF2tHha67Fw2qj20s15PQK16jIOp5mcMjyOCgrRL35UUCkVKrMXL98B68AVXDdzZ3A
         dMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQ4tIaavlt5yVo3hG5yN8Vc7bvboizCJnQN2yLqwvz8McFB8rx3KqvJDfU+Oc3akbP/4LwrJNqLYxT/rtoCBDA7qCep+9BW9x2O4=
X-Gm-Message-State: AOJu0Yxd1bukFjKnzqU6qRGKkKSE9n3eKsCH/S/hlMMiEwSiLOPARrQL
	/86QQZjfZk5n5y6oB9IN7D3s15Ry2Y4uP9hkxdqphWe6+428SAc0vrRhy2VI4JZtki/LYAuImgP
	a
X-Google-Smtp-Source: AGHT+IG3c3yEsOEYt0Ms552/y+JJoXTiNtytJKuxIEuDy+I8cVSDLVszMI5UxWNOdiCzcSoAoeEhpA==
X-Received: by 2002:a17:907:e25a:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a839292f340mr1049403666b.23.1724143477182;
        Tue, 20 Aug 2024 01:44:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383946973sm728037766b.160.2024.08.20.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:44:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 20 Aug 2024 10:44:26 +0200
Subject: [PATCH 3/3] dt-bindings: i2c: nvidia,tegra20-i2c: define
 power-domains top-level
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-dt-bindings-i2c-nvidia-v1-3-2763e9a9a1b0@linaro.org>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tuavY8B+K9C97HunEmyoljvzjotXaTEWqYBTIU/UZM4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmxFducl0CivLBIidJgzplwyH3OS+XGj4W/ZkF4
 pJsphTvNMKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsRXbgAKCRDBN2bmhouD
 1/2MD/kB+O/KfmEbReWf0/6iWQuEfJCxT8RTJOcit9xG2fcCDf8v4xRinTMTAPu7Cmn4ifH3FOJ
 0GKYtD+06DEsKYzsaQSNtAO/HJuvn8qFaTzdmSgSsiZVqdkNGSy+pw9FuQZZ+YG3qSYc/z5DQgx
 /TdT0pOt/mKOQR0SxuwoGKTqtyIPVeXH4tLLEZMkbMzg+k2VDw682/YVeDX3aG/v9NuXPWKaFBK
 l3sPa4cdgHQ+m3/fYU9SJ5QqDaNGCkzoKqvR5z0g6rfkh/6L4I9ybPn/X8jDnfYgCf8j4oUkAGD
 uvV6/hPuQi9fDV4jQTCCmzywtLddIoy0tjzZkNT3p3IASEKqFFxK8Zjsj5Ia7fXztnvNwjktV3C
 QuinUxVaRwK/3on7aMP8kNROGUQqDs8QsNXVVYJIEgCWHDwoDHa7cqwnbQV3EzsYk0Dj3LfuCQ/
 5rpb+0v6WdZDCkt2T7uQFJDVnOD0geeM9gfwL7baZw7dww+00zjvuMnfjZdA0wD1bHxSKQC+wCR
 tiVoPdnYNthyWZkdB1VEg6rkaDj82lxRlHdOuwyPQjFNyR+E+14xbqQqEM2XSTnxdbpyY4IPmRy
 MnSPSAiYaE9jRBCfaGCm1A+Lqtx3590pIlR+36zo3lmE0IS/VpZblLL5ptuIX1CwgsVJwBz3zYo
 B/LOImh9cl7lw+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Properties are expected to be defined in top-level "properties:" block
and further customized in "if:then:".  Only one variant has power
domains, so add respective top-level property and disallow it for other
devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index eeaa07fe3875..b57ae6963e62 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -103,6 +103,9 @@ properties:
     items:
       - const: i2c
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     items:
       - description: DMA channel for the reception FIFO
@@ -162,6 +165,9 @@ allOf:
         power-domains:
           items:
             - description: phandle to the VENC power domain
+    else:
+      properties:
+        power-domains: false
 
 unevaluatedProperties: false
 

-- 
2.43.0


