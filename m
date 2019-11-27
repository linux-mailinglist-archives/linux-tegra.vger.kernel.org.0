Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2191410A996
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Nov 2019 06:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfK0E7i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 26 Nov 2019 23:59:38 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17820 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfK0E7h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Nov 2019 23:59:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dde02bc0000>; Tue, 26 Nov 2019 20:59:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 26 Nov 2019 20:59:37 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 26 Nov 2019 20:59:37 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 04:59:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 27 Nov 2019 04:59:36 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.169.149]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dde02b70001>; Tue, 26 Nov 2019 20:59:36 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <allison@lohutok.net>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <mturquette@baylibre.com>,
        <horms+renesas@verge.net.au>, <Jisheng.Zhang@synaptics.com>,
        <krzk@kernel.org>, <arnd@arndb.de>, <spujar@nvidia.com>,
        <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: soc: tegra-pmc: Add Tegra PMC clock ids
Date:   Tue, 26 Nov 2019 20:59:23 -0800
Message-ID: <1574830773-14892-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574830780; bh=nBZ2jL8Xbzw6bstXTbwfBSRgB9PAmA4jf6nyPDEPCRc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=R6F/juMBDC5JvDEQMfAH+uKMwWRutAxkRwb8YDJSR0vOaS9LYczxm0AnMISORdbNf
         lRW7FdnIMuDG2pDCFBWI3qvd1Y/Bra3F4TqxZJ5jjAA/mT3pqYNAMVw1chOny/yJb7
         i6+ofLF+6TkPIuKKMfselmR8PQq5uxGYqaI98uKAq29BmHA/7pZUV4fkSOF2BJAvTT
         yoheccWEKfKVD3Pncs5fQBl6KZRr7vSnFnvbrNkGQbFslregFhi30MD/LB16P3pskI
         LdK+Uzezxj5mQcAFfZJHcdLte+pkjpR9qm7vdy6bTEPE433J5g2XkSuESYILW3sO1V
         ITIkievKrV+2Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra PMC has clk_out_1, clk_out_2, clk_out_3 clocks and each of
these clocks has mux and a gate as a part of PMC controller.

This patch adds ids for each of these PMC clock mux and gates to
use with the devicetree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/soc/tegra-pmc.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
new file mode 100644
index 000000000000..705ee8083070
--- /dev/null
+++ b/include/dt-bindings/soc/tegra-pmc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019-2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_SOC_TEGRA_PMC_H
+#define _DT_BINDINGS_SOC_TEGRA_PMC_H
+
+#define TEGRA_PMC_CLK_OUT_1_MUX		0
+#define TEGRA_PMC_CLK_OUT_1		1
+#define TEGRA_PMC_CLK_OUT_2_MUX		2
+#define TEGRA_PMC_CLK_OUT_2		3
+#define TEGRA_PMC_CLK_OUT_3_MUX		4
+#define TEGRA_PMC_CLK_OUT_3		5
+
+#define TEGRA_PMC_CLK_MAX		6
+
+#endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
-- 
2.7.4

