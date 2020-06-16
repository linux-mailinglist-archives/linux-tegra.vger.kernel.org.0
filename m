Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556261FB2B4
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgFPNyS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13099C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u26so2325846wmn.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rSN3uDE7VVZdIMjjKeh4Dls6PgkPtrFPEandbX5MKoQ=;
        b=jVIlO54+hiIR87/2x0lfJ7IHZKwSvn0pa6pW4X9QV+XYjG0tJ7/2KK+or/7BKRoZOQ
         8NqrDKHbKYCSKkdB9okGqA+JIN1jUKfpJa5cIAc8+pc88Wj8/MJfVXwHdzB4OyX3PKW8
         EpCLPWEzKgFcqk0We8Jqd0dv33kXRjFZzbrCHgbcDu6vK5lL5IsWDJg2xRYw5adECyA8
         sccLsAiPfvdNNtDbIusJCIm2tVLHkK0SHo0/lOZ4HytPWWETwQ5f2F2JuQT0Ci4UivKJ
         6WvXc/t+dHnIPhh68TaB2TAkxb7Yz1TYS8vZrg0YcCJ4TrmOWvuMGd1oHdXMjR2xhOLa
         +9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rSN3uDE7VVZdIMjjKeh4Dls6PgkPtrFPEandbX5MKoQ=;
        b=ORnE/EfaQbEogkNbcfMrcuIKY9/zFeyIE+IsLazut0vTIw+U41/eFkco/XON3JVXtQ
         /xy9bCbwyVBby1luN6yNrALkw7j3hQ4XffPchUHyRExX8RfdSR0LPTO1neR534zC7aVd
         S3gEs7NfZCLsc306oS6mOusVeRaD1X+1/FgVQ+W+XbD8XJkH7Xdp6ibGMJ184x8acE53
         UqoWJ9Jsl9+T/6z0ZRMJKDWnKEPTFKVfwyyRKHKjpViBiob4Q9vgOHtJVjv76fQFm7Ij
         pCxeYCFfAlrioE9wAzMGn0TITVa0jm+UfQ9ctSi0jZBJqB0pl9WODVHWegFWe6vScGkB
         ktfw==
X-Gm-Message-State: AOAM533PrWCPgnsVpFrpHvcQX5JUicvf8Eq6wNG121IoazfeUPulaOJ0
        4iCsq3b0aNUX7d01nb134xw=
X-Google-Smtp-Source: ABdhPJw+e1jzoylENDT/ZHUvtE+hfQH6t7Xu0KBupGORyIcp1d6XWfWd/4tcYmLdyDdCaZTgPRf6pA==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr3458541wme.107.1592315654795;
        Tue, 16 Jun 2020 06:54:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z8sm28917970wru.33.2020.06.16.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 35/73] arm64: tegra: Add missing #phy-cells property on Jetson TX2
Date:   Tue, 16 Jun 2020 15:52:00 +0200
Message-Id: <20200616135238.3001888-36-thierry.reding@gmail.com>
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

PHYs need to have a #phy-cells property that defines how many cells are
required in their specifier. The standard Ethernet PHY doesn't require
a specifier, so set its #phy-cells to 0.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 2fcaa2e64370..de049d8d458a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -50,6 +50,8 @@ phy: phy@0 {
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA186_MAIN_GPIO(M, 5)
 					      IRQ_TYPE_LEVEL_LOW>;
+
+				#phy-cells = <0>;
 			};
 		};
 	};
-- 
2.24.1

