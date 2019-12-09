Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB38116FE2
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 16:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfLIPIB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 10:08:01 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37579 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPIB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 10:08:01 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so15339900wmf.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCh0DvmuPvNnvwyZrUn1Yxeo2DKZuHbBZB63XGCCkS0=;
        b=RCFZsnYA0ah3RgaH4YcQ8lshQjU7h/V8oku0vGmhP4oE9Wtew3Cf9yl2hieQG5wrK6
         Ix2xPTip9Dd4NRjiWUdsWMp61s5znz2sevxNPEMTWQxZyd3pq8l77DoTAHRRhmp85Uy+
         iZCodqQIhd+4nvvloniqdKNiV+iuR0PKJabToorhlsWVZi9BzSg1EqvtudbeqB0RAwja
         T+sdZ2DJRdFhDap4NVifzs3S4ANB8VN1e32SPvQ5xJj7Wza5fCalFMyYIlsvBm6aleBN
         L0hAyV5gu3bi8DdTiU+RSIPy+Yb1Z7X3/j54c4/9x3aMMtnsjxLc3qt5MBZq+IenwAia
         7VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCh0DvmuPvNnvwyZrUn1Yxeo2DKZuHbBZB63XGCCkS0=;
        b=BuU0qXlgufScqi0cFkL1l9nZL9EuADg4/SeDbcwRi9vvS1XG9z7rwFy3YZg/9WKhgo
         NJyUbwvJVzNrzNFia/yrshjrt2vrfupekiygzgmojmECEQ8ARnOjD5C1CRpoFSQ3JUjO
         L46xbQrK+7zqWc21cOvSK1a3yZRIB434tZi0ynqskye/AluXaKVbUi1DmMsm4oUcWiNc
         qlgnocCAFH33Tsn8tdw4ZLpcjdOr3HjlNxrlCM2X9Gta9+S82mJGQ8aPnNeNpqSF+gjp
         OBWGpxz0FrMojiK1n/SwttSMxVMp96ND7Qj6x5fJN+ZTGw4tPKAhClDO6VpLKzeJcqsm
         B3yg==
X-Gm-Message-State: APjAAAXWDg4ugVaS4JclHXZRqf0N4AlPAdw9lLuehAi4yEVLeaH1bKow
        I95IpdSUeFI2BEFhs1gYzVw=
X-Google-Smtp-Source: APXvYqxl2jgGeV/nQbJT4WcN79CWmM1WA8NXKH9i0hXyR/42inKaAVju+sJOobjHc7cEOfabhQZ6KA==
X-Received: by 2002:a1c:c90e:: with SMTP id f14mr25155761wmb.47.1575904079019;
        Mon, 09 Dec 2019 07:07:59 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 4sm41628wmg.22.2019.12.09.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 07:07:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [RFC 1/2] iommu: arm-smmu: Extract arm_smmu_of_parse()
Date:   Mon,  9 Dec 2019 16:07:47 +0100
Message-Id: <20191209150748.2471814-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209150748.2471814-1-thierry.reding@gmail.com>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function will be subsequently used to extract stream ID information
early, before a struct device is available.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm-smmu.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index d1aef07bb784..5c5cf942077e 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1545,18 +1545,28 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 	return ret;
 }
 
-static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
+static u32 arm_smmu_of_parse(struct device_node *np, const u32 *args,
+			     unsigned int count)
 {
-	u32 mask, fwid = 0;
+	u32 fwid = 0, mask;
 
-	if (args->args_count > 0)
-		fwid |= FIELD_PREP(SMR_ID, args->args[0]);
+	if (count > 0)
+		fwid |= FIELD_PREP(SMR_ID, args[0]);
 
-	if (args->args_count > 1)
-		fwid |= FIELD_PREP(SMR_MASK, args->args[1]);
-	else if (!of_property_read_u32(args->np, "stream-match-mask", &mask))
+	if (count > 1)
+		fwid |= FIELD_PREP(SMR_MASK, args[1]);
+	else if (!of_property_read_u32(np, "stream-match-mask", &mask))
 		fwid |= FIELD_PREP(SMR_MASK, mask);
 
+	return fwid;
+}
+
+static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
+	u32 fwid;
+
+	fwid = arm_smmu_of_parse(args->np, args->args, args->args_count);
+
 	return iommu_fwspec_add_ids(dev, &fwid, 1);
 }
 
-- 
2.23.0

