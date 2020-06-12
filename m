Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91D21F798F
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgFLOTz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:19:54 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF85C03E96F;
        Fri, 12 Jun 2020 07:19:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q25so8496346wmj.0;
        Fri, 12 Jun 2020 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRFnuMAeCw4oPn+fnqmB83L5B7hsBpnaQlPRplkfmVw=;
        b=Uw3pzPt/TituZUzf9G5LFizML1hx+IQywH1BhVAnGvZgVnDjCkeAMM81R72oVSedd+
         nnGa31F+smt1OPrZSgJOgE8GBEAauj9hyjE5nlHGLaOu8CeCu78mKXnCF2UT2zN3hqY5
         LipEdQNKuJkmLocuSPy6rJ3qgOy//EuSrNsDXZjKt1t8Y8FViCWQvAbjnybaWmNOVyl9
         CQMOJ4E0aI2XoMF4fP8uV3N7B7DP0tq1DID4SSb5YtLV3k/7mpF0/mywoISRNkCRLLLG
         mPwHyvbfLmZcwLUFf2J2BP/50IsVxhILrXCsHk5EPgMk/280zcQDPnhff3PFnS14CMbo
         4yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRFnuMAeCw4oPn+fnqmB83L5B7hsBpnaQlPRplkfmVw=;
        b=FmZ2AyaHFTNu2TMVs/HVQvf5mpFCSWPPGuYYGbSGXiqhFB5D5n9Wsd1ca+/0GI5kz1
         XGouMdUZYCz0tcMIBJz2NyoOIzBGTo2hQnswvqiUtKYAEo5RBMc5WhxFmOx8sx34hj8P
         vroWowFHBWRJlfyNBLDCMQtCEstqFovq7ZnwL+yBAXvN0/YfV8tFlU7ettnWIRm9CvBo
         z2K3mqku9g2m8Un9V5euSPalSjD8ewJeeUp/22Ot9nQIZKbI9SgHIMbx0ZFncITHkZsg
         V9q6YstHwHr7QLLNz/TOxtzA1qTuaJ+cn9zHy3UYobewTNyr4Vc3J0yAjcKMZNwDT2us
         QRMA==
X-Gm-Message-State: AOAM531XXzKQ39Fnzk70CfVXs9+z2+NdBwEr6QeyN/qM+C7LRC9q5f8i
        nJTwAi7F1zsxiXLk0eQ5Qmo=
X-Google-Smtp-Source: ABdhPJzVyUE0fTzVFpLfWelgoZZN5EzSAC50nTvtW2X9pjfwhks0eKnS5WM3dbojvA3EmWUouygAsA==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr14688512wmg.68.1591971593476;
        Fri, 12 Jun 2020 07:19:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i10sm10183642wrw.51.2020.06.12.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 22/38] dt-bindings: gpio: tegra186: Use unique include guard
Date:   Fri, 12 Jun 2020 16:18:47 +0200
Message-Id: <20200612141903.2391044-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This header file can be included from the same source or DTS files as
the existing dt-bindings/gpio/tegra-gpio.h header, so make sure its
include guard is unique.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/gpio/tegra186-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/tegra186-gpio.h b/include/dt-bindings/gpio/tegra186-gpio.h
index 0782b05e2775..af0d9583be70 100644
--- a/include/dt-bindings/gpio/tegra186-gpio.h
+++ b/include/dt-bindings/gpio/tegra186-gpio.h
@@ -8,8 +8,8 @@
  * The second cell contains standard flag values specified in gpio.h.
  */
 
-#ifndef _DT_BINDINGS_GPIO_TEGRA_GPIO_H
-#define _DT_BINDINGS_GPIO_TEGRA_GPIO_H
+#ifndef _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.24.1

