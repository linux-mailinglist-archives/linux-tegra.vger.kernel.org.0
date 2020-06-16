Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F30B1FB2EA
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNz5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNzj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:39 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3743EC0613ED
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so2992369wmj.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DGzB0/0/il17VNqcHra8V8a8lDPZ/qFFOjjsMWa0K+o=;
        b=GfDCizPR0iMBSNcQN8A211laGhsls+R4319HIstBW6C1SFDmd/9irZfxnoX4S60PUi
         HAXLjAdQcFcuFGKlmV+i9AAvQWHeKyZ0rpF+LOpkU7bD/c8wk8ThMdrpTxOdVfvqSelE
         joNh0xtDepA/6i5QrPygN0+5v0GyU+oj+u7c5lIfWZwonOFFs8kSowxhKjCqLiC0T0AN
         xXHu6cbW10RvD9MF5OZ+y6PV/fUhpG3ktuRh8PyurPWiZ82zP6Zb1x99u2ezmDW57DIt
         2wYSYmcqVsB6O7lVqwzBHBRG6QiElal9y5jT8rdQzApMiceDzT6IPrnhuamv4Uztm93/
         tAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DGzB0/0/il17VNqcHra8V8a8lDPZ/qFFOjjsMWa0K+o=;
        b=CwhIdNr/QgCiYUwXm/r4xDl50lD04K5kwpHedVB1NxZZCziTHoPNgpHfYvXHs9FLoe
         ztL2j89iXUZgO1CXG0RXKpJL82+BxvlqHncJ6qHeZtIgBjeYZsexYked571HWaovpbei
         ie/xDlvBTWu3HUcPR+bzjQXbBbP+Mjsk/uN7dLori2soVrGIqXqctF4g50W9EoZr/VSY
         dHAX0rA82gDqAkgvPXIviqlpgGGIN0JeWySXscUTPI/lungCFVbR5yURK/nWrd8eMwxG
         IB48Thagtdx9QIQXgjUP3LhLH9WOu8URymaEpHvBps32RN0JNCGWaPC4aJd5sGCUgZIK
         f9sA==
X-Gm-Message-State: AOAM530mMcuBNUDIMQ5F9yIM8hwjlDccMu/PeXJzrxNa07v+PnimtjkP
        aldDslGr18tzohqzXMI8uEQ=
X-Google-Smtp-Source: ABdhPJyvOJUx8J8tverpbBVlKwlWUXIE1Ix8D7gKUxJaOT4kLqxfAok6NyTmm+d7P2I1R0jX1hubiQ==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr3232857wmc.1.1592315738010;
        Tue, 16 Jun 2020 06:55:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a1sm4008540wmj.29.2020.06.16.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 73/73] arm64: tegra: Fix order of XUSB controller clocks
Date:   Tue, 16 Jun 2020 15:52:38 +0200
Message-Id: <20200616135238.3001888-74-thierry.reding@gmail.com>
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

This is purely to make the json-schema validation tools happy because
they cannot deal with string arrays that may be in arbitrary order.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index c265211f8a84..b9c6ba707ef9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -997,8 +997,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA210_CLK_PLL_U_480M>,
@@ -1006,7 +1006,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_ss_src", "xusb_ss_div2",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.24.1

