Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E520D6308
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731451AbfJNMvQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:16 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53446 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so17147103wmd.3
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByOD/URUTplb+5mvC2oecBpFoqh1Lrogh0FPvicFxx4=;
        b=BfXUzm2VewPyYkUCGJVNqEQaPRyntweb24BGSGEiaGKmWqLNb5E3CKsBtzyRHit1LF
         RH+rOqQtsJdAMqc/jwYwepBvBV70dlqA7O9VJVOPGNELd5sW/U3QINoZjawTzoxiX/iC
         oJVImuzxBq8VuGsrh0ilh8WUK/IFa8mmsgSdOLAbvsxiWTdKqs5bja6jYOVZ9AwACB6j
         jREavpuXhz0wORWSij+Y4/TSxLLfNmEZJEzjxXPxnyYnNyouaiaVFxz5lFFdppjm7Oo3
         rl/RuXhI4jeTY9JLPkzJBYslXaQRiIMVynoIOzO+GQQkg2z/OEqwceqXxAMzsfOxylto
         hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByOD/URUTplb+5mvC2oecBpFoqh1Lrogh0FPvicFxx4=;
        b=C/i1hp5o0eKBnsD7SnWz0jXOmlcY/e77QZ6sSYw+uhW4XZ67E8PjrqT8U/kuvemUXG
         8C8yIZoyh6I/ubwWIE4VoIfiL+DkoHWeillV+kFOin4Q2OYO0aoOq65ooMk9uuV0GrEB
         4v9tP2YTB+7T4/IHyXygaguQe6MCVQU8ftUDDn4ItNght7INbIzIRSkoAwQU8FpiJwqI
         yHrFvpMLvhk76idO/RhKDeowid1rislfilHqhAExIme+ObdkUYOsFnJpcPrxsDGYue7b
         vV1tQQUCgRKqzrnDsl03m8C5+Oaef5DoPgU7ZaWiYjJ0xnRWq+SX19TCgRBUV4MPSJf1
         zWlQ==
X-Gm-Message-State: APjAAAW0SVdssAeIDEgwFNMe5Vr79doCkPp2WTpSZKobjJyu2rI/sFKZ
        BXn2FNGVGrh6W922/mUCtVA=
X-Google-Smtp-Source: APXvYqwzHVU93ie1bseLLY/s+4NFR5ZzARfzHrP6+sB19QpVkZf9w0io00VLw9eswka+jOaiddjjTw==
X-Received: by 2002:a05:600c:2107:: with SMTP id u7mr14817594wml.13.1571057472712;
        Mon, 14 Oct 2019 05:51:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c132sm27253057wme.27.2019.10.14.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
Date:   Mon, 14 Oct 2019 14:50:45 +0200
Message-Id: <20191014125049.425101-11-thierry.reding@gmail.com>
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

Handling of the IOMMU group attachment is common to all clients, so move
the group into the client to simplify code.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c   |  9 ++++-----
 drivers/gpu/drm/tegra/dc.h   |  2 --
 drivers/gpu/drm/tegra/drm.c  | 22 +++++++++++-----------
 drivers/gpu/drm/tegra/drm.h  |  6 ++----
 drivers/gpu/drm/tegra/gr2d.c | 10 ++++------
 drivers/gpu/drm/tegra/gr3d.c | 10 ++++------
 drivers/gpu/drm/tegra/vic.c  | 10 ++++------
 include/linux/host1x.h       |  2 ++
 8 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f7f7984bb749..3ac535bd99ca 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2014,9 +2014,8 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (!dc->syncpt)
 		dev_warn(dc->dev, "failed to allocate syncpoint\n");
 
-	dc->group = host1x_client_iommu_attach(client, true);
-	if (IS_ERR(dc->group)) {
-		err = PTR_ERR(dc->group);
+	err = host1x_client_iommu_attach(client, true);
+	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		return err;
 	}
@@ -2089,7 +2088,7 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (!IS_ERR(primary))
 		drm_plane_cleanup(primary);
 
-	host1x_client_iommu_detach(client, dc->group);
+	host1x_client_iommu_detach(client);
 	host1x_syncpt_free(dc->syncpt);
 
 	return err;
@@ -2114,7 +2113,7 @@ static int tegra_dc_exit(struct host1x_client *client)
 		return err;
 	}
 
-	host1x_client_iommu_detach(client, dc->group);
+	host1x_client_iommu_detach(client);
 	host1x_syncpt_free(dc->syncpt);
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0c4d17851f47..3d8ddccd758f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -90,8 +90,6 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
-
-	struct iommu_group *group;
 };
 
 static inline struct tegra_dc *
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 498d22a65616..b74362cb63eb 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1068,8 +1068,7 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	return 0;
 }
 
-struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
-					       bool shared)
+int host1x_client_iommu_attach(struct host1x_client *client, bool shared)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
@@ -1080,7 +1079,7 @@ struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
 		group = iommu_group_get(client->dev);
 		if (!group) {
 			dev_err(client->dev, "failed to get IOMMU group\n");
-			return ERR_PTR(-ENODEV);
+			return -ENODEV;
 		}
 
 		if (!shared || (shared && (group != tegra->group))) {
@@ -1095,7 +1094,7 @@ struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
 			err = iommu_attach_group(tegra->domain, group);
 			if (err < 0) {
 				iommu_group_put(group);
-				return ERR_PTR(err);
+				return err;
 			}
 
 			if (shared && !tegra->group)
@@ -1103,22 +1102,23 @@ struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
 		}
 	}
 
-	return group;
+	client->group = group;
+
+	return 0;
 }
 
-void host1x_client_iommu_detach(struct host1x_client *client,
-				struct iommu_group *group)
+void host1x_client_iommu_detach(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
 
-	if (group) {
-		if (group == tegra->group) {
-			iommu_detach_group(tegra->domain, group);
+	if (client->group) {
+		if (client->group == tegra->group) {
+			iommu_detach_group(tegra->domain, client->group);
 			tegra->group = NULL;
 		}
 
-		iommu_group_put(group);
+		iommu_group_put(client->group);
 	}
 }
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 29911eff9ceb..6a06d636e930 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -100,10 +100,8 @@ int tegra_drm_register_client(struct tegra_drm *tegra,
 			      struct tegra_drm_client *client);
 int tegra_drm_unregister_client(struct tegra_drm *tegra,
 				struct tegra_drm_client *client);
-struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
-					       bool shared);
-void host1x_client_iommu_detach(struct host1x_client *client,
-				struct iommu_group *group);
+int host1x_client_iommu_attach(struct host1x_client *client, bool shared);
+void host1x_client_iommu_detach(struct host1x_client *client);
 
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 int tegra_drm_exit(struct tegra_drm *tegra);
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 3cbb4a029c41..5d5af9a05c18 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -17,7 +17,6 @@ struct gr2d_soc {
 };
 
 struct gr2d {
-	struct iommu_group *group;
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
 	struct clk *clk;
@@ -51,9 +50,8 @@ static int gr2d_init(struct host1x_client *client)
 		goto put;
 	}
 
-	gr2d->group = host1x_client_iommu_attach(client, false);
-	if (IS_ERR(gr2d->group)) {
-		err = PTR_ERR(gr2d->group);
+	err = host1x_client_iommu_attach(client, false);
+	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		goto free;
 	}
@@ -67,7 +65,7 @@ static int gr2d_init(struct host1x_client *client)
 	return 0;
 
 detach:
-	host1x_client_iommu_detach(client, gr2d->group);
+	host1x_client_iommu_detach(client);
 free:
 	host1x_syncpt_free(client->syncpts[0]);
 put:
@@ -87,7 +85,7 @@ static int gr2d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	host1x_client_iommu_detach(client, gr2d->group);
+	host1x_client_iommu_detach(client);
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(gr2d->channel);
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 87a386134cc4..c249a6bd8d51 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -23,7 +23,6 @@ struct gr3d_soc {
 };
 
 struct gr3d {
-	struct iommu_group *group;
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
 	struct clk *clk_secondary;
@@ -60,9 +59,8 @@ static int gr3d_init(struct host1x_client *client)
 		goto put;
 	}
 
-	gr3d->group = host1x_client_iommu_attach(client, false);
-	if (IS_ERR(gr3d->group)) {
-		err = PTR_ERR(gr3d->group);
+	err = host1x_client_iommu_attach(client, false);
+	if (err < 0) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		goto free;
 	}
@@ -76,7 +74,7 @@ static int gr3d_init(struct host1x_client *client)
 	return 0;
 
 detach:
-	host1x_client_iommu_detach(client, gr3d->group);
+	host1x_client_iommu_detach(client);
 free:
 	host1x_syncpt_free(client->syncpts[0]);
 put:
@@ -95,7 +93,7 @@ static int gr3d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	host1x_client_iommu_detach(client, gr3d->group);
+	host1x_client_iommu_detach(client);
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(gr3d->channel);
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index e4b17c7ce708..d34b1ada422c 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -34,7 +34,6 @@ struct vic {
 	void __iomem *regs;
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
-	struct iommu_group *group;
 	struct device *dev;
 	struct clk *clk;
 	struct reset_control *rst;
@@ -188,9 +187,8 @@ static int vic_init(struct host1x_client *client)
 	struct vic *vic = to_vic(drm);
 	int err;
 
-	vic->group = host1x_client_iommu_attach(client, false);
-	if (IS_ERR(vic->group)) {
-		err = PTR_ERR(vic->group);
+	err = host1x_client_iommu_attach(client, false);
+	if (err < 0) {
 		dev_err(vic->dev, "failed to attach to domain: %d\n", err);
 		return err;
 	}
@@ -224,7 +222,7 @@ static int vic_init(struct host1x_client *client)
 free_channel:
 	host1x_channel_put(vic->channel);
 detach:
-	host1x_client_iommu_detach(client, vic->group);
+	host1x_client_iommu_detach(client);
 
 	return err;
 }
@@ -246,7 +244,7 @@ static int vic_exit(struct host1x_client *client)
 
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(vic->channel);
-	host1x_client_iommu_detach(client, vic->group);
+	host1x_client_iommu_detach(client);
 
 	return 0;
 }
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 4396cd566a33..8b2d1a4bf7b1 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -18,6 +18,7 @@ enum host1x_class {
 };
 
 struct host1x_client;
+struct iommu_group;
 
 /**
  * struct host1x_client_ops - host1x client operations
@@ -44,6 +45,7 @@ struct host1x_client {
 	struct list_head list;
 	struct device *parent;
 	struct device *dev;
+	struct iommu_group *group;
 
 	const struct host1x_client_ops *ops;
 
-- 
2.23.0

