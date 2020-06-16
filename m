Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE261FB2AC
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNyD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:01 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66F0C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so3158217wmh.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CgHFXQGZCBEeJb+voRiLKHYUP+aolWvzm4Cf5SWvL0s=;
        b=WPl1istJDy6REda+MLJhcwq9sIrmI+2C7/zhWoTkvFxPVBO3D4w22LYcdMDihJ8UGa
         GVLD6TTwc9MTjhmvj4jxmqtnG0/istl+j0WTZMLQ1vSdfZN9oSfKWBf+dc93kArSZbCa
         7VIQye4Q+5k+gji319QsIt+NQy9Ur83anQkUK4EQu5cIeZacrwPTnAE9nyMXUS4gtAug
         uB9Ryx8FndCP4daSd/46hZEw/Q1uViKpOTFuk2mZzAvcqjuzjtURz00VT8vaiQUKCVou
         JZa+pr3bVASW0L+KGmyOTz9u+P0NVI/Gh40GfeektaX9HyUv46P+ASGTDeL2qCHh/hHg
         j3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CgHFXQGZCBEeJb+voRiLKHYUP+aolWvzm4Cf5SWvL0s=;
        b=AAtaq/gVysTGyowm/agPYlXpIpocsRojHqIu2oBldF1siBHOpbK4NTnbxXlDl6ZXZe
         J3IBjPtnMMVkawIUw1mx5U5WFsPzkmXmWZ6JntoNs8LZUywKZ8TYg1DCYK1YZIGAKKIj
         9e8LQTGmtNrnPIwZIZpNOPxRXROyN0thrNTTzjAt53ECYd3cT9ErtBfzQL1SBU4eiPdw
         152l28USIi/oYS7QyMLI5C/Qm3rrMv28W7tcYmGWpdoT+XihpmpRD7B+IjxmQj9TPz/c
         Mv9skZvNE6uqtQ6y4vm51MlmR3N6TtF3XevsZIAHrpa4CRh2UIGRUnGpFthsaslUGdHi
         pbLQ==
X-Gm-Message-State: AOAM530X1qJjKmCsY5bK8oFZ+uCGPLebMiq6yAkrCPKRspflU3xgc4BA
        46QF2dRR1d40Vl+8lIQTVmE=
X-Google-Smtp-Source: ABdhPJwA9Vln20BWen/PoW0PG0VaFlSCUK2CNP+GyGm8bz6amWfj+xqV/Tv4EQVld7V/6csj5gt8EA==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr3226376wmc.1.1592315638658;
        Tue, 16 Jun 2020 06:53:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z12sm32056041wrg.9.2020.06.16.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 28/73] ARM: tegra: Use standard names for LED nodes
Date:   Tue, 16 Jun 2020 15:51:53 +0200
Message-Id: <20200616135238.3001888-29-thierry.reding@gmail.com>
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

LED nodes should be named led-* to match the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index f6aa783b0f02..ada2bed8b1b5 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -589,7 +589,7 @@ wakeup {
 	gpio-leds {
 		compatible = "gpio-leds";
 
-		wifi {
+		led-0 {
 			label = "wifi-led";
 			gpios = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "rfkill0";
-- 
2.24.1

