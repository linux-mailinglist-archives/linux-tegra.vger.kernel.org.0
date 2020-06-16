Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0383A1FB28C
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFPNw5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728917AbgFPNwz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:52:55 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D84AC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:55 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id j198so2331844wmj.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DfKrEtIM9f4J1ILWbHdJL82Q0YpEBKSidb9IkXGOQXk=;
        b=vV9mIgIkoBBNPTMVWWBvzHPSrk6P5tzFLpJh3JSoSj5s0nSsKQKPIfm5/YQDmbv+14
         32C71tw4kDbEdDbgtShYqdX4p61t6eYAqpeDGYXDHUv60ZM3LzBiAMHi0Q6Yd0BsuH0F
         pj6jvZk6Fbkzr+bjBJrd1WJlEJWSUfczM2mKfy8h3uP43/qxAmLrRc4uc1qzvKe3BMrE
         LCiXDbCrXrD0fPMZ1092xY1/5I5uCTidwtdhpxjUItDQiCafPDYEs5gnyw15gAXNk7tU
         UhuvGpRF9VsIBhlEu/f54xmJhxtoUWjmQcm/jDmtF+PCQ40zurlnzeXA/rbQSOcJpijz
         jNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DfKrEtIM9f4J1ILWbHdJL82Q0YpEBKSidb9IkXGOQXk=;
        b=Wn622Bv7sjWpSYxTHlFCHvxAy21lg+iIyPDHJ5cgU2SN01f7+9xlBDWWH/3LGK91sW
         wk+Y7S0E+ilcNmCPXAHROub6yzrtuXCpHtdYPbdKDEB9AnyWZR0JkphAOwebEWzRV/FN
         ztPB6TUpBrom1HJx1Tae+fvoC7f8wZGQ2l4ZdlVI0aHFcjGETSqDklC0WHKb+s3k/cUH
         kMfBYcDZ58hZ1l3e58FrVrnPMPL97UFEFWzspUvf1pmKERFS9HAgfQoWjPIhUlpodguv
         PJXmnkhl6WngZezY5VYXBaR2PIDWV+CnxgqttjqSrxqawEwgNYXvXsokzeaz9E3SIDia
         szKQ==
X-Gm-Message-State: AOAM530giv8IdJ93OGwbBvfksLtPGmFTvYKh792acGguJP3+KNXHZl0b
        5UUpmmkA4ljqc0r/CWn7sGs=
X-Google-Smtp-Source: ABdhPJzimWy2ZwnnqLNniAegIrukiql+cBkrgt5pDjrKUCZoH3HwmJMKY76ZkRr9xCvh6yZhb66gkA==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr3660108wmg.68.1592315574125;
        Tue, 16 Jun 2020 06:52:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g25sm4114995wmh.18.2020.06.16.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:52:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/73] ARM: tegra: Remove battery-name property
Date:   Tue, 16 Jun 2020 15:51:29 +0200
Message-Id: <20200616135238.3001888-5-thierry.reding@gmail.com>
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

This property is not documented and will cause a validation failure.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 1dfff574e371..584db54cd750 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -769,7 +769,6 @@ i2c@7000c000 {
 		battery: smart-battery@b {
 			compatible = "ti,bq20z45", "sbs,sbs-battery";
 			reg = <0xb>;
-			battery-name = "battery";
 			sbs,i2c-retry-count = <2>;
 			sbs,poll-retry-count = <100>;
 			power-supplies = <&charger>;
-- 
2.24.1

