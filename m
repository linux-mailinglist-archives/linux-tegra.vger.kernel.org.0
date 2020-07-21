Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA7C22833C
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Jul 2020 17:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgGUPLK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Jul 2020 11:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbgGUPLK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Jul 2020 11:11:10 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9995BC061794
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2020 08:11:09 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h28so15567980edz.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2020 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LvpJ00dIgYJjMoQw4tlD2nymMkBnkIRMqBQkrZw9b3k=;
        b=YdX4aV5PEiqsbiaH3Ifbmjo6Y1o0spyp1iVm2qppRxW0wk9CsVVggfrb3JsAaaAfRM
         exlsQBVLpBtt3/SQoN7fdKjRjRua8ixr9rX4u7Gdr1CfAz4y4nku6lom7U6rdUCu/Z0j
         5SkwtlYAOSqk86hoiXMqKl7WiPn/QeC36RsYgTdgWYlGAX6vPnfMQshQhlkj7AXMsO5T
         Lu7x1H2I6MBiAtsZSNHK0K0m1mm0617WetQZYF73SHJlVy67RYPMSfXyEweoKmdpRUD7
         mGzAxNiQ9bUoUJ5TFV1U6NTBIJ260SGLn5LNfvtHy/YTY160Scg44uJPXib3wtlToSb7
         856A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LvpJ00dIgYJjMoQw4tlD2nymMkBnkIRMqBQkrZw9b3k=;
        b=Mo0wjyUDBz33+1Ur/jzvWne6tzps29osO2oy82QJsHjOBI+WjRRBuMJeo6rsUEaxZh
         0Vf1u20FWE2LLzXPD3qumOJ5jDq3vgElOM0Kynv7ux7sqVQb2S9LS4oXgolq/Mse3ZoS
         +kUblAyD+3dA4c426u44s9zZDuLTxObvkRo4VuvMczEh8i+yYDxw9t5p5PTUuXN+sl2e
         mnGbpuLZI0Plq2f7pRh0N6+TAKTK3ojpddIhprvM/Obst2tmRIkhL5eg5tIJlJlmNrH1
         4I9nw1iEAJMvx3/sebxH1BPZ4ODaRcyLvt9pVBm7GVcqDGjO3QS172mh11ldI7s0HIP6
         ySaQ==
X-Gm-Message-State: AOAM532O+2r3JYWZShBas3lBapP9Q1X/KtFvZG6vQZgddCIOzgnEuB9I
        owSipMzOsZuub3bMnieyaRg=
X-Google-Smtp-Source: ABdhPJz5b+P9NZo/tS24ow5iUQhIVljCyA9KzOWechudO5xRCTBBF5SlaF5XyvnNy3qFUTeLkbeiUw==
X-Received: by 2002:a50:d80f:: with SMTP id o15mr26883971edj.156.1595344268377;
        Tue, 21 Jul 2020 08:11:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d24sm16698362eje.21.2020.07.21.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:11:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>
Subject: [PATCH] arm64: tegra: Properly size register regions for GPU on Tegra194
Date:   Tue, 21 Jul 2020 17:10:55 +0200
Message-Id: <20200721151055.253644-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Memory I/O regions for the GV11B found on Tegra194 are 16 MiB rather
than 256 MiB.

Reported-by: Terje Bergström <tbergstrom@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 48160f48003a..fc36d683049b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1398,8 +1398,8 @@ sor3: sor@15bc0000 {
 
 		gpu@17000000 {
 			compatible = "nvidia,gv11b";
-			reg = <0x17000000 0x10000000>,
-			      <0x18000000 0x10000000>;
+			reg = <0x17000000 0x1000000>,
+			      <0x18000000 0x1000000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "stall", "nonstall";
-- 
2.27.0

