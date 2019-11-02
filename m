Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A29ED013
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKBR4v (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41983 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR4v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id p4so12717798wrm.8
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nFY1vqzSONgdwE5+azceCzycYUt1l/wUOCKvdJLbIwE=;
        b=tw+Jpba8055Bl8J2Hlie89ay0WxADSFMhaavglIxVwMeYCKa98EiG+IJGKD99CGMf8
         MmdBt7wzXf7CCufbUnVkS7Cbp0BDpGuyca+to8s4g0lEZtpDUlOlYdKCC7JbKIB5KE1X
         LS7xWBahzkzEeP9ofB1SwNH0vI0e6trPz2AVeq/1zDoJZF1goHsbSdVjW1XS8f2sxLev
         zEE5jpuvrMBgqmoEBQC/y1HpGo4hlV1njKU6fNkTgH+K7MceB8WxjyzYHRCsP1QMRtdN
         tGhQ+oZciB0MKcL/zYQMsgn0xwUKwpZr5V2A4lcthRicFvIKR+wOTsixgsiq5F4lIt9r
         Z85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nFY1vqzSONgdwE5+azceCzycYUt1l/wUOCKvdJLbIwE=;
        b=oCUkiQc7Wu9UrJqpCfUyAO9hRcJChz6arhhSD6zZWk7cK2S6YoQd56hrqyk9YVfENj
         b8ZxqnxPq6Y1I4TFx8LMIWCkXqM1/MRasFL+M2NLwS7CklusQbOApKhT4+djbgk6MxYW
         VvQnm2LmoSb5hJeOYWYfubA5EyT38Sg2lbrIWKkWfnx7x76PFE8MDu1ps2h3FPowGzHQ
         SOmFNQSX+Ybh9ZtZixRpFsP0uYmIa6129/pWxnAMJp6udBB1sj/Z6kCqK7KijlvBSTEi
         /iz1MkBw2BHml/c1cIBThuNKMeLXWsckcoUozsEtXJyfdRlkDCt4Jcp1C5v7cu836yvT
         P9zw==
X-Gm-Message-State: APjAAAVU7msP7k9dro1UhVeovoQq8/AqWtXJgpJ5CdnZujuwbSHQJG6z
        b+3KuzKv0kHbu4OEEceoDxHMbfd8
X-Google-Smtp-Source: APXvYqyTBiZYvfTa39s9N+6sTjLpKVJXitd6D44ddHfUz9PxVTxgBDpCrbr5sez8rkJvcruoMq3iww==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr8258412wrw.238.1572717409261;
        Sat, 02 Nov 2019 10:56:49 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t29sm23428383wrb.53.2019.11.02.10.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/9] drm/nouveau: tegra: Do not try to disable PCI device
Date:   Sat,  2 Nov 2019 18:56:32 +0100
Message-Id: <20191102175637.3065-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

