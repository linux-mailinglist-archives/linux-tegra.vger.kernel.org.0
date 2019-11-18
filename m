Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D94FFE8B
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 07:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfKRGd5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 01:33:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37533 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfKRGd5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 01:33:57 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so17364207wmj.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 Nov 2019 22:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJ3byi3aLV//wKwRUzx55Fw+IotBkoOqdaPqQTMPHes=;
        b=THMFXlprllbo1gFX6xbZ7rY4S/L01CPp+9urtLofnxT09uwfcbT9Z7n4ZdoYGOuRvL
         4Iz54jkLMwWtT0gZbI8EfC4LxI6OrJUPU1GwDRNgqDlS1+oYCEO3VYDY4XGV4/EINMp8
         +P2VmZ8005nrODaSM70AMAZgoYIBRJpu1yzRGyg6lZy8UhOQuA7hMlSS6vjkShVE+iwt
         it2uoqwEooJ1yqBLDPP1iAV9YgpOTwIQ+gw/JMgasDcfiDUs/lZpJy5f6V7v/9pmC0g5
         NTnmlHEwmsm8xmuWP2ah2o5VZ2Jm+Sdg/Y2+c3w0Ja/LeTQN6VBDamRaq9PpCllgooo0
         NYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJ3byi3aLV//wKwRUzx55Fw+IotBkoOqdaPqQTMPHes=;
        b=XN8Ixx5WYfzzfXEW6sMqKcREVmcHzXikyxxWuvQmd8DensC9VilQX6M3VMgM4+Jbp+
         9yujXUGcv4pbunS02Vo6tIHlhJV+iqB9YHlcnsr73fwR0ZBp9Qidb7u4C8FcEeiqrLTe
         s0b60hx6+YUNwHzAJpHm7c7RVlBBToSq3ZMrBY7jqQ26gR85i5BRSzEb86S9ysqmFgJE
         Vtf//sE09d1tK3Ua6dUuXxf+m2364WlR2w3DQgdMEjlGl4dlFHvu1MtVLjEiKzoy0pJL
         tauaYCmk1kX9BwPg2VPReEMtu97A4EjcSHGuSWq9cP2vSyqIh7SdmvR2DnNOiNHFz9s6
         taWA==
X-Gm-Message-State: APjAAAWHlXHXdzUCRGbF0D74fRDbwYi0sdgrGnusEcn0Ah56+EOKnDgj
        l4stFqroswFKzJWHRz6RClw=
X-Google-Smtp-Source: APXvYqwR9ud3AbyxLQqFItenQjE0lf0R040mQqwAEMUQyNxHtG3prJCfncFiYqvN5iDQJ4Ydxs2TeQ==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr26832378wmb.156.1574058835178;
        Sun, 17 Nov 2019 22:33:55 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w132sm19750386wma.6.2019.11.17.22.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 22:33:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] soc/tegra: pmc: Add reset sources and levels on Tegra194
Date:   Mon, 18 Nov 2019 07:33:48 +0100
Message-Id: <20191118063348.1816857-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118063348.1816857-1-thierry.reding@gmail.com>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
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

