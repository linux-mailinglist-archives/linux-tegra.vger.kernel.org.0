Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725A4116CB0
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfLIMAU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:20 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36341 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfLIMAU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:20 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so15909488wru.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=SKUQl8T0YZIUWCBN3443ZKkGVN5Go8c7h7XoQozfP9MSykuO+Pr3ftH+ORSi2RAxAy
         rVEc36/ZlaiBKn9c7DSQjG0flhGKIDydl/ehc5l83+f6M1V+hhn8VX3GlYvVZscEZm9E
         mWcDoMQMPMFSjYAfKT4gb0hMZd0JlEgN69vDkGlN8M0PwdvOi5GlqMPR2YUongTZDMKK
         E35byK4fLXznAaOeCH2zat5ch0ut19tjVuqTQljNAmuJbpSaA2fRXb1I5vSywAV+r08j
         NrA6PHXYX0f1usHdmKDVtTrwi5Y6/UgBsQ4C1ZxoJih8av5JFBFhS+xYgfhA6d4ac9Lj
         JZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=dWyK3ZQmPUkwHdUGVWYojSpq7zAEwcvfKRo7jpdJgLzf5rJWMuHNNUzqThXCklr3o2
         rpYQE9yMaY2QadQHT1qpHP8NoX0HWtlyylN4NVJ4iIpBn2o+fpb4e0bfn46SDaI6JV5G
         esK11uxdUSaYRj4F9owi6bnXvQ3CPk0X42h1jDu8NMx2un31JBP1vuR/uajU+LQ1G90K
         I6umHDEvcr1zjo9YX1oxfVOL/UxDd9CLSnD5MwUn8Ia5BNfbNpPOYRajyn9dq5D86FQc
         ov6+Lntw4iHzhqkYvfd76CukwEoAIXM6h7I2l+L4NGcNYxGZRTwBsuyxk5qRVF8Tb9tD
         TKRA==
X-Gm-Message-State: APjAAAWUwjaupcNCvFSsN12ycLW7q1pSxyxqXboBeC9H67WwXMuZ76xk
        iAmq/7Q3QSYKP4GUOOMgZLs=
X-Google-Smtp-Source: APXvYqzXPoZDxBiw+5no9dfH5axKmd4vK6atZbcQ1BeBP6m3W9lIvlzVLMCJTuPWlpxT9mBV93YTdg==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr1816420wrm.223.1575892817765;
        Mon, 09 Dec 2019 04:00:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id x26sm1672491wmc.30.2019.12.09.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/9] drm/nouveau: tegra: Avoid pulsing reset twice
Date:   Mon,  9 Dec 2019 13:00:01 +0100
Message-Id: <20191209120005.2254786-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When the GPU powergate is controlled by a generic power domain provider,
the reset will automatically be asserted and deasserted as part of the
power-ungating procedure.

On some Jetson TX2 boards, doing an additional assert and deassert of
the GPU outside of the power-ungate procedure can cause the GPU to go
into a bad state where the memory interface can no longer access system
memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0e372a190d3f..747a775121cf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -52,18 +52,18 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 	clk_set_rate(tdev->clk_pwr, 204000000);
 	udelay(10);
 
-	reset_control_assert(tdev->rst);
-	udelay(10);
-
 	if (!tdev->pdev->dev.pm_domain) {
+		reset_control_assert(tdev->rst);
+		udelay(10);
+
 		ret = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
 		if (ret)
 			goto err_clamp;
 		udelay(10);
-	}
 
-	reset_control_deassert(tdev->rst);
-	udelay(10);
+		reset_control_deassert(tdev->rst);
+		udelay(10);
+	}
 
 	return 0;
 
-- 
2.23.0

