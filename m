Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96B11FB2AA
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFPNxz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNxy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:54 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC10C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y20so3173755wmi.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmNqc5hsD3DobIcOkfT8oUHZhc0K21ivxjwgeIbNRxc=;
        b=AnfoBKPuYoDsBtAsRxfzizoqUWkP+v8P+obvDks0pBbFBPfMYn2/3zp32EhJfN6rCA
         ucauSms2BpZCNQGt2xt+vjA6A2S2ltYFrxCA9tae3jxsQaXGu8ygVLzKktL0KfBaT7n6
         WGMmbBkN/Ew5JqxB3mSjX0pkEF+ncpqon8SH2FyYR+G+wlR62hguG4dQikHCmjWMJjt4
         I3SJmGC0gVFLxI7lQZvyhku2U6fOtOfqzbWlEmjH+g7HT7MDvBHXE6hRwU0VxATlftWe
         8SjpIBO4jDOaSRIo85uuzUQuGzp+kgLAPctmDX4G9qxqxLxR+xhqUTlRQpRz8x5yVG5v
         AHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmNqc5hsD3DobIcOkfT8oUHZhc0K21ivxjwgeIbNRxc=;
        b=VoD42wHcx2C7sGbO05fNtlfjg1FeSXP+MMO5DcM7aiVyh97tLQVqHNFqmazPaVXgZl
         pmgukc2VHxTzY6W7oh92bht/8F8HPTYCzmDKE+gE3FMc1sLMo8fxpL4BhAO62wUodLOK
         TPNlP9B0kv4jxHHvQ+LUAIkrABbMC0NVrYmlOLHPBstOaHF+7/8RwniANwH0GwoPqRSm
         A8SXQCw8pUWCiy8X5LJf4sPqUAETVzQ/Rt5Qv89B/AmDq0cv8fisxncgPJ9/8XWn1NZN
         dUq5mCSEY5lqQi0C/kaDRWu9kLplpHDk0jmppcNPwdsg3yQJENwqGQj5OrDzTykdXawY
         uuUA==
X-Gm-Message-State: AOAM533GIgf4r4WJ9uWaxZLXYXMagUCKRpzl9IE99IPn8E4S3i9RokYE
        i7f3khHahQL0WJ+eWxBMyok=
X-Google-Smtp-Source: ABdhPJzzBUavyHf99hjFAc0SOolGUcuE7FGhCUvYuFKCUpHk+Xp2ZBz54eK9ibaAmHmndaISzrQuIw==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr3616321wmd.189.1592315633157;
        Tue, 16 Jun 2020 06:53:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r12sm30951520wrc.22.2020.06.16.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 26/73] ARM: tegra: medcom-wide: Remove extra panel power supply
Date:   Tue, 16 Jun 2020 15:51:51 +0200
Message-Id: <20200616135238.3001888-27-thierry.reding@gmail.com>
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

Simple panels can only have a single power supply. The second listed
supply is not needed because it is also the input supply of the first
supply and therefore will always be on at the same time.

In retrospect the panel probably doesn't qualify as simple since it
apparently does need both of these supplies, even if in the case of the
Medcom Wide it isn't necessary to explicitly hook them up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-medcom-wide.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index 049181421a86..a348ca30e522 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -59,7 +59,7 @@ backlight: backlight {
 	panel: panel {
 		compatible = "innolux,n156bge-l21";
 
-		power-supply =  <&vdd_1v8_reg>, <&vdd_3v3_reg>;
+		power-supply =  <&vdd_1v8_reg>; // <&vdd_3v3_reg>;
 		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
 
 		backlight = <&backlight>;
-- 
2.24.1

