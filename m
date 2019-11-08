Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0422DF4FD9
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Nov 2019 16:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfKHPfq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Nov 2019 10:35:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38509 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfKHPfq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Nov 2019 10:35:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so618612wro.5
        for <linux-tegra@vger.kernel.org>; Fri, 08 Nov 2019 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJ3byi3aLV//wKwRUzx55Fw+IotBkoOqdaPqQTMPHes=;
        b=Qyjrr63/Knh3H73ZOYxMB9bpzDDmUoktgpfdPDSK0MeyWLKZWAbYXyKwIgIDwd3RwN
         m2gWh027hwkmMqElAB3ONaWf5Bo6CVoi5ToD9YpKJ9qRg0uX94zpzIAxCUeBY/ewDocc
         8VFLV6tmMzbUubyaJXUvXTBmxbBBkfkqhj4lJG1Ame1FxIkEuPLAlyt7RDk5hfhTONng
         kex1SayBK1IzOYh8uusg7d1YhOG6AJhSnoIorM2U5XXSIjxIPuherZqK556TSERXZGCh
         RyM1r3UkVKTvX3dbnaWxOfHFlYNEiiCTjk3QRjeqOVEHVbi6JLiqK+wBMA+erGxcOPuZ
         pWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJ3byi3aLV//wKwRUzx55Fw+IotBkoOqdaPqQTMPHes=;
        b=kfKxeZorCpc2wrAtmzskM+KIyKaAsKVl2VZAzFrLDVFo06my0absZvtnwgGcJHnby9
         WXIPByOzHVPk/CpAeSX8lbZKELyjtHR8PCy6pm4rLpk7ygH3s5ZtlVfL2fI6d7jSa6xa
         NoA2Tmreq8bSilOMfz8M5o2X4JH+ojajaovSwTUGQmizYKPWWGTHRnXgW+mw59+YVXet
         jKqF4j3a1632/Jrogm+QtgpMkfVpGiN2UotF5RCUWPTwa7RnWF6piL4R/bRK3NWfePwh
         NaxP7LPUr/j+kCOR2k3ILbRTf515f6BdzLr5Wd0XSJoNRlpaAf2IhU3J7jNRHSB52EY1
         iwlQ==
X-Gm-Message-State: APjAAAXNIe223wAstRbp5Oi8C6NCEjkFPmZFB5oKhDBGeEGAbixRPN5m
        s0y2qEwVzz+fWMMHb0AMCi0=
X-Google-Smtp-Source: APXvYqySSZWvyqV2n1N232R0RxEFZHRgEnIebJpUsBeQChZsEI2vEfyhekE4wUq5q4b5Uwc/zxHdNw==
X-Received: by 2002:adf:e346:: with SMTP id n6mr8379264wrj.234.1573227342221;
        Fri, 08 Nov 2019 07:35:42 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g5sm7745826wmf.37.2019.11.08.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:35:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] soc/tegra: pmc: Add reset sources and levels on Tegra194
Date:   Fri,  8 Nov 2019 16:35:36 +0100
Message-Id: <20191108153536.3157608-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108153536.3157608-1-thierry.reding@gmail.com>
References: <20191108153536.3157608-1-thierry.reding@gmail.com>
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
 drivers/soc/tegra/pmc.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 32b3e8d9155f..63195281718d 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2927,6 +2927,43 @@ static const struct tegra_io_pad_soc tegra194_io_pads[] = {
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
@@ -2949,6 +2986,10 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
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

