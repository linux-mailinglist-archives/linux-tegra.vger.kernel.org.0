Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90FC4116CB4
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfLIMAW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:22 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44310 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfLIMAW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so15873875wrm.11
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=E8zburFTQFbyXTDRWkkvQMSz5JNfUifO6kw1FDbBuBwPKbzpbbw/fKkOr9jz3xU9Ej
         LcipXvsmVU9ZQ6KmHbbJzmjImuxsTMD6Kr0VgCsiXmlt59hBMCzZyoNPWpgBJtu+AcvV
         YwzcQI8m0jrqljc12UDr9iVDSYqJJU0y7Eyb2jRQ+aPh7F5frcKJXHnP5vLprMHgXQJR
         q0cYYx7n5643QUY57xo0OqvwYKbKTJDELa4EsbU9j8B0KgHSBXyWe8jZvXfqKQPI4F6i
         Swo6xinD0cSmQO4g9qf/yBdC5dOr8PxVzt6G8NbnOcD2xiCNgkk1HrNBSpxQol3wZhmX
         KwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=LVtcUFeDzaeZ3eW4eTrVsIlU4yTzk86pdOp+3e/7AQZmgP1bZHcEx7LDz5u/RUBiCT
         mvcfXq7UDCln/u2TD2s1j9nqddZarQC3HU4bzcP8GD8RtJ6iYiV0JwX5SkthEz17bJ4+
         Rt9A1BrN9I+5LIPX0zTxrBfJHGTBvl3IczSufaYY0fpjES5YPMM9fWMS/HgZ0UyYr4wD
         ypEC7QFiM7btCwDGz7BDFlc9jdHIHSVlB1CusS9zuwD+SBvkfgVzUJLXHTtANso2OCfc
         KzAwgXJIfKvTh3ObMrbQEgBCeNzIImJu4FgtZHpm8JSb6HZ7/Ge8SfSvM0vAoaTTuHOF
         WmFg==
X-Gm-Message-State: APjAAAWIIAEwuZM9rFpGGxi0x52lToSxjg8iAJz3u1zRsXmyJNQB526v
        CepSr6D137qtFziybxDZY7w=
X-Google-Smtp-Source: APXvYqz6AD9TbeO2U0q7ZW37gBJWPpvXTESxowBlxDJqhVrWpyoFbwFU1U8Obp2WvpV1pHnwNC7u2w==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr1726974wrs.330.1575892819756;
        Mon, 09 Dec 2019 04:00:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l17sm26821557wro.77.2019.12.09.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/9] drm/nouveau: tegra: Set clock rate if not set
Date:   Mon,  9 Dec 2019 13:00:02 +0100
Message-Id: <20191209120005.2254786-7-thierry.reding@gmail.com>
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

