Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE79610CBDF
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfK1Ph7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:59 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:39517 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK1Ph7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:59 -0500
Received: by mail-wr1-f46.google.com with SMTP id y11so28532797wrt.6
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Dj5QeGhVIw+jJO0yySFJPhYXfPiaBftwUYyrusaKzY=;
        b=cqT7e+42pcBLNUzMN1laPcYNlu1zTORQr2TV7bJdnQlTWu4bwC9aJkxcRknC91wrVQ
         VMJqdr/fksMMm/pyo2cJRP8DXDjHnQk4U0xC8eQ5Q2eB1iwzJBfU3teahBAnrj/j4duT
         koKAM9qrs4ZmhmvRz3gK+U/6YuEeR6+gc77WUyXSY+C7VuV0DVp1+b88VZ5vGJaJYAU8
         6N2HFCQ9IX+xEEfLzBBIMnFLhFRYpMCvoRZin3ZVmcQCNBtWYwBgu8aaA8w7z5j1rFHo
         JZPpQni4vP1rrwt1RzrOoJkVES4hkRIu2IJhyUTSHUT0fwSblrnzSV31BFMtBQSjcdNc
         /Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Dj5QeGhVIw+jJO0yySFJPhYXfPiaBftwUYyrusaKzY=;
        b=Uz5Ie2DMs4XZHItFIr4K+zGWmML+zXNEU6+VbkC2PRapSMd7n/KxQzxziEft8ipXTb
         p1QDEejUiPHYIeK/KE/2GSBY9CEM0S6rp+F3N5F4+Mb5oJWZLlmyVV4QmIeJp9pvvXBa
         OYx2USPKRoOk90P1Onl6sBnjBmMMA/FKMSD5LhOtf7akqh/oyhELsEA724NQxJ+dTCc8
         bA+2WdKFMn1WFCMwlvCHG5yeQQk30kPRY72Nqy/OFntZ9Jia3ks5QSrB75a3wa9uBLi9
         vAA7QTHL86P15slysF715DA2XccZsfidWpjfRlWG9btABuiZ/fekUPEtR3Qcu9WyBG9/
         +tdQ==
X-Gm-Message-State: APjAAAXVVAp6ERnakPRxIzqvwO9HkBoPoR6MMxGDMNJqaCtMOJsSudfB
        TiKMQMkVd5ZW1kNw6SYH6c4=
X-Google-Smtp-Source: APXvYqwS6ivoSIoL1JFkfrZIU83hrx3H7cggPKDcssn9xfif+3YWxM9Ll57LI06q98frR6TkygjpZw==
X-Received: by 2002:adf:9427:: with SMTP id 36mr40495496wrq.166.1574955477119;
        Thu, 28 Nov 2019 07:37:57 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 60sm23844474wrn.86.2019.11.28.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 7/9] drm/tegra: Silence expected errors on IOMMU attach
Date:   Thu, 28 Nov 2019 16:37:39 +0100
Message-Id: <20191128153741.2380419-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Subdevices may not be hooked up to an IOMMU via device tree. Detect such
situations and avoid confusing users by not emitting an error message.

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

