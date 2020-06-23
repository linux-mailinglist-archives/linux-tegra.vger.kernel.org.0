Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92EA20573C
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jun 2020 18:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732224AbgFWQbL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Jun 2020 12:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgFWQbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Jun 2020 12:31:11 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FB9C061573
        for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2020 09:31:11 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id x24so1027772edi.4
        for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2020 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rErDaiQxE9DKaS1pVohjcPCzFWF5xrAwumJKxTDlZd8=;
        b=mOlRYiovoIOpy+zVhVAkV+ZtHL7w5KYDrI8/vQdMfDg6wRFQrUTRilJuUoH5CS+gqB
         Co4Ch62cgw/0h8yyf9k8MxNDmdzhYkBdIusaWiXFEOxXs4Za/wIzgtEkQ2GBf4EUhfaD
         qk1SuRiSGnrGmGI9lNUxd0OwCVooBAtPbNJqqUOtyplV/yOH++3JKvIoqF8i6naR//IC
         hCOGdyi7cjIwCA/Q1R+ubRQJkxS406KlQCZB4l8Qtyze2gNpKle9D9nhSEvxUvNPm00j
         w19DC3is3kJBuqtK1LDyfeEY62/gS7Nx0GVKhz5uuQfpn82Gh+Qwq7LHMdbFwE69V4wF
         qZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rErDaiQxE9DKaS1pVohjcPCzFWF5xrAwumJKxTDlZd8=;
        b=ZIq4ZcqNt2YAgLiWwj+55oWDNGbp3Q6U+/IXFhFnladltVc0J3L8X8Njv/nUT3j4Ns
         DU5c/fBmhSVO6bR9DVBTLcuBF0ClXDFEFMbNM86MvSay+UuQojr7dbumfaY7cs3dKwW6
         4+sL58d5RInO6pDS39E/LZKBucQJgKB8gE56d4ViYt8HDmogpRL+KqQLPM4KHCmlxt1p
         8sGGLOKIre4Z5bryvclASILKDYiHb3+Wti7UxAQfe6b4cx1kEaDQLMLtySKUZH69DLUL
         Fd3/HKJem/US37hG7tiX15Kn0bN/xB7nAduGgzDKJEPlcJkNrNADCOi6OckAQqtnpVsP
         ilFw==
X-Gm-Message-State: AOAM532lZjoAXR0Tp4nhlPvoUQHLfmHjqvpIVqgKAeHirNkhEQUnREE2
        Pz7A8Ewruy7em+atjU1gYH0=
X-Google-Smtp-Source: ABdhPJyZWT7OD78dTdU4OSkuUNYkfZDePrG3kzV1deQPpgb1CuPqaPjd0qyNT825SjRjiZFR8KRAsw==
X-Received: by 2002:a50:d5db:: with SMTP id g27mr2446404edj.217.1592929870083;
        Tue, 23 Jun 2020 09:31:10 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id dm1sm14876154ejc.99.2020.06.23.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 09:31:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Enable VI/CSI support on Jetson Nano
Date:   Tue, 23 Jun 2020 18:31:05 +0200
Message-Id: <20200623163105.1668850-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the VI and CSI controllers on Jetson Nano. Note that this doesn't
hook up any camera sensors and will only allow testing the capturing of
images from the test pattern generator.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 4eb51e5eef3a..c924163a9115 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -61,6 +61,16 @@ dpaux@54040000 {
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
+
+			csi@838 {
+				status = "okay";
+			};
+		};
+
 		sor@54540000 {
 			status = "okay";
 
-- 
2.27.0

