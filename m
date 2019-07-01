Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096734412F
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387557AbfFMQMc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:12:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38220 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732462AbfFMQMb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:12:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so21411630wrs.5;
        Thu, 13 Jun 2019 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wk6QpWbPHxyMczqqineUBiLTVajQMdvzH6F9gBM8PvU=;
        b=r9SJYnDMMoP7KesraASlSyc8784X/rHIoZTyIJ9IT/JGjQPexWVn132Z0M+CoRKF4D
         g6Va0RmKvKSVFqH1oV4aA8qJk70zu2E+i/I5QYQ5yya9KQXMf3vhtVreQGtWcn+SWj8+
         Lez7op9T8p0tl5mr1I4x//+pz4+soli65/BZpy5m9AF7jV79NV4zlWAbg5du4AON6tfX
         bOTqvpV0heNnqgYhZ2hxfl8SrRBnyeFmzvlnF+J6QJMv86Ka4Cv5GbwzmIjkjzRKOi2i
         2lBKv1AafEzGHITr3OLyoATR6w532ipLggjP1cKsC7OFUhfxWkLfFdSXbwH1gAPg/Ycy
         u39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wk6QpWbPHxyMczqqineUBiLTVajQMdvzH6F9gBM8PvU=;
        b=PZs0KatYci0sbrF/UzpOnMoopYpP0xThYAO6SyewwJftTV7KqaaNqFkemIlQ18CloG
         HSbBnGf9wXlMrtUepI9KfnHlM1HiBmfjf5/CtBeABDs0w9pHcf7cI9mEwDjAyGFnRIst
         zNinLSW0upwbBRG8FOivtRijZywhNuYSsrTtMTDpw23nmeC4Ymrt8CfdinL6/lqCNrWJ
         ukcdfaJEt/lYHSu8RQ8hraFWqrAc0aOR44qPJ6tY/lUZti1+o6kqhg37IMWF7WNkpL/W
         h9BO0C2bJQSlLkBfeBQF5N/GILjKQaA7jNHLfdksqu9siRTmAN78gLCfSacPxBAuBewQ
         oDhw==
X-Gm-Message-State: APjAAAWqyCqBU8iGld4lN5NjfJPzfXPK05MIuU4vmTySLJKZIv95Sfmh
        mbBmE8yWUtGFpaTxr9gEKTM=
X-Google-Smtp-Source: APXvYqz/Tg4g2AVUkAv5kL3Qqod1gGcIdwXtLjHhAQ4a7wouh9hquIK5XzLFdu/A96F/YECIRjOXFg==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr57934185wrt.111.1560442349392;
        Thu, 13 Jun 2019 09:12:29 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q15sm150497wrr.19.2019.06.13.09.12.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:12:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] clk: tegra: Do not enable PLL_RE_VCO on Tegra210
Date:   Thu, 13 Jun 2019 18:12:25 +0200
Message-Id: <20190613161225.2531-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613161225.2531-1-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It turns out that this PLL is not used on Tegra210, so there's no need
to enable it via the init table. Remove the init table entry for this
PLL to avoid it getting enabled at boot time. If the bootloader enabled
it and forgot to turn it off, the common clock framework will now know
to disable it because it is unused.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 793c7acaf4e2..13537e4458b5 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3337,7 +3337,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1 },
 	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
 	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
-	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 1 },
 	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
 	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },
-- 
2.21.0

