Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E4C1FB294
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgFPNxN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgFPNxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EEAC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so2966441wme.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CsJOLSAV7jrFDpiST38oXr0om9CoIKPDCCZXQlS9m+Q=;
        b=C6nNcEvDBdDRoblLxhN8crE9V0SWAqmjp8IXfNd70fYoZSj08a+KNMXYpm2Ep0mkGs
         04ztt55i2rIDsg9NqBibK7gjtsS1RsgWepHq96duxmdHx/BqXi8yjtlTKea7tETXxnBd
         TP2mOSmfu8UbeN+b9tinPBznIPZbFp2rgCRwTErfeBhm8pcP1lVdlMMVO051Bx3Y6YUq
         JMiWnei717U/W4qh1myEpoaEeNHN1gBa8eJ1gE1k6HBwxSeewyADUMg/b9/OX6zqWKzC
         YI5yy9NuKEP22YheElSCpdqbuyiw3AFV29GaD/rfl66C4/o6VF8JGcO3IrvBK1PCJ5En
         ajMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsJOLSAV7jrFDpiST38oXr0om9CoIKPDCCZXQlS9m+Q=;
        b=cR3LnR59GPtD2gObOZMXG/mHNHdLDR6H2pVBs0VKOD6YjshMX6iWlnFqRR7qOlvnrZ
         wtoD+fJd6fzRxxb2VHeHkmhha0tnzQG7h+n2uCdUSlgsVCKfGzZk9JUGlLzst7yF8k+x
         E4I4U5z249nYItvJOq+yt/7jKoexm2Lozvy8BGNsTOnHYnO/8+IeghGplT6anyvA4qTY
         BC70Yvf+gssBiROZGbf0r+bCLeUfpxcb8n9RYQ5IWzwQavLFSXQyarY+pH4mtqfZ2SDI
         WYrfa49uppdGH/2a4IrVb+DTVjm/KupmeldIqbIvEceuekRlxYp2jebgHvhcgYFLz5pR
         +c2w==
X-Gm-Message-State: AOAM530SfnTbPHeIiY43QWvZmoLh0tNfuqKmBB1wSi73wniw7jnI/etX
        n+K9p6U/v6EtIMUyJiO8ONs=
X-Google-Smtp-Source: ABdhPJzjqNfVbW94/FWweHsM1LMjOQFMMEaox+XR5ER4LbkHjLbu5AdkLhtiA+njLuz+SS46g3QF/g==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr3238882wmj.153.1592315590607;
        Tue, 16 Jun 2020 06:53:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r7sm3881747wmh.46.2020.06.16.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/73] ARM: tegra: gr3d is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:35 +0200
Message-Id: <20200616135238.3001888-11-thierry.reding@gmail.com>
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

The instantiation of gr3d in Tegra114 is not backwards-compatible with
the version found on earlier chips. Remove the misleading compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index d583dfba688f..392f06107b32 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -46,7 +46,7 @@ gr2d@54140000 {
 		};
 
 		gr3d@54180000 {
-			compatible = "nvidia,tegra114-gr3d", "nvidia,tegra20-gr3d";
+			compatible = "nvidia,tegra114-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA114_CLK_GR3D>;
 			resets = <&tegra_car 24>;
-- 
2.24.1

