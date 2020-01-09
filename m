Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6726413526F
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2020 06:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgAIFJ4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Jan 2020 00:09:56 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1228 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgAIFJ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Jan 2020 00:09:56 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e16b5910001>; Wed, 08 Jan 2020 21:09:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 08 Jan 2020 21:09:55 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 08 Jan 2020 21:09:55 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 05:09:55 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 Jan 2020 05:09:55 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e16b5a10000>; Wed, 08 Jan 2020 21:09:54 -0800
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3] regmap: add iopoll-like atomic polling macro
Date:   Thu, 9 Jan 2020 10:39:50 +0530
Message-ID: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578546577; bh=TSe9jL/cy0RgJmhUMtsjtgxVdya2t7aMDssrvL8m5MI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=M8P0C+Kf3vo//Nc3hsSmNRkmScBKZ/VFA68mrI5njLJtgIW7Yhc6TL9Xzo9J49tYW
         H1mLuh7QrnxTHf17C/xVKo8qu4TW+acpKCrweuMuUh1pU1mEhJKhwAnoGBCn76CZa7
         DYutS7e49Zdi3186xFI8kJG9MwNWSykiMn6qmNql4qAOFvU8cWJ4HzstN3XjCuyn2j
         ZFeGlOvsjIGxcDzsIEXXDlmY52hQNmVQRYrcrDZW29Ky+GBVZisP19ms6rMqaZGOzS
         6qMlxEVOQymkxJqYXMKVM9//zOopFWMcqLFpEkQvstuYoKobnirhUGjEjCID71dfFT
         Y7AMvhO0jLFJA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
is atomic version of already available 'regmap_read_poll_timeout' macro.

It should be noted that above atomic macro cannot be used by all regmaps.
If the regmap is set up for atomic use (flat or no cache and MMIO) then
only it can use.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/linux/regmap.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index dfe493a..f0a092a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -145,6 +145,51 @@ struct reg_sequence {
 })
 
 /**
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
+/**
  * regmap_field_read_poll_timeout - Poll until a condition is met or timeout
  *
  * @field: Regmap field to read from
-- 
2.7.4

