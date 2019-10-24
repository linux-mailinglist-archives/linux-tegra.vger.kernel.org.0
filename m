Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF95E38B4
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405821AbfJXQqk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50923 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405516AbfJXQqk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id 11so128641wmk.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cu4ZaTXoU6RcuFW1hTOweUU/CS+vekzJPEEygzQ/x1w=;
        b=E3hc2PdcoligcilS1Kw1X8ZfxWgKwt3Sn8FUwTdkYAO/B+ELfzi2jRgQ3/FVdjbPgC
         q6DfwU3DGGjZqeqZU+802JCciaFCVi4RZsJLiLc/7G9IiwgI+z+XEda2H+Alw6ku6B3i
         yzkuFXC3Ql72K+rbQiA+7QnCVq97du+gGp1NqUJA6P1DK2Ul9JRZrAaOYcNwBvow6W1f
         D+BUvTTxysGS/laJQaNnE/J2qaDJ2fPBsR4P/4oIN+E4xa2Al2lt2xqTzDD2YyCGoyN0
         V252QhgP6DpfTSsY8lj9UYqwcX7cnC97/Jc/LTTILTBAE1Pn0iFmZrt2+lrRFM64Uvau
         eEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cu4ZaTXoU6RcuFW1hTOweUU/CS+vekzJPEEygzQ/x1w=;
        b=j+EzsTsKYqTd0Sa0HdAJYT0mLKQnbrY1RemgIa6U+9/4go4mgbeS0DGJ0G4DYi8qYA
         ulyjV1gDAhWV9upZUfTps6w0cwfIs7Xn4Jyz/cHbnsc1jwa51R0TdblCyupuMfc20rSX
         4X+TV9Lzl57rUteHsrT++p0smnj6U3nvo1OqEpcp1qgyCbmXCfAy/Prxmd6Vfi3yc2Vn
         yUyHfraHRIDhzakw9ggY3lDJAz7npvisNU7ErjCjVeJ5tyDLBERY1dBTVaTH9Muy0M+Z
         VzreuSzRHDDAxswCqE1DLNVBa1OH/AYkj+7WZ3rD8yvWleu5Ee/DZOu5CEFEU1OaomxO
         Hl3A==
X-Gm-Message-State: APjAAAX8tCGijtHvMJaUUZdfK9c8TU5UggDfyh+V6H/GKB9bxp/JOZb0
        J9g671h299allJpHQZ32KZXGGm5f
X-Google-Smtp-Source: APXvYqzYfyl8FGtJ4trA5xN0bWqUzXTku3LpNYYPzDs5/TORC9PUXuZhVK55Zn6eufQ3hXzfzIN9qQ==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr5597342wmb.18.1571935598210;
        Thu, 24 Oct 2019 09:46:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s14sm3185170wmh.18.2019.10.24.09.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 27/32] drm/tegra: sor: Unify clock setup for eDP, HDMI and DP
Date:   Thu, 24 Oct 2019 18:45:29 +0200
Message-Id: <20191024164534.132764-28-thierry.reding@gmail.com>
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

With the clocks modelled consistently across SoC generations, the clock
setup for eDP, HDMI and DP can now be unified.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 92 ++++++++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index fdbd76ec1cf7..a245bbbd638a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -527,6 +527,14 @@ static const char * const tegra_clk_sor_pad_parents[2][2] = {
 	{ "pll_d2_out0", "pll_dp" },
 };
 
+/*
+ * Implementing ->set_parent() here isn't really required because the parent
+ * will be explicitly selected in the driver code via the DP_CLK_SEL mux in
+ * the SOR_CLK_CNTRL register. This is primarily for compatibility with the
+ * Tegra186 and later SoC generations where the BPMP implements this clock
+ * and doesn't expose the mux via the common clock framework.
+ */
+
 static int tegra_clk_sor_pad_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct tegra_clk_sor_pad *pad = to_pad(hw);
@@ -1987,10 +1995,36 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
 	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
 
-	/* switch to DP parent clock */
-	err = tegra_sor_set_parent_clock(sor, sor->clk_dp);
-	if (err < 0)
-		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
+	/*
+	 * Switch the pad clock to the DP clock. Note that we cannot actually
+	 * do this because Tegra186 and later don't support clk_set_parent()
+	 * on the sorX_pad_clkout clocks. We already do the equivalent above
+	 * using the DP_CLK_SEL mux of the SOR_CLK_CNTRL register.
+	 */
+#if 0
+	err = clk_set_parent(sor->clk_pad, sor->clk_dp);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to select pad parent clock: %d\n",
+			err);
+		return;
+	}
+#endif
+
+	/* switch the SOR clock to the pad clock */
+	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
+			err);
+		return;
+	}
+
+	/* switch the output clock to the parent pixel clock */
+	err = clk_set_parent(sor->clk, sor->clk_parent);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to select output parent clock: %d\n",
+			err);
+		return;
+	}
 
 	/* use DP-A protocol */
 	value = tegra_sor_readl(sor, SOR_STATE1);
@@ -2661,16 +2695,34 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
 	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
 
-	/* switch to parent clock */
-	err = clk_set_parent(sor->clk, sor->clk_parent);
+	/*
+	 * Switch the pad clock to the DP clock. Note that we cannot actually
+	 * do this because Tegra186 and later don't support clk_set_parent()
+	 * on the sorX_pad_clkout clocks. We already do the equivalent above
+	 * using the DP_CLK_SEL mux of the SOR_CLK_CNTRL register.
+	 */
+#if 0
+	err = clk_set_parent(sor->clk_pad, sor->clk_dp);
 	if (err < 0) {
-		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
+		dev_err(sor->dev, "failed to select pad parent clock: %d\n",
+			err);
 		return;
 	}
+#endif
 
+	/* switch the SOR clock to the pad clock */
 	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
 	if (err < 0) {
-		dev_err(sor->dev, "failed to set pad clock: %d\n", err);
+		dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
+			err);
+		return;
+	}
+
+	/* switch the output clock to the parent pixel clock */
+	err = clk_set_parent(sor->clk, sor->clk_parent);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to select output parent clock: %d\n",
+			err);
 		return;
 	}
 
@@ -3061,16 +3113,34 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
 	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
 
-	/* switch to DP parent clock */
+	/*
+	 * Switch the pad clock to the DP clock. Note that we cannot actually
+	 * do this because Tegra186 and later don't support clk_set_parent()
+	 * on the sorX_pad_clkout clocks. We already do the equivalent above
+	 * using the DP_CLK_SEL mux of the SOR_CLK_CNTRL register.
+	 */
+#if 0
+	err = clk_set_parent(sor->clk_pad, sor->clk_parent);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to select pad parent clock: %d\n",
+			err);
+		return;
+	}
+#endif
+
+	/* switch the SOR clock to the pad clock */
 	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
 	if (err < 0) {
-		dev_err(sor->dev, "failed to switch to pad clock: %d\n", err);
+		dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
+			err);
 		return;
 	}
 
+	/* switch the output clock to the parent pixel clock */
 	err = clk_set_parent(sor->clk, sor->clk_parent);
 	if (err < 0) {
-		dev_err(sor->dev, "failed to switch to parent clock: %d\n", err);
+		dev_err(sor->dev, "failed to select output parent clock: %d\n",
+			err);
 		return;
 	}
 
-- 
2.23.0

