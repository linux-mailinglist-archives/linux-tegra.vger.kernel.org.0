Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658B8286596
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Oct 2020 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgJGRRX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Oct 2020 13:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgJGRRW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD33C0613D9
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=efbeVCQoLytd+E0O7D/DZEJokfsYVieF5J5uHvSWzyA=; b=KleiKpJsqv/dP/sMwRkzTEq/HT
        hACeGG1+RYvWvKjBspB8qzSnOSt2WrNA3XuMYydNv2dfFkmBGuTbZHNP94ZrVoC/ZDm3uw46AlqgY
        60rTiHGvDNHTihhu9JOFzvJB3qsOojZGwDqxJms3AM1XswUvTPnpp7lTCK6B+VXjc5NCkHM+hRNjz
        /7vRAAcjPPdt29Vx/UunQPeS5lQC9LYJ6UEXMhJRNTedGR5te0dVO04DN6MxAz2kMb3zIhwIQgN6C
        hpJ+AFo7/U9uYHZutjMRjfuvWorNZ19FPggsrb8eEX9RhYnfIHR2+3g44T303Pl5Wn+c39ZNB5/CP
        syQL/9cw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD40-0006P9-3t; Wed, 07 Oct 2020 20:17:16 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 07/20] gpu: host1x: Introduce UAPI header
Date:   Wed,  7 Oct 2020 20:12:25 +0300
Message-Id: <20201007171238.1795964-8-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the userspace interface header, specifying interfaces
for allocating and accessing syncpoints from userspace,
and for creating sync_file based fences based on syncpoint
thresholds.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/uapi/linux/host1x.h | 134 ++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 include/uapi/linux/host1x.h

diff --git a/include/uapi/linux/host1x.h b/include/uapi/linux/host1x.h
new file mode 100644
index 000000000000..9c8fb9425cb2
--- /dev/null
+++ b/include/uapi/linux/host1x.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _UAPI__LINUX_HOST1X_H
+#define _UAPI__LINUX_HOST1X_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+struct host1x_allocate_syncpoint {
+	/**
+	 * @fd: [out]
+	 *
+	 * New file descriptor representing the allocated syncpoint.
+	 */
+	__s32 fd;
+
+	__u32 reserved[3];
+};
+
+struct host1x_syncpoint_info {
+	/**
+	 * @id: [out]
+	 *
+	 * System-global ID of the syncpoint.
+	 */
+	__u32 id;
+
+	__u32 reserved[3];
+};
+
+struct host1x_syncpoint_increment {
+	/**
+	 * @count: [in]
+	 *
+	 * Number of times to increment the syncpoint. The syncpoint can
+	 * be observed at in-between values, but each increment is atomic.
+	 */
+	__u32 count;
+};
+
+struct host1x_read_syncpoint {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of the syncpoint to read.
+	 */
+	__u32 id;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Current value of the syncpoint.
+	 */
+	__u32 value;
+};
+
+struct host1x_create_fence {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of the syncpoint to create a fence for.
+	 */
+	__u32 id;
+
+	/**
+	 * @threshold: [in]
+	 *
+	 * When the syncpoint reaches this value, the fence will be signaled.
+	 * The syncpoint is considered to have reached the threshold when the
+	 * following condition is true:
+	 *
+	 * 	((value - threshold) & 0x80000000U) == 0U
+	 *
+	 */
+	__u32 threshold;
+
+	/**
+	 * @fence_fd: [out]
+	 *
+	 * New sync_file file descriptor containing the created fence.
+	 */
+	__s32 fence_fd;
+
+	__u32 reserved[1];
+};
+
+struct host1x_fence_extract_fence {
+	__u32 id;
+	__u32 threshold;
+};
+
+struct host1x_fence_extract {
+	/**
+	 * @fence_fd: [in]
+	 *
+	 * sync_file file descriptor
+	 */
+	__s32 fence_fd;
+
+	/**
+	 * @num_fences: [in,out]
+	 *
+	 * In: size of the `fences_ptr` array counted in elements.
+	 * Out: required size of the `fences_ptr` array counted in elements.
+	 */
+	__u32 num_fences;
+
+	/**
+	 * @fences_ptr: [in]
+	 *
+	 * Pointer to array of `struct host1x_fence_extract_fence`.
+	 */
+	__u64 fences_ptr;
+
+	__u32 reserved[2];
+};
+
+#define HOST1X_IOCTL_ALLOCATE_SYNCPOINT  _IOWR('X', 0x00, struct host1x_allocate_syncpoint)
+#define HOST1X_IOCTL_READ_SYNCPOINT      _IOR ('X', 0x01, struct host1x_read_syncpoint)
+#define HOST1X_IOCTL_CREATE_FENCE        _IOWR('X', 0x02, struct host1x_create_fence)
+#define HOST1X_IOCTL_SYNCPOINT_INFO      _IOWR('X', 0x03, struct host1x_syncpoint_info)
+#define HOST1X_IOCTL_SYNCPOINT_INCREMENT _IOWR('X', 0x04, struct host1x_syncpoint_increment)
+#define HOST1X_IOCTL_FENCE_EXTRACT       _IOWR('X', 0x05, struct host1x_fence_extract)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif
-- 
2.28.0

