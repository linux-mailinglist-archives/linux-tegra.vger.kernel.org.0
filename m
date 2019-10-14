Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F36D6303
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731432AbfJNMvK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37127 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so16631206wmc.2
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FwBg+ebSJP5mRjr900RF+E/RqOvjOLM24+kI7t4VvUg=;
        b=DOlLanNaCmwuTEm1kbAzhv1PC8LkEv4wn3LmSmiRgU3vG4Zq6lTTq3lyOHwRdqjBTc
         cJKq6Q+3ujIHy9JzOxO9uocKYFPbl3Qjr3mowd4Xd5ArqjQOj4KWpEzp1AZD6OpieOVz
         /teKSxf4EUaDQqHGV7XcG8d6oC1CHCUlXZtKRni9c/6S8tlm/T65HnODIvS3hF/hNWUy
         bs0U5xLavIhEF0B9SUJq+Q4Di9V3SmjB/BfazUpyM5D2tZRduplXBsAGrLFoWyD1Kcii
         IEOMTliZ+HpghdKrlwru4q2t2jEKiAFt57B41S1GL0679eNejylsL2Ht1DKfYYs8rSkX
         9xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FwBg+ebSJP5mRjr900RF+E/RqOvjOLM24+kI7t4VvUg=;
        b=VraF3Ng8fP5asZr71cHdtiM6DyWyGtvkQk9j8aVxKQcFcaQs1rLM6ItxwlzZ+4D+ec
         +fa+29WaM0abgxWQeGeIY96z3xTJJluA+9790hmtbE71Lb3aYhhxv8zql4uN3EBHvtiK
         IZdYwKI9BPWVdt14wAXYYddlT2OhjdkNoGg5Zpwa1LhOAEAdQoy9q6wKuYq0cCv3nlDd
         LAgLhi0e8w/VYMA5a06TYJXBxneXfO08eh6Lf/2gml60GyJKBymqTFGDeQfVfdwiKE5D
         TU11nEY6BEa7gD24eGcuhzWzEmZpZSmszgocKTB5BXd7Zv76dVMnsurxHjyDIbwRhBzP
         dP2g==
X-Gm-Message-State: APjAAAVTW3vLuuM93K3xfl6Fv8HVymVaUvOHh9W0nkKym1RbVyJjWFWz
        YFmQTDAWClGoGR7A2nWplyo=
X-Google-Smtp-Source: APXvYqzXG6B2Rb+gy/AW++lSmQzs70JeEvfgo03vNOj77BcGg0/KS5QnmwfcvAVFWiTYXiMXWp9RYw==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr14486354wmb.18.1571057468225;
        Mon, 14 Oct 2019 05:51:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x5sm23902742wrt.75.2019.10.14.05.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 08/14] drm/tegra: vic: Inherit DMA mask from host1x
Date:   Mon, 14 Oct 2019 14:50:43 +0200
Message-Id: <20191014125049.425101-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

VIC, just like all other host1x clients, has the same addressing range
as its parent host1x device. Inherit the DMA mask to reflect that.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 748798f2cdc8..d60e479cde92 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -385,6 +385,13 @@ static int vic_probe(struct platform_device *pdev)
 	struct vic *vic;
 	int err;
 
+	/* inherit DMA mask from host1x parent */
+	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	vic = devm_kzalloc(dev, sizeof(*vic), GFP_KERNEL);
 	if (!vic)
 		return -ENOMEM;
-- 
2.23.0

