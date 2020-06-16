Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2871FB2AD
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgFPNyD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CC0C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r9so2972938wmh.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YuiLIUu/YnML9dFw4hu2Yeqj2POA+ml5uNhb4909fHI=;
        b=nlwgsg+ofktUw3Aw5uAsr+hgAEjUb5vgy4T/TfjNeRjK07MwLGNKm1rEBOkWy2jvjF
         WoKqKnwPQaRaa6LMAbTmnHJw7GPwdegAPwQ4U85tLvl3k/xoeQQrRxMml2ekLjVoHdYC
         h5BdCTnLbQ27lplp8fpBkUZrrwief5qAfWovQZ7mWqvan9sJ99DuFgs0WEEeW9X0jFui
         koigc9xrioJdheaFyNOYYMr+CeYdXdoOze0CAQjYccpf9F5PnpB3u5L0KOQNmLBL7IRV
         KyNgzuOkWOQmwnQw5L5PfKl3cUwogbbcSY8Wc/acBNDJ/7kbxsR5N0bwGb/2Pt/R5vKK
         AN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YuiLIUu/YnML9dFw4hu2Yeqj2POA+ml5uNhb4909fHI=;
        b=HCEXDxR+r2TAMsQBFEBYWn741M/aQfvHG03YcoNwb5HPDBPONca1Qhj/ZCKdh+udp6
         DPhR6de6wgF3O/WNnoefJiD9zCCyEt/JCZueT1nSHBm4Y5t5BhzYSotR0j2N1x0nHAYn
         IfHSCQlyq1GGcK/pwDByqNaLJWweQzPfsjWFnuFdfQdvsbhW7kb0zN1wnLbxo4uLMMwM
         nsNC0M6HFv6+8p1ILF6pJvcA1B7PHADc8rLYzx0VndX5De4uLB5CVEoKKw4DbYX//aEj
         WD/NcIFW+tUrIbeFcjO18Smk5JwccJFa0CgjRd890dUkSxwYW558TrDAg/NBd7cqs6IK
         32MA==
X-Gm-Message-State: AOAM530oDRWOa/iy6w7+v9XlMX/KqZ8V6bnmO2d/QqsZwaXRSILfX5jA
        LESW9dLdrEXesaf876ZoevA=
X-Google-Smtp-Source: ABdhPJzLSUEeB11A9gIgfZR8uzltD2LdQNQ9FATlM6iL7NTpC0rwccouKcZkB398Df+o56LB614dSA==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr3402842wma.32.1592315640615;
        Tue, 16 Jun 2020 06:54:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h15sm27602787wrt.73.2020.06.16.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 29/73] ARM: tegra: seaboard: Use standard battery bindings
Date:   Tue, 16 Jun 2020 15:51:54 +0200
Message-Id: <20200616135238.3001888-30-thierry.reding@gmail.com>
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

Seaboard uses a non-existing, possibly obsoleted, binding for the
battery. Move to the standard binding which seems to be a super-
set of the odl binding.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-seaboard.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index f1baf16c5010..c24d4a37613e 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -394,10 +394,10 @@ lvds_ddc: i2c@1 {
 			#size-cells = <0>;
 
 			smart-battery@b {
-				compatible = "ti,bq20z75", "smart-battery-1.1";
+				compatible = "ti,bq20z75", "sbs,sbs-battery";
 				reg = <0xb>;
-				ti,i2c-retry-count = <2>;
-				ti,poll-retry-count = <10>;
+				sbs,i2c-retry-count = <2>;
+				sbs,poll-retry-count = <10>;
 			};
 		};
 	};
-- 
2.24.1

