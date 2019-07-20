Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9276EF20
	for <lists+linux-tegra@lfdr.de>; Sat, 20 Jul 2019 12:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfGTKwh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 20 Jul 2019 06:52:37 -0400
Received: from condef-08.nifty.com ([202.248.20.73]:33232 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbfGTKwh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Jul 2019 06:52:37 -0400
X-Greylist: delayed 507 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Jul 2019 06:52:34 EDT
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-08.nifty.com with ESMTP id x6KAeRnP016238
        for <linux-tegra@vger.kernel.org>; Sat, 20 Jul 2019 19:41:22 +0900
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x6KAdjWa009191;
        Sat, 20 Jul 2019 19:39:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x6KAdjWa009191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563619186;
        bh=mcZz3jn7xyQ5IOn7tDEqK+9jIYpqhpvsTuekSTkT8E8=;
        h=From:To:Cc:Subject:Date:From;
        b=OGQfvAdcqdQj+0lggjhXj0Xu2G/Nv0V6R+xYAF1FLnQu0zKAABFL7yOTNOkh0x3sT
         OX+Y0V6D8ZDoo6FMHUhqjgLFWOzsg5JdDdFkH+GoYvXfVECwbVfnlWofCm3L/Yl2Zw
         an2PUa7Hi7kzHTxNG3rtc4ulJiQ+K4+SrN1Q/F9bu+f3N8+BIZsmqHctzjtYMK6RRD
         tpX6YvWiEKiI5a8TvKYhp7r26FDoyQNtk79a1rE0/LkQfHVFJ8GvUPHtbWpP6qczi/
         IG8nPck3L+E2l7oQF0FAtX+XUgCMKJyrsif9OsByTUbZTXJA9M8/Hmxv0pINYznz+G
         x6Q/+o1J+7eoA==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] trace: fix header include guards
Date:   Sat, 20 Jul 2019 19:39:43 +0900
Message-Id: <20190720103943.16982-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

These include guards are broken.

Match the #if !define() and #define lines so that they work correctly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/trace/events/dma_fence.h     | 2 +-
 include/trace/events/napi.h          | 4 ++--
 include/trace/events/qdisc.h         | 4 ++--
 include/trace/events/tegra_apb_dma.h | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 2212adda8f77..64e92d56c6a8 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -2,7 +2,7 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM dma_fence
 
-#if !defined(_TRACE_FENCE_H) || defined(TRACE_HEADER_MULTI_READ)
+#if !defined(_TRACE_DMA_FENCE_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_DMA_FENCE_H
 
 #include <linux/tracepoint.h>
diff --git a/include/trace/events/napi.h b/include/trace/events/napi.h
index f3a12566bed0..6678cf8b235b 100644
--- a/include/trace/events/napi.h
+++ b/include/trace/events/napi.h
@@ -3,7 +3,7 @@
 #define TRACE_SYSTEM napi
 
 #if !defined(_TRACE_NAPI_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_NAPI_H_
+#define _TRACE_NAPI_H
 
 #include <linux/netdevice.h>
 #include <linux/tracepoint.h>
@@ -38,7 +38,7 @@ TRACE_EVENT(napi_poll,
 
 #undef NO_DEV
 
-#endif /* _TRACE_NAPI_H_ */
+#endif /* _TRACE_NAPI_H */
 
 /* This part must be outside protection */
 #include <trace/define_trace.h>
diff --git a/include/trace/events/qdisc.h b/include/trace/events/qdisc.h
index 60d0d8bd336d..0d1a9ebf55ba 100644
--- a/include/trace/events/qdisc.h
+++ b/include/trace/events/qdisc.h
@@ -2,7 +2,7 @@
 #define TRACE_SYSTEM qdisc
 
 #if !defined(_TRACE_QDISC_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_QDISC_H_
+#define _TRACE_QDISC_H
 
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
@@ -44,7 +44,7 @@ TRACE_EVENT(qdisc_dequeue,
 		  __entry->txq_state, __entry->packets, __entry->skbaddr )
 );
 
-#endif /* _TRACE_QDISC_H_ */
+#endif /* _TRACE_QDISC_H */
 
 /* This part must be outside protection */
 #include <trace/define_trace.h>
diff --git a/include/trace/events/tegra_apb_dma.h b/include/trace/events/tegra_apb_dma.h
index 0818f6286110..971cd02d2daf 100644
--- a/include/trace/events/tegra_apb_dma.h
+++ b/include/trace/events/tegra_apb_dma.h
@@ -1,5 +1,5 @@
 #if !defined(_TRACE_TEGRA_APB_DMA_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_TEGRA_APM_DMA_H
+#define _TRACE_TEGRA_APB_DMA_H
 
 #include <linux/tracepoint.h>
 #include <linux/dmaengine.h>
@@ -55,7 +55,7 @@ TRACE_EVENT(tegra_dma_isr,
 	TP_printk("%s: irq %d\n",  __get_str(chan), __entry->irq)
 );
 
-#endif /*  _TRACE_TEGRADMA_H */
+#endif /* _TRACE_TEGRA_APB_DMA_H */
 
 /* This part must be outside protection */
 #include <trace/define_trace.h>
-- 
2.17.1

