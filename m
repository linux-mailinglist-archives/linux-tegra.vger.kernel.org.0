Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E9C110201
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfLCQTd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:33 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:40817 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:32 -0500
Received: by mail-wm1-f54.google.com with SMTP id t14so4155546wmi.5
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyzOe2qMdvVwhl1mEyFjGx3TYlIMn6F7cP5QiE14+H4=;
        b=qValVkF8/qyIg3bVfigaMdP6d1f9SDnhBW4ha4pbI66ZuSwMV0obJpRDLk2/GxQEyY
         2DduUn4hNVmBCC7I/hq1TRg/7u7mZFbldSHl68BQYaqgzYpTsCDwFiHOKjs+qytDW5P0
         SpwSOQJ3ejVxwVlzENpY3it2ox6AC4z+HhThEO5mSMlXNLD/hCwhPcolWmkOohQpLWJW
         BTZpMKbfTz8HxSEPNuqalfNVU0ppveFHwVcX4LvxFBu7OCIFsZyVprYJAv1gE/S75urs
         kxc1+uLaOk5ifq8HqdnzVuZkstGUVPGGZ0p9EdeXJFdS7SCUXmvRqUFiKSOqHO62Gfu2
         /4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyzOe2qMdvVwhl1mEyFjGx3TYlIMn6F7cP5QiE14+H4=;
        b=HHCsG2SklypLlAlKZQqTWW1wYUrlNHS6/S4hQm2T2o4zQsIQ5QzV4wgP09wQc8BkpE
         ZWa+UsorIiSBc7Lxe4HLbeGOEiGocPSYY2oRJ2FV88wYs8hECjhPByr+onMpYvGoWtiM
         Hi9d0FAzU8Re3t+TK28bvQVsYp0vrS+Vz9i1CqA7UsQYv07EMfjzHK1KldujjlG6AMrV
         PTv7TObOF/pY0Ducy0W05Jbc8rLQ/IQqDFmN2w+LqOEeYXxMmqZ1u7vaVw8E2y2/ukcQ
         fageQjiU+JOLtgLZpoYzV9EmcQUmG9igLhpQYxsvJkQf0GvI5s545Jt90q9M7EY//5JU
         lbNQ==
X-Gm-Message-State: APjAAAX+pQfG8TzAhi0n2tvxe5RGn/xKhReDPN1/MO5nmUublIPgYyY7
        SXDcMGSOajzTDupd94NqjiTPWP+LmRo=
X-Google-Smtp-Source: APXvYqwT/wJuzWWV2RPfPnQ7sxDm7cPpS+KNP3aqUMF36DKBCbFhDzv97wNKTeSIru/mQVG2PMmFrw==
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr25491563wmu.151.1575389970584;
        Tue, 03 Dec 2019 08:19:30 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id x18sm4081958wrr.75.2019.12.03.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 7/9] drm/tegra: Silence expected errors on IOMMU attach
Date:   Tue,  3 Dec 2019 17:19:12 +0100
Message-Id: <20191203161914.1312555-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Subdevices may not be hooked up to an IOMMU via device tree. Detect such
situations and avoid confusing users by not emitting an error message.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 2 +-
 drivers/gpu/drm/tegra/drm.c | 4 +---
 drivers/gpu/drm/tegra/vic.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0a5f86b61fda..2b9a25c977c0 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2027,7 +2027,7 @@ static int tegra_dc_init(struct host1x_client *client)
 		dev_warn(dc->dev, "failed to allocate syncpoint\n");
 
 	err = host1x_client_iommu_attach(client);
-	if (err < 0) {
+	if (err < 0 && err != -ENODEV) {
 		dev_err(client->dev, "failed to attach to domain: %d\n", err);
 		return err;
 	}
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 56e5e7a5c108..7a16b51eaa2d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -920,10 +920,8 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 
 	if (tegra->domain) {
 		group = iommu_group_get(client->dev);
-		if (!group) {
-			dev_err(client->dev, "failed to get IOMMU group\n");
+		if (!group)
 			return -ENODEV;
-		}
 
 		if (domain != tegra->domain) {
 			err = iommu_attach_group(tegra->domain, group);
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c4d82b8b3065..3526c2892ddb 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -167,7 +167,7 @@ static int vic_init(struct host1x_client *client)
 	int err;
 
 	err = host1x_client_iommu_attach(client);
-	if (err < 0) {
+	if (err < 0 && err != -ENODEV) {
 		dev_err(vic->dev, "failed to attach to domain: %d\n", err);
 		return err;
 	}
-- 
2.23.0

