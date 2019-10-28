Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBBA3E7173
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389097AbfJ1Mh2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53161 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfJ1Mh2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id p21so9276545wmg.2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCHEmXXyh53/Om/kiUXuXh86NdIS0vexI4+H1W2Xp5I=;
        b=fXmfyYMCWAFqXTbkafRDiO7nIaVYgGmns3mbWRILUheNV0Ygs3QVAA4MSUj74xn+X0
         RIvTBtkHzjjjEdi8S57hQhOxpDZuoYjha2snqT9r0dhqhsO78u/m3XUY6HLl7ipaEp0Z
         bsOaqxXSWDEIWnmNf1w5AMbwQS0XU178eDr953Atziv7kmSzuciAtfJeLqJf3psdruj1
         oFn2smkc/dvAKF4GmPA+Lsemmvu5KS7v8uVJ7cPtJMBmTldNKS3rqhrxsT/eJJAiZLt5
         hMAzmcLU50D4hY+fNq4QDzTN1Ghtd3OTGtzRewwx+1I3aWS7FzN7tT5P/XOf8WYlY7T+
         qnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCHEmXXyh53/Om/kiUXuXh86NdIS0vexI4+H1W2Xp5I=;
        b=e/Ew4Myo8nDeWNoi/LNJUbbaxoKVZ1Qd0oeSOJQ8f5ESja78VWV2dX/SQjjPJ1h/GV
         tYk/1xXCYKDlAlKlerppVrwKchcNDJSX7mWsnNIj8sRk7B1qN9JImARA/nYgBIsXqApg
         diKsdAelqiDHmsb6XNZTNCyduo8nDKBDlteCdUhdEf4ltWOgrU5zLE5lYaWgAc9arB2j
         dqNu/B7RdHIrMnSH9CDlsNd9noUi9UKICxgX0qs+OWMO7dI9f3xwmAh2RNcGh5QMJpOn
         v3Mt7lzm+0Az72Hwgxpw4OQ9RekYLUoWa9RiBnUhL8imu1kBlFLmapeNwSzubR6PmopR
         2zrQ==
X-Gm-Message-State: APjAAAWwYF2m2jtaLmnnEkAzmVQ60GN6sXM+UiHWTjqNzp8AUGDmRH+L
        wK5DMovIS6R6fHIDoRlO+vs=
X-Google-Smtp-Source: APXvYqxKTVo0gNkcafsJPzYUnp7dMEHUOHzkaXiXS7chO1ZrcborvqZ8eiKYPfEaKln4zBhENH/72w==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr16225544wmg.109.1572266245547;
        Mon, 28 Oct 2019 05:37:25 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id b1sm11557745wru.83.2019.10.28.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 02/12] drm/tegra: Simplify IOMMU group selection
Date:   Mon, 28 Oct 2019 13:37:08 +0100
Message-Id: <20191028123718.3890217-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All the devices that make up the DRM device are now part of the same
IOMMU group. This simplifies the handling of the IOMMU attachment and
also avoids exhausting the number of IOMMUs available on early Tegra
SoC generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c   |  2 +-
 drivers/gpu/drm/tegra/drm.c  | 34 ++++++++++++++++++++--------------
 drivers/gpu/drm/tegra/drm.h  |  3 +--
 drivers/gpu/drm/tegra/gr2d.c |  2 +-
 drivers/gpu/drm/tegra/gr3d.c |  2 +-
 drivers/gpu/drm/tegra/vic.c  |  2 +-
 6 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 54966f538141..36c36b295ab1 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2014,7 +2014,7 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (!dc->syncpt)
 		dev_warn(dc->dev, "failed to allocate syncpoint\n");
 
-	err = host1x_client_iommu_attach(client, true);
+	err = host1x_client_iommu_attach(client);
 	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7480f575188d..9a1c1694604a 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -904,7 +904,7 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	return 0;
 }
 
-int host1x_client_iommu_attach(struct host1x_client *client, bool shared)
+int host1x_client_iommu_attach(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
@@ -912,29 +912,30 @@ int host1x_client_iommu_attach(struct host1x_client *client, bool shared)
 	int err;
 
 	if (tegra->domain) {
+		struct iommu_domain *domain;
+
 		group = iommu_group_get(client->dev);
 		if (!group) {
 			dev_err(client->dev, "failed to get IOMMU group\n");
 			return -ENODEV;
 		}
 
-		if (!shared || (shared && (group != tegra->group))) {
 #if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-			if (client->dev->archdata.mapping) {
-				struct dma_iommu_mapping *mapping =
-					to_dma_iommu_mapping(client->dev);
-				arm_iommu_detach_device(client->dev);
-				arm_iommu_release_mapping(mapping);
-			}
+		if (client->dev->archdata.mapping) {
+			struct dma_iommu_mapping *mapping =
+				to_dma_iommu_mapping(client->dev);
+			arm_iommu_detach_device(client->dev);
+			arm_iommu_release_mapping(mapping);
+		}
 #endif
+
+		domain = iommu_get_domain_for_dev(client->dev);
+		if (domain != tegra->domain) {
 			err = iommu_attach_group(tegra->domain, group);
 			if (err < 0) {
 				iommu_group_put(group);
 				return err;
 			}
-
-			if (shared && !tegra->group)
-				tegra->group = group;
 		}
 	}
 
@@ -947,12 +948,17 @@ void host1x_client_iommu_detach(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
+	struct iommu_domain *domain;
 
 	if (client->group) {
-		if (client->group == tegra->group) {
+		/*
+		 * Devices that are part of the same group may no longer be
+		 * attached to a domain at this point because their group may
+		 * have been detached by an earlier client.
+		 */
+		domain = iommu_get_domain_for_dev(client->dev);
+		if (domain)
 			iommu_detach_group(tegra->domain, client->group);
-			tegra->group = NULL;
-		}
 
 		iommu_group_put(client->group);
 	}
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 8b812bb52e5b..28f2820a7371 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -36,7 +36,6 @@ struct tegra_drm {
 	struct drm_device *drm;
 
 	struct iommu_domain *domain;
-	struct iommu_group *group;
 	struct mutex mm_lock;
 	struct drm_mm mm;
 
@@ -100,7 +99,7 @@ int tegra_drm_register_client(struct tegra_drm *tegra,
 			      struct tegra_drm_client *client);
 int tegra_drm_unregister_client(struct tegra_drm *tegra,
 				struct tegra_drm_client *client);
-int host1x_client_iommu_attach(struct host1x_client *client, bool shared);
+int host1x_client_iommu_attach(struct host1x_client *client);
 void host1x_client_iommu_detach(struct host1x_client *client);
 
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 5d5af9a05c18..1fc4e56c7cc5 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -50,7 +50,7 @@ static int gr2d_init(struct host1x_client *client)
 		goto put;
 	}
 
-	err = host1x_client_iommu_attach(client, false);
+	err = host1x_client_iommu_attach(client);
 	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		goto free;
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c249a6bd8d51..24fae0f64032 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -59,7 +59,7 @@ static int gr3d_init(struct host1x_client *client)
 		goto put;
 	}
 
-	err = host1x_client_iommu_attach(client, false);
+	err = host1x_client_iommu_attach(client);
 	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		goto free;
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index d34b1ada422c..603f41ed4b81 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -187,7 +187,7 @@ static int vic_init(struct host1x_client *client)
 	struct vic *vic = to_vic(drm);
 	int err;
 
-	err = host1x_client_iommu_attach(client, false);
+	err = host1x_client_iommu_attach(client);
 	if (err < 0) {
 		dev_err(vic->dev, "failed to attach to domain: %d\n", err);
 		return err;
-- 
2.23.0

