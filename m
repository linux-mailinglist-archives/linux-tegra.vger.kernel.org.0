Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09548E38AF
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439931AbfJXQqd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33633 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439929AbfJXQqd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id s1so18097260wro.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J+teLrDmUq/g4c7wc3+RbjUGyVD2T7B6IPhjV4FrY+o=;
        b=NyyAEeonT461+ilpnoe9F3HqNKX94i5GlETWA3k3XcYZKsdNMiUKnSvbP/5deI4iKW
         ubNd2lZ9FTtDB+me9TNBpM9TiJy4UfNEHxQewT6OlHkvyePtViLsc7DzByadrucAw0kd
         Hr5fU9cLv0L+o2Pf3mdcnZum/u5tDcmKuVXFmz2+vnidYUhcqdX/IYTTDUiAGSRCEiNT
         JSHwpRAjc9vl4ppV7Ak0KuUZliyhLF+mgv+X6SsOm2SCkCy43viXwwHozx+G4OLDeRt6
         72J7ASNqun16rvb7fu1aHSMD2p38wPvNMPizTqreKikFzsKh46DxFGP+WYzn7jt63gNp
         IHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J+teLrDmUq/g4c7wc3+RbjUGyVD2T7B6IPhjV4FrY+o=;
        b=RwIBmXGzenXFTe5FpW510Fh6atp3m9IZYe9fKCo5HB6SwkGm9Ug/aYly+lO1E98w8Y
         8BBCq2nbmA91lsRD291/tv4/O53uTiNfOO9CqrOfB2nbdTgPj54b946TE28bJeBoX4as
         tGhHYCL3f7Errrp/D9HPFRlSm0Ay/1cu2d0y//umg/ddat96TC4klSthdpJ5lj9h8Lgu
         hj6nVyqSblVR1nIL0dVsnIz4BIqhiJ+6yHb2ZPaUJ6qiKtQV/UzNqa24TsaJQc8JQ8sf
         TEMA2bL7FZ/81QabLd2oNUKk1CJEWeaFHOnZ3+9/mDMRP6zUsxjBmUd3DrZgZmLG5ynd
         j5Qw==
X-Gm-Message-State: APjAAAXcOORd0MqBW8tY7I8qpJPrYjOWiqdJ6xa8sPYv28NgrZJHeQ5R
        4bmi42fLar4/4ZLyr8pMbFM=
X-Google-Smtp-Source: APXvYqxILzNyOiSXsbSp1f4vtgYmepdyNF/ujbe8i31SrmYnTTz3zGzE96FmDDaPMXk7zs4FolzQig==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr4963666wru.150.1571935591737;
        Thu, 24 Oct 2019 09:46:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r1sm19783003wrw.60.2019.10.24.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 24/32] drm/tegra: sor: Implement pad clock for all SOR instances
Date:   Thu, 24 Oct 2019 18:45:26 +0200
Message-Id: <20191024164534.132764-25-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

So far the pad clock was only needed on the second SOR instance. The
clock does exist for all SOR instances, though, so make sure it is
always implemented. This prepares for further unification of the code
in subsequent patches.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index c7faf088cabc..71a7ed57cb4f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -522,8 +522,9 @@ static inline struct tegra_clk_sor_pad *to_pad(struct clk_hw *hw)
 	return container_of(hw, struct tegra_clk_sor_pad, hw);
 }
 
-static const char * const tegra_clk_sor_pad_parents[] = {
-	"pll_d2_out0", "pll_dp"
+static const char * const tegra_clk_sor_pad_parents[2][2] = {
+	{ "pll_d_out0", "pll_dp" },
+	{ "pll_d2_out0", "pll_dp" },
 };
 
 static int tegra_clk_sor_pad_set_parent(struct clk_hw *hw, u8 index)
@@ -594,8 +595,8 @@ static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 
 	init.name = name;
 	init.flags = 0;
-	init.parent_names = tegra_clk_sor_pad_parents;
-	init.num_parents = ARRAY_SIZE(tegra_clk_sor_pad_parents);
+	init.parent_names = tegra_clk_sor_pad_parents[sor->index];
+	init.num_parents = ARRAY_SIZE(tegra_clk_sor_pad_parents[sor->index]);
 	init.ops = &tegra_clk_sor_pad_ops;
 
 	pad->hw.init = &init;
@@ -4016,6 +4017,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	 * pad output clock.
 	 */
 	if (!sor->clk_pad) {
+		char *name;
+
 		err = pm_runtime_get_sync(&pdev->dev);
 		if (err < 0) {
 			dev_err(&pdev->dev, "failed to get runtime PM: %d\n",
@@ -4023,8 +4026,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 			goto remove;
 		}
 
-		sor->clk_pad = tegra_clk_sor_pad_register(sor,
-							  "sor1_pad_clkout");
+		name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sor%u_pad_clkout", sor->index);
+		if (!name) {
+			err = -ENOMEM;
+			goto remove;
+		}
+
+		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
 		pm_runtime_put(&pdev->dev);
 	}
 
-- 
2.23.0

