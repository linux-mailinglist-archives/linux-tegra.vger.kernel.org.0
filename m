Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E141DE86C4
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Oct 2019 12:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfJ2LZu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Oct 2019 07:25:50 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53980 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJ2LZu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Oct 2019 07:25:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id n7so2148662wmc.3
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2019 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mrl82oas7BWS4T527v273KEJtxNbYP7ZsIwucxyh6us=;
        b=dItonYua+Hq/bWXRWfnyxzkm/F2n9oXMRJ+jBopDHRR0Xj2YXGUWryQw+ExjhXKijy
         A9dhQbuHtAT8p6MKEDAMr1aQ7jeh95q1Lfd9XCcqidv7HYmlT02AovoeWKxg+GxwQFDa
         W59jwB1U90picqVhHHsIk+/qrIg7PVo7JjO3zYNTWk7PkFry6I7JeXm2mn+/ZoWxpCu3
         tbUkFUZUa2A+pHT4Fy+NMQqs2EX5NIuduNZr6C9zIHJJcbBqxQJPjBGEejt0or1C85cO
         vmg8gyfmxxJ35mmWEtmYM7aVvw57w3tuBIt0d5jQo/0/TORO83Je7e6dmuvcPiwW5ZF2
         UNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mrl82oas7BWS4T527v273KEJtxNbYP7ZsIwucxyh6us=;
        b=PVvZBhHBJqMJ9Pfy8zl/ZB126ryNOAafVS8Y7m6jnXWyIenuudI2AxCJq7UO6BwkUy
         yWFYI2FLi19l5FjNdlk8U0lxmpM9Kpd/uTFxZa3ia5SF5JErE80hiusNEQhdk5TtbPg7
         AXxPS0YJs6RHpnqWSjxSeY0cU5hsuVOuvu2WdGKtAWb6uvkSPgGorKVbRzY+CjgjEuQS
         fvGXDSRdloYCEWFriPpMbHbbkKRAD1IC6RPflKosS4IHl+7YJuKF6ZlVb7WcNS+jQXy1
         qJBB4UkFNN7gJ/HF1kLAx3OBNtXt1PKz37eg7k3oQY2CBCTo4/fNynfmmB1DKnteXtC6
         +h8g==
X-Gm-Message-State: APjAAAUovSiz3L7vgummPQN1i2c1PVJjj/pAhRVzKhv2w+Vuj+3N42Ri
        +uBwCAc51pY9T3I47+GtFmU=
X-Google-Smtp-Source: APXvYqyfWzYDq+gw74EZ63vGbz2y9bMnkXQA5qPnP4h0K+ci9P8ZIITlYzv6p2Q62PiTjdL2cxplGg==
X-Received: by 2002:a7b:c762:: with SMTP id x2mr3769405wmk.174.1572348347794;
        Tue, 29 Oct 2019 04:25:47 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t1sm18081623wrn.81.2019.10.29.04.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:25:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        William Cohen <giantklein@gmail.com>
Subject: [PATCH] arm64: tegra: Add PMU on Tegra210
Date:   Tue, 29 Oct 2019 12:25:45 +0100
Message-Id: <20191029112545.378365-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra210 contains an ARM PMU v3 that can be used to gather
statistics about the processors and their memory system. Add a device
tree node so that this functionality can be exposed.

Reported-by: William Cohen <giantklein@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index aac7f3efee16..7832a3ea79c8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1439,6 +1439,16 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&{/cpus/cpu@0} &{/cpus/cpu@1}
+				      &{/cpus/cpu@2} &{/cpus/cpu@3}>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.23.0

