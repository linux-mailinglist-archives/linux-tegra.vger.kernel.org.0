Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8BF1FB2DD
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgFPNzW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNzV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B68C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d128so3182583wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wbc2pnbB3OBTDG8nCrQ0ZO/9K8+8OAOdCsSzY43cJ8U=;
        b=nyVEktSdoXCMtIrXFAb2yKXVkaA5SJQzXyQHtsh/1LaXRtDXlXdXj8eAjhColWBk2J
         SGliWBa2Z2euCaDT1iyq+U6Q7tk0WWXKYRzK1K+VeedCOFimxP4xyieUr8QdVhYNoWBK
         hANDAFWVPwVmV8mcB0BJTMs/sDVmHjwcm7JYdR6P7NoCqnIPQsKcKkQqtBCTDtE/bSW8
         mvH9jjqpz4gd7VcrFMETNWSZ0/tsU0+XEn0F5qn54ipbY4rEtSFVsVXDJ9QqlHR8qHkA
         /RoWDa3KWWZY0sXjmHJ8HVqJs0WgXtzk6O4GGsqKDhtuJJGYC/U+DIAmG5qFEj8xd2lV
         S6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wbc2pnbB3OBTDG8nCrQ0ZO/9K8+8OAOdCsSzY43cJ8U=;
        b=WlDDjHAV8HoW++wy8LmlbbvN63xfCh34N5nYXJ9lgo+20Jm87qZnPP3jHBUrXgAE0N
         Rl3RpjUa5rpT2FmtkfUfFoRrQt96tQWA7+QxWKNrbr1d/uuzfb4Y6VvbDl/1tat1OoTB
         nc2DQbwzSy0AeuJUp2WvZjCgVseQ1nKjtXxV8sqVPS+ss2ULbtay5jfVrMiZak5hH4nO
         2xFuZBVRsRosUdB4hYtQQcuH8eEKOE6Jd64j6z1Dfmxr2qiIcy2DlgZcECS6FfgAY1aT
         +E4cAvYekF782Ph5kSYBD7YD6eD4woIrIsI68isY4/PVczm7za7SX1XToWZgmtl7UnHz
         GMiQ==
X-Gm-Message-State: AOAM531kEcO64j36wNvULpkdf82U19OHYAc7pWbvsCcaaSm4EJhAHPWs
        oW1kUl+12G86jnjv8+h5VWU=
X-Google-Smtp-Source: ABdhPJw7Ne/U54AuM1vlB4mwhW8A1Pje6DrkDeyNYelZnKcA43bmqjMswzYv3makQFEhByGTlZ/Ehw==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr3256659wmh.37.1592315719144;
        Tue, 16 Jun 2020 06:55:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i8sm28364307wru.30.2020.06.16.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 64/73] arm64: tegra: Fix {clock,reset}-names ordering
Date:   Tue, 16 Jun 2020 15:52:29 +0200
Message-Id: <20200616135238.3001888-65-thierry.reding@gmail.com>
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

It's very difficult to describe string lists that can be in arbitrary
order using the json-schema based validation tooling. Since the OS is
not going to care either way, take the easy way out and reorder these
entries to match the order defined in the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 1cd369ac48d2..a73050ec61a7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -799,15 +799,15 @@ pcie@10003000 {
 			 <0x02000000 0 0x50100000 0x0 0x50100000 0 0x07f00000>, /* non-prefetchable memory (127 MiB) */
 			 <0x42000000 0 0x58000000 0x0 0x58000000 0 0x28000000>; /* prefetchable memory (640 MiB) */
 
-		clocks = <&bpmp TEGRA186_CLK_AFI>,
-			 <&bpmp TEGRA186_CLK_PCIE>,
+		clocks = <&bpmp TEGRA186_CLK_PCIE>,
+			 <&bpmp TEGRA186_CLK_AFI>,
 			 <&bpmp TEGRA186_CLK_PLLE>;
-		clock-names = "afi", "pex", "pll_e";
+		clock-names = "pex", "afi", "pll_e";
 
-		resets = <&bpmp TEGRA186_RESET_AFI>,
-			 <&bpmp TEGRA186_RESET_PCIE>,
+		resets = <&bpmp TEGRA186_RESET_PCIE>,
+			 <&bpmp TEGRA186_RESET_AFI>,
 			 <&bpmp TEGRA186_RESET_PCIEXCLK>;
-		reset-names = "afi", "pex", "pcie_x";
+		reset-names = "pex", "afi", "pcie_x";
 
 		interconnects = <&mc TEGRA186_MEMORY_CLIENT_AFIR &emc>,
 				<&mc TEGRA186_MEMORY_CLIENT_AFIW &emc>;
-- 
2.24.1

