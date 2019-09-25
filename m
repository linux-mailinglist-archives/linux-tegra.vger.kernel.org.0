Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5FDBDD3F
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Sep 2019 13:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390960AbfIYLi4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Sep 2019 07:38:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37540 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390764AbfIYLi4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Sep 2019 07:38:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so4517829wmc.2
        for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2019 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBfm/gjjEKNDOgAtwmYv5+6VD5WTz5YLNuQu201VpB8=;
        b=WJE4WLos0OZ7eClXh1/VWpBnCCBFTvdoNedvpoCn7b6iBwLMyY1MRxOqwTRLOEKnye
         +kLsmcJMRpKtZml0aDcRAjAGQ7lVYlSQigiya1imqqh8NMHTXAZq6pvuxF8I9coKjY0G
         z3jllttxXSVNYzwbt0K2uOzaBKzq6SP0MWDnn4kfxQndKf2kNuYgSOAZ8LuxMOPG2rK2
         3KwAqHJ8o6mNAuGlrcMHkc6kzF762kkvxa6cwB5tzVZsyNI5TykLap2zErL/xBto6trh
         3odiKbC0ncXPYDPTaBOIrZ8NTuBtmN+YdRuSQ+5N/0R15FcFNivk4dm6c3kLkAQdnJ2v
         YucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBfm/gjjEKNDOgAtwmYv5+6VD5WTz5YLNuQu201VpB8=;
        b=BaMd/pNy6oTq+uJ/RssMM62QRzjzkFJUHZhhpQsa5qy/aYdBvEtAMWZ+t5k15Rngk7
         ROqOV9juJCBEjsx/MjKtOlMsFfDd3JCo9oZ0Brz9C6LW7mRXCr8xF89Dgg2Hgk9VWx1F
         J1HbdKZD3NQ15phjmETVoDNCmrBeov+YjMxpaCNB8pB2rWEMdQ9N2SWEVOm+qsdPSFSg
         +mG9ygZZPeF7118nN91onx2OvOwuCgXMWjRSxIKEYOtvye3KqiPMmJX1uf4/uL3nHcNR
         eLgMUH0AGGn7s39Wcf90GNGUanrCJ1o4N7Jv6FeyrOsWkhohXghKytjJsU5G+yrBxAMt
         nlXw==
X-Gm-Message-State: APjAAAW7KB9oq6zpvLpZfgBFhedPrCvy4UwXTpJBTjyfqrQA2bVcLH0E
        V/R3TTzPam3TyV343l2OMohx1ept
X-Google-Smtp-Source: APXvYqyJe/FK7+gkQqeF/j6aw+0DeexipdkcLwgai+QGWa/T1JTGz9fFbOQnvKkiTnngSaRy/w8jRg==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr7125273wmi.156.1569411533654;
        Wed, 25 Sep 2019 04:38:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id o9sm8978731wrh.46.2019.09.25.04.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 04:38:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Fix compatible string for EQOS on Tegra194
Date:   Wed, 25 Sep 2019 13:38:51 +0200
Message-Id: <20190925113851.2691-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The EQOS hardware block found on Tegra194 is in fact not compatible with
the instantiation on Tegra186. While the register programming is exactly
the same, one notable difference is that on Tegra194 only 39 bits out of
the advertised 40 bits can be used. Bit 39 enables some on-the-fly
swizzling of data that is counter-productive to ethernet connectivity.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index e590a3cebed0..49e2121f0cbf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -40,7 +40,7 @@
 		};
 
 		ethernet@2490000 {
-			compatible = "nvidia,tegra186-eqos",
+			compatible = "nvidia,tegra194-eqos",
 				     "snps,dwc-qos-ethernet-4.10";
 			reg = <0x02490000 0x10000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.23.0

