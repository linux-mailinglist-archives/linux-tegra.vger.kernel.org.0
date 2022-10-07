Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E565F7842
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Oct 2022 14:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJGMuO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Oct 2022 08:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJGMuN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:13 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7614A2ED5C;
        Fri,  7 Oct 2022 05:50:01 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id 13so11130527ejn.3;
        Fri, 07 Oct 2022 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8upa/AE8nGpXl24ostbZMoh41mWOyaVWO9cdEU+UC6c=;
        b=KqioInl1OGok63D0PEYJEYdJmf6l6crQEOdxne1TXTN7RwWaTISgSVvmKDjkysZpfR
         xy2FVwlfn8rkJD7CWIknL7k6j7y2W97eeiTF59k+utBZWWUyCZbT4n9JQas3h95UJ/5p
         eJh4bwFMQW1xyrJNxmNohvs4C8x4nza/5StFnLEQ3XEcOok24nxiYEZxblZTESgEY7Yp
         iAD2Fs20vPrZJofrSG9H19Y/fy9d3ijnwVwcmvrtrQfcZ6Kv2ULIel2+Cpe5PBgcWuT0
         nhAhHX6fJBvEGhHDLTfZbvd5JWMu9F9XpQAV6aXkd5DxcMRvfEvVjZvCntQYO97bckM7
         1gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8upa/AE8nGpXl24ostbZMoh41mWOyaVWO9cdEU+UC6c=;
        b=j5v2wVagsdTrlvudpzVYy/z/UrxZhN8sT101BQrF5KyZl3oq1pyTjdLIwf6hwk9faQ
         RxhxRR5zo8ojJmLfWpLPQyJnyrE81GqnpB32q5QFykBV5rbMR6Td8cjo1lZfxr5c9Rx+
         DNs8chD7/N/j9cPxtRGXBrNcO1AMhGbF4IMi9wsMN/OLAXiY9WIg72yUNDyGIKfmxo5w
         yByKX6iAVcnR31uJPxzTEEUPoSHqfmp+BRFWW+hLdJpvlL/uqLCLNyLa6BPK9ZppLwrI
         AR3SfHKeeaXg66Lcbc21XNBN+8rO5r6o/NlDLOEu1xd1yx+9X5wZkiou6OVIjbagweho
         hquQ==
X-Gm-Message-State: ACrzQf0JkTPYwVwNW8HUPzOB7m2bwSKI9OwiA3SG8vGMvuECSJFzzKhc
        cRkDk4XoLiF/mkTeELqU2i4=
X-Google-Smtp-Source: AMsMyM56DggySACNM4kUVGOr3nTN2K4x0R0idGdKggbS7mIKRxTkL/rKnQT+lLyDg2/BOtWmBl8koA==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id wu10-20020a170906eeca00b007306880c397mr3865892ejb.593.1665146999629;
        Fri, 07 Oct 2022 05:49:59 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j9-20020aa7ca49000000b00458d383a6ddsm1416515edt.44.2022.10.07.05.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:49:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] drm/simpledrm: Add support for system memory framebuffers
Date:   Fri,  7 Oct 2022 14:49:43 +0200
Message-Id: <20221007124946.406808-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

v2: make screen base a struct iosys_map to avoid sparse warnings

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 177 ++++++++++++++++++++++++-------
 1 file changed, 141 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 18489779fb8a..cf36f67d22e4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/clk.h>
 #include <linux/of_clk.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/minmax.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
@@ -207,7 +208,9 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
+	phys_addr_t sysmem_start;
+	size_t sysmem_size;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -441,6 +444,106 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
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
+	void *screen_base;
+
+	drm_info(dev, "using system memory framebuffer at [%pa-%pa]\n", &start, &end);
+
+	screen_base = devm_memremap(dev->dev, start, size, MEMREMAP_WC);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr(&sdev->screen_base, screen_base);
+
+	return 0;
+}
+
+static int simpledrm_device_init_mm_io(struct simpledrm_device *sdev, phys_addr_t start,
+				       size_t size)
+{
+	struct drm_device *dev = &sdev->dev;
+	phys_addr_t end = start + size - 1;
+	void __iomem *screen_base;
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
+	screen_base = devm_ioremap_wc(dev->dev, start, size);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
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
@@ -491,15 +594,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		iosys_map_incr(&sdev->screen_base, drm_fb_clip_offset(sdev->pitch, sdev->format,
+								      &dst_clip));
+		drm_fb_blit(&sdev->screen_base, &sdev->pitch, sdev->format->format,
+			    shadow_plane_state->data, fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -518,7 +621,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -635,8 +738,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -706,35 +807,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
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
@@ -878,5 +953,35 @@ static struct platform_driver simpledrm_platform_driver = {
 
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
2.37.3

