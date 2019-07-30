Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE57AEA4
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jul 2019 18:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfG3Q6z (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jul 2019 12:58:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35432 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbfG3Q6b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jul 2019 12:58:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id y4so66582597wrm.2;
        Tue, 30 Jul 2019 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZWQH59p1BAhtVxgjPSmUyGH/iZiK4gbSDXkFIng0cVs=;
        b=P+3HNWsr+m/ftVLVO1dz1uXoXDvRuOu3uq6j+K347Y1hu090sNzOjfra10Ov4u2B+G
         dXwV8PDbcVt3jllyDV6IH/XFOlOs5jNfwri1pWqxD+cH6XBvj5D/hwEtrQoYoYX7VL+R
         XjW/lhr5mVRUlMpaxL0J1lARkWglG40T5Ex9z6mRLNPCbNVho5aE3iXYWsWwT/U3hMyc
         YRf7nmiYg4DcKNatWNHwvpepiEolZB6JCTNDU5GvAW4QxrwVbc8fW3UTBIvWsdkLp01/
         sNIMJISOjtTr3MBDm04+5nckfiARNcnbGINdroq14Xs24/Dz4DZXqNyJJNwTlrNYkgAe
         m2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZWQH59p1BAhtVxgjPSmUyGH/iZiK4gbSDXkFIng0cVs=;
        b=FltNoqzSVzMpShKh53paBNh/tZ3ql2N9oKymwk5fdm5zL/HhXcg4s89SY8Lt2q0ygC
         UWNkADsmd+ZklGdFI0nOdlFKfIMch/LbQuyMRElWe0GuAi/xMLktpAIQB90Axeo7qAET
         YArRK2CYtcf+zdUcKo74K1/LHStn+A8LZDzHjVY8kLhwe/MjFueNYbqIzdwx7eHchy+s
         Q/QlYvZxdZXNYNZMOxwATsr1bdxwOHCFCwhpaZirVuFFCIVt7qBkNhRJeVr32inPYgAp
         AWUIcRY5iN96ZjI8yNWKvgxkahCA76c2qPN2HcgV692nr+J12PTCZfYGkeuGVFwvwKn0
         VvTw==
X-Gm-Message-State: APjAAAVIQOKnBLwHw/uObNMiuLmSlLA4JTEjWbUTFtf+pTgQR0XcEHxs
        KYnP3nh5RNnlEzy3oFOH22Q=
X-Google-Smtp-Source: APXvYqwRrEGjNdV+jFeLa0ewFGNOy3UkiM8ZnLkCJ+VxwFJHxWUuULS46ujbKnA0WPOkAtBxr+QIRg==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr19169346wrt.182.1564505908510;
        Tue, 30 Jul 2019 09:58:28 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.gmail.com with ESMTPSA id r5sm70845040wmh.35.2019.07.30.09.58.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 09:58:28 -0700 (PDT)
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
Subject: [PATCH v9 14/15] memory: tegra: Consolidate registers definition into common header
Date:   Tue, 30 Jul 2019 19:56:17 +0300
Message-Id: <20190730165618.10122-15-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730165618.10122-1-digetx@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Memory Controller registers definition is sparse and duplicated,
let's consolidate everything into a common place for consistency.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c       | 30 -------------------
 drivers/memory/tegra/mc.h       | 52 +++++++++++++++++++++++++++++----
 drivers/memory/tegra/tegra124.c | 20 -------------
 drivers/memory/tegra/tegra30.c  | 19 ------------
 4 files changed, 47 insertions(+), 74 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 1bad7f238881..955f1d3f6b6a 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -18,36 +18,6 @@
 
 #include "mc.h"
 
-#define MC_INTSTATUS 0x000
-
-#define MC_INTMASK 0x004
-
-#define MC_ERR_STATUS 0x08
-#define  MC_ERR_STATUS_TYPE_SHIFT 28
-#define  MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE (6 << MC_ERR_STATUS_TYPE_SHIFT)
-#define  MC_ERR_STATUS_TYPE_MASK (0x7 << MC_ERR_STATUS_TYPE_SHIFT)
-#define  MC_ERR_STATUS_READABLE (1 << 27)
-#define  MC_ERR_STATUS_WRITABLE (1 << 26)
-#define  MC_ERR_STATUS_NONSECURE (1 << 25)
-#define  MC_ERR_STATUS_ADR_HI_SHIFT 20
-#define  MC_ERR_STATUS_ADR_HI_MASK 0x3
-#define  MC_ERR_STATUS_SECURITY (1 << 17)
-#define  MC_ERR_STATUS_RW (1 << 16)
-
-#define MC_ERR_ADR 0x0c
-
-#define MC_GART_ERROR_REQ		0x30
-#define MC_DECERR_EMEM_OTHERS_STATUS	0x58
-#define MC_SECURITY_VIOLATION_STATUS	0x74
-
-#define MC_EMEM_ARB_CFG 0x90
-#define  MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)	(((x) & 0x1ff) << 0)
-#define  MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK	0x1ff
-#define MC_EMEM_ARB_MISC0 0xd8
-
-#define MC_EMEM_ADR_CFG 0x54
-#define MC_EMEM_ADR_CFG_EMEM_NUMDEV BIT(0)
-
 static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	{ .compatible = "nvidia,tegra20-mc-gart", .data = &tegra20_mc_soc },
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index cd52628c2b96..957c6eb74ff9 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -12,6 +12,37 @@
 
 #include <soc/tegra/mc.h>
 
+#define MC_INTSTATUS					0x00
+#define MC_INTMASK					0x04
+#define MC_ERR_STATUS					0x08
+#define MC_ERR_ADR					0x0c
+#define MC_GART_ERROR_REQ				0x30
+#define MC_EMEM_ADR_CFG					0x54
+#define MC_DECERR_EMEM_OTHERS_STATUS			0x58
+#define MC_SECURITY_VIOLATION_STATUS			0x74
+#define MC_EMEM_ARB_CFG					0x90
+#define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_EMEM_ARB_TIMING_RCD				0x98
+#define MC_EMEM_ARB_TIMING_RP				0x9c
+#define MC_EMEM_ARB_TIMING_RC				0xa0
+#define MC_EMEM_ARB_TIMING_RAS				0xa4
+#define MC_EMEM_ARB_TIMING_FAW				0xa8
+#define MC_EMEM_ARB_TIMING_RRD				0xac
+#define MC_EMEM_ARB_TIMING_RAP2PRE			0xb0
+#define MC_EMEM_ARB_TIMING_WAP2PRE			0xb4
+#define MC_EMEM_ARB_TIMING_R2R				0xb8
+#define MC_EMEM_ARB_TIMING_W2W				0xbc
+#define MC_EMEM_ARB_TIMING_R2W				0xc0
+#define MC_EMEM_ARB_TIMING_W2R				0xc4
+#define MC_EMEM_ARB_DA_TURNS				0xd0
+#define MC_EMEM_ARB_DA_COVERS				0xd4
+#define MC_EMEM_ARB_MISC0				0xd8
+#define MC_EMEM_ARB_MISC1				0xdc
+#define MC_EMEM_ARB_RING1_THROTTLE			0xe0
+#define MC_EMEM_ARB_OVERRIDE				0xe8
+#define MC_TIMING_CONTROL_DBG				0xf8
+#define MC_TIMING_CONTROL				0xfc
+
 #define MC_INT_DECERR_MTS				BIT(16)
 #define MC_INT_SECERR_SEC				BIT(13)
 #define MC_INT_DECERR_VPR				BIT(12)
@@ -22,17 +53,28 @@
 #define MC_INT_INVALID_GART_PAGE			BIT(7)
 #define MC_INT_DECERR_EMEM				BIT(6)
 
-#define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_ERR_STATUS_TYPE_SHIFT			28
+#define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
+#define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
+#define MC_ERR_STATUS_READABLE				BIT(27)
+#define MC_ERR_STATUS_WRITABLE				BIT(26)
+#define MC_ERR_STATUS_NONSECURE				BIT(25)
+#define MC_ERR_STATUS_ADR_HI_SHIFT			20
+#define MC_ERR_STATUS_ADR_HI_MASK			0x3
+#define MC_ERR_STATUS_SECURITY				BIT(17)
+#define MC_ERR_STATUS_RW				BIT(16)
+
+#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
+
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
+
 #define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
 #define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
 #define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
 
-#define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
 
-#define MC_TIMING_CONTROL_DBG				0xf8
-
-#define MC_TIMING_CONTROL				0xfc
 #define MC_TIMING_UPDATE				BIT(0)
 
 static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 5d0ccb2be206..4d80c81a4581 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -10,26 +10,6 @@
 
 #include "mc.h"
 
-#define MC_EMEM_ARB_CFG				0x90
-#define MC_EMEM_ARB_OUTSTANDING_REQ		0x94
-#define MC_EMEM_ARB_TIMING_RCD			0x98
-#define MC_EMEM_ARB_TIMING_RP			0x9c
-#define MC_EMEM_ARB_TIMING_RC			0xa0
-#define MC_EMEM_ARB_TIMING_RAS			0xa4
-#define MC_EMEM_ARB_TIMING_FAW			0xa8
-#define MC_EMEM_ARB_TIMING_RRD			0xac
-#define MC_EMEM_ARB_TIMING_RAP2PRE		0xb0
-#define MC_EMEM_ARB_TIMING_WAP2PRE		0xb4
-#define MC_EMEM_ARB_TIMING_R2R			0xb8
-#define MC_EMEM_ARB_TIMING_W2W			0xbc
-#define MC_EMEM_ARB_TIMING_R2W			0xc0
-#define MC_EMEM_ARB_TIMING_W2R			0xc4
-#define MC_EMEM_ARB_DA_TURNS			0xd0
-#define MC_EMEM_ARB_DA_COVERS			0xd4
-#define MC_EMEM_ARB_MISC0			0xd8
-#define MC_EMEM_ARB_MISC1			0xdc
-#define MC_EMEM_ARB_RING1_THROTTLE		0xe0
-
 static const struct tegra_mc_client tegra124_mc_clients[] = {
 	{
 		.id = 0x00,
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index b1226d3f067f..fdc0b342cf80 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -10,25 +10,6 @@
 
 #include "mc.h"
 
-#define MC_EMEM_ARB_CFG				0x90
-#define MC_EMEM_ARB_OUTSTANDING_REQ		0x94
-#define MC_EMEM_ARB_TIMING_RCD			0x98
-#define MC_EMEM_ARB_TIMING_RP			0x9c
-#define MC_EMEM_ARB_TIMING_RC			0xa0
-#define MC_EMEM_ARB_TIMING_RAS			0xa4
-#define MC_EMEM_ARB_TIMING_FAW			0xa8
-#define MC_EMEM_ARB_TIMING_RRD			0xac
-#define MC_EMEM_ARB_TIMING_RAP2PRE		0xb0
-#define MC_EMEM_ARB_TIMING_WAP2PRE		0xb4
-#define MC_EMEM_ARB_TIMING_R2R			0xb8
-#define MC_EMEM_ARB_TIMING_W2W			0xbc
-#define MC_EMEM_ARB_TIMING_R2W			0xc0
-#define MC_EMEM_ARB_TIMING_W2R			0xc4
-#define MC_EMEM_ARB_DA_TURNS			0xd0
-#define MC_EMEM_ARB_DA_COVERS			0xd4
-#define MC_EMEM_ARB_MISC0			0xd8
-#define MC_EMEM_ARB_RING1_THROTTLE		0xe0
-
 static const unsigned long tegra30_mc_emem_regs[] = {
 	MC_EMEM_ARB_CFG,
 	MC_EMEM_ARB_OUTSTANDING_REQ,
-- 
2.22.0

