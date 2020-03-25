Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A7B1931BC
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2020 21:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCYUQM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Mar 2020 16:16:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33914 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYUQM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Mar 2020 16:16:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id 65so4990084wrl.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2020 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aW1zxIHiei+l8kDSE2lVXf/aMBDE/GtIkGFrQXvKkrY=;
        b=XXUz449uJivXz+1lH6pKa9IvT3vUx61/skXaEyQxpkslFR268FwckKE0ryQDUx701N
         hFN9ocSGCuE6bKpdgya8YmthXDASOYWZzKV0R5jms1rqgazVMF6jARv+kE4Jaj9Ek4tl
         4eTpmnHinx0xIrgGWCQbfltjb+zAE5XOGX8UCX1526r3yQQpu+OQlKZ70Tvq3pdw0zfT
         URkTU8sfdTa9DCxUSsUukPcK9vKOk6XHkFleL6FisODDvXphdzzLa1TCv9UTGLrUsHSd
         XDrukLto5efrUE03q5jP6ZN4xbnLDbhY6IkB7PAW1qwSPG/Eg0p0ivpJ58+QwwmBH6zF
         ByDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aW1zxIHiei+l8kDSE2lVXf/aMBDE/GtIkGFrQXvKkrY=;
        b=DIWKPWCoYx1rnX34DSkRPm2K6lR1SurVvq+IIY5Nrc9uq+E3pmXQcActG0DDAHHK8a
         SgnziEvuWTeROgrlwONYq+FUZRQ6s1TRR1+qDXqAlRtdebU/cEep+LRvdzJe/qJBpPqd
         SnSTR3Xntgo7EcyLRj9YqSodasylPt3OzrhuDudfTSQtKZghElLfyJV/tzgwG+OC3TD4
         RJAykZ0tgWHy7Bc1UB+z6LovuT/sgcPUSLfNqDehQWqwQeqHqXgFAomUN0CCEr2YdjkT
         sCpBZPqKtb22FdDWlDiNnEkEmMPA+K4MIWbZL9VuvArjFaaBn6fBxvnX4tAKEcOiKeUy
         EZXw==
X-Gm-Message-State: ANhLgQ1Vj1gSFYKgV/7jV1T3UIwTE5jasGmLOhuuGuWvjBs2xXUgieyz
        VhNVgYIYU/8R/0Vx9Hv44rw=
X-Google-Smtp-Source: ADFU+vtTfrVHW69I+ZhOz8qw8xUje/j42rKoNxAP2wTt+E5WQ5s6QhBcgeHzC4Bw5Q5NdWxjLUtZ/g==
X-Received: by 2002:adf:800e:: with SMTP id 14mr5104354wrk.369.1585167368929;
        Wed, 25 Mar 2020 13:16:08 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id e9sm151985wrw.30.2020.03.25.13.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 13:16:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] gpu: host1x: Use SMMU on Tegra124 and Tegra210
Date:   Wed, 25 Mar 2020 21:16:04 +0100
Message-Id: <20200325201604.833898-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200325201604.833898-1-thierry.reding@gmail.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra124 and Tegra210 support addressing more than 32 bits of physical
memory. However, since their host1x does not support the wide GATHER
opcode, they should use the SMMU if at all possible to ensure that all
the system memory can be used for command buffers, irrespective of
whether or not the host1x firewall is enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 40a4b9f8b861..d24344e91922 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -192,17 +192,55 @@ static void host1x_setup_sid_table(struct host1x *host)
 	}
 }
 
+static bool host1x_wants_iommu(struct host1x *host1x)
+{
+	/*
+	 * If we support addressing a maximum of 32 bits of physical memory
+	 * and if the host1x firewall is enabled, there's no need to enable
+	 * IOMMU support. This can happen for example on Tegra20, Tegra30
+	 * and Tegra114.
+	 *
+	 * Tegra124 and later can address up to 34 bits of physical memory and
+	 * many platforms come equipped with more than 2 GiB of system memory,
+	 * which requires crossing the 4 GiB boundary. But there's a catch: on
+	 * SoCs before Tegra186 (i.e. Tegra124 and Tegra210), the host1x can
+	 * only address up to 32 bits of memory in GATHER opcodes, which means
+	 * that command buffers need to either be in the first 2 GiB of system
+	 * memory (which could quickly lead to memory exhaustion), or command
+	 * buffers need to be treated differently from other buffers (which is
+	 * not possible with the current ABI).
+	 *
+	 * A third option is to use the IOMMU in these cases to make sure all
+	 * buffers will be mapped into a 32-bit IOVA space that host1x can
+	 * address. This allows all of the system memory to be used and works
+	 * within the limitations of the host1x on these SoCs.
+	 *
+	 * In summary, default to enable IOMMU on Tegra124 and later. For any
+	 * of the earlier SoCs, only use the IOMMU for additional safety when
+	 * the host1x firewall is disabled.
+	 */
+	if (host1x->info->dma_mask <= DMA_BIT_MASK(32)) {
+		if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+			return false;
+	}
+
+	return true;
+}
+
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
 	/*
-	 * If the host1x firewall is enabled, there's no need to enable IOMMU
-	 * support. Similarly, if host1x is already attached to an IOMMU (via
-	 * the DMA API), don't try to attach again.
+	 * We may not always want to enable IOMMU support (for example if the
+	 * host1x firewall is already enabled and we don't support addressing
+	 * more than 32 bits of physical memory), so check for that first.
+	 *
+	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
+	 * API), don't try to attach again.
 	 */
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) || domain)
+	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 
 	host->group = iommu_group_get(host->dev);
-- 
2.24.1

