Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D488F1E0149
	for <lists+linux-tegra@lfdr.de>; Sun, 24 May 2020 19:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387903AbgEXRwu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 May 2020 13:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387913AbgEXRwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 May 2020 13:52:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821B1C061A0E
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z6so18359973ljm.13
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VRiXq9jvD5cunzbI/cTlKdAeJSiGSMflTkILhjo8iJU=;
        b=Y7mar+F7PxVh1S2w9HVLeu0mYCxQga2HQ7WLa/UHBXgqumDOX5nbwSU24FoeJXNXxn
         OiwLSvl6TmcY+W6PwaPPReq4X1wIto+8ki2zQDo1JtAOXJrK2iqF1Wv64iIZ+AIWPyvk
         Gj0UUIzQvmd6n6r3dO4me+iXtl/FZ8ozr1qhrLBkfh2vBOii07nTEXU7lTD+u+72kmF1
         yUM8ek4rAtXDPifI5iWWPYAlrjvXSFNgs3lA2Ah7hBoCGINwcqUlO0Oih5/UdOZkTuW9
         3uuP95ozgIXbzur1s8vL7gC+tMx+eyE0KUUriQgl3vVFNf4RYl3BRSJLOF7vlXVDQ85Z
         uXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VRiXq9jvD5cunzbI/cTlKdAeJSiGSMflTkILhjo8iJU=;
        b=LLc5K9M8Br0cow0afbwBRjggns5uvugnFD73bgIvqr6GmwfvEJw/p0nnBzFpRK7RXi
         kK1m/u1ypfXmIJvxMnb1sUnhMP6lWuD6fMuNBCn3vQrwyC04vUG0ahC90Pq1I7rpq3+r
         ejigcblL/evrhp/4au0dUJ2UQVKxFCkV2BvSxJk1dpSq1wkXw2Rf9prnevSgHVKpO/Jh
         5QbXvbOVXW6FnkwRFb09/pc7JMNW/NwI8Zx8Vak2lQsNjarYhRFh79vIdG7FmT8p0ZS1
         E0wzjUVwJ52crKdaa+2zeT/F3ly03hiiY5AWs0QlewYuXe2sezTSYM1xNb/QxuCNQxgC
         AHbA==
X-Gm-Message-State: AOAM530WcyBkDVtTkqrkG7WTIcxANjTFgM34TpsYu0uvc/MogFecivIo
        YkQ8ea8N3LelI2xKsBtgy8o=
X-Google-Smtp-Source: ABdhPJxxHYozBMeF8YxtfRr0CLbWPcGZeJW1Sz76poXxA9qB7Tx4z89RTIrDddAQ51LQn316QbIf6A==
X-Received: by 2002:a2e:3c14:: with SMTP id j20mr12580732lja.175.1590342768100;
        Sun, 24 May 2020 10:52:48 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 10:52:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/4] gpu: host1x: debug: Dump push buffer state
Date:   Sun, 24 May 2020 20:51:00 +0300
Message-Id: <20200524175100.9334-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
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
index 02125842071c..c25c3fe0a295 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -192,8 +192,14 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
 
 static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 {
+	struct push_buffer *pb = &cdma->push_buffer;
 	struct host1x_job *job;
 
+	host1x_debug_output(o, "Push Buffer at %08x, %d words\n",
+			    pb->dma, pb->size / 4);
+
+	show_gather(o, pb->dma, pb->size / 4, cdma, pb->dma, pb->mapped);
+
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		unsigned int i;
 
-- 
2.26.0

