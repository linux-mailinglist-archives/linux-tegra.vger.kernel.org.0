Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093C71009A3
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKRQrb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:47:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41577 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfKRQqv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:46:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id m4so14794045ljj.8;
        Mon, 18 Nov 2019 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pG9lXccv0oOEUJTH/gOp3aikTwBYEJL3+x/Tztb4ZXo=;
        b=cn2Yy7WZjKpfPkxqhPZL3cm3uPcINgrwtJErnnQ1xIthJFcPBV6s5KOeuazEAwgTDd
         CX2h5pGsAFQI+DjdtlExJNnUb5TxjP7P6XU0nJKEZ+jqqSJDthBlIXskRE+qTBSyQzq1
         Q5fF64vTRDzbRdRz1e/kTQiUHrcDnATe2Php1nCAX8qV4COzjRi2CqSSoGpc5W6vwLao
         HColuUwE5yi0DMA9iUBdfqud1sMI4a7pcuTkNY934C1ZG6PAQkx2weqmGv3chC50zKEP
         Ofd7vF4MZn7tmlLaIqx45vPFexpeA+804sc7fA1M0T9rurIC2aU+LyrGOzeDrkIhW6qX
         rDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pG9lXccv0oOEUJTH/gOp3aikTwBYEJL3+x/Tztb4ZXo=;
        b=gEfNoK592Z6S579nAf/AXzjtk9dMSC4l7x4GaDcfqyVSpCsrz3LmUkO3cFaepmYZuk
         83x3ZRHsEhbrYzgWe4FX+cBMNo3ozg9Rh/DS5VmoUrDhI3tzIwSpeJQdk+HJzL5oIc7e
         PkUpx/an1ttl9S6BzerFZHJc2pvL/ZaeCPs/k88Az6u01sFGRBOSyRm73W1SrkU7XC2c
         zN2zYBrapF/JsaLgdu0sScQnPhcvd/FCc7nyRIq6zKf9s7gL7EAdVlHP1G30CY3X+b9i
         Gvu4Wsvgcgq1dNI+axtvRKYgDWC7eYN1nkwOju6yjfw68K59wLvBgomah9tF8FKHOn+B
         +OnA==
X-Gm-Message-State: APjAAAWzXgmL/Omlrs93tuEcmtPzsh4ntdcopH1MkZUe6rJhIngBg25G
        I2BQyP/BcFTGbhfjhGcb+2U=
X-Google-Smtp-Source: APXvYqxHjz3Ecs55M2sI8pU6csg3HH+jE0WDtOLSgtZDCsx+6K+r5FpqYSBI0xapTQknmPmIQ8bCww==
X-Received: by 2002:a2e:8ed6:: with SMTP id e22mr268631ljl.3.1574095608809;
        Mon, 18 Nov 2019 08:46:48 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d4sm8880307lfi.32.2019.11.18.08.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:46:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/11] clk: tegra: cclk: Add helpers for handling PLLX rate changes
Date:   Mon, 18 Nov 2019 19:45:04 +0300
Message-Id: <20191118164512.8676-4-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118164512.8676-1-digetx@gmail.com>
References: <20191118164512.8676-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

CCLK should be re-parented away from PLLX if PLLX's rate is changing.
The PLLP parent is a common safe CPU parent for all Tegra SoCs, thus
CCLK will be re-parented to PLLP before PLLX rate-change begins and then
switched back to PLLX after the rate-change completion. This patch adds
helper functions which perform CCLK re-parenting, these helpers will be
utilized by further patches.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-super-cclk.c | 34 ++++++++++++++++++++++++
 drivers/clk/tegra/clk.h                  |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
index 7bcb9e8d0860..a03119c30456 100644
--- a/drivers/clk/tegra/clk-tegra-super-cclk.c
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -25,6 +25,9 @@
 
 #define SUPER_CDIV_ENB		BIT(31)
 
+static struct tegra_clk_super_mux *cclk_super;
+static bool cclk_on_pllx;
+
 static u8 cclk_super_get_parent(struct clk_hw *hw)
 {
 	return tegra_clk_super_ops.get_parent(hw);
@@ -115,6 +118,9 @@ struct clk *tegra_clk_register_super_cclk(const char *name,
 	struct clk_init_data init;
 	u32 val;
 
+	if (WARN_ON(cclk_super))
+		return ERR_PTR(-EBUSY);
+
 	super = kzalloc(sizeof(*super), GFP_KERNEL);
 	if (!super)
 		return ERR_PTR(-ENOMEM);
@@ -173,6 +179,34 @@ struct clk *tegra_clk_register_super_cclk(const char *name,
 	clk = clk_register(NULL, &super->hw);
 	if (IS_ERR(clk))
 		kfree(super);
+	else
+		cclk_super = super;
 
 	return clk;
 }
+
+int tegra_cclk_pre_pllx_rate_change(void)
+{
+	if (IS_ERR_OR_NULL(cclk_super))
+		return -EINVAL;
+
+	if (cclk_super_get_parent(&cclk_super->hw) == PLLX_INDEX)
+		cclk_on_pllx = true;
+	else
+		cclk_on_pllx = false;
+
+	/*
+	 * CPU needs to be temporarily re-parented away from PLLX if PLLX
+	 * changes its rate. PLLP is a safe parent for CPU on all Tegra SoCs.
+	 */
+	if (cclk_on_pllx)
+		cclk_super_set_parent(&cclk_super->hw, PLLP_INDEX);
+
+	return 0;
+}
+
+void tegra_cclk_post_pllx_rate_change(void)
+{
+	if (cclk_on_pllx)
+		cclk_super_set_parent(&cclk_super->hw, PLLX_INDEX);
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index fa18bef914af..0afe28f4372b 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -771,6 +771,8 @@ struct clk *tegra_clk_register_super_cclk(const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
 		spinlock_t *lock);
+int tegra_cclk_pre_pllx_rate_change(void);
+void tegra_cclk_post_pllx_rate_change(void);
 
 /**
  * struct tegra_sdmmc_mux - switch divider with Low Jitter inputs for SDMMC
-- 
2.23.0

