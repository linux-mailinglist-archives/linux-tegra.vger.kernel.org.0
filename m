Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16302D7B7E
	for <lists+linux-tegra@lfdr.de>; Tue, 15 Oct 2019 18:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfJOQ35 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Oct 2019 12:29:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36684 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727651AbfJOQ35 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Oct 2019 12:29:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so24673178wrd.3
        for <linux-tegra@vger.kernel.org>; Tue, 15 Oct 2019 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JvkdWrZIuVB4wEQZQVs5mAArtaBmF1bFpmfJLPYELHc=;
        b=c9iAWGuv1XKyHTA7scMFN2stJQ00qiFgIav/YIaYpT/gsyQUB45XlCLD/GVMFPFjaL
         1N636dgDqAWWFtQQuyx3UguhBhZ8LpG1khVGnZwJA4tc1R0lf37t+ajkrIdT4ugOzpaR
         VyfWCEdLwm/s0C2YSocndvVNe4El3u/AnW8iUSzz91jeVT8NhZe83063/1WNAo6jr6Jc
         uJl2ZYGBJq1DRyxkyijvc9qyGCs9XGzOx44DqruBqaN4ZO1yLf8ZR7925pneGyqAw+vm
         lRmjy7vWfxVGSSxnaKDcL9vznyjC2U0NqHVxx4jIKnw4w5+llBb3/V4s3CU0r68rNQou
         mcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JvkdWrZIuVB4wEQZQVs5mAArtaBmF1bFpmfJLPYELHc=;
        b=q4viVZR3nVfrBrtRkKJTXCRc7BYkoqMiAoDujzTNmEi3EDyRMldbxIBlG2tNazvfsE
         b9yajrXNDOIuGBEfde7QZnsEhqPhTY6DSKj980CzVHP2OnwurcBpuUUhUEjjxmBdh01x
         a7A7ztCPq9Ifr9fz/S2kHbkg5Cuif4MYE+WO6NSNIqKeqgQAXrHiafq9uQQpbkIZnFWw
         KRWxMw3yKcsAEdlRnbi9biWqGeBB1eVkH1nQl4+QeWkfHCqtO0rSJpVvOfEzhse42vBg
         BpqrdIsawvwfAu769Eo5BoW0dckdFdVC+kLY8HAKAdhNR/mdgteKzHGzF0lRH6T9Dx/X
         0A6A==
X-Gm-Message-State: APjAAAVPLuD1G2QRU7RUzXQY7sEssRU3xrwj63Ome0+ExTO5oKXBJljB
        mH0pzJhyZG3bjJvcxLM/cZs=
X-Google-Smtp-Source: APXvYqxoxfeOmJ+UjotH/Ka0LqpXHcSy2mQ+oNsgtxdm/eawKd9g2S88Wjj+MkFv0YlMhAQ9t9zt4A==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr31056334wrm.81.1571156994875;
        Tue, 15 Oct 2019 09:29:54 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s9sm24373148wme.36.2019.10.15.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:29:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [RFC 3/3] iommu: arm-smmu: Get reference to memory controller
Date:   Tue, 15 Oct 2019 18:29:45 +0200
Message-Id: <20191015162945.1203736-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162945.1203736-1-thierry.reding@gmail.com>
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the memory controller framework to obtain a reference to the memory
controller to which the SMMU will make memory requests. This allows the
two drivers to properly order their probes so that the memory controller
can be programmed first.

An example where this is required is Tegra186 where the stream IDs need
to be associated with memory clients before memory requests are emitted
with the correct stream ID.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm-smmu.c | 12 ++++++++++++
 drivers/iommu/arm-smmu.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index b18aac4c105e..8dd214244926 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -2015,6 +2015,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 	smmu->dev = dev;
 
+	smmu->mc = memory_controller_get(dev, NULL);
+	if (IS_ERR(smmu->mc)) {
+		err = PTR_ERR(smmu->mc);
+
+		if (err != -ENODEV) {
+			dev_err(dev, "failed to get memory controller: %d\n", err);
+			return err;
+		}
+
+		smmu->mc = NULL;
+	}
+
 	if (dev->of_node)
 		err = arm_smmu_device_dt_probe(pdev, smmu);
 	else
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index b19b6cae9b5e..40b6d42eb3ab 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -17,6 +17,7 @@
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/memory-controller.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -224,6 +225,7 @@ enum arm_smmu_implementation {
 
 struct arm_smmu_device {
 	struct device			*dev;
+	struct memory_controller	*mc;
 
 	void __iomem			*base;
 	unsigned int			numpage;
-- 
2.23.0

