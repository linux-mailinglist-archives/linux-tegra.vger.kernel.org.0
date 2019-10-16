Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684A3D8FF2
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbfJPLub (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:50:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32965 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfJPLua (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:50:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so27721280wrs.0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AlPPBm4srKsAvpAcC+NwwAp6Rz/P7KMIyX2GM7hrRY=;
        b=HYpVk/VkIkhePa3U+OtGXpH89MDVJBwhV1l2OmFTM4UHRDyQHlxQ6qehExDezlPp8I
         jZilnoimIbQ51Mg5B9RXAwV/KcUD/JrjaZ/qPzL0ZdkSksavFkNUY2Uh8vZ+uK8yicKI
         ACXCEbZ5N5jmmr+R8/nwOjXuE2nGFoSSanqU5GVZws85tuAIPrHyypIYJL5mCjSyvrr2
         nskk8m9apb/hM8hDTUM2erE4CxxyI/Cu5Ds+AeSe5/Ehx3CKpQHNazN/FIr4uonI3+3l
         Asu3Eta4+w/fYZ4lu0Gz3YxdHry7D673L8vlqO3qnHDijdCTpJe/gd3ZbE7bEpFfnlhR
         EbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AlPPBm4srKsAvpAcC+NwwAp6Rz/P7KMIyX2GM7hrRY=;
        b=SmlvuRO7Bxbjx55AZ4MCt9UGxasQga02RR5x/IEGRNYnOPo1+WJNDNASC1GeIYVlED
         vNJPV84P6kfmcgIzz+ycabxur8ShIcb699tWAInMqBiwVPJjNuL803G2ay84p3DcOQ23
         OJ3uVZE1tA8hB6YjTU3QK6p9Gui9RKKwdhckBgdkNDqXykUH6IWj8iIcIjAimL2etLD7
         l50Y1+Qd1n8HiXAPhcuhHLbUsS6FRKKG33e0EUFnVxbMsdaFD4oNL/3/IJix+7wHdIAb
         DKlgEga3mu10P8xA7O8MLmb7cRrZjT3UmxydQ7xO59Fndm3cYCeew0IlbBwDKaxAdEhJ
         W9Yg==
X-Gm-Message-State: APjAAAUB6f1hFKXDQv1PTfH5rtoF0DHRzsLV2kXuCO+pl0nI0muDob2d
        gacUT34pQaz6Pgc8vnKcUj8=
X-Google-Smtp-Source: APXvYqwSzNMdMd6jpDsyZY8yAC0uEwWQnLuosqnZfhIyJs9nvKRQZ5bDaDIHzz7HBpsSDwbbIiuW2A==
X-Received: by 2002:adf:f547:: with SMTP id j7mr2529411wrp.26.1571226629070;
        Wed, 16 Oct 2019 04:50:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n7sm27110235wrt.59.2019.10.16.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:50:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] iommu/tegra-smmu: Use non-secure register for flushing
Date:   Wed, 16 Oct 2019 13:50:24 +0200
Message-Id: <20191016115026.1768745-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Navneet Kumar <navneetk@nvidia.com>

Use PTB_ASID instead of SMMU_CONFIG to flush smmu.
PTB_ASID can be accessed from non-secure mode, SMMU_CONFIG cannot be.
Using SMMU_CONFIG could pose a problem when kernel doesn't have secure
mode access enabled from boot.

Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 99f85fb5a704..03e667480ec6 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -240,7 +240,7 @@ static inline void smmu_flush_tlb_group(struct tegra_smmu *smmu,
 
 static inline void smmu_flush(struct tegra_smmu *smmu)
 {
-	smmu_readl(smmu, SMMU_CONFIG);
+	smmu_readl(smmu, SMMU_PTB_ASID);
 }
 
 static int tegra_smmu_alloc_asid(struct tegra_smmu *smmu, unsigned int *idp)
-- 
2.23.0

