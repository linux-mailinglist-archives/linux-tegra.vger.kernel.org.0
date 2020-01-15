Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A069313C4E6
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2020 15:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAOOGY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Jan 2020 09:06:24 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55545 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgAOOGY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jan 2020 09:06:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so18039451wmj.5
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2020 06:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpaCDCp3aHifqmtaxF5hEcnltst6bnP9UNBwuYjhTyg=;
        b=uz/uXYTiOFJ44/TLVCgYExcwylBymtVJe4kPo2u+zUTksrUbJEjCNopJhDVEY/Q61R
         lR0K006XswSwr2UQOvP+hzZjbnOqBjfvhca9tli84HO5XhXaj4WfhBRMjIQojONKUJ1E
         2UKDuf6krQSqCF+owAeOW5d/+uz1/c4YK55AKxyArSJ11lcyT8sdlDA+5iFaGOFMm6LI
         LGsVtBOW18mOV/TZXItj7BQ4JY620F9QavAGgPs9XrgrgyJ/Zrnu9pMHNPrHvHtThyEu
         Il86FkvQIQ1K1uM9oPZB8xCy4HK6CcX1hc7bShhnkHB0ZNOId25hYkGKCa/XbJvmadt5
         BKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpaCDCp3aHifqmtaxF5hEcnltst6bnP9UNBwuYjhTyg=;
        b=p166/KXjjndKVQ28Ctz+kBx5iC/qEAow72+j02TmV0IfLmaHVxzcgnJvGJ2Vxu6SwN
         1Oj9iraFvSyl+XotIZVkkypbQqrmPEu4IVVghglNTyWod0iKES6W8gNXdYA3PSemnTTm
         /KfJNmkeyEW7CZQcgNdDc3YaqCaNZ1hRfQu+HDD3WK1/GDGPYe98g18aMwWD6oKo1RIh
         XtHSOVu3TPhkRX36pGVWk7V6A5LqflCxPfFZYm8RWxOXXseD3xT58fK6cD4wA/lFG5VP
         gsiB87IE3s9igAdhErHWCTPVAFNkXDfeKh5GEthCo7HD8pCBjJc5of6P6dWVDLa/U6xi
         z2aA==
X-Gm-Message-State: APjAAAX/fsHQp67EBePAJtHm14103vmigxFCudz00YI1thZ4KLMHQkcL
        36rcmZg+BkHg7mUW2Wi6xPM=
X-Google-Smtp-Source: APXvYqzgxb+l/AQl2zK9ehpckCGpp5lcjCBS+W4pziqCj97U6Z5Zrr80a44bIrdJwLbHr6vaOxEcwg==
X-Received: by 2002:a1c:9dd7:: with SMTP id g206mr33806939wme.61.1579097182214;
        Wed, 15 Jan 2020 06:06:22 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id u7sm23337154wmj.3.2020.01.15.06.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:06:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/nouveau: gm20b, gp10b: Fix Falcon bootstrapping
Date:   Wed, 15 Jan 2020 15:06:13 +0100
Message-Id: <20200115140613.70268-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The low-level Falcon bootstrapping callbacks are expected to return 0 on
success or a negative error code on failure. However, the implementation
on Tegra returns the ID or mask of the Falcons that were bootstrapped on
success, thus breaking the calling code, which treats this as failure.

Fix this by making sure we only return 0 or a negative error code, just
like the code for discrete GPUs does.

Fixes: 86ce2a71539c ("drm/nouveau/flcn/cmdq: move command generation to subdevs")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that this is against Ben's tree, which should only hit linux-next
tomorrow, so most people should not be hitting this yet.

 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c | 9 +++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
index 6d5a13e4a857..82571032a07d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -52,8 +52,13 @@ gm20b_pmu_acr_bootstrap_falcon(struct nvkm_falcon *falcon,
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gm20b_pmu_acr_bootstrap_falcon_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_id)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_id)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index 39c86bc56310..5b81c7320479 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -52,8 +52,13 @@ gp10b_pmu_acr_bootstrap_multiple_falcons(struct nvkm_falcon *falcon, u32 mask)
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gp10b_pmu_acr_bootstrap_multiple_falcons_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_mask)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_mask)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
-- 
2.24.1

