Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122C325EB6
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 09:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbfEVHfI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 03:35:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50397 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfEVHfI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 03:35:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id f204so1066450wme.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3USNmTFASDI25Xnff4nyiTrS0Z8Dx8HlEBn7dan5y08=;
        b=cvBQR6BGCSD/Yaw8xiwS/aiY/f57uDE6r4YfcijpV8dALktEsaAML+5TWazSEo0UCR
         RUo+qjoNJ0JlHdjLVph7YkuxZvXtgRDc6XyLB7ResJ0kqJzh+JwgoS3mh0LyZbeQTSjI
         +2uxuYWy0GBtU6vrQgHP01FI8ycLEAyngOzB83Y0MzrMIzPyJn6NgTZ5M81JDsn3ZI9R
         rtrgJlxyTAQ4bRFlk6PEP4Ur2w/IS2vGYZNb5McZpGseqo/qQQDAhbtlc1+tVvsWOYPh
         Ckbv2EnX5jc9ZxJD01RimaiPBryJSoQkA0jSr/suo5GLu3DCbZN94AM4pEd4sT+7vONh
         IlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3USNmTFASDI25Xnff4nyiTrS0Z8Dx8HlEBn7dan5y08=;
        b=ayxXP+kVMhyBwc4BEk31EAZxpa4rSyzGW9cB3WgMf0rbP6VKYBFbiWlBaqL2I3lhpW
         xo0H9pCXZfXFqbTXSC0YgvPrASUnvR77LR75TUpDr0EwTzTT0GSHfb5TfYefv2n7vaBV
         ljangeHqzGUKVWlJ+XZH3aCV4yVpr7C43lCKgL95jWcQm9GlPQ6dBNZpzb0nqEKhmaX1
         R1sOh61rgcz7B8shRmGLVprX+gBWxLtcANhxovSvoKdfpj4KhRF1IbE8gjezATq1OTb6
         VRxWbrFX+jO6KAAiwe5/JjHbMRrweFO+0t3L8U+8nBa6gvcu5pG1mUcXooPifvfWD1W3
         ty+g==
X-Gm-Message-State: APjAAAVwRcA1WAJPy4G6vQqKOUn70kigmspgfaSNEzMuK51ed+z6xtNp
        CYkfoI++HRPUYJAq1ZBJvFE=
X-Google-Smtp-Source: APXvYqx4MjSHFMArM213SDEkgjV+phknCFyTP/5ZdbOIW2/O+c3EOGHZYE3UJ8QPjSRNvoV3PH4Z0Q==
X-Received: by 2002:a05:600c:21d7:: with SMTP id x23mr6369534wmj.105.1558510505866;
        Wed, 22 May 2019 00:35:05 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 205sm8068758wmd.43.2019.05.22.00.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:35:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Anuj Gangwar <anujg@nvidia.com>,
        Bibek Basu <bbasu@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Clarify that P2771 is the Jetson TX2
Date:   Wed, 22 May 2019 09:35:04 +0200
Message-Id: <20190522073504.28483-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

P2771 is the internal part number for the Jetson TX2 developer kit.
Clarify that using the DT model property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index dfc206dd6fbb..5102de1dac9c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -7,7 +7,7 @@
 #include "tegra186-p3310.dtsi"
 
 / {
-	model = "NVIDIA Tegra186 P2771-0000 Development Board";
+	model = "NVIDIA Jetson TX2 Developer Kit";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
 
 	i2c@3160000 {
-- 
2.21.0

