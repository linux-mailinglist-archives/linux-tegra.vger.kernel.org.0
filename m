Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BAC52814A
	for <lists+linux-tegra@lfdr.de>; Mon, 16 May 2022 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbiEPKDD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 May 2022 06:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236182AbiEPKCm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 May 2022 06:02:42 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61BE38BC;
        Mon, 16 May 2022 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=jqNVkhlKQgqXtLeAWprMxZosE+nkqym2SEmCMhLQNlc=; b=mNaPe7wMpoDuhyDl8pFtEmAHLc
        5J/HSv3E0VvYnoDCN1P3XTBb5uq4aR6ZPr13BkMXXmOsoQfwEHaqXkpF+tOIZWPnoSLePfm/y6k9U
        J1xafUOOrq9H3tH4ynmj9JGeGTRl0cV/KvdSqWCKsPcM7PJS4aQXDlapvZ3ES5R7PVJcG32zUsgP4
        KFgfXFkb4NGM1/8tc+v4PJk4Cql9acA5S0FMpErqt+EA+2bM2njcc+S8jV5CttDOWNPnDNhjT3+qj
        QsXTP0lU/ncQYyqJGmCfhpM2U75TY/v2s9VNsDI29I1UF78woFEIpE1qiUtTZmCktSW1+/m1XqNat
        taXN6dOw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <cyndis@kapsi.fi>)
        id 1nqXYf-0005yU-I6; Mon, 16 May 2022 13:02:33 +0300
From:   cyndis@kapsi.fi
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v1 06/13] gpu: host1x: Program virtualization tables
Date:   Mon, 16 May 2022 13:02:06 +0300
Message-Id: <20220516100213.1536571-7-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Program virtualization tables specifying which VMs have access to which
Host1x hardware resources. Programming these has become mandatory in
Tegra234.

For now, since the driver does not operate as a Host1x hypervisor, we
basically allow access to everything to everyone.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 21 ++++++++++++++++++---
 drivers/gpu/host1x/dev.h |  8 ++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 8c6ce8014c09..5a57165ab0f6 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -217,7 +217,7 @@ static const struct of_device_id host1x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, host1x_of_match);
 
-static void host1x_setup_sid_table(struct host1x *host)
+static void host1x_setup_virtualization_tables(struct host1x *host)
 {
 	const struct host1x_info *info = host->info;
 	unsigned int i;
@@ -231,6 +231,21 @@ static void host1x_setup_sid_table(struct host1x *host)
 		host1x_hypervisor_writel(host, entry->offset, entry->base);
 		host1x_hypervisor_writel(host, entry->limit, entry->base + 4);
 	}
+
+	for (i = 0; i < info->streamid_vm_table.count; i++) {
+		/* Allow access to all stream IDs to all VMs. */
+		host1x_hypervisor_writel(host, 0xff, info->streamid_vm_table.base + 4 * i);
+	}
+
+	for (i = 0; i < info->classid_vm_table.count; i++) {
+		/* Allow access to all classes to all VMs. */
+		host1x_hypervisor_writel(host, 0xff, info->classid_vm_table.base + 4 * i);
+	}
+
+	for (i = 0; i < info->mmio_vm_table.count; i++) {
+		/* Use VM1 (that's us) as originator VMID for engine MMIO accesses. */
+		host1x_hypervisor_writel(host, 0x1, info->mmio_vm_table.base + 4 * i);
+	}
 }
 
 static bool host1x_wants_iommu(struct host1x *host1x)
@@ -602,7 +617,7 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	return 0;
 
 resume_host1x:
-	host1x_setup_sid_table(host);
+	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
 
@@ -632,7 +647,7 @@ static int __maybe_unused host1x_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	host1x_setup_sid_table(host);
+	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
 
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 85edcc6e0fc7..920e5548cfbc 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -90,6 +90,11 @@ struct host1x_sid_entry {
 	unsigned int limit;
 };
 
+struct host1x_table_desc {
+	unsigned int base;
+	unsigned int count;
+};
+
 struct host1x_info {
 	unsigned int nb_channels; /* host1x: number of channels supported */
 	unsigned int nb_pts; /* host1x: number of syncpoints supported */
@@ -103,6 +108,9 @@ struct host1x_info {
 	bool has_common; /* has common registers separate from hypervisor */
 	unsigned int num_sid_entries;
 	const struct host1x_sid_entry *sid_table;
+	struct host1x_table_desc streamid_vm_table;
+	struct host1x_table_desc classid_vm_table;
+	struct host1x_table_desc mmio_vm_table;
 	/*
 	 * On T20-T148, the boot chain may setup DC to increment syncpoints
 	 * 26/27 on VBLANK. As such we cannot use these syncpoints until
-- 
2.36.1

