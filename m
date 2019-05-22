Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CB025ED5
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 09:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfEVHyS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 03:54:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39206 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEVHyR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 03:54:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so1082282wmk.4
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=toVACGXBx18Y2vxcEbYtE4cJq4mW2GCPqGkJY2PpimM=;
        b=s/HidqJblQnsycAV7nj2L2KxlyV00nn3U4PoaGefxOXlLMZW9kOBYGEHr0YmSfaMb6
         u+d1LU4WL4tUQ+JX3rmxVMsH0PZGQbzA55UsjC16dGjUiNxD03ykbOlCrOVkQpceu+wM
         Caq2ssqRZ/Mwmlbsv02hE7AvVgxLmSEWaz/q14GSmNSBT8brmA4KifSpVZG70WXjIU9J
         U6FeGCiFHOFaETiJkvWnOXN3akfZesXbu9Eo/rOJML8a0euL5l201O/6ETLpl8o62A77
         t7tVrRNABs9NEhRhfsdtx5MCkBKQAc647peQMj499YE+DO/MeWgtMHPV4YPjfh1Q9A0U
         6yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toVACGXBx18Y2vxcEbYtE4cJq4mW2GCPqGkJY2PpimM=;
        b=T8b5XfJ+CUg0zqhmW6L00/ZR/hHom1DfP/JIfrphMmgR/sXVsgoa3dwy0mnKVJwttw
         NyaenhMGamxEH85eYRJUh+E9qOG/BC6j/idI8cDEDhCXqI/InKMEmkZMIaEjX1UlA61K
         UHsLf4To5MKuhCzlirSHukmBYcsdRRoNljPuq18zMF2pD0b6mrEwhGe0ihluYqQ4dA/q
         4OyHzYE6JcedR3s0wgmw83/T1LHsCJLW70vpffm3t+DnyUIS9k7wQ/FrDC52oQVxxIgL
         5NzIZMWcKK/7tbGHGe2/r4d6iPD/qy/BVmFtCTAeforV5Zx7t/hAWZvPHTRcjePKP19G
         W/5Q==
X-Gm-Message-State: APjAAAVRanvSgDxwjpYkSy1Ew7gk5tnjKDitUv48w8aFiWTucXG66F8r
        MGdkrLpOf1rDj1cFcRxVMf0=
X-Google-Smtp-Source: APXvYqwpAKETh0Nlapz19jg2B8EUcLDRGFMgms5Wakz+0keXXGm+1YJt7ueQt1gpBICftoFnuE8PKw==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr5977810wmc.59.1558511655785;
        Wed, 22 May 2019 00:54:15 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id n15sm25830193wru.67.2019.05.22.00.54.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:54:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Anuj Gangwar <anujg@nvidia.com>,
        Bibek Basu <bbasu@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] arm64: tegra: Clarify that P3310 is the Jetson TX2
Date:   Wed, 22 May 2019 09:54:10 +0200
Message-Id: <20190522075412.30839-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522075412.30839-1-thierry.reding@gmail.com>
References: <20190522075412.30839-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

P3310 is the internal part number for the Jetson TX2 module. Clarify
that using the DT model property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 64686b033c38..38ad1053f21a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -4,7 +4,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 / {
-	model = "NVIDIA Tegra186 P3310 Processor Module";
+	model = "NVIDIA Jetson TX2";
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
-- 
2.21.0

