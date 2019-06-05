Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83F7358E6
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfFEIqK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:46:10 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42893 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfFEIqI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:46:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so519926wrl.9
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JAh0tQYxRGivtLwVSpTEFqNc9NXs0jToXbtvZ2UvbRY=;
        b=KgU2NAvYFSJydcbmDhCQIjjonGQRe2XpasElf/BJSCoRJK76zv7lDRUlG90AyFhqjp
         HMOXsENXMgdzXJTjznrIm/H+c+qf0jqqhon1vCUMNUsVEcrDS+ZtYOBq8KCtkNGWnVKi
         MDUE1+YTEKthuvmiUzJ2zyfK1qSCIM5eoo3wb2WHCixUOzvOKWsv7KTQWNvsJ91Sarz4
         WcjkiLhaFXJ48TE31TeEIJcu9k3EJYoKHoKBQXm8OS0YQ+hc2dzP/O5QPCs+oLTSkX2t
         0UyV3sW1lgMXHjYEXl367XnF7GslTTTFBVUKh1FqB8gPK4oBidPhj5omO1mjGZi8iYSu
         A7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JAh0tQYxRGivtLwVSpTEFqNc9NXs0jToXbtvZ2UvbRY=;
        b=acChHOOKYEBQitsQhVDy+tsZeIf5j3nH9HxAYDg3U2AUjSmoIi2SURFyoAAmhx9kN6
         pqtfwVbUvXk26PN30qNt6q7D8YG8XqSO67XbHe47uitnGdkqOD8qxbmH4r4beSdQKqFp
         gXC7EM0V3mXmwu818UM72sjcA3XQrvAdy9W69CLKN1+kX+e9mRfr1GKnHdnrSPaNxMJm
         xPknvkdn5/uYuKcvGLMLF+SobncH/v4Kr9hHZRVeH4e3SZBHrJA/A/gXD4pF9wIelBdh
         7CKCYWGjfy+Mkyl/+kSsL0i8iw6bZcHxiT5BaE2qhlMY+V07PZXZmqJZEIxpAhEB7FfS
         Gtrg==
X-Gm-Message-State: APjAAAXOZ+nJ5jB15y7Cty6nUUDCqGksypk98NgnYEyN6Z/I6FEJ/29p
        RvrXWGFy+RXIF/Qt6TpDZhI=
X-Google-Smtp-Source: APXvYqw888SyctRbwhPUlMKJr6n5Z0t3+u+hUpReww+AM+kBbXY/8usZ6rnXOrfTptTVDa803MKKGQ==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr3787886wrl.54.1559724366992;
        Wed, 05 Jun 2019 01:46:06 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 88sm26581553wrl.68.2019.06.05.01.46.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:46:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Increase maximum DMA segment size
Date:   Wed,  5 Jun 2019 10:46:05 +0200
Message-Id: <20190605084605.12225-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Recent versions of the DMA API debug code have started to warn about
violations of the maximum DMA segment size. This is because the segment
size defaults to 64 KiB, which can easily be exceeded in large buffer
allocations such as used in DRM/KMS for framebuffers.

Technically the Tegra SMMU and ARM SMMU don't have a maximum segment
size (they map individual pages irrespective of whether they are
contiguous or not), so the choice of 4 MiB is a bit arbitrary here. The
maximum segment size is a 32-bit unsigned integer, though, so we can't
set it to the correct maximum size, which would be the size of the
aperture.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 3 +++
 include/linux/host1x.h   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 9797ccb0a073..6387302c1245 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -414,6 +414,9 @@ static int host1x_device_add(struct host1x *host1x,
 
 	of_dma_configure(&device->dev, host1x->dev->of_node, true);
 
+	device->dev.dma_parms = &device->dma_parms;
+	dma_set_max_seg_size(&device->dev, SZ_4M);
+
 	err = host1x_device_parse_dt(device, driver);
 	if (err < 0) {
 		kfree(device);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index cfff30b9a62e..e6eea45e1154 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -297,6 +297,8 @@ struct host1x_device {
 	struct list_head clients;
 
 	bool registered;
+
+	struct device_dma_parameters dma_parms;
 };
 
 static inline struct host1x_device *to_host1x_device(struct device *dev)
-- 
2.21.0

