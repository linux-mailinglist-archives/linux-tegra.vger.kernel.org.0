Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72D31FB2D8
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgFPNzO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPNzM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:12 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBD1C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so3181966wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OICfzC5DNLWC8Mt/Hql2kszDs/lPys4EDGoOcxnuo0E=;
        b=ejfJqBK5B17ICN8HyRWo+casH8nlg9Up9/8htgKPkCd8aRnMre1x9N/B/gQ0sWK3T1
         bnWnGSaFnd1xS5jO4Fdk0JOTxkQgA7EUSGZamPQyABLoiIyXKpr3KAaovLLQK6R1JAr0
         3SOJ5QpW6xINrnsIOBiV7PSAz8/zvXGQVHZYgjNF5CHA2gkAjvLp+S0Nvl/MXGB6lKQZ
         ziddCKD9Lb1xR6EY+y+Vkg0WXy276udCubEHjZfZoqE47rKHWxJViy1U0wSdj50w6bbR
         wjjVFaRipO/uTWuWhLv6Zrw+BCRBWtNSHEa/AflX7tw++/b8eXeP08UAitNIUcYb676b
         IdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OICfzC5DNLWC8Mt/Hql2kszDs/lPys4EDGoOcxnuo0E=;
        b=TEO7tZ6TjKclHpuFO8BMhV6kiwa93bEPBsiH30j2jvKg9zb/oLZX2V3qYtkVU9+Ho8
         hjtGGIoRbGmSKZkBYwulQ0vgGDxLxbGERaYfD+2grDeL510fJeW+FRa5chnrk+HdCY/J
         iWaBcb4ijh7N9dAZE5kde1+hsUpYo62oT64/XxCiT9M5lcFx72WNxZAdq+iaXaYM4Kii
         7ZUVHUOlDNKFU53h03FyNsKwQitq2uUODym1BExW9osprxvcDJcPI86zo5qVXOoq5Vr7
         vYaXp4qMOe3TXlRZC/SXjQ4cqrnMdU/vOTDByZ+HYXUxLSpmy4mAwt1Df4FOM2DL3hys
         aJgw==
X-Gm-Message-State: AOAM532Cjf2o6ym2zo2NacYFd7wM0umbrv4SkB3QI7YwwOwrJZgb7HX9
        m1MAHpoPOh85NR8rABm1XBo=
X-Google-Smtp-Source: ABdhPJzOQCn/2tSUkdTXWMJYbll+3NsWiJc9+A2Xy3fZHYpJeayA9xv/Fk+mcpbj4ole1j/Zprj1qA==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr3358571wml.22.1592315709317;
        Tue, 16 Jun 2020 06:55:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a10sm1096846wrm.21.2020.06.16.06.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 59/73] arm64: tegra: Add missing #phy-cells property to USB PHYs
Date:   Tue, 16 Jun 2020 15:52:24 +0200
Message-Id: <20200616135238.3001888-60-thierry.reding@gmail.com>
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

USB PHYs must have a #phy-cells property, so add one to the Tegra USB
PHYs which don't have one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 0425e584791b..9d1dd021a2cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1113,6 +1113,7 @@ phy1: usb-phy@7d000000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 22>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -1151,6 +1152,7 @@ phy2: usb-phy@7d004000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 58>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -1188,6 +1190,7 @@ phy3: usb-phy@7d008000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 59>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
-- 
2.24.1

