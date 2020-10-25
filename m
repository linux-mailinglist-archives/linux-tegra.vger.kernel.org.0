Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EBE298447
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419370AbgJYWSq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419360AbgJYWSl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D118C061755;
        Sun, 25 Oct 2020 15:18:41 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 77so9432676lfl.2;
        Sun, 25 Oct 2020 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjxBYYYDofDB9Xc2U/Srp0mvRhO4gkuJUBQqpWNNoV0=;
        b=YV/1WFw0xY3isTwdScb3k2pex3Dai3xJdtff9FJqsRfSyKVdWHHs5DCXBfBgTpqldg
         l4M4l39dmFECPUYA8K7mZbJJ9/dyLPqq81DL+nT1fAi3XuOYLgs75rpFJlw55Pz5Voyu
         PqgjSMwWydryrom39MPZ3Opv96Y7IZPOp1k/+RuMn/FzvGvbyf4Cz65SKxu4cksxu7Mv
         vYKDyyCF2dkUVBepQ6QBdISdwIO60wB6J/4Z0h9tH4RHnflO0s4EkyNE1XrFCVZGers+
         qV0ypNS/sZp0b+/u1UFVx3YqsmStUaDMW8Sdemm34XE/gPL+FZltNkipyVVKTWOoH/Mk
         ydZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjxBYYYDofDB9Xc2U/Srp0mvRhO4gkuJUBQqpWNNoV0=;
        b=nihlK0ylkfLdKNei2M9qZ+/XxOXuFyXHX47U9jI8VKN2kEX+m6UMFZIQWUyHWzNuEL
         fptfOWZVcGNYsgMNStvSohoiU8en4nDRa4/7KHJv21IDmcrTG2yvjUK1fN28wCK1Y8qx
         oxAwwUuXCfkppFKNoSsVd2wZBdKd9ghni/458FNE4nl27LBNPBsIgkIS+PmanUN/XXwv
         +Bzs+Z/u2sRfnc3vN1vQHtKG6jJjFQnl/YhsgFursxU5AiKEcGvQ9Z/G/ejIQ41C5fMt
         fGtF9zLs4ZNHD3nCLTLWj1QfdfFN0L79Jjx+9wbdQXWSnOWKmGQw/LzMiFZ9ubXXuwFI
         Tmuw==
X-Gm-Message-State: AOAM533a5vxpOA/S50tdxSzyHJ6LSJMEAPSnoEEe9HhHzDt0ZTvaBabX
        R51Se2GHmUcEcz2AlSFwzIM=
X-Google-Smtp-Source: ABdhPJwBd34BXTnyHpkHGOlFfGgghnvgLQ4l+3P5+e3cLu4M9Ce5jOuxIhq1ehyjQz2mLjcLOIJ2mA==
X-Received: by 2002:a05:6512:301:: with SMTP id t1mr3615749lfp.232.1603664319577;
        Sun, 25 Oct 2020 15:18:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 45/52] drm/tegra: dc: Extend debug stats with total number of events
Date:   Mon, 26 Oct 2020 01:17:28 +0300
Message-Id: <20201025221735.3062-46-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It's useful to know the total number of underflow events and currently
the debug stats are getting reset each time CRTC is being disabled. Let's
account the overall number of events that doesn't get a reset.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 10 ++++++++++
 drivers/gpu/drm/tegra/dc.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 986e7a0dde2a..f50a42170977 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1539,6 +1539,11 @@ static int tegra_dc_show_stats(struct seq_file *s, void *data)
 	seq_printf(s, "underflow: %lu\n", dc->stats.underflow);
 	seq_printf(s, "overflow: %lu\n", dc->stats.overflow);
 
+	seq_printf(s, "frames total: %lu\n", dc->stats.frames_total);
+	seq_printf(s, "vblank total: %lu\n", dc->stats.vblank_total);
+	seq_printf(s, "underflow total: %lu\n", dc->stats.underflow_total);
+	seq_printf(s, "overflow total: %lu\n", dc->stats.overflow_total);
+
 	return 0;
 }
 
@@ -2289,6 +2294,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
 		*/
+		dc->stats.frames_total++;
 		dc->stats.frames++;
 	}
 
@@ -2297,6 +2303,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_crtc_handle_vblank(&dc->base);
+		dc->stats.vblank_total++;
 		dc->stats.vblank++;
 	}
 
@@ -2304,6 +2311,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): underflow\n", __func__);
 		*/
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
@@ -2311,11 +2319,13 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		/*
 		dev_dbg(dc->dev, "%s(): overflow\n", __func__);
 		*/
+		dc->stats.overflow_total++;
 		dc->stats.overflow++;
 	}
 
 	if (status & HEAD_UF_INT) {
 		dev_dbg_ratelimited(dc->dev, "%s(): head underflow\n", __func__);
+		dc->stats.underflow_total++;
 		dc->stats.underflow++;
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 8fade75caef9..e3fc48f8154a 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -40,6 +40,11 @@ struct tegra_dc_stats {
 	unsigned long vblank;
 	unsigned long underflow;
 	unsigned long overflow;
+
+	unsigned long frames_total;
+	unsigned long vblank_total;
+	unsigned long underflow_total;
+	unsigned long overflow_total;
 };
 
 struct tegra_windowgroup_soc {
-- 
2.27.0

