Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6541FB2D4
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgFPNzL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNzG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACC4C0613ED
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so20836945wru.12
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vQrAbRZWbplxXwXzb0xz0CFwouZ1zpZU0LF6qFAbzmY=;
        b=Vdtswjqnt7aRRSednGL+53hFv7Q+f624Hzp8hQvmP/OKUc0KiQD0Ayg/gX5zo+q6Gl
         cvv4oOJKUhGlQIjqRHbft4r+64G1TSzWcdIlh65Xp0MyMcDNxSoUGV58/81ahN4Hynn0
         OBqjmncB/X4MkzZlSzSy3SN05zmRT5TtJkzAoQxMc0KX7ShVKrAp6f8xI++pJvixJ9h6
         rgMBpCVlYdmu55sRN2+N3nuZyJHfDFgfRxm0W41qBebXsjsoPpvoL+QEVmWHo78bVYgL
         3hA9Z/FyHChMWI65fwUkrkd0zfFanOh4kqrpYLeSLlMwegyK4O+TLBSA2vuqxhCYVUl+
         DhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQrAbRZWbplxXwXzb0xz0CFwouZ1zpZU0LF6qFAbzmY=;
        b=B0J0O/o12HIFGJLUEslFPDyGQvANCKiH/3lBanYc1arGqnphyFgRE24jkXaFItJmT/
         7Ci8WbBKDiP1NCwcR/BtvMmbGBNAlSij/k90XQzkEp8l8AdcdWBw8yafocZyR+8tqML+
         s9SaCS/7Rv77hgigXWzNCLasNuPcK5BxLxQyrEOmFr35LkyzWIyj77pPP72xkWbfp8bf
         AmdwdWq50gPXgklAAwkLQ6V5x+U/FF4mRVRiSXWxf92LHWr3aKJNlq5z3cBaN4Oj1mhb
         mV77W7JpJNQsNwjr01py1sHnZjfKWDhhZZf1Z+v9q6AGdSZaBJTAdzK9+A+6KE5nRt4j
         NZLA==
X-Gm-Message-State: AOAM530Yw9KnNlsxeub95h3ELEPiVIiR72KSgs8bI3tUxNPsD+q0Si3H
        FCHc6A93ycGQ9xw30nLKkyQ=
X-Google-Smtp-Source: ABdhPJzHESeXsUzSgo3PnNTDbYQACYi+ZtOvWBdX00k0HBTT05FT7jTYO217EKwC3e10LeR2qrynOQ==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr3449332wru.118.1592315704674;
        Tue, 16 Jun 2020 06:55:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a10sm1096598wrm.21.2020.06.16.06.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 57/73] arm64: tegra: Use sor0_out clock on Tegra132
Date:   Tue, 16 Jun 2020 15:52:22 +0200
Message-Id: <20200616135238.3001888-58-thierry.reding@gmail.com>
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

The sor0_out clock is required to make eDP work properly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index c4d3a88403eb..6d9bd9cae388 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -141,10 +141,11 @@ sor@54540000 {
 			reg = <0x0 0x54540000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA124_CLK_SOR0>,
+				 <&tegra_car TEGRA124_CLK_SOR0_OUT>,
 				 <&tegra_car TEGRA124_CLK_PLL_D_OUT0>,
 				 <&tegra_car TEGRA124_CLK_PLL_DP>,
 				 <&tegra_car TEGRA124_CLK_CLK_M>;
-			clock-names = "sor", "parent", "dp", "safe";
+			clock-names = "sor", "out", "parent", "dp", "safe";
 			resets = <&tegra_car 182>;
 			reset-names = "sor";
 			status = "disabled";
-- 
2.24.1

