Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E17358EC
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfFEIrU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:47:20 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54210 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEIrU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:47:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id d17so1367085wmb.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rot6iK92B6TEwBliOivir2gNRQvaPz5fEeAyYY+Fv5U=;
        b=H6lYu/gqA4bVS+BSuV3Ewu/CQgV1E1fOiZZ7ZNviFIWlHbtG9Z/e11mAFVxaxB8hqv
         5OMPyTex2Tk4QqMJpnNf4NO5rykhHCDgVLBG5SpYrOI98R29Gmer3I0oCu0qBxB/XI1f
         nCFXwCD8FnAvWy3BeJkBWpWg4Cziw2Rn5UBMfP6+dn8tulS8Vw5nXBBIVivimHumqRBG
         wdLYtmzPvQQQCRX+pr1bF7VZmlGomMypPzQ9WxgJZMCN00z+ls2WX6PR1YJ2dHIuhLNo
         CWMwVNflughjadeT8FA5ZfG3eqUUFESzCGZf97Tu25z9aU3MBtdEEwEYi5qnLTOq+Y4s
         hQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rot6iK92B6TEwBliOivir2gNRQvaPz5fEeAyYY+Fv5U=;
        b=Arjm+E1581nGk1h+UChZwGrGVM6FZDWcQ6QssXrnLEsh/ZIk/Blp9p+6i8zrm6QVch
         RP0jd+mxcbmO+0FCTCVRXizQ/CzKEKp9vQ25BI+fNv7cGx6/m9QsYQe+LDEGPF+FJo02
         aYF2MtYVIgUS9ER0mJxLjIZQBXNSBQVjuQUPgl107kle0x4mhC8riIVT18i4F9XhT6k0
         QlxuVILck+AcKWpLQikzRrDrjV/ByEbhs3omPj7RCZ9Bmq4tCR4KvaG3W2MONCTu5GS7
         ZO1naLJwPfrz6kMaw9KRX7Yx/89xD9BSggG4ySAYQMvFqZM7VzogmRQ5s0dmpuELCvF1
         uOAQ==
X-Gm-Message-State: APjAAAUpx9NL4RzwRBI6YnwJ/MaZS91mIlxma5SRPq8y13zxkNj9QPbM
        M5Mpd9LOJv+8HB07lm0dDmI=
X-Google-Smtp-Source: APXvYqxHuBz8WlxFDs/6ggHdHm3eReJjTdN+uN/413q5Rx2HKmix6KmFDMnx6dSgorOpRMKI2dMouQ==
X-Received: by 2002:a1c:c74a:: with SMTP id x71mr21458623wmf.121.1559724438307;
        Wed, 05 Jun 2019 01:47:18 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id u13sm5569575wrq.62.2019.06.05.01.47.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:47:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Do not link logical devices to DT nodes
Date:   Wed,  5 Jun 2019 10:47:16 +0200
Message-Id: <20190605084716.12461-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Logical devices created by the host1x bus infrastructure don't need to
be associated with a device tree node. Doing so will cause the driver
core to attempt to hook up IOMMU operations and fail because it is not
a real device.

However, for backwards-compatibility, we need to provide various OF_*
uevent variables that were previously provided by of_device_uevent() and
which are parsed by libdrm in userspace when querying the available
devices. Do this by implementing a uevent callback for the host1x bus.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 6387302c1245..742aa9ff21b8 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -305,6 +305,36 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
 
+static int host1x_device_uevent(struct device *dev,
+				struct kobj_uevent_env *env)
+{
+	struct device_node *np = dev->parent->of_node;
+	unsigned int count = 0;
+	struct property *p;
+	const char *compat;
+
+	/*
+	 * This duplicates most of of_device_uevent(), but the latter cannot
+	 * be called from modules and operates on dev->of_node, which is not
+	 * available in this case.
+	 *
+	 * Note that this is really only needed for backwards compatibility
+	 * with libdrm, which parses this information from sysfs and will
+	 * fail if it can't find the OF_FULLNAME, specifically.
+	 */
+	add_uevent_var(env, "OF_NAME=%pOFn", np);
+	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
+
+	of_property_for_each_string(np, "compatible", p, compat) {
+		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
+		count++;
+	}
+
+	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
+
+	return 0;
+}
+
 static int host1x_dma_configure(struct device *dev)
 {
 	return of_dma_configure(dev, dev->of_node, true);
@@ -322,6 +352,7 @@ static const struct dev_pm_ops host1x_device_pm_ops = {
 struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
+	.uevent = host1x_device_uevent,
 	.dma_configure = host1x_dma_configure,
 	.pm = &host1x_device_pm_ops,
 };
@@ -408,7 +439,6 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.dma_mask = &device->dev.coherent_dma_mask;
 	dev_set_name(&device->dev, "%s", driver->driver.name);
 	device->dev.release = host1x_device_release;
-	device->dev.of_node = host1x->dev->of_node;
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-- 
2.21.0

