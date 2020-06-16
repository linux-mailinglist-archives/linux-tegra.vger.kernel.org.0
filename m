Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2578F1FB2B5
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFPNyV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1356BC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l10so20842336wrr.10
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfZn0e2yak8oW3bFOlBf3ybvTJUHnF3nqSzE+El5OpU=;
        b=uSaIDrOETWkxJkuo7Tq/oV3yWUlMo3tfHlWwcgh04nyYp1ICpyeh20VzvUyCUyqAaQ
         3tDXfCPfqVDqEXGLxqraQx+cqjrnbjlljd5/H6mAeXP4Mn2p1gvmA4TcmXYrzictCbsv
         Nfj3hAFF9oOJaBXpbIYh2upGSXum0DsQdEWgRsHz0/QCbzxvDflW5/rvbEUHD0DP6Mo3
         oQhpQ3yptMGg39FZqLOYuTqM15QHoFsi+GQEK9c/i/zub89Dws0uayuJterc2D6iB9WH
         OJXlSI6Fa81sxo7VO9Y4vQ/n31E4ebp2lbFBgG0Z4hcAVZudFBgDCgFhie2tJOqaLBor
         RwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfZn0e2yak8oW3bFOlBf3ybvTJUHnF3nqSzE+El5OpU=;
        b=g9CLHz+S8k1MzLMpDgk6bHGboo/Hi0HS/XGdYL7veOQy0rFkYmQmwjcg6WsKryvgvc
         SXth9XFv20LCqlwz+7zCmAI5U5dZEQ9wX/c5igdgYGgRSRKLoNajmA0lXTVibFaMJ8/2
         QurP56rDFcZtZGS0vwgxdIFrPipURXBImtxny8GHmX3eTqRmV35aSr6RtBlwIv8ncxcQ
         OXciva/c1NhQq8vbtHbpqziIHrQwiyTrggD0ma8Fhvd1mqwd9ceIOGcbGb1L5m0hpERG
         Z6CGHDLmmnH3uAaPobBsj4XIflW7KrZr0ipzFHKEey7O3hLCdkgJhZJr3aOzZ08joH1C
         Hchw==
X-Gm-Message-State: AOAM530HoCVNPe4Sep+bVCC8IZqiutgKvOHs7swdAK5BQeiuSAdcLUdb
        GVEIA6tMoXTrKmz9aSE1JXk=
X-Google-Smtp-Source: ABdhPJwd7gT9/J7V9dYG9c35OqjoTaO9IQ+WwWcoJwQi8j0Jda4Xu0zzbH/M7ykH2cDgI+o11exrlA==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr3158732wrt.193.1592315657762;
        Tue, 16 Jun 2020 06:54:17 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q13sm29731927wrn.84.2020.06.16.06.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 36/73] arm64: tegra: Add missing #phy-cells property on Jetson AGX Xavier
Date:   Tue, 16 Jun 2020 15:52:01 +0200
Message-Id: <20200616135238.3001888-37-thierry.reding@gmail.com>
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
required in their specifier. The standard Ethernet PHY doesn't require a
specifier, so set its #phy-cells to 0.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index b96eb4e14556..f3781e86f321 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -44,6 +44,7 @@ phy: phy@0 {
 					reg = <0x0>;
 					interrupt-parent = <&gpio>;
 					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
+					#phy-cells = <0>;
 				};
 			};
 		};
-- 
2.24.1

