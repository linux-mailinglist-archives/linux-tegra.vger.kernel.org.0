Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E90520CC17
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgF2DS7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DS7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF455C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:58 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y18so8225186lfh.11
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SDOxLugkRc98jm7/ARfCzhMETuCaOUFDx45/EJB4D+Q=;
        b=bfBHZ1yogzA+VchQuTWQ0ker0M7Ji52RzCTwoGXm06HNI7t2KEy0ospuNpn1bEfOSw
         c7cI6vm3MJcC9QTkjncuEjp7GI9q3Kqlsgr2MhvKE6ltS/sj/njHE3j6bHDtttpAqogT
         rpy/fKBU+ZGp3BZiEK8sW7pj2sF6oF/oO2Wvdxj0EK+EF3kah1BKYf2SZnQxPzBFpkkL
         S82UVk4ewUdu0eBv+TaWi4sM4vglFiCsYVHJkx1pDzSGgVLIvJuESID8Pwdh3JXXQXQu
         ws/X5bvJrLAmGDdMoisRvW+V+pKq1JvwxrR7+D4dNalMbSAPVsz1MlVUb5Y54+QjPPRl
         1glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SDOxLugkRc98jm7/ARfCzhMETuCaOUFDx45/EJB4D+Q=;
        b=nBhtBMFTLA9zaFs5N31I2ygHnydjp8gcEr48no7snjgSWHDmZ5UnXlYfu+xBKYYv2K
         12QEkrqk2exz29QI+fOtjuyuEONmWQadbT9oayi6qbu5RR4dOO1mTbjW86IDIkCfn4RX
         VQ3rfBumcePHShMTjo6tFNQMe6ZZTUUKknM+Bjpqa5Dq2nDGbWyVDujK24vZXhpZKUuZ
         ntF/ByBgMlCGOajaLIw6Zvzg62wuWO/+M9/L/GB02pvGwAQUM0+S0M4i5NDFSw4oo42v
         /ppqe5mdcsXSvyilQYiFcXvr/UzBHnZ1OLvLL12vVe/wjzkVGm0FmuFDtWM1pItwAfgK
         bkQA==
X-Gm-Message-State: AOAM531ez7Gf025OxoAcNemekpAa5E5c5Ql1pmvjJGV4KcCSfjCIZ73O
        uXLvAGKlxP+LqQAMW7WdKJE=
X-Google-Smtp-Source: ABdhPJyyQwfSCzRkdvYbrlKjQwQFxvBehxFedIbbhc6doEWkZGUOabFsSpUXNuMFOVNEocXvmKZUUw==
X-Received: by 2002:ac2:5593:: with SMTP id v19mr8025383lfg.43.1593400737514;
        Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/6] gpu: host1x: debug: Dump push buffer state
Date:   Mon, 29 Jun 2020 06:18:42 +0300
Message-Id: <20200629031842.32463-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When job hangs and there is a memory error pointing at channel's push
buffer, it is very handy to know the push buffer's state. This patch
makes the push buffer's state to be dumped into KMSG in addition to the
job's gathers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/hw/debug_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 02125842071c..f31bcfa1b837 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -192,8 +192,14 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
 
 static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 {
+	struct push_buffer *pb = &cdma->push_buffer;
 	struct host1x_job *job;
 
+	host1x_debug_output(o, "PUSHBUF at %pad, %u words\n",
+			    &pb->dma, pb->size / 4);
+
+	show_gather(o, pb->dma, pb->size / 4, cdma, pb->dma, pb->mapped);
+
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		unsigned int i;
 
-- 
2.26.0

