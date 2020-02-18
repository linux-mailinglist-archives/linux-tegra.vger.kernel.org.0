Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA0A1629ED
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Feb 2020 16:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBRPzn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Feb 2020 10:55:43 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54456 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgBRPzn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Feb 2020 10:55:43 -0500
Received: by mail-wm1-f68.google.com with SMTP id n3so1112268wmk.4
        for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2020 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OYFurpuhEjyPIoK1j3D/L4KM5Y+IxCt4ihYGqAzlAmg=;
        b=BHD0mkYF7bP5IjgFfcLkcgPksARxCcA1RVzvCszC31PyS1jFsyLHYHm1DpPBu+vj5T
         Gh3N5BFI/ec5ugTxNQsUX+3VK7Wqi2OaNhUxApEpaxIo6WR8PBr1ZwfFflZYeh/STZpp
         i/NutV5BLNkqJcWHiKIRfuUYh4yD2lOBU++Yl6AGEjTfBIm/Jewg8sXxFrpAoWEKr1lL
         3EySk17T6bhnYrTxk6FathdRHBReYrqR61MjKoR3ihA/3CpvclAqVmKMxdZ2ExSoN5Jh
         84kvps7VFqnpRw8Cbbfmf2cRGUtcyExZgLGpvwlXQ5XSC0xcYxBVWbdY3yALZ+Ob2lH6
         MBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OYFurpuhEjyPIoK1j3D/L4KM5Y+IxCt4ihYGqAzlAmg=;
        b=cVWdaI5fywVzTl2lAaBZkxcE1NwysDxDQEUQqiSkJXdLa7J1iU+XOrV8v6rpS7vOt2
         0ejvY7r18dKjbHJwVKPQNIyFGquI0Q3ckDEnykozr92aIndQrtZdaFyWUo/3NTdjIOUM
         DvwFvQUfMU217XeB+q9enYmm5gQeBjg3cyHVxu5wA2Sb42YprGFrgRxm7mNWGeKX02N7
         Y1tQcruCVIYjfwrjgLK7DBrpv5YrQQo521ZqdcVlQAmMjgGrWt4M7ToY79xmPZrf2bYu
         UUe4rk+RMq+9vx1YLxTRtYBwXrW19MZBQwYl43eGrrZ77G2UASNkk6Wnvr8wQSRN/owC
         ZCyA==
X-Gm-Message-State: APjAAAXYFK1SXYbinjpPRia8fdNqsHhmPB49aRJeeDShjDAztUxMK/dp
        meOa1M3F83iYzV/fH7GoZ/M=
X-Google-Smtp-Source: APXvYqz7ewWUU3zCxW3W7Raw4nbVuHA5Hv+3MKjZpDXNkwOiCL6eoa3r05aTP1JQVwhkXJOnvaiafQ==
X-Received: by 2002:a1c:7712:: with SMTP id t18mr4010374wmi.32.1582041339980;
        Tue, 18 Feb 2020 07:55:39 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
        by smtp.googlemail.com with ESMTPSA id a9sm6767758wrn.3.2020.02.18.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 07:55:39 -0800 (PST)
From:   Wambui Karuga <wambui.karugax@gmail.com>
To:     thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH] drm/tegra: remove checks for debugfs functions return value
Date:   Tue, 18 Feb 2020 18:55:33 +0300
Message-Id: <20200218155534.15504-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove the return checks and error handling of the
drm_debugfs_create_files function from various debugfs init functions in
drm/tegra and have them return 0 directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 11 +----------
 drivers/gpu/drm/tegra/drm.c  |  7 ++++---
 drivers/gpu/drm/tegra/dsi.c  | 11 +----------
 drivers/gpu/drm/tegra/hdmi.c | 11 +----------
 drivers/gpu/drm/tegra/sor.c  | 11 +----------
 5 files changed, 8 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a4c2..e70d58b21964 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1496,7 +1496,6 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	struct drm_minor *minor = crtc->dev->primary;
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	int err;
 
 #ifdef CONFIG_DEBUG_FS
 	root = crtc->debugfs_entry;
@@ -1512,17 +1511,9 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	for (i = 0; i < count; i++)
 		dc->debugfs_files[i].data = dc;
 
-	err = drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dc->debugfs_files);
-	dc->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dc_early_unregister(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..6ec224f3d824 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -841,9 +841,10 @@ static struct drm_info_list tegra_debugfs_list[] = {
 
 static int tegra_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(tegra_debugfs_list,
-					ARRAY_SIZE(tegra_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(tegra_debugfs_list,
+				 ARRAY_SIZE(tegra_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 88b9d64c77bf..30626fcf61eb 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -234,7 +234,6 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_dsi *dsi = to_dsi(output);
-	int err;
 
 	dsi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -244,17 +243,9 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		dsi->debugfs_files[i].data = dsi;
 
-	err = drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dsi->debugfs_files);
-	dsi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dsi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..d7799d13d8ad 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1064,7 +1064,6 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_hdmi *hdmi = to_hdmi(output);
-	int err;
 
 	hdmi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				      GFP_KERNEL);
@@ -1074,17 +1073,9 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		hdmi->debugfs_files[i].data = hdmi;
 
-	err = drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(hdmi->debugfs_files);
-	hdmi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_hdmi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..47c1d133069a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1687,7 +1687,6 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_sor *sor = to_sor(output);
-	int err;
 
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -1697,17 +1696,9 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		sor->debugfs_files[i].data = sor;
 
-	err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(sor->debugfs_files);
-	sor->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_sor_early_unregister(struct drm_connector *connector)
-- 
2.17.1

