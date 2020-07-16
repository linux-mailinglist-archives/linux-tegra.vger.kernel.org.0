Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52A7222529
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgGPOTS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:17 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BBBC061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d18so4881634edv.6
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JxFS1+GP3Puv1gzomSYgZUeomAGb2SWboVlMfgMHm0=;
        b=WUa+a2j24vhFvbxF9nF90vTJ66wiB5M/I+EtRDm6ihsr/anOdS5rfbRZ5xoB0fu01E
         MfRvhW314d5OR60blxxnhR0aFp9B1vIqK24nm7O5kjcUNiX6HDsnCuM1/ZUsYi+Ht/7Q
         eaTNYcqNIAQReeoFkrakIY0XpgBSonNxhrpDSWPJWWZYRQZIiRErwCoVNMJpSAe+24Vn
         90zzWRrKc+u4qCb6MgU2xq3tbJIY1ZKruUI7B+GcO9jVM9Ovjk92PlNmh0M4z+FFsCCw
         tstOvhFoaQk2pV39XKaRq2U72CeF6NOMYyVxGMSunA25O0R391uOm0UdOMdTYRkScGDA
         CFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JxFS1+GP3Puv1gzomSYgZUeomAGb2SWboVlMfgMHm0=;
        b=CUEeUsfcikd4NGeBXHWkCctkDiRK+Bn/JLB9KKpDlO2NVE2RaaEjFl6Cc7ZCf729X8
         +M26Zs2KkGi0hrg3VsFxl45k+FVz70ABJhRfX+ZN1gBQOte/r06Q3YRidfKi32g0qk0f
         mjGE71QLcgZKSEu1GN6v/60ufwJItxqrU8nS8ANpXJWwDZlBABjLtNM627YCb8SpRlGi
         0tArYeHkj2NgW7ui375phEcSlqJz7Zz8FNBAptrGhsy8R9cFhIZxRE9Db7XU3N9ejWAC
         rhLlNFYKDN/+fu7Zp4PxfjqMdqnyraUl1rCmPgGzckPPyuy/cTKcBHlD9n1gs0wCryPt
         KSXA==
X-Gm-Message-State: AOAM530SmSudGhlz7gYijel3uzStdgey3lePuAJL4XkaqfNIYyeUlJ50
        2SxYtTfy2V6D2253PH8uJho=
X-Google-Smtp-Source: ABdhPJxbhHQkLSqySIi71LfXhfPFOw0h8nZ8U86OJQ+pcdcSEOwZyDks/CUFy1EVrwOkm8j14jodPA==
X-Received: by 2002:a50:931e:: with SMTP id m30mr4907020eda.341.1594909156295;
        Thu, 16 Jul 2020 07:19:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bc23sm5416893edb.90.2020.07.16.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/9] soc/tegra: fuse: Implement tegra_is_silicon()
Date:   Thu, 16 Jul 2020 16:18:53 +0200
Message-Id: <20200716141856.544718-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function can be used by drivers to determine whether code is
running on silicon or on a simulation platform.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 13 +++++++++++++
 include/soc/tegra/fuse.h               |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 89f1479b4d0e..be6b7fc169ca 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -52,6 +52,19 @@ u8 tegra_get_platform(void)
 	return (tegra_read_chipid() >> 20) & 0xf;
 }
 
+bool tegra_is_silicon(void)
+{
+	switch (tegra_get_chip_id()) {
+	case TEGRA194:
+		if (tegra_get_platform() == 0)
+			return true;
+
+		return false;
+	}
+
+	return false;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 214908fc5581..a9db917a1d06 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -24,6 +24,7 @@
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
 u8 tegra_get_platform(void);
+bool tegra_is_silicon(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.27.0

