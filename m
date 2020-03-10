Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FD318018E
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Mar 2020 16:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgCJPU3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Mar 2020 11:20:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53579 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgCJPU2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Mar 2020 11:20:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id 25so1848799wmk.3;
        Tue, 10 Mar 2020 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ejespMMiPzZHhFOGLxs6wv6JPThWUWz2rdaye1ZX1xE=;
        b=LnPycMi9mVpe4/wyAd0bNohxb10FTZG9jnzxFevxgCgHPfdCGIgnkkAxDD/um2OBiK
         AzWW4Am9+08wylaO5SWwDJuSXRAJEyZSoLidL4bPzg/a37sFEIHHzDYZKeYf09hnTISp
         XxZTs2yndfERean3v/j59OSa51pdh5kLj4mky9AWwgXyNEjsL9szWzfU5fCXCppaTFna
         KhkI7gGvJ/Eq8nrRxJiYiXWxJeoN5u6RGrm7lJ8hbRL2IRtTGYuoWLJiqIa5/ha8krZZ
         tIAh+vxhZpmYc2jIhwF/UxYk25hNb3xACzACIhIfUgbrtTacCaaN51CULObvwoV6Qt4w
         oz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ejespMMiPzZHhFOGLxs6wv6JPThWUWz2rdaye1ZX1xE=;
        b=cac1wJReMwpBuUMgGy/a3RW1/ENiZPAZC7sgo5keBgNCER3lfvs4ohPRhfM0RQ+d8G
         613cnqgo0zoB4SZm8Ne1FAPuO4N//MMmSyvnkdyk1o+1/FQQl79FwpMWoerpnI0vZ5yU
         pMLgt6rbnTCou/dHyY5zDH0e6QfPr6dUZBf5kGccLWo46OMkkh7ZFYy6L11ykF+jUzA6
         8tsbHbqY3XleqCcHxIgEsrmxcosFuNlYn3BQS9E++kN6zQ8NVbShZ0muA+RqTuX8Va7I
         CXu3J7irbYASFb1+wECtv89AEc5qvr1baHh5Pe4HcsY1sv29fXyNhnU71O34g0fhD+W2
         wJ/w==
X-Gm-Message-State: ANhLgQ0c2i6t4xuJgIuKkFwiosw9EyneoFAlzscEN88aDUKKHREutKiE
        kQZK16juv49HlVi8n4TUnis=
X-Google-Smtp-Source: ADFU+vunebyxLiVsdW9gdZAEwa9042/kxrT+tUmYqJglzEE5qNmB4sB0o7H1+jzA747X4EKITn6DEQ==
X-Received: by 2002:a05:600c:204a:: with SMTP id p10mr2630343wmg.55.1583853626226;
        Tue, 10 Mar 2020 08:20:26 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id o3sm4778931wme.36.2020.03.10.08.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 7/8] arm64: tegra: Add external memory controller node for Tegra210
Date:   Tue, 10 Mar 2020 16:20:02 +0100
Message-Id: <20200310152003.2945170-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310152003.2945170-1-thierry.reding@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Add external memory controller (EMC) node for Tegra210

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- drop list of clocks because we need very strict ordering that DT can't
  guarantee
- drop hard-coded EMC table, bootloaders should add it dynamically

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 64c46ce3849d..3fa92dd8350b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -895,6 +895,17 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra210-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>,
+		      <0x0 0x7001e000 0x0 0x1000>,
+		      <0x0 0x7001f000 0x0 0x1000>;
+		clocks = <&tegra_car TEGRA210_CLK_EMC>;
+		clock-names = "emc";
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		nvidia,memory-controller = <&mc>;
+	};
+
 	sata@70020000 {
 		compatible = "nvidia,tegra210-ahci";
 		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
-- 
2.24.1

