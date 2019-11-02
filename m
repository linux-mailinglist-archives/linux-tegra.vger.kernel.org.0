Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64651ED016
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKBR4y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55094 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR4x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id c12so7992946wml.4
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=nP2SGINI4Ur/eHW/lspNtR35xdwGU7jvbgoMCmGYHbG8Pf1PrfIk9Y0NDM6F85H7Fv
         sZZZ0s/ojJj4ZbV79PnHQHspwJMQ5Ee7/HWruEjifAUdh3OxVaoedI4loPy+m8uYUlBz
         49Sv69d5FDwE2LGgjDSqAW+UoahBppg/LHNrovn3wVJiNIhtvSnFF4RVqoM2apOP/l6y
         WYRJMLzsx8B52UTxPys49YFNpglgtIW6Du0D+zAD4akodfQ7iy6W9r8v+zfyMyMcHBWL
         Co++vpyUFGjVUAwiSzCRM6ETL1ub638Wz//133ii8rWFxsJp3nZnYqlqwhAzqJrbwONB
         vpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=C9pESXbrw3vEb8H2eD3ehPZWLx2OEO+BAMPcOj4vmxctb60SZkJoUxOj38xCXrtGud
         0j00abxRU3EPA36WazlVlhtdHSwjg5r44Ye/3e1Pa3k+hyF8IUTfpq6utvHRb0V3gXF7
         fBpLNdXWC6VSC1BUjpYrIjCYBP7leiuq9n1g+9/4tyYnPJgTnRj3nh7H5j/ipynCoyx5
         GPzT27oKkkru9iUWVTNmg+GYI9S4gegwiNL8p6fMLrvjRV+cv9FjzUMAHxJg1nch32zx
         fmL0JacWv76P6DgqeRCFL+bBerFJmFrbsnoWN8iMbmL9fl4+F6GesBIvYaJo2BvyYuzn
         fnuw==
X-Gm-Message-State: APjAAAVmLnPyVRoCfdo9M4+G5z1lCzOGqr96GHwOHt4Jg3myPpHCcMSr
        5Dh/tw4xEN2rlK4uh91ix/8=
X-Google-Smtp-Source: APXvYqyS7+gBjnA3J0Ipl+n3F4+f2+CSBvOI/VkWKB6mZCfhDy76c/tr0ezPCPCD4eQtO1Cds5+7Rw==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr16105671wmd.48.1572717411603;
        Sat, 02 Nov 2019 10:56:51 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u1sm8614139wrp.56.2019.11.02.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/9] drm/nouveau: tegra: Avoid pulsing reset twice
Date:   Sat,  2 Nov 2019 18:56:33 +0100
Message-Id: <20191102175637.3065-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
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

