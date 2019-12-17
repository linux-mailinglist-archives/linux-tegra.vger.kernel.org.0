Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320D2123663
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Dec 2019 21:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfLQUFU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Dec 2019 15:05:20 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2775 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfLQUER (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Dec 2019 15:04:17 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df934a40001>; Tue, 17 Dec 2019 12:03:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 17 Dec 2019 12:04:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 17 Dec 2019 12:04:16 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 20:04:15 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 20:04:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Dec 2019 20:04:15 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.101]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5df934be0004>; Tue, 17 Dec 2019 12:04:15 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 07/19] dt-bindings: soc: tegra-pmc: Add id for Tegra PMC 32KHz blink clock
Date:   Tue, 17 Dec 2019 12:03:54 -0800
Message-ID: <1576613046-17159-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576613028; bh=x4itCOEFQTqr4Po2PuDtX3OJlZkcnEkwJ110zILFSac=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=P4nSUg6reLMXodgvNC6ayrWyRc/M3esh0xmdyGwzK4zuKPhsEVMZbDQGrfwZbfdH/
         UVWFvRVH8EFwTNI/9/b9x+U0O1cnPvJJjXF1eyJrIUQneXrdeS+VpXok1gj3WWXraX
         jpgJDBh8K6WKmBhr5ddP/kG9oOW1/7m3jlpnmScypSI8RqmeaQei+V8bJZByV6blU8
         hFs2l1lyKSssLWawqvfwLLPwXPhSBCUz4WAM89Q1m+ghCrTo7hnlzZLokJAgNUDts/
         RLYvDbfJivcWRQqPdU5uHd3FRBbE5iHNQmi2nKXdybGRvJZe9ZuGszmVqGjhpUAn+P
         56XFFPxPYoXTQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra PMC has blink functionality that allows 32KHz clock out to
blink pin of the Tegra.

This patch adds id for this blink clock to use for enabling or
disabling blink output through device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/soc/tegra-pmc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
index f7c866404456..a99a457471ee 100644
--- a/include/dt-bindings/soc/tegra-pmc.h
+++ b/include/dt-bindings/soc/tegra-pmc.h
@@ -9,7 +9,8 @@
 #define TEGRA_PMC_CLK_OUT_1		0
 #define TEGRA_PMC_CLK_OUT_2		1
 #define TEGRA_PMC_CLK_OUT_3		2
+#define TEGRA_PMC_CLK_BLINK		3
 
-#define TEGRA_PMC_CLK_MAX		3
+#define TEGRA_PMC_CLK_MAX		4
 
 #endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
-- 
2.7.4

