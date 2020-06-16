Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAE41FB2E0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgFPNz2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgFPNz1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5AFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so3182993wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qZkPY5bmoCgpmhUCVf6pNbB0U2EgFEkvwmeKVPqcE4I=;
        b=RJBSY6X3D75xtJyfmnTDI6AZfDHhVeb64mmheEEmVIb/poZNRfrXigc+Kg10fO4Hvy
         e7IiCqrmBN36GV2U3nGUDZDf5rZAtlkRCHLcwVwx1LaIKhcWZ8ZFY1WU0YvWoqYKFJJb
         03Kk0e4KOkIumR/Js4azvwYTa2kxAxPCSko59QWp4pBPE5/e6McJLYcMqVf3isRsKijp
         VHAfk5YTUZwQtJdxMFHqbzGVATF83sQlcgox+JFw5gdE8nM1m/0basM2WFig1a8Wy+iX
         0WSLf6j49GiHDsStQZ8kBobnmkpbHvfyXtTLr6HjKCP+hYeW7MY9Dh6CYo16NhlBL2gL
         v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qZkPY5bmoCgpmhUCVf6pNbB0U2EgFEkvwmeKVPqcE4I=;
        b=l2QhELrs5acBjJXkaQolGaA3jknCN370VTqS5hrymaxHZhBcqCCy9xsvlq7wQO6ee0
         1tFAtITuVBWuZr/d7r9jTP6Md+vY16S20O+ULhSthw7GA5a9zQDlHqakC2CANc2Y1fll
         evDwPj2PmOgGGCxyc32Y93xICCrvwE7V5E3oIKXK8+KllkONsdjlDA2Rgg6O1A0WNZvg
         Wdj2QqMokdLZQkrrrG6u2LWtoUMECOBxMsm0+LCBIu8aZ8xjrG30Qr8y8nmAlLG/9kEW
         u/75hqp+GX+PLOmDc7qqBj1jl56KJG1AtH3OuSmxPuqTMrZj4pUr1OxrejTFubroQgVV
         Qq+g==
X-Gm-Message-State: AOAM531TZ3LavX46sg5yabxLX5Vt/Y/qOBbzJ3HUdAj8AnZK2Ghg4wW/
        jDtGw7LhqmcjGyIRk99d2mE=
X-Google-Smtp-Source: ABdhPJzhOQC9gckMGWo4NKUvSt4NZfpgQk/k5WXziNdJe6I0mhJandqfAD4DXCQ2dCspJWQEhoMUEQ==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr3402681wmb.150.1592315726078;
        Tue, 16 Jun 2020 06:55:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u3sm4187727wmg.38.2020.06.16.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 67/73] arm64: tegra: Remove unused interrupts from Tegra194 AON GPIO
Date:   Tue, 16 Jun 2020 15:52:32 +0200
Message-Id: <20200616135238.3001888-68-thierry.reding@gmail.com>
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

The AON GPIO controller on Tegra194 currently only uses a single
interrupt, so remove the extra ones.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2ecb80e1b09d..e0aa6c74073a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -999,10 +999,7 @@ gpio_aon: gpio@c2f0000 {
 			reg-names = "security", "gpio";
 			reg = <0xc2f0000 0x1000>,
 			      <0xc2f1000 0x1000>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.24.1

