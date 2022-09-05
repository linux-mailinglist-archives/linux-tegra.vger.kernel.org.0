Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F6D5AD787
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Sep 2022 18:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbiIEQdU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Sep 2022 12:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbiIEQdS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:18 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351542C660;
        Mon,  5 Sep 2022 09:33:12 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 29so6917902edv.2;
        Mon, 05 Sep 2022 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BY5zA1WHllLq+uXJXlZXf/Pl4ckkzNhpiTBDZ92+nNE=;
        b=EautIyav6Ilh+qp7Aj7XtjX0W5vr8uzzfZ1MmmHe82S812a1z5bQ5m3SW5Naw7AEBX
         KfmqjhKfFBaiXpKN95Snx8mkWiG3lGLIUHpbiYpJtxlvaNJlZMIc7hIyRBTpXON4LO3Q
         J9/ZAJgiZn2NdRixk5FcI4Ffg+nQ4aAkLLjawHRhrJiU2xlqUJWUi9ZO4awrm/F8dIyC
         sFvAtOZITff9LaGj8VDRQRXyS3kxj0q0zHK5zVQ9i3Dq7af/3zJ1S8HIz7U+dAhnOKHW
         xftMKfJjnuDfCIy/4u0zRwMCcwrb2BVOJo541TJ2C1JDLnmpsbb73os8mqROQy83EU+1
         U5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BY5zA1WHllLq+uXJXlZXf/Pl4ckkzNhpiTBDZ92+nNE=;
        b=4dBSGDtQUmf74+BEDnWQn2IBi+bnmm+97zae1ENQXXz2x91k9WpxP3Q4W4ksWYkwov
         Egw0HORUqvBmVvoXcTBWVYqivWpd8T7g1y8zlrEhk2zCFxFjcHaAKIglW+siNkkuvoCN
         QHnrDwWeKGfqYZj4A8RQ3x4pMwmlLvrA86iblSp89t0xKkzOYgqIzkb1SCkxoBxRAM2I
         DkR8SVd9UO/eN0zBlWUkrJ+XpFSysFB+rlG8sH20yMuXKh8zJDeHGvshtSKaGbhxL9rn
         Ui2vuUk6T15RRqm548Szm+KSmRF84xQ9hoib0jHnWxA56LkEzF9KPi5yTS+HjnKfaKnp
         4wVg==
X-Gm-Message-State: ACgBeo2HEcPOSQMBIsgQNd1UvNmgWLTG71JBI58KQ0FIgk53S+j+NJSp
        OqMHiCjniWyZKHUQnziOhHg=
X-Google-Smtp-Source: AA6agR7ZLfxxdrfzn5klxEnJdBaof0jmZPiJbW1eDeD8QsBzX7qWAoe9M4Zvo0a4lLr4Qb7q62zp4w==
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id k19-20020a056402049300b00445b5f07a0fmr43735026edv.120.1662395590232;
        Mon, 05 Sep 2022 09:33:10 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s6-20020aa7c546000000b00448cb764290sm2202829edr.92.2022.09.05.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/6] drm/simpledrm: Add support for system memory framebuffers
Date:   Mon,  5 Sep 2022 18:32:57 +0200
Message-Id: <20220905163300.391692-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Simple framebuffers can be set up in system memory, which cannot be
requested and/or I/O remapped using the I/O resource helpers. Add a
separate code path that obtains system memory framebuffers from the
reserved memory region referenced in the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 166 +++++++++++++++++++++++++------
 1 file changed, 135 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index a81f91814595..16377b39f012 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/clk.h>
 #include <linux/of_clk.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/minmax.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
@@ -218,6 +219,8 @@ struct simpledrm_device {
 
 	/* memory management */
 	void __iomem *screen_base;
+	phys_addr_t sysmem_start;
+	size_t sysmem_size;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -451,6 +454,100 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 }
 #endif
 
+/*
+ * Memory management
+ */
+
+static int simpledrm_device_init_mm_sysmem(struct simpledrm_device *sdev, phys_addr_t start,
+					   size_t size)
+{
+	struct drm_device *dev = &sdev->dev;
+	phys_addr_t end = start + size - 1;
+
+	drm_info(dev, "using system memory framebuffer at [%pa-%pa]\n", &start, &end);
+
+	sdev->screen_base = devm_memremap(dev->dev, start, size, MEMREMAP_WC);
+	if (!sdev->screen_base)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int simpledrm_device_init_mm_io(struct simpledrm_device *sdev, phys_addr_t start,
+				       size_t size)
+{
+	struct drm_device *dev = &sdev->dev;
+	phys_addr_t end = start + size - 1;
+	struct resource *mem;
+
+	drm_info(dev, "using I/O memory framebuffer at [%pa-%pa]\n", &start, &end);
+
+	mem = devm_request_mem_region(dev->dev, start, size, sdev->dev.driver->name);
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the I/O-memory resource as-is and try to map that instead.
+		 */
+		drm_warn(dev, "could not acquire memory region [%pa-%pa]\n", &start, &end);
+	} else {
+		size = resource_size(mem);
+		start = mem->start;
+	}
+
+	sdev->screen_base = devm_ioremap_wc(dev->dev, start, size);
+	if (!sdev->screen_base)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void simpledrm_device_exit_mm(void *data)
+{
+	struct simpledrm_device *sdev = data;
+	struct drm_device *dev = &sdev->dev;
+
+	of_reserved_mem_device_release(dev->dev);
+}
+
+static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
+{
+	int (*init)(struct simpledrm_device *sdev, phys_addr_t start, size_t size);
+	struct drm_device *dev = &sdev->dev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
+	phys_addr_t start, end;
+	size_t size;
+	int ret;
+
+	ret = of_reserved_mem_device_init_by_idx(dev->dev, dev->dev->of_node, 0);
+	if (ret) {
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return -EINVAL;
+
+		init = simpledrm_device_init_mm_io;
+		size = resource_size(res);
+		start = res->start;
+	} else {
+		devm_add_action_or_reset(dev->dev, simpledrm_device_exit_mm, sdev);
+		init = simpledrm_device_init_mm_sysmem;
+		start = sdev->sysmem_start;
+		size = sdev->sysmem_size;
+	}
+
+	end = start + size - 1;
+
+	ret = devm_aperture_acquire_from_firmware(dev, start, size);
+	if (ret) {
+		drm_err(dev, "could not acquire memory range [%pa-%pa]: %d\n", &start, &end, ret);
+		return ret;
+	}
+
+	return init(sdev, start, size);
+}
+
 /*
  * Modesetting
  */
@@ -511,13 +608,18 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 	struct drm_rect src_clip, dst_clip;
+	struct iosys_map dst;
 	int idx;
 
 	if (!fb)
 		return;
 
+	if (sdev->sysmem_size == 0)
+		iosys_map_set_vaddr_iomem(&dst, sdev->screen_base);
+	else
+		iosys_map_set_vaddr(&dst, sdev->screen_base);
+
 	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
 		return;
 
@@ -721,8 +823,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -790,35 +890,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
 
-	/*
-	 * Memory management
-	 */
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return ERR_PTR(-EINVAL);
-
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
+	ret = simpledrm_device_init_mm(sdev);
+	if (ret)
 		return ERR_PTR(ret);
-	}
-
-	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res), drv->name);
-	if (!mem) {
-		/*
-		 * We cannot make this fatal. Sometimes this comes from magic
-		 * spaces our resource handlers simply don't know about. Use
-		 * the I/O-memory resource as-is and try to map that instead.
-		 */
-		drm_warn(dev, "could not acquire memory region %pr\n", res);
-		mem = res;
-	}
-
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
-	if (!screen_base)
-		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
 
 	/*
 	 * Modesetting
@@ -959,5 +1033,35 @@ static struct platform_driver simpledrm_platform_driver = {
 
 module_platform_driver(simpledrm_platform_driver);
 
+static int simple_framebuffer_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	struct simpledrm_device *sdev = dev_get_drvdata(dev);
+
+	sdev->sysmem_start = rmem->base;
+	sdev->sysmem_size = rmem->size;
+
+	return 0;
+}
+
+static void simple_framebuffer_device_release(struct reserved_mem *rmem, struct device *dev)
+{
+}
+
+static const struct reserved_mem_ops simple_framebuffer_ops = {
+	.device_init = simple_framebuffer_device_init,
+	.device_release = simple_framebuffer_device_release,
+};
+
+static int simple_framebuffer_init(struct reserved_mem *rmem)
+{
+	pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
+		(unsigned long)rmem->size);
+
+	rmem->ops = &simple_framebuffer_ops;
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
+
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL v2");
-- 
2.37.2

