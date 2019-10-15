Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8047BD7B7A
	for <lists+linux-tegra@lfdr.de>; Tue, 15 Oct 2019 18:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfJOQ3y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Oct 2019 12:29:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41232 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388049AbfJOQ3y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Oct 2019 12:29:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id p4so8775043wrm.8
        for <linux-tegra@vger.kernel.org>; Tue, 15 Oct 2019 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpzOutponfPCE66kYKUzbnWZf9wUFokgB1aEqqzJRN4=;
        b=TR4JS+xJjiL5PpcHHo1bHsLqgAf+I5G1almKK9qnnQzdIlAxJQSuZ/rWVUob/0MFkq
         SV/xJ5oLSpNwuKp5jHNjYJ7YhQc2GuhMxpZT8MMiCiTTy+LJmhTKm/L5wjxRPTyDTp6k
         zHTFBSzk35o0PbIRGO1Wz6W6eP5IYIoOiwEX/BIZQmaAFfiGMRPff1rsbx9NfXLGOFoz
         je2ycnzqgxzx7DjSkM4YUeO64k44Tybyx6Tyz8XaRCS1Bq2H5ekyXM85v7Z7wQZVm7ad
         pMyH23XPihr4kOjhbL7Y5z11Q3FBYxp4SPlpjBwDwsozBheOOq8ppytZclKbuRRVyQxj
         yCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpzOutponfPCE66kYKUzbnWZf9wUFokgB1aEqqzJRN4=;
        b=DWabPHa3t0DpL0mY+yAXGcvnuJkpBcGbESAV8C5/MgeOzERTDFH//nbC4Xb0oRP4Du
         j4dzDpZjS+oLrcQ/S0ZxwTF5FYzG+vKh04DYyQa+ks+cOJP05CNVmcDHVkIppxazUg5I
         WtEMirtNq3/qAK0K+bAEnfq/zBME13r4U34AuQC+WxrfNZzF+KDTpL+sfX9TbSWeBzrM
         TDJfTAvVO3mMC2y7Qqx760fqVBLFd7jresWbYHf7SMr0f3Sti6+lWtayM0y6ENlg7E5i
         o5gftsdKo5eJttH38HU54yg+sAnaX4b6XF8g31pd0OTdLC/ZR5R1yqbpfae0uGEZK5vG
         teIw==
X-Gm-Message-State: APjAAAWtkM1jTyjj1nBG2rq3+m/1b9giN5NSPiDqCiYFL/we5BDYFLyg
        eHlPXtJL/5lzQ/qdn8QxH2Y=
X-Google-Smtp-Source: APXvYqxWF5drIRUxDhcv3ypIwvXmMeeoDfbseM/6FwwVczfTNOW4OPmxA+jqeGDYOiXzFwUS8zQ88Q==
X-Received: by 2002:adf:ebd1:: with SMTP id v17mr23996540wrn.204.1571156990937;
        Tue, 15 Oct 2019 09:29:50 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z13sm16541534wrm.64.2019.10.15.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:29:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [RFC 1/3] memory: Introduce memory controller mini-framework
Date:   Tue, 15 Oct 2019 18:29:43 +0200
Message-Id: <20191015162945.1203736-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162945.1203736-1-thierry.reding@gmail.com>
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This new framework is currently nothing more than a registry of memory
controllers, with the goal being to order device probing. One use-case
where this is useful, for example, is a memory controller device which
needs to program some registers before the system MMU can be enabled.
Associating the memory controller with the SMMU allows the SMMU driver
to defer the probe until the memory controller has been registered.

One such example is Tegra186 where the memory controller contains some
registers that are used to program stream IDs for the various memory
clients (display, USB, PCI, ...) in the system. Programming these SIDs
is required for the memory clients to emit the proper SIDs as part of
their memory requests. The memory controller driver therefore needs to
be programmed prior to the SMMU driver. To achieve that, the memory
controller will be referenced via phandle from the SMMU device tree
node, the SMMU driver can then use the memory controller framework to
find it and defer probe until it has been registered.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/Makefile           |  1 +
 drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
 include/linux/memory-controller.h | 25 ++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/memory/core.c
 create mode 100644 include/linux/memory-controller.h

diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 27b493435e61..d16e7dca8ef9 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -3,6 +3,7 @@
 # Makefile for memory devices
 #
 
+obj-y				+= core.o
 obj-$(CONFIG_DDR)		+= jedec_ddr_data.o
 ifeq ($(CONFIG_DDR),y)
 obj-$(CONFIG_OF)		+= of_memory.o
diff --git a/drivers/memory/core.c b/drivers/memory/core.c
new file mode 100644
index 000000000000..1772e839305a
--- /dev/null
+++ b/drivers/memory/core.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 NVIDIA Corporation.
+ */
+
+#include <linux/memory-controller.h>
+#include <linux/of.h>
+
+static DEFINE_MUTEX(controllers_lock);
+static LIST_HEAD(controllers);
+
+static void memory_controller_release(struct kref *ref)
+{
+	struct memory_controller *mc = container_of(ref, struct memory_controller, ref);
+
+	WARN_ON(!list_empty(&mc->list));
+}
+
+int memory_controller_register(struct memory_controller *mc)
+{
+	kref_init(&mc->ref);
+
+	mutex_lock(&controllers_lock);
+	list_add_tail(&mc->list, &controllers);
+	mutex_unlock(&controllers_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(memory_controller_register);
+
+void memory_controller_unregister(struct memory_controller *mc)
+{
+	mutex_lock(&controllers_lock);
+	list_del_init(&mc->list);
+	mutex_unlock(&controllers_lock);
+
+	kref_put(&mc->ref, memory_controller_release);
+}
+EXPORT_SYMBOL_GPL(memory_controller_unregister);
+
+static struct memory_controller *
+of_memory_controller_get(struct device *dev, struct device_node *np,
+			 const char *con_id)
+{
+	const char *cells = "#memory-controller-cells";
+	const char *names = "memory-controller-names";
+	const char *prop = "memory-controllers";
+	struct memory_controller *mc;
+	struct of_phandle_args args;
+	int index = 0, err;
+
+	if (con_id) {
+		index = of_property_match_string(np, names, con_id);
+		if (index < 0)
+			return ERR_PTR(index);
+	}
+
+	err = of_parse_phandle_with_args(np, prop, cells, index, &args);
+	if (err) {
+		if (err == -ENOENT)
+			err = -ENODEV;
+
+		return ERR_PTR(err);
+	}
+
+	mutex_lock(&controllers_lock);
+
+	list_for_each_entry(mc, &controllers, list) {
+		if (mc->dev && mc->dev->of_node == args.np) {
+			kref_get(&mc->ref);
+			mutex_unlock(&controllers_lock);
+			goto unlock;
+		}
+	}
+
+	mc = ERR_PTR(-EPROBE_DEFER);
+
+unlock:
+	mutex_unlock(&controllers_lock);
+	of_node_put(args.np);
+	return mc;
+}
+
+struct memory_controller *
+memory_controller_get(struct device *dev, const char *con_id)
+{
+	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
+		return of_memory_controller_get(dev, dev->of_node, con_id);
+
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(memory_controller_get);
+
+void memory_controller_put(struct memory_controller *mc)
+{
+	if (mc)
+		kref_put(&mc->ref, memory_controller_release);
+}
+EXPORT_SYMBOL_GPL(memory_controller_put);
diff --git a/include/linux/memory-controller.h b/include/linux/memory-controller.h
new file mode 100644
index 000000000000..4b06b2ea1d14
--- /dev/null
+++ b/include/linux/memory-controller.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 NVIDIA Corporation.
+ */
+
+#ifndef _LINUX_MEMORY_CONTROLLER_H
+#define _LINUX_MEMORY_CONTROLLER_H
+
+#include <linux/device.h>
+#include <linux/list.h>
+
+struct memory_controller {
+	struct device *dev;
+	struct kref ref;
+	struct list_head list;
+};
+
+int memory_controller_register(struct memory_controller *mc);
+void memory_controller_unregister(struct memory_controller *mc);
+
+struct memory_controller *memory_controller_get(struct device *dev,
+						const char *con_id);
+void memory_controller_put(struct memory_controller *mc);
+
+#endif
-- 
2.23.0

