Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271CF44191
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391450AbfFMQPZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:15:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53301 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391687AbfFMQPY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:15:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so10842773wmj.3
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DpBbyPHvCDneAyryA5C+ERapkjrDv1eXh/P8laW+iGM=;
        b=T1vu0+7Jkh9mdumQCy/bwXbXZx4uv/zXFj+aAWc+5zXlBeZvmI3R9Qdlg0c61re/OM
         S3lGMYg3hdr8hbUAuM5PUaBOZgn/1MbORTj9cWBu/BXizbOP08D1Telngin62faUD3hc
         8sA9exDDuPkTdSzMIVqx5eTem6rDugcVsPiNIT2pTTBJ2ahiaeC5EsLK85AVj8R8zL4r
         a4Gq+BGinrm+VfSzt4kAfXyBCfGi/APQIUroTyZctKwzxiqjxShR1Tu2DoovcoHpl8bE
         HIQngbtAd/QWZKFelJM90COuKS3b1pnkC7IhZ2jDjwqgtSBSmTJI81hE3HNU7nRLOr4V
         0MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DpBbyPHvCDneAyryA5C+ERapkjrDv1eXh/P8laW+iGM=;
        b=LLdahbIWaehv+6rTpsSSW378kDHwZL4FBt9wrICf+5hgL0+vQe0W/IH+Y7ZMMPoUUA
         jTBhb+NXKD5oHc9716k3dbFAuEKm6OnC1hpntEdg0EA/W5EKRbYDb9JDVF+MRggl4ems
         WNz67ymzTYyvwCyx+Se3/82PSaEc/wXw27BMTAqx8fYYfnsY8961bLUUpnPsHe9LG2kJ
         gP7R5uB004A85z+5a3Lsnpr2x6YTKgT88ir2R/HhyidKzMmNFSLNPqYlmq5I/+MWibB2
         oARHhT3g72yvc3DtS47+yfQM7aFqOEG8yN7txD9P7wuKUAF58Kbcnk009ztzMuh1TMqh
         sPjg==
X-Gm-Message-State: APjAAAXL6W1IPa2LidxNreknV/KE/jnzeO+KcHLP2/hfQBIhZyehY+ny
        0e/asTS4PVSOrezDHsj76U0=
X-Google-Smtp-Source: APXvYqzGJjKVMyhSdSG26h5YVJwlP8+YWWtUQ0+DJmGA8qjhGLSAlzVUOz1JF4s75l4/iG4As6xQ0w==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr4790682wme.150.1560442522134;
        Thu, 13 Jun 2019 09:15:22 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id a67sm362881wmh.40.2019.06.13.09.15.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:15:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] arm64: tegra: Add ethernet alias on Jetson Xavier
Date:   Thu, 13 Jun 2019 18:15:17 +0200
Message-Id: <20190613161517.2837-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613161517.2837-1-thierry.reding@gmail.com>
References: <20190613161517.2837-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Adding this alias for the Ethernet interface on Jetson Xavier allows the
bootloader to pass the MAC address to the Linux kernel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 9f5810765efc..0822f5eabc33 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -8,6 +8,7 @@
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
+		ethernet = "/cbb/ethernet@2490000";
 		sdhci0 = "/cbb/sdhci@3460000";
 		sdhci1 = "/cbb/sdhci@3400000";
 		serial0 = &tcu;
-- 
2.21.0

