Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D371ADD7E
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 14:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbgDQMj5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 08:39:57 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17650 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgDQMj5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 08:39:57 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e99a3610000>; Fri, 17 Apr 2020 05:38:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Apr 2020 05:39:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Apr 2020 05:39:57 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Apr
 2020 12:39:56 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 Apr 2020 12:39:56 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.163]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e99a39b0001>; Fri, 17 Apr 2020 05:39:56 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 2/2] soc/tegra: fuse: Trivial clean-up of tegra_init_revision()
Date:   Fri, 17 Apr 2020 13:39:49 +0100
Message-ID: <20200417123949.26288-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417123949.26288-1-jonathanh@nvidia.com>
References: <20200417123949.26288-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587127137; bh=hDW9+H9O/pDyz3BT6+7eIUTGfjFbOHeAQB0vx01dk7E=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=QjBFCa+zfZlLnzYm6pYpcouTv6z0AtwFnWBvxjI4gfQSrKK+Qk/szZDDKrvOX16Sj
         0TDpLpmU5ZJwbp+rrUo2YfbNMklNjkxMY9EWpvUHkVkQ9jPN2WwOp/tOXuS7RApb+h
         +CYdOAEqbzFZw2G7UrpbRF3gZHqdKIr87TmscVu6PJTK0o+K30M39sA75sj+T085wU
         BYGPLGp0tKDzjE51aOx3oD8RM6E67etfgmpyESOS0HXoiAFDRC3jBStSk+ql16kvax
         8dQmtTBuvmZxGBsVfIn1KvLNshfdeu9D+mE59ypJGXTxAdw6+S9VRMtyVw+Ra2HG1t
         4wKP9esPyo53Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Clean-up the tegra_init_revision() function by removing the 'rev'
variable which is not needed and use the newly added helper function
tegra_get_minor_rev() to get the minor revision.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- None

Changes since V1:
- Added this change in V2 of the series

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 44a154ca16b5..3cdd69d1bd4d 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -75,36 +75,32 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 
 void __init tegra_init_revision(void)
 {
-	u32 id, chip_id, minor_rev;
-	int rev;
+	u8 chip_id, minor_rev;
 
-	id = tegra_read_chipid();
-	chip_id = (id >> 8) & 0xff;
-	minor_rev = (id >> 16) & 0xf;
+	chip_id = tegra_get_chip_id();
+	minor_rev = tegra_get_minor_rev();
 
 	switch (minor_rev) {
 	case 1:
-		rev = TEGRA_REVISION_A01;
+		tegra_sku_info.revision = TEGRA_REVISION_A01;
 		break;
 	case 2:
-		rev = TEGRA_REVISION_A02;
+		tegra_sku_info.revision = TEGRA_REVISION_A02;
 		break;
 	case 3:
 		if (chip_id == TEGRA20 && (tegra_fuse_read_spare(18) ||
 					   tegra_fuse_read_spare(19)))
-			rev = TEGRA_REVISION_A03p;
+			tegra_sku_info.revision = TEGRA_REVISION_A03p;
 		else
-			rev = TEGRA_REVISION_A03;
+			tegra_sku_info.revision = TEGRA_REVISION_A03;
 		break;
 	case 4:
-		rev = TEGRA_REVISION_A04;
+		tegra_sku_info.revision = TEGRA_REVISION_A04;
 		break;
 	default:
-		rev = TEGRA_REVISION_UNKNOWN;
+		tegra_sku_info.revision = TEGRA_REVISION_UNKNOWN;
 	}
 
-	tegra_sku_info.revision = rev;
-
 	tegra_sku_info.sku_id = tegra_fuse_read_early(FUSE_SKU_INFO);
 }
 
-- 
2.17.1

