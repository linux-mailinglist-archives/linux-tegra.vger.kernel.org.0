Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC44B3D19
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbfIPPES (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:18 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40401 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbfIPPES (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:18 -0400
Received: by mail-ed1-f66.google.com with SMTP id v38so360827edm.7
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=n8cpQzdf6s+dwC812zcO+7PvElTqDg+8hJE7U3KrfCMjOFtdWxDa4AJU6vizAOF8kx
         7+wHB4E79A57I9H9KDh0hfrIzvocxOUG+Vboq45ipHeK5Ki93Magx64al6XM+itTg8xC
         lLBsB9dXfcxyRCzlMI9CmoxXGh3Hky0DME5+Y6b+/pm3C4vIiOlpGI8HlSsyKizziURi
         gWOR4SGPztqHdy8rD4xbSA7DS+lXINJVFB+tZrl/mdsf15bmi651VzNYJZk5y4rqLFXT
         4EVHf9TskykwWPoDJ4XtOseObo7tRWOBnRJUUT/1dTUn88ia4NpikfphSrUnKF45LEcu
         zHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
        b=l+3CIbfdBu0TpJSfyR5t4fuBiCv/QVrP6sI9A4E+EKZRE0ypQB1yEUrzPIyMoHBg6k
         8Iw+fboNIQjJ4mex0u0C933AOWtTz8h4L4U54uQsSC1MD+koNjdNMDeUDwyYWc25udOt
         JZ1l1LQbBVrE6HESQXE4/UZCd6RKm8ywA7DvG7+TCRxRh7Q+eE9DZ5HyWus0w00va7uH
         5S9e26CbG+88uHkabu+0RwpXsVPDuqPpRFw6mOt6kVRzdbgaoN7KmMBdLC2yopKZbM+9
         T+qS4kKHDca4ASwZG32N54YKunmb5CEgppbKdqKde55v3wJFn+SjBCHUrRGGb5cOxwsi
         IbEQ==
X-Gm-Message-State: APjAAAXzTamaWsDOvQiN4Agnb2IEZZHfLrIDaWcz6EDiVNQTUmxCP0ey
        LzYCAqZr0V9wIr0tZY26/rNmLLcN
X-Google-Smtp-Source: APXvYqwRvWyCUvUSTGCISgYTe/nKEOMhmiSYAAorp+BG4taJxap2eTfS+WK1OPfHXXWLZ0AdhPisKA==
X-Received: by 2002:aa7:c5c1:: with SMTP id h1mr5031118eds.10.1568646256458;
        Mon, 16 Sep 2019 08:04:16 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id jx11sm4259038ejb.19.2019.09.16.08.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 01/11] drm/nouveau: tegra: Avoid pulsing reset twice
Date:   Mon, 16 Sep 2019 17:04:02 +0200
Message-Id: <20190916150412.10025-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
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

