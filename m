Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D98D1FB2D9
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFPNzO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgFPNzM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:12 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65620C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:12 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u26so2327472wmn.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SUdlPyxdGWCgmnigeWgRVCwmjI++8hho3XmOt25jjdI=;
        b=lG33AK5PdVrGfzQbJRnW9klc7931v/SPsOkRM/oequaJiGe/cbVfXTzZ+rQHIApQcf
         gEUph1xaWj1okiVqas98eKy5J85tlN84RfqVfRkFwTVr/Rpge0QDA+XjMYgg/xa8LjJq
         xTNXRiLH0AvC3vDmfE+E0Nkvv9jCHdPS6V98KVYFy6/1oXdjdarPhfzeYhU8iP4V1QyV
         Zi30DaGHvwPrRKa+lGhjMgQZxF3C1nG+15jI9gjzns9lNDQAZb2Fqsn3TET3zhGIKr81
         XOs/oh6gy3rInlFu8MesJx/8tOOu3e8mKeFsf7ZIx9lPxPrGSigTVo5sbTpHRb1M8B0P
         QaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SUdlPyxdGWCgmnigeWgRVCwmjI++8hho3XmOt25jjdI=;
        b=EaL4ICVXWg8IGXvu96PHSOH5Y/X82nPjOPMYfiVz7EOxQ4x3UkAUARsBl9+lc+3liT
         HVITVye0aeHbrSpmucFsp6yps1rLGQWqI44uOInHiGpPyNiWrAmSJWNyaBEwlX4Cm78a
         H6j1z3jLJbkcgHzQf5UyjtqsbmhIFuIHd0yDhPhNEz6i9ZCPx8Ic6u/yIvUpUCQEQmWZ
         7kvQU2Y6mV7RcThCABphkv7wdg0lAM62Fgfpf5aPymnryVztEzs7XXUPplaeW+qty9BI
         PWHuUQiYIKpg15uB91H+4mmvxOhvpFtTd+tqMC3a9vT9vwudHiN3ossWv5MYi5xPTnmn
         jmRQ==
X-Gm-Message-State: AOAM5305nVw9NNL/JjthAa9o69ZYkj+7jOM1QzT3QghzilHIrSgIekBe
        3ztflHfl4dPk9EMSmId8sJU=
X-Google-Smtp-Source: ABdhPJyRJKmPN8L7dtwQ/4k64aAuB2UW6h7GFFC+jQd8XIlu/SoAy1Yac0HJcSCb4Voylfd6BUkeeQ==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr3476240wmh.111.1592315711173;
        Tue, 16 Jun 2020 06:55:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d17sm30608379wrg.75.2020.06.16.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 60/73] arm64: tegra: Remove unneeded power supplies
Date:   Tue, 16 Jun 2020 15:52:25 +0200
Message-Id: <20200616135238.3001888-61-thierry.reding@gmail.com>
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

On Tegra186 and later, the BPMP is responsible for enabling/disabling
the PCIe related power supplies of the pad controller and there is no
need for the operating system to control them, so they can be removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 43b8d643e7a1..482ed7b0fcff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -119,10 +119,6 @@ padctl@3520000 {
 
 		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
-		dvdd-pex-supply = <&vdd_pex>;
-		dvdd-pex-pll-supply = <&vdd_pex>;
-		hvdd-pex-supply = <&vdd_1v8>;
-		hvdd-pex-pll-supply = <&vdd_1v8>;
 		vclamp-usb-supply = <&vdd_1v8>;
 		vddio-hsic-supply = <&gnd>;
 
-- 
2.24.1

