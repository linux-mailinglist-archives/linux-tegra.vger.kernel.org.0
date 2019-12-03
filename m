Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC0B4110255
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfLCQcH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:32:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36785 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCQcH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:32:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so4486363wru.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EYcVq3D13Cv4p0YNI7vV4r0UyMzhZvJG8/eW5rX0Js=;
        b=M1RiCYW2WNP7GbjFLZELTAtnhtCw8Gpb8OacJDUGjYNnOkqc76EaY7gHlP+UgXvCa1
         GJddsGVbqve62OHibGYMYYB8iPyMKbNgYcxCdXW3el6pAJPj6ARv0LUSCbyzcP/TnTrD
         eTaKuFyO8WaN6LuOcS0vZWE3vxg24NRasxoKICvL2ykDKXGBs2+ABCEV5INxlrKWmr7A
         8sAyAaUyU1xhNNo0o/xOh4JCiBdyGuXYE2TxyGheydfWEb8EeLNrAJehemOH4MgPEH/8
         pa0hmcvKk60hubUMJL7587wLjV0Gh9YIxYFXuNIvY6W+ZJdhpYQVRaqi2chuYThleQ6M
         V+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EYcVq3D13Cv4p0YNI7vV4r0UyMzhZvJG8/eW5rX0Js=;
        b=Dzp6DZlkA88nsIu0j7N6NK5z2q7M2X417/vfTeeWNKOK4FziTRmXf7tNOzNeo0txdJ
         xNciVR8/IuiqXOSgsye+9WYDMctpSRuYY1873SCgNMe+uDC2+acbZnAXIS+h6xz+4YCa
         UjQaGKWjbiMD3E5TCZFTRVSj/F6d1mne2lsiZoXN9zZEYI2lVYVAaY9ilqJMgiFoUGWn
         qdvRRa9pCDkc67854Ugid4eAdQQ1tiW9hyoEAyAmgr5iRr7t2Y6pkL4zjWJ0ovZefo1e
         22WID5yqDig2jWBhc1Wi/VT2J1qQHUiIUJDZ6FJz7gS/4rlDy0V0/lne5RxmE1OUcsrL
         TzEA==
X-Gm-Message-State: APjAAAXzGOoFXl3jbHRm9hV6WCHgv21UuMN+GCxXoO9hubGj2nVmpeQX
        Oq2hhIhWbwT/BptO4wfRctk=
X-Google-Smtp-Source: APXvYqxCJLqegjUn/l5I5qAgvCYWCXdjUUQz8EvWQ8Op1wr04iv9ZZZm3F1PIX8jSwd2TOD6xGCZ4A==
X-Received: by 2002:a05:6000:12ce:: with SMTP id l14mr6580381wrx.342.1575390725033;
        Tue, 03 Dec 2019 08:32:05 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id h17sm4460645wrs.18.2019.12.03.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:32:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] lib/scatterlist: Add contiguous DMA chunks helpers
Date:   Tue,  3 Dec 2019 17:32:01 +0100
Message-Id: <20191203163203.1486837-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a few helpers to count the number of contiguous DMA chunks found in
an SG table. This is useful to determine whether or not a mapping can be
used by drivers whose devices need contiguous memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/scatterlist.h | 11 +++++++++++
 lib/scatterlist.c           | 29 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6eec50fb36c8..51a8416623a9 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -262,6 +262,7 @@ int sg_split(struct scatterlist *in, const int in_mapped_nents,
 	     const size_t *split_sizes,
 	     struct scatterlist **out, int *out_mapped_nents,
 	     gfp_t gfp_mask);
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents);
 
 typedef struct scatterlist *(sg_alloc_fn)(unsigned int, gfp_t);
 typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
@@ -306,6 +307,16 @@ size_t sg_pcopy_to_buffer(struct scatterlist *sgl, unsigned int nents,
 size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 		       size_t buflen, off_t skip);
 
+static inline unsigned int sgt_dma_count_chunks(struct sg_table *sgt)
+{
+	return sg_dma_count_chunks(sgt->sgl, sgt->nents);
+}
+
+static inline bool sgt_dma_contiguous(struct sg_table *sgt)
+{
+	return sgt_dma_count_chunks(sgt) == 1;
+}
+
 /*
  * Maximum number of entries that will be allocated in one piece, if
  * a list larger than this is required then chaining will be utilized.
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index c2cf2c311b7d..4c0d11968f8d 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -142,6 +142,35 @@ void sg_init_one(struct scatterlist *sg, const void *buf, unsigned int buflen)
 }
 EXPORT_SYMBOL(sg_init_one);
 
+/**
+ * sg_dma_count_chunks - return number of contiguous DMA chunks in scatterlist
+ * @sgl: SG table
+ * @nents: number of entries in SG table
+ */
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents)
+{
+	dma_addr_t next = ~(dma_addr_t)0;
+	unsigned int count = 0, i;
+	struct scatterlist *s;
+
+	for_each_sg(sgl, s, nents, i) {
+		/*
+		 * sg_dma_address(s) is only valid for entries that have
+		 * sg_dma_len(s) != 0.
+		 */
+		if (!sg_dma_len(s))
+			continue;
+
+		if (sg_dma_address(s) != next) {
+			next = sg_dma_address(s) + sg_dma_len(s);
+			count++;
+		}
+	}
+
+	return count;
+}
+EXPORT_SYMBOL(sg_dma_count_chunks);
+
 /*
  * The default behaviour of sg_alloc_table() is to use these kmalloc/kfree
  * helpers.
-- 
2.23.0

