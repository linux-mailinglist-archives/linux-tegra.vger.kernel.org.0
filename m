Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E415100638
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 14:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKRNLC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 08:11:02 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37211 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfKRNLC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 08:11:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so19401621wrv.4
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 05:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k+1aw8FZcn9vm3OtpXHxipwlf8vYx7AC6lIfwsEHkRg=;
        b=id6NNUTPEzrjed3PoRHETDxJNYkvYTO1EanHnXqQjdM78xpb6uCFlZvbU4EA0wcIB6
         zQQ7Eh1jv0gVoITyBMdYZ1A7IYuddYNWIlhvjapDs9EG8TFEs8SpkoX7R5/zke0rOpO6
         7KF5YtbOqhboGASTa5Sgl8jzFEbTU1VcbH5YrRngLXLekFif84hPD6f4MfnYwV5SSVPF
         4wnKfQA2p/SGBsevenkefS7L8gUeNVvc/GN8LD3uG+eTHiiq14+p1PZRH/bNCl5sk7iB
         90oAFyFPTnHop8I4HAiOcnD+8R+mQR/k9IS8qpGkiOZ9wCJGvmp6G+RFzmMjGub7fW9H
         O06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k+1aw8FZcn9vm3OtpXHxipwlf8vYx7AC6lIfwsEHkRg=;
        b=mJrGjcyD21JSU/+MgGBarHoEgg7xW436btSCYi1g2DfMuaAT2FWHrTCY3IWc4/ABM9
         watnLrmmG/QsXVy9glT31NJ7q8Q7Q6F8HPIEUdCEmueYsBN09UxKXnqpLDhl2Fx/yRVH
         sT4jDV4UYUUvhsD046F+xkWIrPnXO8YTv79ACsJ6MxLAHsIeQJE72gGxgleGlOJIi/WO
         vktzqAVevYveozCuVHYeaKwIMHxHsbJUz16VwqSEgogXNYR+jSnA0ziqvoaDh2hc83dL
         m5kvtwp1pl3ktjyvTu6j8GwBk8Y9YySsL0ISseC2Hv0D9jMbLwUmnL9HMELwyMKQM1G3
         SYZQ==
X-Gm-Message-State: APjAAAXmWCJzOv6asSVZCCg2e2IJCAPaene0tMqQPWZ2Gr6VNnB5+/PC
        0Thv5bBxZlBpC6b3HwQTNknhgDcnqHA=
X-Google-Smtp-Source: APXvYqxaeXp84vNNj9I65C1/euxrJbcaTdlonBJ53isXqVi8QVWmAq2v8nCkwX951BmdxF7Qp0VoBw==
X-Received: by 2002:adf:dc90:: with SMTP id r16mr10936285wrj.258.1574082660414;
        Mon, 18 Nov 2019 05:11:00 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h205sm21938992wmf.35.2019.11.18.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 05:10:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] soc/tegra: pmc: Add reset sources and levels on Tegra194
Date:   Mon, 18 Nov 2019 14:10:58 +0100
Message-Id: <20191118131058.2336829-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118063348.1816857-3-thierry.reding@gmail.com>
References: <20191118063348.1816857-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 supports the same reset levels as Tegra186 but extends the set
of reset sources. Provide custom PMC register definitions to account for
the larger field for the reset sources as well as the updated list of
reset sources.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- use the new Tegra194 register definitions

 drivers/soc/tegra/pmc.c | 43 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1916899d09a3..ea0e11a09c12 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2926,6 +2926,43 @@ static const struct tegra_io_pad_soc tegra194_io_pads[] = {
 	{ .id = TEGRA_IO_PAD_AUDIO_HV, .dpd = 61, .voltage = UINT_MAX },
 };
 
+static const struct tegra_pmc_regs tegra194_pmc_regs = {
+	.scratch0 = 0x2000,
+	.dpd_req = 0x74,
+	.dpd_status = 0x78,
+	.dpd2_req = 0x7c,
+	.dpd2_status = 0x80,
+	.rst_status = 0x70,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0x7c,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+};
+
+static const char * const tegra194_reset_sources[] = {
+	"SYS_RESET_N",
+	"AOWDT",
+	"BCCPLEXWDT",
+	"BPMPWDT",
+	"SCEWDT",
+	"SPEWDT",
+	"APEWDT",
+	"LCCPLEXWDT",
+	"SENSOR",
+	"AOTAG",
+	"VFSENSOR",
+	"MAINSWRST",
+	"SC7",
+	"HSM",
+	"CSITE",
+	"RCEWDT",
+	"PVA0WDT",
+	"PVA1WDT",
+	"L1A_ASYNC",
+	"BPMPBOOT",
+	"FUSECRC",
+};
+
 static const struct tegra_wake_event tegra194_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
@@ -2943,11 +2980,15 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
 	.io_pads = tegra194_io_pads,
-	.regs = &tegra186_pmc_regs,
+	.regs = &tegra194_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
 	.irq_set_wake = tegra186_pmc_irq_set_wake,
 	.irq_set_type = tegra186_pmc_irq_set_type,
+	.reset_sources = tegra194_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra194_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
 };
-- 
2.23.0

