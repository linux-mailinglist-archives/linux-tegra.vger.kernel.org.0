Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB98125ED6
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 09:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEVHyT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 03:54:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32844 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbfEVHyT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 03:54:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so4066866wme.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gf0ccTGAlddb6+UNXdvj/h9bTld3M34FNmXLOVz7q8Q=;
        b=KddhaAOFaAdBDBwRXL/ieVHtimXb0mj+p9dPCbm4S7fqnKQ9tBuHaRi9nt1I8brRoO
         sMi4OYyLJlYY+pAPwM599GprwosyAgF+TR5c0sXgRfLGbM0n5/BL9U4a9pR9mExGWT2m
         EFqPzLkal+PAZq1YsfQfrCJvzVnOhgY8ZcCcqi849Pv2a/CCsCII2EXf+qeEe3zaw+5F
         hshyXRW7ew66Zx4tDdILvOZw+ThbFfITzVMLbvoqcQVNdNzsEzPb10aakJV+8/aicL6D
         vwaACEW0+M3SLHzCY4at79ScleSFmImelSBciN0P6K7MARVVPghF3nYW7sq+J+PJI6aL
         5ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gf0ccTGAlddb6+UNXdvj/h9bTld3M34FNmXLOVz7q8Q=;
        b=jnC5Q5s36a+9EtIjDF2Vpa/r2WLYtzEtgmkC4CJfxjpjNADrDgNu9jXne5xBXsEwsH
         nhTxW5TBPGy2fnYXXYbPtm8mEbBEquDF/MAEW+1ulRoDiW7HEoZNNKCMd5HrOs/RS4c3
         zrJNPE2wLNSkuHw5YKQEgmvIaGhfM+gmzjgMp2Aa82Jhh/4pUe+g7LK3IZKo9lon7Nms
         NAA4lQl0+Yw/iKeR3AcOjH6trP7KSndvg2NGC0QocjvzD44ENkct7DWOFMeZunlC+N83
         w6aQlqUm7KngvdSy4szILt2wF18hqTp611u1+gebh/A7fVp6FoBwcNN3BrJFsCTKbQzz
         MHUQ==
X-Gm-Message-State: APjAAAWx1j+6myt2El3GvHMBN97VdKzf+pmm/AagZGyi+HleLV9hyvMs
        vaanFwUAYZZTag1HYNiger4=
X-Google-Smtp-Source: APXvYqykmX9Usx0HoDD38gGMcHQjsXEzO0UaaKf5S4oWUG8hgxExCGXkfyEry58pfPX3vcyImdH3IQ==
X-Received: by 2002:a1c:ba54:: with SMTP id k81mr5877254wmf.70.1558511657237;
        Wed, 22 May 2019 00:54:17 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 88sm57022280wrc.33.2019.05.22.00.54.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:54:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Anuj Gangwar <anujg@nvidia.com>,
        Bibek Basu <bbasu@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] arm64: tegra: Clarify that P2888 is the Jetson AGX Xavier
Date:   Wed, 22 May 2019 09:54:11 +0200
Message-Id: <20190522075412.30839-3-thierry.reding@gmail.com>
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

P2888 is the internal part number for the Jetson AGX Xavier module.
Clarify that using the DT model property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 0fd5bd29fbf9..9f5810765efc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -4,7 +4,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 / {
-	model = "NVIDIA Tegra194 P2888 Processor Module";
+	model = "NVIDIA Jetson AGX Xavier";
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
-- 
2.21.0

