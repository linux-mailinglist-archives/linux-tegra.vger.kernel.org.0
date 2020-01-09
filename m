Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5F136284
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2020 22:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgAIVax (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Jan 2020 16:30:53 -0500
Received: from foss.arm.com ([217.140.110.172]:37040 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgAIVax (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 9 Jan 2020 16:30:53 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B8F31B;
        Thu,  9 Jan 2020 13:30:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6897C3F534;
        Thu,  9 Jan 2020 13:30:52 -0800 (PST)
Date:   Thu, 09 Jan 2020 21:30:50 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regmap: add iopoll-like atomic polling macro" to the regmap tree
In-Reply-To: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
Message-Id: <applied-1578546590-24737-1-git-send-email-spujar@nvidia.com>
X-Patchwork-Hint: ignore
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The patch

   regmap: add iopoll-like atomic polling macro

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 50816a4c39263913d8cfd1ee32f90102679606c6 Mon Sep 17 00:00:00 2001
From: Sameer Pujar <spujar@nvidia.com>
Date: Thu, 9 Jan 2020 10:39:50 +0530
Subject: [PATCH] regmap: add iopoll-like atomic polling macro

This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
is atomic version of already available 'regmap_read_poll_timeout' macro.

It should be noted that above atomic macro cannot be used by all regmaps.
If the regmap is set up for atomic use (flat or no cache and MMIO) then
only it can use.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Link: https://lore.kernel.org/r/1578546590-24737-1-git-send-email-spujar@nvidia.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/regmap.h | 45 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index dfe493ac692d..f0a092a1a96d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -144,6 +144,51 @@ struct reg_sequence {
 	__ret ?: ((cond) ? 0 : -ETIMEDOUT); \
 })
 
+/**
+ * regmap_read_poll_timeout_atomic - Poll until a condition is met or a timeout occurs
+ *
+ * @map: Regmap to read from
+ * @addr: Address to poll
+ * @val: Unsigned integer variable to read the value into
+ * @cond: Break condition (usually involving @val)
+ * @delay_us: Time to udelay between reads in us (0 tight-loops).
+ *            Should be less than ~10us since udelay is used
+ *            (see Documentation/timers/timers-howto.rst).
+ * @timeout_us: Timeout in us, 0 means never timeout
+ *
+ * Returns 0 on success and -ETIMEDOUT upon a timeout or the regmap_read
+ * error return value in case of a error read. In the two former cases,
+ * the last read value at @addr is stored in @val.
+ *
+ * This is modelled after the readx_poll_timeout_atomic macros in linux/iopoll.h.
+ *
+ * Note: In general regmap cannot be used in atomic context. If you want to use
+ * this macro then first setup your regmap for atomic use (flat or no cache
+ * and MMIO regmap).
+ */
+#define regmap_read_poll_timeout_atomic(map, addr, val, cond, delay_us, timeout_us) \
+({ \
+	u64 __timeout_us = (timeout_us); \
+	unsigned long __delay_us = (delay_us); \
+	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
+	int __ret; \
+	for (;;) { \
+		__ret = regmap_read((map), (addr), &(val)); \
+		if (__ret) \
+			break; \
+		if (cond) \
+			break; \
+		if ((__timeout_us) && \
+		    ktime_compare(ktime_get(), __timeout) > 0) { \
+			__ret = regmap_read((map), (addr), &(val)); \
+			break; \
+		} \
+		if (__delay_us) \
+			udelay(__delay_us); \
+	} \
+	__ret ?: ((cond) ? 0 : -ETIMEDOUT); \
+})
+
 /**
  * regmap_field_read_poll_timeout - Poll until a condition is met or timeout
  *
-- 
2.20.1

