Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA7E5B1E9
	for <lists+linux-tegra@lfdr.de>; Sun, 30 Jun 2019 23:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfF3VEo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 30 Jun 2019 17:04:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45835 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfF3VEo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 Jun 2019 17:04:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so10894629lje.12;
        Sun, 30 Jun 2019 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y0shjWZR4s9zJHqVWwZPltTGcrU0R1di6AYm7h2L5QM=;
        b=T+faajvMgLP1K2fUnnSXBp/7tjaTuCnOhiYwR30av2VJWAT0ujGQ6xXps6SLmd5mOe
         P59xGl2TZoE6mj0ow2Nlv3Dt95M7/SAcpWB4PQ1FWf/EbbJz3CV7k3dDn9gF2XUrL01I
         dRVoiGClfNWBmcKK/zPYIVHgW/THOCIFqSUmB6s+O8sXvDZX9elyJ2bjCNDk3ZhX9Zso
         HvO6/7X0o4B3YXTjOj5nrA1wqck//7I273QgDPnSFmN2jWQGGIVyYVJjrewWl1A4Fk5N
         7FhuXSXxJoqU9RVk6ec3z+t9uUASU3Ykq1K11kJt7YxL5kl9fTjJvhVrJiA0czL0+wdA
         KNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y0shjWZR4s9zJHqVWwZPltTGcrU0R1di6AYm7h2L5QM=;
        b=DovVbDKX+H2hxRnxdUzXrFNqbJvIr106pa2KymNflyozcCLgiyjkjdnQ8T0jLlKKsW
         ihcxuxF8+o03Wulvv4bWyauK/m6q0sw+T3E99Tlwvs/T2xlhAyu/z2x3yGuw7u5dWykY
         c89vfjPPzbGr0D9t5hida2Gh3nBsIvo5nej/dSCCXWQSmuqCR9KI5mEGzkn5gRnYp6qF
         xLAGOHAS7aquTFxy60iTql/VclV3AMkKf9Wc/d80TeN2oHnEZErSlJSmycsgBbKC8pra
         aERuCx1de6z1ijbpSuhQekh+2eUpIPgpmsv8Tlch1Nqx4A8SDj9SqxA4rTz1k6ew3j8+
         S+UA==
X-Gm-Message-State: APjAAAXh1Iug9WHfETTQ2Rwn1yI9SIFPQAznzKtUzDrfDI/RIkxwLX34
        RsMFGUwFPo1S/aGq4t4hYHwHRovh
X-Google-Smtp-Source: APXvYqyZHgC9SYFnxGooyhRrhsUXVoJhUckvX3Pk8JwqgP7ZmWuUu7XJFsPQMmpdAjGweCJQEbPJVA==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr12106482lji.171.1561928681754;
        Sun, 30 Jun 2019 14:04:41 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id u9sm2221408lfb.38.2019.06.30.14.04.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 14:04:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/15] memory: tegra20-emc: Pre-configure debug register
Date:   Mon,  1 Jul 2019 00:00:09 +0300
Message-Id: <20190630210019.26914-6-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190630210019.26914-1-digetx@gmail.com>
References: <20190630210019.26914-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver expects certain debug features to be disabled in order to
work properly. Let's disable them explicitly for consistency and to not
rely on a boot state.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 1ce351dd5461..85c24f285fd4 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -22,6 +22,7 @@
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
+#define EMC_DBG					0x008
 #define EMC_TIMING_CONTROL			0x028
 #define EMC_RC					0x02c
 #define EMC_RFC					0x030
@@ -80,6 +81,12 @@
 #define EMC_REFRESH_OVERFLOW_INT		BIT(3)
 #define EMC_CLKCHANGE_COMPLETE_INT		BIT(4)
 
+#define EMC_DBG_READ_MUX_ASSEMBLY		BIT(0)
+#define EMC_DBG_WRITE_MUX_ACTIVE		BIT(1)
+#define EMC_DBG_FORCE_UPDATE			BIT(2)
+#define EMC_DBG_READ_DQM_CTRL			BIT(9)
+#define EMC_DBG_CFG_PRIORITY			BIT(24)
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -396,7 +403,7 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 static int emc_setup_hw(struct tegra_emc *emc)
 {
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
-	u32 emc_cfg;
+	u32 emc_cfg, emc_dbg;
 
 	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
 
@@ -419,6 +426,14 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	writel_relaxed(intmask, emc->regs + EMC_INTMASK);
 	writel_relaxed(intmask, emc->regs + EMC_INTSTATUS);
 
+	/* ensure that unwanted debug features are disabled */
+	emc_dbg = readl_relaxed(emc->regs + EMC_DBG);
+	emc_dbg |= EMC_DBG_CFG_PRIORITY;
+	emc_dbg &= ~EMC_DBG_READ_MUX_ASSEMBLY;
+	emc_dbg &= ~EMC_DBG_WRITE_MUX_ACTIVE;
+	emc_dbg &= ~EMC_DBG_FORCE_UPDATE;
+	writel_relaxed(emc_dbg, emc->regs + EMC_DBG);
+
 	return 0;
 }
 
-- 
2.22.0

