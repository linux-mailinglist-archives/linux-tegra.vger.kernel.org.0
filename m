Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E96151BBA
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 14:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbgBDN7i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 08:59:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38032 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbgBDN7i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 08:59:38 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so23189395wrh.5
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2020 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3q/hiF2IK65NcJNCMMQsx8gxz/hZCyk8W3CetMdLmis=;
        b=gJx9rclb/KYIETIY47XHZSF6l4XeJ0wqmlLGUNZ5+qo2egx4cOuEZRnCmaHkqLwOt+
         HCKpE+/ik2ToYZPvqXHXdUQZ7KxSn2B5xY24BdbzNgUVXo27Wwdvn0C8JOGN1unMFv41
         dz7VRsT5+XuYYhLKq5vNwqqtB+OgVsU73Q3KsX6EfEZA5othsUsUZqIquGbAuTUOpF3T
         AhNrKXUUPDLM6QEAITNRXefmqIismhoK9uvP/4mCeu7ib3MyoQ3tptiI96ZJ000xIEG8
         BpPJFjuAC7WCBc6wtaitvLr7nK8iidEJ+eb9YAE3osvTQDOKVMXB+eGD903Xz3nF4PFJ
         ZZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3q/hiF2IK65NcJNCMMQsx8gxz/hZCyk8W3CetMdLmis=;
        b=rmKcIIWSDkUVpDA0XP7mSjiblPWUUY1V/HoGAFwrWTGoPiVTYkXut+paTrycv5b6AU
         PL7nPXsezenJVyhS8J+YbaJcj5dKnAf5A/aUdHi9ZWIHEtwabIdqFVz5ZmHr0l+5wUPu
         0DEhpAMfuaKG+64pChbdRt2jb9PymF9B7EnHufTt3M21l7NTt9g6xlfDzk4MGP8KgWKL
         BL88ebgq8M258Qtb0WKgcwbaZ1YUImAZEW9Wuf2greTap3A6MQn46/Q+bUMf0XvcnSRP
         isK+N5YKaTt8QbK6Ow3Lmsc0j72lUxR9DHggIrhiTVKR/UAToCOVQLzfLUY3l5QdzrzM
         oQnw==
X-Gm-Message-State: APjAAAUiBblhJ0L0akJV/2X6zQ5JRbt/u9E4w/nOqBU2A2US8/4ducAp
        bnq/1QWgGxdTO0G6LwLd+pc=
X-Google-Smtp-Source: APXvYqwn7BYhO8M2hQpfD9Jym0+4PExkrgi1qA+f60pUUidTJsrFQPhlPwtg8l3T+MSYBgVbmJMQig==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr21772768wrq.125.1580824775081;
        Tue, 04 Feb 2020 05:59:35 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w26sm3759538wmi.8.2020.02.04.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 05:59:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
Date:   Tue,  4 Feb 2020 14:59:24 +0100
Message-Id: <20200204135926.1156340-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Older Tegra devices only allow addressing 32 bits of memory, so whether
or not the host1x is attached to an IOMMU doesn't matter. host1x IOMMU
attachment is only needed on devices that can address memory beyond the
32-bit boundary and where the host1x doesn't support the wide GATHER
opcode that allows it to access buffers at higher addresses.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 49 ++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index aa9e49f04988..bd268028fb3d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1037,23 +1037,9 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 	free_pages((unsigned long)virt, get_order(size));
 }
 
-static int host1x_drm_probe(struct host1x_device *dev)
+static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
-	struct drm_driver *driver = &tegra_drm_driver;
 	struct iommu_domain *domain;
-	struct tegra_drm *tegra;
-	struct drm_device *drm;
-	int err;
-
-	drm = drm_dev_alloc(driver, &dev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
-	if (!tegra) {
-		err = -ENOMEM;
-		goto put;
-	}
 
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
@@ -1082,9 +1068,38 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	 * up the device tree appropriately. This is considered an problem
 	 * of integration, so care must be taken for the DT to be consistent.
 	 */
-	domain = iommu_get_domain_for_dev(drm->dev->parent);
+	domain = iommu_get_domain_for_dev(dev->dev.parent);
+
+	/*
+	 * Tegra20 and Tegra30 don't support addressing memory beyond the
+	 * 32-bit boundary, so the regular GATHER opcodes will always be
+	 * sufficient and whether or not the host1x is attached to an IOMMU
+	 * doesn't matter.
+	 */
+	if (!domain && dma_get_mask(dev->dev.parent) <= DMA_BIT_MASK(32))
+		return true;
+
+	return domain != NULL;
+}
+
+static int host1x_drm_probe(struct host1x_device *dev)
+{
+	struct drm_driver *driver = &tegra_drm_driver;
+	struct tegra_drm *tegra;
+	struct drm_device *drm;
+	int err;
+
+	drm = drm_dev_alloc(driver, &dev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
+	if (!tegra) {
+		err = -ENOMEM;
+		goto put;
+	}
 
-	if (domain && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err = -ENOMEM;
-- 
2.24.1

