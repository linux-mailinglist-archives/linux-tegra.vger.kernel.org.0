Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B051FB2B7
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPNyY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNyX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21904C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so2967010wmh.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kohp4ByBzij/Hl1xrB3hZcDo7ypF5P2DDaqD3Gmwppk=;
        b=jcdi4uwKaB7wSEetmMfgyfs9siH+AqnbUtVtKRDTYJY6ChjA4WVlAMqrl6999ZDPU5
         k8yXcKV1wzNcfiiF9dudSLTPAj//Z+zWIPXwZWB12cKJvimSBQvGgi+LEC5vTI7i6tiv
         i5T9yMlJlnuutdYWgtz6PsGn67K52tf/ZT5RHqA3qap5F0FrzSVXtmjaFp7vjx40N5fw
         qCa9vjcgaX5moihQ29Bo1dhz13lUof3JAcvmdyanZW34h+FC84uh/btgkonbyC19FcNW
         z4agAV1bt8YzhTCzed2zVb9OZX4SlRL0gr9UDFov1Zujhf/edyhMA5vOds8j25k3Z3Yo
         J/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kohp4ByBzij/Hl1xrB3hZcDo7ypF5P2DDaqD3Gmwppk=;
        b=kYMJpXAta8IB8GkO4gHeIftSjZg+KlV/3s47bGX/uOV3x6zedORFw+05rw/eEfX9xe
         ckYUxbtvgdJ+0CeZSaRnfxMVEz1Miyj/2uTaixzQDeiFRx1TDltEbvwTWxlxVAaCvbii
         1JMxFt+3V07npCqsCObItLiREV9GwiAg/ZG0zxv2QIFuXQvwfUesDcDjPiVHx5yRY3xW
         UGIosRFTKGRPLE1uTr3PbWYDJILAqjK/mD56BgiD7hia188ijA/Mrlj796OC1QI48I0c
         W+Y1KvpoDsmcIehOFeGnJt6q5IFaQiYwsN2bClf5pQ4cgjUINjVv3Z2+kbpcv32RjqLG
         XuUg==
X-Gm-Message-State: AOAM530zozJSB1KQxotTXRDbmhtEzSW4yDb7lDjgZSmGoHliA/Sm+vd0
        /4TqrVqCSgz2iIN6/nuDLSsY/V8a
X-Google-Smtp-Source: ABdhPJzYuYZvMSSS5pnGUNFPkuUuZ4PRqL2q+UUmEmXZXfwEASaYq51lzkq8aIWeT/mP4+U59DZB3g==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr3355026wmb.82.1592315661916;
        Tue, 16 Jun 2020 06:54:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s2sm4000871wmh.15.2020.06.16.06.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 38/73] arm64: tegra: Use standard notation for interrupts
Date:   Tue, 16 Jun 2020 15:52:03 +0200
Message-Id: <20200616135238.3001888-39-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It is customary to use angle brackets around each tuple in the
interrupts property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 373f575b8678..50b56168fc97 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1199,8 +1199,8 @@ gpu@17000000 {
 		compatible = "nvidia,gp10b";
 		reg = <0x0 0x17000000 0x0 0x1000000>,
 		      <0x0 0x18000000 0x0 0x1000000>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "stall", "nonstall";
 
 		clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
-- 
2.24.1

