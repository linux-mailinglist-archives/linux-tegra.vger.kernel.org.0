Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA2222525
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgGPOTK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:10 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4E8C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:09 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a1so4864230edt.10
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vz4JJf+AvBouSQqckAWdIIBtsrDCHUh+IEqSeYUd6tg=;
        b=iPuWs0l1qwbk+OirRgwUDdskdbzlCZ0ulnJWzQpRWTOfLGn/egsMkwYK8EYXLCdila
         bn6bSqZju76nS6ajxQBExXJf0yXSH5UZcBhzrAjPSbQp8CbFfwph7b4CrlHNeKylKVoq
         4Bfk45g4MLqlevIEvaQxfQWMNMGl246wagzCf1381+RBAy6tH7mAg/cVa0OJOxJKrcSR
         a+mtOm9jz1YVZGqMNnfRJ4GbnHQpOGQBPMQsdXEIrCo5uBiKMznKSyyhTIMag0lLPz4X
         7kR44qEzs1pfCM5be11Ao7c8lt9BKydiSWeyrjEC6kAe3/a7tGOoYZ2G066cEnNC9v23
         yiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vz4JJf+AvBouSQqckAWdIIBtsrDCHUh+IEqSeYUd6tg=;
        b=MeULaRUtAHaOKlEgPS5DbzTA+xQT+nmgpTKQEHeC/2wkJ34hD8Nr9Ry2lqYV5vLBRH
         xoJ0yF9MnglNVwVzDiUsQfArK2Ohei5CVzUbq/y04aQXqdbIPcvgT1h4ZVQoVSwG5LN2
         0wjp7kh8NWqK9OVl72Bj6z87V7zuSjtiX6JNKSqdX4AkdrJ9pDfJ5OKKuobMNNP6lOYz
         vW0M9aljsLgxHywdy1d1DqwSz9CSk7X/RSBXgSf3nSr23M2RkIPl6RNQFm6X3KCGZpkW
         E5xQhe/aXmZvWQvL/hY+QUepozRioApU48P1wmRxWQLpK7HfKHWJijokvRMf8OhgLhZC
         +TSw==
X-Gm-Message-State: AOAM532ixPit41CHqkNc6TvxpRVTvYdv6lMXjOL6MHxTh1IZA3QmukSS
        xdHGnfHPvgwNf9n9wAi03sTKI+j6
X-Google-Smtp-Source: ABdhPJxbVtlYHy7DUffeTg0KSB37ulxN7kuNbi2LOJH6NglYW3XQIsjcVCkmc5s2G7W8X2Ilh55rWA==
X-Received: by 2002:aa7:c80f:: with SMTP id a15mr4483996edt.299.1594909148443;
        Thu, 16 Jul 2020 07:19:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n2sm5429873edq.73.2020.07.16.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] dt-bindings: fuse: tegra: Document Tegra234 compatible string
Date:   Thu, 16 Jul 2020 16:18:50 +0200
Message-Id: <20200716141856.544718-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra234 FUSE block is very similar to that on prior chips but not
completely compatible. Document the new compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 2aaf661c04ee..b76cf42639f1 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -7,6 +7,7 @@ Required properties:
   For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
   For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
   "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
+  For Tegra234 must conatin "nvidia,tegra234-efuse".
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
-- 
2.27.0

