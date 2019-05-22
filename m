Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94D525ED4
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 09:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfEVHyQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 03:54:16 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39203 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEVHyQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 03:54:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so1082215wmk.4
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34K0TGjeATDdf8IOVKeWs5JeW/U7EXmZnjE2mvWzffg=;
        b=aFK8qzVcDuOsDTCwBpUSLZZnteMHELM15Cxahrysvvpt6sAx/Q/owRRKLkeEeQkSR5
         7Pfgfib+8OYqK7yH4mIKaR/7J5pkYcn+wXvnMc3a/eajlMEncYBNoyWDu5gfyE+Xo34E
         6IRx+UYRP0+0D/h1OFY54Px2BZ+pBTQlxb2o1ihW8FTLCzOcn8Tg76hzSAXaqRF3XILZ
         DWUf7xjs6OnEa4N+QEBthXqAXPZSQDmi4Q8RvXuE5n4uOG4cG8CGTdeh0mXawB6YrGgZ
         oyRCxgjP75eDnkrZo51TAF8jVTI7zpJ6VTaIcWdUPHoNHFaqAm8yf8YT/eINEb2FDZw9
         6zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34K0TGjeATDdf8IOVKeWs5JeW/U7EXmZnjE2mvWzffg=;
        b=TsmKOtucdeboW+f/i+C8R+etOwRsmrvAjuMwx7vzy3+nFQLpvZgeqeFuH1i8xzWxRH
         BeRgVRlOa637yRvf9n/smf7VG89XZqi/MNo1sBazAWpDClEVlJXZvKyT8ZxZZVJwbXye
         nq41OmmAh6YVZO67Pd6JU/5icA84dJuULHciwYkvNg2fvcpZ+IAR+QZd1mTY37wS4d60
         SgR2lEqqJ5uf+ZOanc/S3Wnl6408tgqUsO6r6aMLixBY76l/LGJtNqwtYDd3HifnpSGF
         UahyCvZ2Fsdhp3G7M7/zWYGSRqXliMhT3ZbKh/s6IiMzNFZfDLJ150QgqJIaiEq8sTJn
         fI8Q==
X-Gm-Message-State: APjAAAWgUcXGHZaBYbhtyY/DgxxFYC9WaLJUfA6X5fqxRBj0nBqAbwiM
        lsHu2rlMZRDsKRyUGsPqRWc=
X-Google-Smtp-Source: APXvYqx9aQD0RV84cuCdeN6o6I8AX7vlCyBSPnn8uMuuwCqfH9pkPaet7tpcRY7kaevymPd67cnbtw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr6593710wmi.9.1558511654265;
        Wed, 22 May 2019 00:54:14 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q16sm5458152wmj.17.2019.05.22.00.54.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:54:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Anuj Gangwar <anujg@nvidia.com>,
        Bibek Basu <bbasu@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] arm64: tegra: Clarify that P2771 is the Jetson TX2 Developer Kit
Date:   Wed, 22 May 2019 09:54:09 +0200
Message-Id: <20190522075412.30839-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

P2771 is the internal part number for the Jetson TX2 Developer Kit.
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

