Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE041FB28E
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNxB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbgFPNxA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:00 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD25FC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:59 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d128so3173835wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZXEbv/x0T8NRWftaB6bwURGcBWmiOgCAbqfov9/KHNQ=;
        b=GcI+noiGq+iar/iB9yA/a6G+lmoNmtz702DbZ4kkXaeiOq0uu4/ohsCgQ9khUokXDX
         RAtBWdx0+DBSnNEn7PtwQyCUDTarkzbE2WwaRX7EGPXkopOPJ3R6yED6xCU4Kyi1Y4ys
         A2Xp3dWVyIQmC6gyr9LuNhguQ2LToFMcqHXuYzneXQeg16sZ3GgZYGmfW+JH8xJsUaU/
         di6Vz5y2+RfQqMmWFtVUomfLiDZckEO8ycgzwIWT44HAC0HKD2x4fQXRV4jl0gxQsYUw
         Bc5Y1I5z5MMyxTMUN7XJUgFDiCqVJ830Fn5nACeMHD9V8r1dQ1ju+nEuNu0KShIQdME2
         vGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZXEbv/x0T8NRWftaB6bwURGcBWmiOgCAbqfov9/KHNQ=;
        b=IpCClyYW/fAYo7fkbE6cIKBKayr0zNpTRFeClUFNmn2RQ1tTszmQU9DcGK4HRVnlgy
         VOKbt9YoIM2ZvejGrO28Qj7oYGkLcVtfLikbq+gP7h4itOah98/2nVxXEnxyKzLBgBXo
         7BZRFdUnBxjUE9TmsgE9NG2uLm95A/BLCT2sabqIPROP2XKj8GZNs4UafDkl2H9S2DaF
         rlAYCcl6rnCLx2EaAhv1O4bIS7SjcMAq4bVMWgFc3iiw/PeTGEBSnS+g8zRLlI/1Qd48
         jBs4A27WfCJjbL9di/gEkozOpLuktca3GTmBibYdgyaFAIMBfpGL/7HRMvC5iOpc76be
         S6Xw==
X-Gm-Message-State: AOAM531oAlPqnPkrT46S3vfuQlIkB7746AyLO27Nx7ite22ehKjeRZWU
        AiykNyd4hzti7XxY3y8eDS8=
X-Google-Smtp-Source: ABdhPJwKRsi2fWVS01SU1sG57FGp8wzYiVSftb5oP8Yg8f8uc9tXrRvwipsqf5xc1OFluycle2Exyg==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr3269785wml.24.1592315578629;
        Tue, 16 Jun 2020 06:52:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o15sm4079926wmm.31.2020.06.16.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:52:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/73] ARM: tegra: roth: Use the correct DSI/CSI supply
Date:   Tue, 16 Jun 2020 15:51:30 +0200
Message-Id: <20200616135238.3001888-6-thierry.reding@gmail.com>
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

The correct DSI/CSI supply property is called vdd-dsi-csi-supply, so use
that instead of the wrong vdd-supply property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-roth.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 5249afdca577..7378b5d6f2fa 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -37,7 +37,7 @@ host1x@50000000 {
 		dsi@54300000 {
 			status = "okay";
 
-			vdd-supply = <&vdd_1v2_ap>;
+			avdd-dsi-csi-supply = <&vdd_1v2_ap>;
 
 			panel@0 {
 				compatible = "lg,lh500wx1-sd03";
-- 
2.24.1

