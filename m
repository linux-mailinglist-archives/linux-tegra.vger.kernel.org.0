Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C60B3D1C
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbfIPPEV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:21 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40410 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfIPPEV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:21 -0400
Received: by mail-ed1-f67.google.com with SMTP id v38so361055edm.7
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=c2lXS8CJSnfav5ofaOvfzFlnEUvOjdwi1Y1UOQYq+PCD8YVubB+CQdtitMlDads9rD
         nq7BmSaG/Y/XEy+qAmOA1MKqm/8HV+30fEpgaPsQBmByPFz4hD+Ze13EXhSXlImc6xBp
         UKCTx2urdlcsj3VrlyVCRe0Ef+piETXHBkXZ2LHJA9CjNAIXE+3PxK45ioTM+08KVAVG
         yZ0V9Lsz0dHaVx83ihsVUDTJ3259qb+es2CRFZ2Jf8LCJhoj6tx2ITjhD2Rqfv6ZCgQb
         4w5VxcoyYXMGFrNhdmRVjwc+klo6DG9xfNs15qIhQGIfQO5rPVedbO2a6x3wMFJDoefF
         K6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=TqILENGVMgrwJYV7BONYZ0Tl8ReG1gMNrSDopavA9S2LwsnURXcnqNP02i+91qc/24
         0/eJDsx7KEYIy1JsV1Ay/NcLPQ2XOC4AooifFEtwixSnxGHxhNqE4ntR7IpBVPsfcZfp
         l+00UnvB02eTjyZVsLuNm4PIL+RZbYAijpfhR1+Zqhkj2G1BNTyMIR/E0o9boHhRQCGE
         /HVWyulTlQp5eCnULDZdiZEkpsGi7NnHd3B+ct+Ii4PtJnL/igC4wCKac4vG5SjMe0AG
         kuT+bYy1qDIZbvNkDds1Z6N62eEYCO4t3i4YArCMNttgnikgE5wpyfCYSvo9bSDL9T3J
         AYBg==
X-Gm-Message-State: APjAAAUKvH4uslVOmzXfYVDhEzMKzke4/MJum9znF71mpwzD+WysMVb8
        AEsAm8j/Tz1tjISXWpK33ew=
X-Google-Smtp-Source: APXvYqwQYM/jep+uQY8ryx0IupNXrcssF3uFD6H5Sz9kk2SVEgc4TyFPeC76+VT0Cny/s2Oled2cgQ==
X-Received: by 2002:a50:ec84:: with SMTP id e4mr63730127edr.193.1568646259320;
        Mon, 16 Sep 2019 08:04:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id qx25sm1379638ejb.61.2019.09.16.08.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 02/11] drm/nouveau: tegra: Set clock rate if not set
Date:   Mon, 16 Sep 2019 17:04:03 +0200
Message-Id: <20190916150412.10025-3-thierry.reding@gmail.com>
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

If the GPU clock has not had a rate set, initialize it to the maximum
clock rate to make sure it does run.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 747a775121cf..d0d52c1d4aee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -279,6 +279,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		      struct nvkm_device **pdevice)
 {
 	struct nvkm_device_tegra *tdev;
+	unsigned long rate;
 	int ret;
 
 	if (!(tdev = kzalloc(sizeof(*tdev), GFP_KERNEL)))
@@ -307,6 +308,17 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
+	rate = clk_get_rate(tdev->clk);
+	if (rate == 0) {
+		ret = clk_set_rate(tdev->clk, ULONG_MAX);
+		if (ret < 0)
+			goto free;
+
+		rate = clk_get_rate(tdev->clk);
+
+		dev_dbg(&pdev->dev, "GPU clock set to %lu\n", rate);
+	}
+
 	if (func->require_ref_clk)
 		tdev->clk_ref = devm_clk_get(&pdev->dev, "ref");
 	if (IS_ERR(tdev->clk_ref)) {
-- 
2.23.0

