Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D81E500848
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Apr 2022 10:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240829AbiDNI21 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 14 Apr 2022 04:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240793AbiDNI2Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Apr 2022 04:28:24 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7153369C8;
        Thu, 14 Apr 2022 01:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr3N1hVHwxl7Aw6iepgHqU57qG2P0blc1s88C9aWGo+NVhdwk7HGBSsgftC7vmsp0fc/+bKrNuASQv+0ORvl9oumZKbuqbuvAmQVEcxPoo4NFdz+2zhSvVURj57lBXcYmq8CHJJzeFMNKtLuduaZ+a0cHzDDYgW494JdFbOyIeooVLJEEKApeouoUDpEdVpX6tx/klrgrpESoXEUyn+t4Z/olzgRz11+QuUy9kO+EhcDAVz5P552c+aX+9uZSzxKfEGYydDVbS3LHY2yMVS15hv2Tmcii2zQmWzSNy14Bv1UYBYuqhywN/n4bN8G4l9C+mGRWvlCF26z7YfLLKZjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B2CmVkVbtscRL6V/wPTTrjTas3SM0Y10J6ywc7ceEg=;
 b=hNkJNCFl9Prw+ns3LdQA995Zj0oaym+XtWZKFnCjcOMtj8Uu9Vj76ZsCgdAX2Kymm3Z0KhfG32OpWqvXWTJXqephkZ8VUvAxvjS1SALi1GqOszNtp+wTnXqfBCxpCs3Xo7i8mIOQ9o/tD6n7dFI7iBo6vQm2JuDuAoCJ2Ws+f90E+xqKqa6Unn/o+G1eBbfPi+/y7sGA8awZtd1NMTw9L+fBCUowyxOikkpX/5xJXTx+XWN8vpMAmNciesK2rIhfi9J0bXUtbncYNnGcYhYziXBgpTPlm0gFvJZ1QQqh73IwKvSYoMXzgHsTmjgigyCRaL/12uFVK5S/jFjs3Mzvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B2CmVkVbtscRL6V/wPTTrjTas3SM0Y10J6ywc7ceEg=;
 b=kzquMtkTYR1uwRFPOLaJ9tljIEu9ap1DDNamHUnB9Wl8qTZfOwokn9LrHFN4tXaRGXdwmHHwa1QxdaW30tVGsmB0WZizk6mfTjFH1R9CifYx8Gp/hl12+NmWe4CX9Ix2fLoehi2lhY+AfNmWI0EKIp/UY80lYmqQlUzUZS/J468Ts7rNCafxi9/y6ZiDh5udvNWKmfq4D/jrwxmEKqn/AUl9gEIkvPRgOjGt/nhzaGhx2mz4baeCfNV2UrhUao8pWgek1fAYEb1QJnVWGtlTejbifpLWkygbmWUaSHGSC+wgBPHiWjo4MfotjhC9Yh9vRO5lOmPmZa0Vb0WMp53zQA==
Received: from MW4PR03CA0320.namprd03.prod.outlook.com (2603:10b6:303:dd::25)
 by DM6PR12MB3771.namprd12.prod.outlook.com (2603:10b6:5:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 08:25:57 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::c2) by MW4PR03CA0320.outlook.office365.com
 (2603:10b6:303:dd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Thu, 14 Apr 2022 08:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 08:25:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 14 Apr
 2022 08:25:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 01:25:54 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 14 Apr 2022 01:25:49 -0700
From:   Kartik <kkartik@nvidia.com>
To:     <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
        <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <spujar@nvidia.com>, <akhilrajeev@nvidia.com>,
        <rgumasta@nvidia.com>, <pshete@nvidia.com>, <vidyas@nvidia.com>,
        <mperttunen@nvidia.com>, <mkumard@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <kkartik@nvidia.com>
Subject: [PATCH 2/6] clocksource: Add Tegra186 timers support
Date:   Thu, 14 Apr 2022 13:55:34 +0530
Message-ID: <1649924738-17990-3-git-send-email-kkartik@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649924738-17990-1-git-send-email-kkartik@nvidia.com>
References: <1649924738-17990-1-git-send-email-kkartik@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b5ed4de-f99f-4fef-a751-08da1df065f8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3771:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3771F217973CEC26872967DBCDEF9@DM6PR12MB3771.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hp3mDiG0aKV7JsJSqRUU3HpG/oiJvXnok+YjR96FDzrMeIPjOoj0Wzs9XzNGdYuQJNr7cXBv/+OOp0iH4oLHMxQuiyfP+RN0xIdpSyB4WEAxXrMVWVAmrt+juAvS/8Ld3s1XxIKMHnaywK7sySQaa44G8ZrvWObZUQ7xOKms7+oWNIeOTBTxPsPwXiR57+3w5hSlNsdsb5bqJlhPn3697aYu4bIlVlwjKdE9afE1WFJGpS/6CeTDT6pr7vmmgLi5ihnQywWuAlsIbicWPNe5yZBotuomireQXByicMxBmyErI5cA7wpYA1iKm0O/T7T43WslR+vbC8+I1+8QbIxgVu9vJXxstAA5FG+5n3AMWe74blDXBYTun25Aov2OqpkjeA2q2sSU+d/ZPNXx1jJDcmOIMFiGkRkwEh+CYiJcVZdKbgQlmil9Z/eTzH50sgruUYO6aGsqCnuvB9gZcRu7Gg6+PBqdbxViM7p+1i01JWAIJE7gnXrQ1TNdqeeAzKgaQMtow6bWPnBobtCA2gzyl0779ZmyzxZVV6GIMAJE1NSHUaF9B98uJaeqjCYCBac3PoKM7RKCKD+ylIN6QER+Gcx4IezeBHLezRHeGIhddCTef+fnlmbgiugK/8PdD3lh7tk+aluO/RGSFnqLxCOLDyrGzJvlGqcXWWNEoMQu8Ff1O7hB+SKeS/GLMmlvAT3fFtuvC6KG8orqYNnwxWGKi1qTTEs8pX0bDiGqmJ2N6UE=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(110136005)(82310400005)(6666004)(7696005)(426003)(26005)(70586007)(8936002)(70206006)(86362001)(8676002)(36860700001)(508600001)(5660300002)(316002)(36756003)(40460700003)(30864003)(83380400001)(7049001)(2616005)(2906002)(186003)(921005)(356005)(336012)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 08:25:56.5403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5ed4de-f99f-4fef-a751-08da1df065f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3771
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently this only supports a single watchdog, which uses a timer in
the background for countdown. Eventually the timers could be used for
various time-keeping tasks, but by default the architected timer will
already provide that functionality.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Kartik <kkartik@nvidia.com>
---
 drivers/clocksource/Kconfig          |   8 +
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/timer-tegra186.c | 508 +++++++++++++++++++++++++++
 3 files changed, 517 insertions(+)
 create mode 100644 drivers/clocksource/timer-tegra186.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fe3f05dfafd9..c68ecafc6ad1 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -150,6 +150,14 @@ config TEGRA_TIMER
 	help
 	  Enables support for the Tegra driver.
 
+config TEGRA186_TIMER
+	tristate "NVIDIA Tegra186 timer driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on WATCHDOG && WATCHDOG_CORE
+	help
+	  Enables support for the timers and watchdogs found on NVIDIA
+	  Tegra186 and later SoCs.
+
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 833cfb7a96c1..a917811443d1 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SUN4I_TIMER)	+= timer-sun4i.o
 obj-$(CONFIG_SUN5I_HSTIMER)	+= timer-sun5i.o
 obj-$(CONFIG_MESON6_TIMER)	+= timer-meson6.o
 obj-$(CONFIG_TEGRA_TIMER)	+= timer-tegra.o
+obj-$(CONFIG_TEGRA186_TIMER)	+= timer-tegra186.o
 obj-$(CONFIG_VT8500_TIMER)	+= timer-vt8500.o
 obj-$(CONFIG_NSPIRE_TIMER)	+= timer-zevio.o
 obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
new file mode 100644
index 000000000000..4515517c87a5
--- /dev/null
+++ b/drivers/clocksource/timer-tegra186.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
+ */
+
+#include <linux/clocksource.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/watchdog.h>
+
+/* shared registers */
+#define TKETSC0 0x000
+#define TKETSC1 0x004
+#define TKEUSEC 0x008
+#define TKEOSC  0x00c
+
+#define TKEIE(x) (0x100 + ((x) * 4))
+#define  TKEIE_WDT_MASK(x, y) ((y) << (16 + 4 * (x)))
+
+/* timer registers */
+#define TMRCR 0x000
+#define  TMRCR_ENABLE BIT(31)
+#define  TMRCR_PERIODIC BIT(30)
+#define  TMRCR_PTV(x) ((x) & 0x0fffffff)
+
+#define TMRSR 0x004
+#define  TMRSR_INTR_CLR BIT(30)
+
+#define TMRCSSR 0x008
+#define  TMRCSSR_SRC_USEC (0 << 0)
+
+/* watchdog registers */
+#define WDTCR 0x000
+#define  WDTCR_SYSTEM_POR_RESET_ENABLE BIT(16)
+#define  WDTCR_SYSTEM_DEBUG_RESET_ENABLE BIT(15)
+#define  WDTCR_REMOTE_INT_ENABLE BIT(14)
+#define  WDTCR_LOCAL_FIQ_ENABLE BIT(13)
+#define  WDTCR_LOCAL_INT_ENABLE BIT(12)
+#define  WDTCR_PERIOD_MASK (0xff << 4)
+#define  WDTCR_PERIOD(x) (((x) & 0xff) << 4)
+#define  WDTCR_TIMER_SOURCE_MASK 0xf
+#define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
+
+#define WDTCMDR 0x008
+#define  WDTCMDR_DISABLE_COUNTER BIT(1)
+#define  WDTCMDR_START_COUNTER BIT(0)
+
+#define WDTUR 0x00c
+#define  WDTUR_UNLOCK_PATTERN 0x0000c45a
+
+struct tegra186_timer_soc {
+	unsigned int num_timers;
+	unsigned int num_wdts;
+};
+
+struct tegra186_tmr {
+	struct tegra186_timer *parent;
+	void __iomem *regs;
+	unsigned int index;
+	unsigned int hwirq;
+};
+
+struct tegra186_wdt {
+	struct watchdog_device base;
+
+	void __iomem *regs;
+	unsigned int index;
+	bool locked;
+
+	struct tegra186_tmr *tmr;
+};
+
+static inline struct tegra186_wdt *to_tegra186_wdt(struct watchdog_device *wdd)
+{
+	return container_of(wdd, struct tegra186_wdt, base);
+}
+
+struct tegra186_timer {
+	const struct tegra186_timer_soc *soc;
+	struct device *dev;
+	void __iomem *regs;
+
+	struct tegra186_wdt *wdt;
+	struct clocksource usec;
+	struct clocksource tsc;
+	struct clocksource osc;
+};
+
+static void tmr_writel(struct tegra186_tmr *tmr, u32 value, unsigned int offset)
+{
+	writel_relaxed(value, tmr->regs + offset);
+}
+
+static void wdt_writel(struct tegra186_wdt *wdt, u32 value, unsigned int offset)
+{
+	writel_relaxed(value, wdt->regs + offset);
+}
+
+static u32 wdt_readl(struct tegra186_wdt *wdt, unsigned int offset)
+{
+	return readl_relaxed(wdt->regs + offset);
+}
+
+static struct tegra186_tmr *tegra186_tmr_create(struct tegra186_timer *tegra,
+						unsigned int index)
+{
+	unsigned int offset = 0x10000 + index * 0x10000;
+	struct tegra186_tmr *tmr;
+
+	tmr = devm_kzalloc(tegra->dev, sizeof(*tmr), GFP_KERNEL);
+	if (!tmr)
+		return ERR_PTR(-ENOMEM);
+
+	tmr->parent = tegra;
+	tmr->regs = tegra->regs + offset;
+	tmr->index = index;
+	tmr->hwirq = 0;
+
+	return tmr;
+}
+
+static const struct watchdog_info tegra186_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.identity = "NVIDIA Tegra186 WDT",
+};
+
+static void tegra186_wdt_disable(struct tegra186_wdt *wdt)
+{
+	/* unlock and disable the watchdog */
+	wdt_writel(wdt, WDTUR_UNLOCK_PATTERN, WDTUR);
+	wdt_writel(wdt, WDTCMDR_DISABLE_COUNTER, WDTCMDR);
+
+	/* disable timer */
+	tmr_writel(wdt->tmr, 0, TMRCR);
+}
+
+static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
+{
+	struct tegra186_timer *tegra = wdt->tmr->parent;
+	u32 value;
+
+	/* unmask hardware IRQ, this may have been lost across powergate */
+	value = TKEIE_WDT_MASK(wdt->index, 1);
+	writel(value, tegra->regs + TKEIE(wdt->tmr->hwirq));
+
+	/* clear interrupt */
+	tmr_writel(wdt->tmr, TMRSR_INTR_CLR, TMRSR);
+
+	/* select microsecond source */
+	tmr_writel(wdt->tmr, TMRCSSR_SRC_USEC, TMRCSSR);
+
+	/* configure timer (system reset happens on the fifth expiration) */
+	value = TMRCR_PTV(wdt->base.timeout * USEC_PER_SEC / 5) |
+		TMRCR_PERIODIC | TMRCR_ENABLE;
+	tmr_writel(wdt->tmr, value, TMRCR);
+
+	if (!wdt->locked) {
+		value = wdt_readl(wdt, WDTCR);
+
+		/* select the proper timer source */
+		value &= ~WDTCR_TIMER_SOURCE_MASK;
+		value |= WDTCR_TIMER_SOURCE(wdt->tmr->index);
+
+		/* single timer period since that's already configured */
+		value &= ~WDTCR_PERIOD_MASK;
+		value |= WDTCR_PERIOD(1);
+
+		/* enable local interrupt for WDT petting */
+		value |= WDTCR_LOCAL_INT_ENABLE;
+
+		/* enable local FIQ and remote interrupt for debug dump */
+		if (0)
+			value |= WDTCR_REMOTE_INT_ENABLE |
+				 WDTCR_LOCAL_FIQ_ENABLE;
+
+		/* enable system debug reset (doesn't properly reboot) */
+		if (0)
+			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
+
+		/* enable system POR reset */
+		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
+
+		wdt_writel(wdt, value, WDTCR);
+	}
+
+	wdt_writel(wdt, WDTCMDR_START_COUNTER, WDTCMDR);
+}
+
+static int tegra186_wdt_start(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+
+	tegra186_wdt_enable(wdt);
+
+	return 0;
+}
+
+static int tegra186_wdt_stop(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+
+	tegra186_wdt_disable(wdt);
+
+	return 0;
+}
+
+static int tegra186_wdt_ping(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+
+	tegra186_wdt_disable(wdt);
+	tegra186_wdt_enable(wdt);
+
+	return 0;
+}
+
+static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
+				    unsigned int timeout)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+
+	if (watchdog_active(&wdt->base))
+		tegra186_wdt_disable(wdt);
+
+	wdt->base.timeout = timeout;
+
+	if (watchdog_active(&wdt->base))
+		tegra186_wdt_enable(wdt);
+
+	return 0;
+}
+
+static const struct watchdog_ops tegra186_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = tegra186_wdt_start,
+	.stop = tegra186_wdt_stop,
+	.ping = tegra186_wdt_ping,
+	.set_timeout = tegra186_wdt_set_timeout,
+};
+
+static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
+						unsigned int index)
+{
+	unsigned int offset = 0x10000, source;
+	struct tegra186_wdt *wdt;
+	u32 value;
+	int err;
+
+	offset += tegra->soc->num_timers * 0x10000 + index * 0x10000;
+
+	wdt = devm_kzalloc(tegra->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return ERR_PTR(-ENOMEM);
+
+	wdt->regs = tegra->regs + offset;
+	wdt->index = index;
+
+	/* read the watchdog configuration since it might be locked down */
+	value = wdt_readl(wdt, WDTCR);
+
+	if (value & WDTCR_LOCAL_INT_ENABLE)
+		wdt->locked = true;
+
+	source = value & WDTCR_TIMER_SOURCE_MASK;
+
+	wdt->tmr = tegra186_tmr_create(tegra, source);
+	if (IS_ERR(wdt->tmr))
+		return ERR_CAST(wdt->tmr);
+
+	wdt->base.info = &tegra186_wdt_info;
+	wdt->base.ops = &tegra186_wdt_ops;
+	wdt->base.min_timeout = 1;
+	wdt->base.max_timeout = 255;
+	wdt->base.parent = tegra->dev;
+
+	err = watchdog_init_timeout(&wdt->base, 5, tegra->dev);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to initialize timeout: %d\n", err);
+		return ERR_PTR(err);
+	}
+
+	err = devm_watchdog_register_device(tegra->dev, &wdt->base);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to register WDT: %d\n", err);
+		return ERR_PTR(err);
+	}
+
+	return wdt;
+}
+
+static u64 tegra186_timer_tsc_read(struct clocksource *cs)
+{
+	struct tegra186_timer *tegra = container_of(cs, struct tegra186_timer,
+						    tsc);
+	u32 hi, lo, ss;
+
+	hi = readl_relaxed(tegra->regs + TKETSC1);
+
+	/*
+	 * The 56-bit value of the TSC is spread across two registers that are
+	 * not synchronized. In order to read them atomically, ensure that the
+	 * high 24 bits match before and after reading the low 32 bits.
+	 */
+	do {
+		/* snapshot the high 24 bits */
+		ss = hi;
+
+		lo = readl_relaxed(tegra->regs + TKETSC0);
+		hi = readl_relaxed(tegra->regs + TKETSC1);
+	} while (hi != ss);
+
+	return (u64)hi << 32 | lo;
+}
+
+static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
+{
+	tegra->tsc.name = "tsc";
+	tegra->tsc.rating = 300;
+	tegra->tsc.read = tegra186_timer_tsc_read;
+	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
+	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	return clocksource_register_hz(&tegra->tsc, 31250000);
+}
+
+static u64 tegra186_timer_osc_read(struct clocksource *cs)
+{
+	struct tegra186_timer *tegra = container_of(cs, struct tegra186_timer,
+						    osc);
+
+	return readl_relaxed(tegra->regs + TKEOSC);
+}
+
+static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
+{
+	tegra->osc.name = "osc";
+	tegra->osc.rating = 300;
+	tegra->osc.read = tegra186_timer_osc_read;
+	tegra->osc.mask = CLOCKSOURCE_MASK(32);
+	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	return clocksource_register_hz(&tegra->osc, 38400000);
+}
+
+static u64 tegra186_timer_usec_read(struct clocksource *cs)
+{
+	struct tegra186_timer *tegra = container_of(cs, struct tegra186_timer,
+						    usec);
+
+	return readl_relaxed(tegra->regs + TKEUSEC);
+}
+
+static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
+{
+	tegra->usec.name = "usec";
+	tegra->usec.rating = 300;
+	tegra->usec.read = tegra186_timer_usec_read;
+	tegra->usec.mask = CLOCKSOURCE_MASK(32);
+	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
+}
+
+static irqreturn_t tegra186_timer_irq(int irq, void *data)
+{
+	struct tegra186_timer *tegra = data;
+
+	if (watchdog_active(&tegra->wdt->base)) {
+		tegra186_wdt_disable(tegra->wdt);
+		tegra186_wdt_enable(tegra->wdt);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int tegra186_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra186_timer *tegra;
+	unsigned int irq;
+	int err;
+
+	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
+	if (!tegra)
+		return -ENOMEM;
+
+	tegra->soc = of_device_get_match_data(dev);
+	dev_set_drvdata(dev, tegra);
+	tegra->dev = dev;
+
+	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tegra->regs))
+		return PTR_ERR(tegra->regs);
+
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+
+	irq = err;
+
+	/* create a watchdog using a preconfigured timer */
+	tegra->wdt = tegra186_wdt_create(tegra, 0);
+	if (IS_ERR(tegra->wdt)) {
+		err = PTR_ERR(tegra->wdt);
+		dev_err(dev, "failed to create WDT: %d\n", err);
+		return err;
+	}
+
+	err = tegra186_timer_tsc_init(tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to register TSC counter: %d\n", err);
+		return err;
+	}
+
+	err = tegra186_timer_osc_init(tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to register OSC counter: %d\n", err);
+		goto unregister_tsc;
+	}
+
+	err = tegra186_timer_usec_init(tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to register USEC counter: %d\n", err);
+		goto unregister_osc;
+	}
+
+	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
+			       "tegra186-timer", tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
+		goto unregister_usec;
+	}
+
+	return 0;
+
+unregister_usec:
+	clocksource_unregister(&tegra->usec);
+unregister_osc:
+	clocksource_unregister(&tegra->osc);
+unregister_tsc:
+	clocksource_unregister(&tegra->tsc);
+	return err;
+}
+
+static int tegra186_timer_remove(struct platform_device *pdev)
+{
+	struct tegra186_timer *tegra = platform_get_drvdata(pdev);
+
+	clocksource_unregister(&tegra->usec);
+	clocksource_unregister(&tegra->osc);
+	clocksource_unregister(&tegra->tsc);
+
+	return 0;
+}
+
+static int __maybe_unused tegra186_timer_suspend(struct device *dev)
+{
+	struct tegra186_timer *tegra = dev_get_drvdata(dev);
+
+	if (watchdog_active(&tegra->wdt->base))
+		tegra186_wdt_disable(tegra->wdt);
+
+	return 0;
+}
+
+static int __maybe_unused tegra186_timer_resume(struct device *dev)
+{
+	struct tegra186_timer *tegra = dev_get_drvdata(dev);
+
+	if (watchdog_active(&tegra->wdt->base))
+		tegra186_wdt_enable(tegra->wdt);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tegra186_timer_pm_ops, tegra186_timer_suspend,
+			 tegra186_timer_resume);
+
+static const struct tegra186_timer_soc tegra186_timer = {
+	.num_timers = 10,
+	.num_wdts = 3,
+};
+
+static const struct of_device_id tegra186_timer_of_match[] = {
+	{ .compatible = "nvidia,tegra186-timer", .data = &tegra186_timer },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra186_timer_of_match);
+
+static struct platform_driver tegra186_wdt_driver = {
+	.driver = {
+		.name = "tegra186-timer",
+		.pm = &tegra186_timer_pm_ops,
+		.of_match_table = tegra186_timer_of_match,
+	},
+	.probe = tegra186_timer_probe,
+	.remove = tegra186_timer_remove,
+};
+module_platform_driver(tegra186_wdt_driver);
+
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra186 timers driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

