Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B236022252B
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgGPOTW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A104CC061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:21 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w6so6733614ejq.6
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j9bjPnYHkc1ScxpRo4KaxBbK7+DK+SRAE3wJZb7d3Do=;
        b=cy8g5b534FiA0iB75cl36AkRrVlXS03zM/Zp3zirVx/LHlYR3vjHPMOxYwe8JLlvOS
         2c/10IL6QBBG0UC3Bo0TMovR4w1IpcO9YFN5EejG8tGSlZQtIyi6Y4vQOs9ksxmvmVaO
         CNhfY3mgwvkNCxQs19kPaO9Q/V5gUh5PFWoOQLye/VGWLPPega8/EXsAZdpODgmXDI6n
         shKmgGbYXGFA9kcZSuOA0XFa3OXj91LmQ82y+q36kFAsVYPPvlNfATQsLLuJN90hnzvO
         LcyyfzCcwAlIGRT6OHE5XPX8jD4eJ/3KwRxhbV2wcfz7qKq2MCAjYQp3g79cp8YQ3Qhu
         y8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j9bjPnYHkc1ScxpRo4KaxBbK7+DK+SRAE3wJZb7d3Do=;
        b=J8mp/mRmiCCwjntFV4fm95OwOELYrKwd+OW4RS02CVePlgM3nWyd7UGU/ERtj+4EHY
         mzqC6Aa2MJcrs22/mOVUj06048T53qlx6lf6c/ChIUvTXSC+IusTGgbi9t7sx5+y9gEm
         rVlUIRodqPD3M7onxcSsSBlSL9ubJR3HItlmmaxBjhm66RVkoIwvhEUh0qQzBDGDLJ19
         hHJPViI0oGNgjO3P62/mJULsR9J086tPnI+hkiaoxhpwYCII28j945OmdxzU2BQatcOU
         BieZGIFmF6OUyspAGC18xJGhUsPGE4mXAlYpOmTG9Ppf5w72OUhPMa7ixnOd93zOuDsV
         4ORQ==
X-Gm-Message-State: AOAM530xGT6cfDEjGMv+34XxSqyEhh6vWufAXR8vv/aYedOCnTfA9di7
        AKsaol8QxvEtzGPbIAqCRgo=
X-Google-Smtp-Source: ABdhPJzLMSAWmGHA5ZypciHPNCoDxd6qUqzCy2tFP13QKkOCtOi/Kgs/pLVy9hD6BNt8VFYH0VcoQA==
X-Received: by 2002:a17:907:72c7:: with SMTP id du7mr3352525ejc.248.1594909160409;
        Thu, 16 Jul 2020 07:19:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c18sm5106476eja.59.2020.07.16.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/9] firmware: tegra: Enable BPMP support on Tegra234
Date:   Thu, 16 Jul 2020 16:18:55 +0200
Message-Id: <20200716141856.544718-9-thierry.reding@gmail.com>
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

Enable support for the BPMP on Tegra234 to avoid relying on Tegra194
being enabled to pull in the needed OF device ID table entry.

On simulation platforms the BPMP hasn't booted up yet by the time we
probe the BPMP driver and the BPMP hasn't had a chance to mark the
doorbell as ringable by the CCPLEX. This corresponding check in the
BPMP driver will therefore fail. Work around this by disabling the
check on simulation platforms.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 3 ++-
 drivers/mailbox/tegra-hsp.c   | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 4d93d8925e14..0742a90cb844 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -856,7 +856,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 834b35dc3b13..e07091d71986 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -13,6 +13,8 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/fuse.h>
+
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 
 #include "mailbox.h"
@@ -322,7 +324,12 @@ static int tegra_hsp_doorbell_startup(struct mbox_chan *chan)
 	if (!ccplex)
 		return -ENODEV;
 
-	if (!tegra_hsp_doorbell_can_ring(db))
+	/*
+	 * On simulation platforms the BPMP hasn't had a chance yet to mark
+	 * the doorbell as ringable by the CCPLEX, so we want to skip extra
+	 * checks here.
+	 */
+	if (tegra_is_silicon() && !tegra_hsp_doorbell_can_ring(db))
 		return -ENODEV;
 
 	spin_lock_irqsave(&hsp->lock, flags);
-- 
2.27.0

