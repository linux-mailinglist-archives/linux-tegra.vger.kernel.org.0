Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F9A116CAE
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfLIMAS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56027 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfLIMAR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so15180139wmj.5
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
        b=YQ4tBVvZm7q1NFbRpNhvsjkaHYJErSU7MKuJbBquAJbCD7/ye0m706FMsJ3DPetesS
         TMJcsNW8KXAtebsAXU8nBeuTOpGKEDDw5XxlFF9WSpkwntHbkDpcwzLKl11n+kXmslvG
         qL0kmFAPqo4itQJBEt+7Elt0zDKiZzT61XVMkW5kTaZwXxhculSaBr/O29cn7Yq3TNM8
         bv2yD3oFJy8Mv3QnYc6FSbGHQC61b20oW2OHoHpzQ47kqushGoSb0EWhuR2U4YLyiQ/2
         OhAm5KFpHPduHDXKwh6a/pGmEiy1JRofZmccSfzJjpTbS7olaQ+Y3R6XIA26WLGTS/De
         kOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
        b=ib12V9l3oL5BqPEctbYx+Kui1rtE2jyvGZ6+uFYjk1q0+Hcz2gRammUMHmRx/3GhJ1
         8Xtpxx/3baY+0zcugXwN4IGV7zvL5VGEXZVRmnA6L+Tkm2F3cCp4zZePbF7V9+m3e1Yf
         fGmSwycOAkgm5HqwOHNXXGqQc49M7gpaoaCpzgfRXPJoDKU1y8zwDRdnLQVZTdDlRKwY
         /+Z0qRIhP0+Myq7U72jbaog4o0sQgZ7M6foQcSqCxiFCc9TVbmXSFjt67JmOif1mvhRJ
         /bj2jB0ZAJD2X3XQgc9kBHSMVMcoB0SlFuOxmr8/oOzcEHyUweM/PS2/ctSY1y74kqzu
         8LYQ==
X-Gm-Message-State: APjAAAVBh0oGs+gJLcP7DRO/fWdw2WkkRoqO6oZY8KtxnRFsKz+w8BD/
        nEtxgi0RsgifA0YyNZtIzys/Zwj0
X-Google-Smtp-Source: APXvYqwKIXZ/lXiOYFdsUXHqh0kNtYZfFbMT/CChCt4KHa9eSuuvZ5vhaaf3RW3PIdOimww2wv4/zw==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr24015907wmj.105.1575892815703;
        Mon, 09 Dec 2019 04:00:15 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id a78sm12038740wme.9.2019.12.09.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/9] drm/nouveau: tegra: Do not try to disable PCI device
Date:   Mon,  9 Dec 2019 13:00:00 +0100
Message-Id: <20191209120005.2254786-5-thierry.reding@gmail.com>
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

When Nouveau is instantiated on top of a platform device, the dev->pdev
field will be NULL and calling pci_disable_device() will crash. Move the
PCI disabling code to the PCI specific driver removal code.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2cd83849600f..b65ae817eabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -715,7 +715,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 void
 nouveau_drm_device_remove(struct drm_device *dev)
 {
-	struct pci_dev *pdev = dev->pdev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_client *client;
 	struct nvkm_device *device;
@@ -727,7 +726,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	device = nvkm_device_find(client->device);
 
 	nouveau_drm_device_fini(dev);
-	pci_disable_device(pdev);
 	drm_dev_put(dev);
 	nvkm_device_del(&device);
 }
@@ -738,6 +736,7 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	nouveau_drm_device_remove(dev);
+	pci_disable_device(pdev);
 }
 
 static int
-- 
2.23.0

