Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720B74BA9BA
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Feb 2022 20:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245115AbiBQTWn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Feb 2022 14:22:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245111AbiBQTWl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:22:41 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C3DCCC42
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:22:26 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x5so11420098edd.11
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S8a0qKld3ExSymqE5AwJ6ypij4RMMmcjC0WPOw54aw0=;
        b=L5NNePlUYK0WrsbDEGkZghIuryvsebd30G5QK1hHfMXZupPfiWiVet4qxCVwZoHrnM
         9ds9jl1IcfKbZR63bE9mwH6oeLk38S96Ug80HA/H8SGEt0+14WgRlJwW5YR3liVL31o/
         Lg2C8smm+oy1bHstsA5HXadAjoX4U7wAqyKlnmQrmtcMBroEEsyn4FzhHcHMuqx5gn5E
         Zta5XKq0TahJdvPZCyyspl2uImoWws707sQDL6wXzGm4ADZb38ptH9FeMteGT/AONStb
         6p79TYkAsukBe1Emtq1ZwNIORxeoVsKFZxKh3citRjYH6tik2Q8HCEPYrUZRIEAifDT0
         r4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S8a0qKld3ExSymqE5AwJ6ypij4RMMmcjC0WPOw54aw0=;
        b=SrRbrzGwR9Xs/5W7+20gwp68J2bqDpdRayaXyDYi+KiG1r7YBZ6DOUsZ3rSSCtzqlH
         QlDqiVWTHU40Ex1sR5pGZSRLxUZgcNU5Bbhhz/GjJuA68hqyTNroQ0LQCaVkbZVtOLRj
         /GlbogM1WWmfQZONEq5xgNZ14qAB+gkV82jks5AT8Qq9cqZlE5czeMc1j77B+109OPss
         BbNftWz2NYsK9Wktm5jV6as0jzFHSFob9t0Wl64GzBNMeMfkDKE7NJT63wOkf7Co1zfa
         JN/K4GI0FCG0Kcrm1h3mBQuZsPh5+55jWdHQBJ8Try/m62AwC7+r7J4WxdXUyvfbamoC
         my5g==
X-Gm-Message-State: AOAM530swud+7JIOZGijXNdwO7hVxTP1uipwJF5aF0Q8sTl24Y2hLWCX
        Tznwgf/Tug3JzYfql0JbnCI=
X-Google-Smtp-Source: ABdhPJzkEbvAGwblNcjKMXJ0hMrdwrGJ0k7G8rP68mhxBIWusvFsXIWN3fnGhn7qPSwNCxutnqfS3g==
X-Received: by 2002:a05:6402:2922:b0:40f:7241:74d4 with SMTP id ee34-20020a056402292200b0040f724174d4mr4380953edb.43.1645125745095;
        Thu, 17 Feb 2022 11:22:25 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id p9sm1505346ejn.104.2022.02.17.11.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:22:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 23/25] tests: tegra: Add VIC clear test
Date:   Thu, 17 Feb 2022 20:19:29 +0100
Message-Id: <20220217191931.2534836-18-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This test will attempt to use VIC to clear a surface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 +++
 tests/tegra/vic-clear.c | 173 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 tests/tegra/vic-clear.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 5380c71d870c..c7bf35899780 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -82,3 +82,12 @@ syncpt_timeout = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_clear = executable(
+  'tegra-vic-clear',
+  files('vic-clear.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : libdrm_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-clear.c b/tests/tegra/vic-clear.c
new file mode 100644
index 000000000000..da72782eda7a
--- /dev/null
+++ b/tests/tegra/vic-clear.c
@@ -0,0 +1,173 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "util_math.h"
+
+#include "tegra.h"
+
+#include "host1x.h"
+#include "vic.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    struct vic_image *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
+    uint32_t *pb;
+    int fd, err;
+    void *ptr;
+
+    if (argc > 1)
+        device = argv[1];
+
+    fd = open(device, O_RDWR);
+    if (fd < 0) {
+        fprintf(stderr, "open() failed: %s\n", strerror(errno));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to open Tegra device: %s\n", strerror(-err));
+        close(fd);
+        return 1;
+    }
+
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_VIC, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel to VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    version = drm_tegra_channel_get_version(channel);
+    printf("version: %08x\n", version);
+
+    err = vic_new(drm, channel, &vic);
+    if (err < 0) {
+        fprintf(stderr, "failed to create VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic_image_new(vic, width, height, format, kind, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                        &output);
+    if (err < 0) {
+        fprintf(stderr, "failed to create output image: %d\n", err);
+        return 1;
+    }
+
+    printf("image: %zu bytes\n", output->size);
+
+    err = drm_tegra_bo_map(output->bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map output image: %d\n", err);
+        return 1;
+    }
+
+    memset(ptr, 0xff, output->size);
+    drm_tegra_bo_unmap(output->bo);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &pb);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic_clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &pb, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &pb, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, pb);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    drm_tegra_job_free(job);
+    vic_image_free(output);
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.35.1

