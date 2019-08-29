Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C2EA2993
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfH2WTV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46516 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfH2WTV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id z51so5697039edz.13
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x2JwQdeRTi/hgvGya3SUXcpdHr3AMqxRJmguZS0isiI=;
        b=fMa8asTWe3nSoojjF5UDYpkAusc9bGVrfnq4cudtFqiVUelRztmeD7OuWQKxzoBXwx
         31u1L7vI++hZTMQ47Cb4n3eWOWFS3yRw6it7V+ZuDsG/3w5sZNAnMmdUoF99lJ4OFWOc
         iSt1s/nEHqAt4zCXl3Jcjyc+w2uaoviZBz0wPekdN6m/NLl4W3WyaNMghBvKm3Phrrx+
         nJBEQc3dnvdDZWh8oFIUFkuEvwL+LzVHToO6mxrQjEVRnCu52xh3jUaElrgtD8yQlh7H
         2fhzzSaZIsDhIKiaax8xCXs3RA33p7wIVm5REaWKX5Tqm9fTRLhr2EMUFjw5OHnHGi+P
         Z7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2JwQdeRTi/hgvGya3SUXcpdHr3AMqxRJmguZS0isiI=;
        b=Wmr/BXk05vpCWMGsDF4pjef2htngETdJNZdPW0WZ7g1I1uQeuPKOaplErv32of0ehe
         PqE3XJ7V+rQx2iB7BgLkkEQfNI4OsnM0kJLkvR47gZdqvJmI+OAdAFCLSWMtF4P/itSn
         I20QIdIxuTq/G+wW+W4/NW50lV+EPAjwfz2dRAGVLShVEV5QT/9QMFcA/Oi/ikh8MLAo
         5N3Z/rwxfSNvsOopisa98+p+HZCXHGCzhayz8mcochMhCURcEfK4dUVIgdbCKTkWpEwr
         xu4FgAA4T1ANxvlxMb2P+GQ8O2/Z3N5GLL9kpgEkhslyQtt9uPAp0Zf8kfH0Bf+7el++
         oPfA==
X-Gm-Message-State: APjAAAW0lBrErDTp+y9C9NW/lgTdxCx5wwvwqZTe7F0WdQzE150vp4m/
        aReBYN+wu4H47FrqIrt6k8ddlKLn
X-Google-Smtp-Source: APXvYqwik/R8aKuqwauXQpDwXaxK1s18HWAuCScBbXbtHsQGzOZ3r99hcz+f+N0tH0yqRkCq7bWnhQ==
X-Received: by 2002:a50:b62b:: with SMTP id b40mr12750324ede.56.1567117159053;
        Thu, 29 Aug 2019 15:19:19 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id f24sm662138edt.82.2019.08.29.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/7] soc/tegra: fuse: Implement nvmem device
Date:   Fri, 30 Aug 2019 00:19:06 +0200
Message-Id: <20190829221911.24876-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The nvmem framework provides a generic infrastructure and API to access
the type of information stored in fuses such as the Tegra FUSE block.

Implement an nvmem device that can be used to access the information in
a more generic way to decouple consumers from the custom Tegra API and
to add a more formal way of creating the dependency between the FUSE
device and the consumers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 82 ++++++++++++-----------------
 drivers/soc/tegra/fuse/fuse.h       |  3 ++
 2 files changed, 38 insertions(+), 47 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 6617a4bd11bb..3ce2138b278b 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -8,6 +8,8 @@
 #include <linux/kobject.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/nvmem-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -31,50 +33,6 @@ static const char *tegra_revision_name[TEGRA_REVISION_MAX] = {
 	[TEGRA_REVISION_A04]     = "A04",
 };
 
-static u8 fuse_readb(struct tegra_fuse *fuse, unsigned int offset)
-{
-	u32 val;
-
-	val = fuse->read(fuse, round_down(offset, 4));
-	val >>= (offset % 4) * 8;
-	val &= 0xff;
-
-	return val;
-}
-
-static ssize_t fuse_read(struct file *fd, struct kobject *kobj,
-			 struct bin_attribute *attr, char *buf,
-			 loff_t pos, size_t size)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct tegra_fuse *fuse = dev_get_drvdata(dev);
-	int i;
-
-	if (pos < 0 || pos >= attr->size)
-		return 0;
-
-	if (size > attr->size - pos)
-		size = attr->size - pos;
-
-	for (i = 0; i < size; i++)
-		buf[i] = fuse_readb(fuse, pos + i);
-
-	return i;
-}
-
-static struct bin_attribute fuse_bin_attr = {
-	.attr = { .name = "fuse", .mode = S_IRUGO, },
-	.read = fuse_read,
-};
-
-static int tegra_fuse_create_sysfs(struct device *dev, unsigned int size,
-				   const struct tegra_fuse_info *info)
-{
-	fuse_bin_attr.size = size;
-
-	return device_create_bin_file(dev, &fuse_bin_attr);
-}
-
 static const struct of_device_id car_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-car", },
 	{ .compatible = "nvidia,tegra30-car", },
@@ -115,9 +73,23 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
+static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			   size_t bytes)
+{
+	unsigned int count = bytes / 4, i;
+	struct tegra_fuse *fuse = priv;
+	u32 *buffer = value;
+
+	for (i = 0; i < count; i++)
+		buffer[i] = fuse->read(fuse, offset + i * 4);
+
+	return 0;
+}
+
 static int tegra_fuse_probe(struct platform_device *pdev)
 {
 	void __iomem *base = fuse->base;
+	struct nvmem_config nvmem;
 	struct resource *res;
 	int err;
 
@@ -150,9 +122,25 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 			goto restore;
 	}
 
-	if (tegra_fuse_create_sysfs(&pdev->dev, fuse->soc->info->size,
-				    fuse->soc->info)) {
-		err = -ENODEV;
+	memset(&nvmem, 0, sizeof(nvmem));
+	nvmem.dev = &pdev->dev;
+	nvmem.name = "fuse";
+	nvmem.id = -1;
+	nvmem.owner = THIS_MODULE;
+	nvmem.type = NVMEM_TYPE_OTP;
+	nvmem.read_only = true;
+	nvmem.root_only = true;
+	nvmem.reg_read = tegra_fuse_read;
+	nvmem.size = fuse->soc->info->size;
+	nvmem.word_size = 4;
+	nvmem.stride = 4;
+	nvmem.priv = fuse;
+
+	fuse->nvmem = devm_nvmem_register(&pdev->dev, &nvmem);
+	if (IS_ERR(fuse->nvmem)) {
+		err = PTR_ERR(fuse->nvmem);
+		dev_err(&pdev->dev, "failed to register NVMEM device: %d\n",
+			err);
 		goto restore;
 	}
 
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 7230cb330503..32bf6c070ae7 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/types.h>
 
+struct nvmem_device;
 struct tegra_fuse;
 
 struct tegra_fuse_info {
@@ -48,6 +49,8 @@ struct tegra_fuse {
 		dma_addr_t phys;
 		u32 *virt;
 	} apbdma;
+
+	struct nvmem_device *nvmem;
 };
 
 void tegra_init_revision(void);
-- 
2.22.0

