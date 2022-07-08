Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F2D56BD6A
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Jul 2022 18:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbiGHPSZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Jul 2022 11:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbiGHPSX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 11:18:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E71371BE5
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=XXF2zWezcBTn6BmeEpOUaiRgGpW/Wb8D7UIg9Td2+Qo=; b=UdE+bCKYqiCu0HVEihmqpKjtzZ
        McnzS3GX745CKugHFDrmV0til/QLq++a2XCGlZOTejiHG3+ZGoAwzzv+fulIKrQatbHZD2ENZY/I/
        BcZB7HURWrzaZ4lqX30UC1AGpPtz4c+pEwk2xVMXwDEiewT59L7G5EBljPjx/vz8BOMQV0kty8qlU
        zGdSck4/bsIhlPPtpTpnBlIRSa55lpfSZ2uDGzM7XLw2kNuqSJ3S2ahPa0kKG2FzDL+plUaIHjfKv
        A3abr5Bdafv/N2E7P3L1U0ugAZyOT/4+VOxlUA51aT8tT/z2oYDljH4s5IEOwAsMmUT75nTz9yKzU
        oR05YgVQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o9pkH-009wYA-Oy; Fri, 08 Jul 2022 18:18:16 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] gpu: host1x: Generalize host1x_cdma_push_wide
Date:   Fri,  8 Jul 2022 18:18:02 +0300
Message-Id: <20220708151803.3064062-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708151803.3064062-1-cyndis@kapsi.fi>
References: <20220708151803.3064062-1-cyndis@kapsi.fi>
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

host1x_cdma_push_wide had the assumptions that the last parameter word
was a NOP opcode, and that NOP opcodes could be used in all situations.

Neither are true with the new job opcode sequence, so adjust the
function to not have these assumptions, and instead place an early
RESTART opcode when necessary to jump back to the beginning of the
pushbuffer.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/cdma.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index bb1f3c746be4..103fda055394 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -615,8 +615,8 @@ void host1x_cdma_push_wide(struct host1x_cdma *cdma, u32 op1, u32 op2,
 	struct host1x_channel *channel = cdma_to_channel(cdma);
 	struct host1x *host1x = cdma_to_host1x(cdma);
 	struct push_buffer *pb = &cdma->push_buffer;
-	unsigned int needed = 2, extra = 0, i;
 	unsigned int space = cdma->slots_free;
+	unsigned int needed = 2, extra = 0;
 
 	if (host1x_debug_trace_cmdbuf)
 		trace_host1x_cdma_push_wide(dev_name(channel->dev), op1, op2,
@@ -634,20 +634,14 @@ void host1x_cdma_push_wide(struct host1x_cdma *cdma, u32 op1, u32 op2,
 	cdma->slots_free = space - needed;
 	cdma->slots_used += needed;
 
-	/*
-	 * Note that we rely on the fact that this is only used to submit wide
-	 * gather opcodes, which consist of 3 words, and they are padded with
-	 * a NOP to avoid having to deal with fractional slots (a slot always
-	 * represents 2 words). The fourth opcode passed to this function will
-	 * therefore always be a NOP.
-	 *
-	 * This works around a slight ambiguity when it comes to opcodes. For
-	 * all current host1x incarnations the NOP opcode uses the exact same
-	 * encoding (0x20000000), so we could hard-code the value here, but a
-	 * new incarnation may change it and break that assumption.
-	 */
-	for (i = 0; i < extra; i++)
-		host1x_pushbuffer_push(pb, op4, op4);
+	if (extra > 0) {
+		/*
+		 * If there isn't enough space at the tail of the pushbuffer,
+		 * insert a RESTART(0) here to go back to the beginning.
+		 * The code above adjusted the indexes appropriately.
+		 */
+		host1x_pushbuffer_push(pb, (0x5 << 28), 0xdead0000);
+	}
 
 	host1x_pushbuffer_push(pb, op1, op2);
 	host1x_pushbuffer_push(pb, op3, op4);
-- 
2.36.1

