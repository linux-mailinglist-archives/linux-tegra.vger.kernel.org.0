Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FC81E0148
	for <lists+linux-tegra@lfdr.de>; Sun, 24 May 2020 19:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbgEXRwt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 May 2020 13:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387766AbgEXRwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 May 2020 13:52:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A498AC05BD43
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q2so18363411ljm.10
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
        b=qFbpAYGm2ctEH/cC83guZs3dwS5irE0qdb6SQG2jOfs74P0SJmeFLRgzhWG2eCE88Z
         9IG7Mdrywrc6/34gr1/fCDip09Xxn2K1L/Kud49oxmA1TLyRFBADa6tXVL6VD35Knlef
         r8Qc+Dlai0N12/dbzZQfKKhgvsAJIOA75Z/B2jpEQInWxPEol/uksDQwvC3kIWyCXDjl
         vmmRUc7g3GdY/vWj1Iq0+6bQz9aZovLpotnihjQQzFasUCo1DvGiwwZNTCfIk88ZJttB
         5mXjAgDKC00EpzLlmI5sIpPqDHvmugmKfjsQXA0Manh0J42KocWSPNSrKRKw6AtskJfW
         httA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
        b=CS15Uj89nsKo56HXW2vN81QGIhsb8SarMGn2NmJOTIjOlVqHaQiIwCr6nOmB9A5EXB
         VtE6vYOO/8ErzO4FPwtsca1BlnxyLtmsP6ZwBGQpFGRI0BRkQ459fgMo2ZdCKVuru04U
         fFCgeNlE4OjHT6HrKz3HK4DNJaFRFgLtrhquQMZ/POAQ/TUPEQH8NRNjfLaWn95nTN7U
         hVjvh1XyLaee3UQjvmeUk+rAweUWMQBn7PYWRKipX6RGRdHvslWtYFdAS2gKmHbBiTLM
         /uQaOi4HNmI+34ngxJYuceu+punt2FekEYFn7LdJ75tAoMzDKOFRQwYIuMzMQ45xGUrq
         hdEg==
X-Gm-Message-State: AOAM530x00sbV29UiCbMcZBQ68GWBgx+VNWk2ndeevAd1LmKv89JSlaf
        3BraHjgeipVv3EWjQC15PLs=
X-Google-Smtp-Source: ABdhPJzzT3pdVktptKpAh2SToU/NOmklk6NdnbF+ydEgCUs1DHwV6vUPb6SLAa4FKS75PWQlahl9Nw==
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr11878027ljc.105.1590342767222;
        Sun, 24 May 2020 10:52:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 10:52:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/4] gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
Date:   Sun, 24 May 2020 20:50:59 +0300
Message-Id: <20200524175100.9334-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Once channel's job is hung, it dumps the channel's state into KMSG before
tearing down the offending job. If multiple channels hang at once, then
they dump messages simultaneously, making the debug info unreadable, and
thus, useless. This patch adds mutex which allows only one channel to emit
debug messages at a time.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/debug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index c0392672a842..1b4997bda1c7 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -16,6 +16,8 @@
 #include "debug.h"
 #include "channel.h"
 
+static DEFINE_MUTEX(debug_lock);
+
 unsigned int host1x_debug_trace_cmdbuf;
 
 static pid_t host1x_debug_force_timeout_pid;
@@ -52,12 +54,14 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 	struct output *o = data;
 
 	mutex_lock(&ch->cdma.lock);
+	mutex_lock(&debug_lock);
 
 	if (show_fifo)
 		host1x_hw_show_channel_fifo(m, ch, o);
 
 	host1x_hw_show_channel_cdma(m, ch, o);
 
+	mutex_unlock(&debug_lock);
 	mutex_unlock(&ch->cdma.lock);
 
 	return 0;
-- 
2.26.0

