Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0049151B8
	for <lists+linux-tegra@lfdr.de>; Mon,  6 May 2019 18:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfEFQe4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 May 2019 12:34:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50492 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfEFQe4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 May 2019 12:34:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id p21so16587743wmc.0
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2019 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRZ8RtyrKcj3qe446aHM7OBWQlNxnyULMIUjwVjZPaM=;
        b=l+MYvV3gBlHfyt2z8vZRf+BQn7AEwevzadY92PN9vb5JHgS0fBRmoLybgLdB5zli6U
         F2kM0hGHmHd1cp73KCkXvlIpUwE4s/W6HzwX4bSgHBfytWNp5plB0zGts9BsN2oztMlP
         D8/CvlBFJ+Ji1Nfs2S/CvhoksCTFSfBfiCRnY1BOyzd4Gi9f9M3AGWEbGAGqajajAnYF
         PeFy8WtghhBJ/bAFiPIYpjb/JneECQoSakJZhRoiJSGg1JA7VW7m8k5Hx7aOgP5hzIdh
         lI5CRa9mqJM0OzeWtCNQuhmKKwvQUqq3RBlALX0yWzvwL9xwDDr1cEoA9e74zakuA2hG
         5sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRZ8RtyrKcj3qe446aHM7OBWQlNxnyULMIUjwVjZPaM=;
        b=XM+vWRCsmuTlONCC3pXtaLot2JRlaJMKS50QAHz6akIyj4deDDGih79oZ53MDYHi21
         X7D7jqgkXXquDceskVxXgKQE0FgZeuC+lOfJhUs5luq5E4XxUxWfGSUPxMj55jqFiBHy
         xnd1scTQhfTRDsncJAowX2rI2RKmwgR6IbyR/B+HrdHdJthIbuZ2Zso5elYq/RXNgZ5M
         a5puFeWSrmOXAVHPvPtdKehkMnnG9xhaaf5Dl86Yhzc+wZ/C7mWAT5frLAb7jMSf3kSa
         rg65V1ZXfdQbildDKXZXkrATFw14kc4fPHvx4nIX6DQw3sZt5qUYaFIjJutWg521MkIt
         CA8Q==
X-Gm-Message-State: APjAAAX3vA8/wAYsC2vYrgpzuMQQzJOSnoBZOWqTkdD4o29eWZxlQ0Qj
        /e7kYK3ypRDqnjJhgwLWUec=
X-Google-Smtp-Source: APXvYqwz1UHDAQ9MLyi7u8ufDnk20pfGLcu+zwVagA8BRRoCDQKb3AyLg9G/1W5qWTgFEMxzHAfsPQ==
X-Received: by 2002:a1c:2ecd:: with SMTP id u196mr6858651wmu.111.1557160495254;
        Mon, 06 May 2019 09:34:55 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q24sm9624675wmc.18.2019.05.06.09.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 09:34:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Enable SMMU translation for PCI on Tegra186
Date:   Mon,  6 May 2019 18:34:53 +0200
Message-Id: <20190506163453.3852-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling
bypass by default") intentionally breaks all devices using the SMMU in
bypass mode. This breaks, among other things, PCI support on Tegra186.
Fix this by populating the iommus property and friends for the PCIe
controller.

Fixes: 954a03be033c ("iommu/arm-smmu: Break insecure users by disabling bypass by default")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 3fb60f6f3a93..426ac0bdf6a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -673,6 +673,10 @@
 			 <&bpmp TEGRA186_RESET_PCIEXCLK>;
 		reset-names = "afi", "pex", "pcie_x";
 
+		iommus = <&smmu TEGRA186_SID_AFI>;
+		iommu-map = <0x0 &smmu TEGRA186_SID_AFI 0x1000>;
+		iommu-map-mask = <0x0>;
+
 		status = "disabled";
 
 		pci@1,0 {
-- 
2.21.0

