Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C382BFD8E
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Nov 2020 01:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgKWAbd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Nov 2020 19:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgKWAbc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Nov 2020 19:31:32 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14982C0613CF;
        Sun, 22 Nov 2020 16:31:32 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id r18so1385730ljc.2;
        Sun, 22 Nov 2020 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
        b=YufEOZGlcie2JDpQAxDfwDTP/9PGmFqD1aL94c96xtWFoZ9+VeGl/wyxS1ZXO6h5Tx
         3OCD7XeGobT/HJcOVPfQ+POUnxXMJnKN6zlOSrPAtLNWr9Ex/Szu8Bz2OEdKDW1DA/fs
         y1Sho+MhZEZ2dE8WdYqDyGrtQd/HOQo/ppbwCfaJvvd+UHsRW7+f/KCuEJRrckJGO91d
         BbyAoZ7zQSu++obmcY7YbEsaQKGprDAltUFh3nE9TGDgxkD2l4S5sTJLaVrxDEmuIF/Q
         wF8a1nn8iGTValzQ04cBO6nuXlCIfnbD+XNDlmtH7UtT+izKD4nLQAHj+PrVdPskTbE9
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
        b=oRxhUCZQsONpO8s0pF8GhqRMgX+HG+nEwcu0LO78vFxzBIa0vT93hVrJSdbfdZv4Jo
         +Buv5UbaJbX6d7R9lQpjfoD3H/Zy/fbXRrueDSgXx7d5UqRom4GwmwbPXuFjtjKclHf4
         q+oC9S7WQdRW0KBeBjueXHp5jaNUY77SK3mYahoneS4pjMrlse8u3jEGXnb8n4eOSrh9
         RXSo4HTlbQ2tDkGE3GTvEpNt4xWIFzxBlFGyvAjdoxrgHxlfUvgFrHpC50trRJoBgLuR
         P7mOhxQQ3I2LoUZQJr9yU7TebnFJO/zJtA+TZ2Ej+NgFa2B1XSdw9fDu7vKT34UvoUYK
         G37w==
X-Gm-Message-State: AOAM532CO/Giyxqsu1qQhWs1f0MmekSEZmXT9IxDcK+sijfMGtrzFiXM
        ZeoY9f5r4vfnP+tcPHOV1lg=
X-Google-Smtp-Source: ABdhPJzlbOW1fWwxx4IasK5xVIghnxNQsUMTnkUV04K/2TB50nUcGltAPpOpooNRptnY6x45PgCotA==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1407672ljm.446.1606091490637;
        Sun, 22 Nov 2020 16:31:30 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 16:31:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v10 15/19] ARM: tegra: Add interconnect properties to Tegra124 device-tree
Date:   Mon, 23 Nov 2020 03:27:19 +0300
Message-Id: <20201123002723.28463-16-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 64f488ba1e72..1801e30b1d3a 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -113,6 +113,19 @@ dc@54200000 {
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
 			nvidia,head = <0>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0A &emc>,
+					<&mc TEGRA124_MC_DISPLAY0B &emc>,
+					<&mc TEGRA124_MC_DISPLAY0C &emc>,
+					<&mc TEGRA124_MC_DISPLAYHC &emc>,
+					<&mc TEGRA124_MC_DISPLAYD &emc>,
+					<&mc TEGRA124_MC_DISPLAYT &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor",
+					     "wind",
+					     "wint";
 		};
 
 		dc@54240000 {
@@ -127,6 +140,15 @@ dc@54240000 {
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
 			nvidia,head = <1>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA124_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
 		};
 
 		hdmi: hdmi@54280000 {
@@ -628,6 +650,7 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -637,6 +660,8 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	sata@70020000 {
-- 
2.29.2

