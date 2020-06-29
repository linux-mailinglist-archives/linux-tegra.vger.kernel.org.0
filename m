Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E81B20CC16
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgF2DS6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DS6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11632C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:58 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g139so8231267lfd.10
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
        b=p49v+FPYkBRH68n3b+EU9KvFMaxtmf5OTVWi83Bpl1meRQUxtnDN60ZdW5IPY/L3YL
         YRHpn9HE+x/gPEoXsMz1G5aUAyR0AF6HVRG6q9yd8WTCzPG3vqxBUJTnUx9A9uKkYGP6
         3MTK8pAqPpe5peUixM/ukcwWiwyqjneNFr/PW/UQs28bq4YTqwt6+Nl/0xc1wdZPNyzo
         pKqJXw9/W/HeNxNQWOIiwdNOjmdIHEaE0SpQdvaUDOOPpp2EA/smycOR6M+DOEPTzcwa
         HJfLSRa1Lj40bhRs9PMp+1a6iEKUYNq3MM2fVFRQee6dQ1t/kx3yt8je/e5qLt4COVMV
         tRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eQIGPn3KMuayvmsa1uBxd3r4xLA/7zWEvkyj+/TLy0=;
        b=uCwgB72Ise17D6CDUCFeL/l52PqeovaIlqzkgG/OrgknLC7r5+Oeh6MVr/itqHNCa1
         PiIRCDjudyWJHYNPwdjCVxMIXech+suJ/a96/Q/w4i3BiL+Q+5Dmr+deUqvSaUNwEwFa
         PFpe1yrQpBQHT4xyZZpJVjJmQs6WVlu/JkVeuso72fu2IvCWuPRyRhYe7d5P0nlGEIQ5
         i9PxDTP97VwjQlEl/XDiiL279+s8RYkMCff0Y6MhJNcct0v/ieVp3AVj6SE/eEqd6gLL
         y4qGKIxgVcM73uT0mCU1Py/qiXtP+PKnNUPqAoinq67vgh7jdQE3X7U/M2R9gXN/DFan
         GpTQ==
X-Gm-Message-State: AOAM532H960c2N2EaGUYSdowV1Z/5f7u4bvSQhlZlmV8PIqZnrUNRoQ0
        WATUKh/Wy0RHoSpPd5vjM68=
X-Google-Smtp-Source: ABdhPJwYVItOG/zb6BAYDE5utvXV9e9+AuvGGwgUmMtOXhB580DEEwhUq0pN1XIfY/euSgHLLA7Vsw==
X-Received: by 2002:ac2:5295:: with SMTP id q21mr7946895lfm.185.1593400736609;
        Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/6] gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
Date:   Mon, 29 Jun 2020 06:18:41 +0300
Message-Id: <20200629031842.32463-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
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

