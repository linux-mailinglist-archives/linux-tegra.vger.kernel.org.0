Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13F20CC12
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgF2DSz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DSy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:54 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBEEC03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m26so8222031lfo.13
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
        b=Lnybw8IMZh3LIPsv2LLMXx0o558bQJ9g1Zmbo841kAIbNNn+UQPOHFcXxeI4V3brht
         2J1gQ4Z4SoMWJm6N+wgQWjDTh/xrdsE4FlCPDgbqNpT4kphDW9aIfSqahyY9cG6cHffA
         IuhbbNDmqLocfNqNOuoBKc4FGzwlbF4pxbnIu4XSYjYd+tlc9L0nmXhlyt13aj/tenPn
         j5kq+GsQKNMT4uXHJlwxhi7ca/Xv8tgZ91Kh8TDbHkzmow4SExncJwRrzs/d00h1C1r2
         esZyu3IGXNfWzQS7q73ODifE8OJ2oyf4HIYYDsmcBpHuQAvN6zfWbUWk6nf6IdMqmXLc
         vFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
        b=dg7VmgJKisambuFcQC9knRYjEcqJDC7CF0iMz+a2kZnpc+OaJjY8boR0JPqM2Oer+F
         aexCQsh9ceydlIDvWOexwSJotQKB3e8/jCAEc3GBP5PnPV47R1DRhZ4K8hR8Pv+AfEAP
         nDt8Jo8jyAxMpNLRIujUQjGM2rp+rXBA7ho3d0oZRGarUMSP9IChL7kIDqrj7GN0K4T1
         2gFtJlj465AIVbHun2JJ8OoRflNjmJ3h+WCETwWWRcmuma/A41tyTN6qZRu+pdiOHX5l
         +1F3LaFCw7LoXxEYRTw1i2O8xUPrRyHhLqmXZ3U/pM75cnaMAMSvCglKYBw7ssV4TA7u
         cnZQ==
X-Gm-Message-State: AOAM532KSXCsUrXNty8o1FYgnljcQL9WfpHq57I/toXzf3lSiYle30wm
        2yqZ6kgyMgpnqM+OnO2ZKQg=
X-Google-Smtp-Source: ABdhPJzBYIs4TadHSeZSXIP8OyR8AiFEjm2k4Io02tnZ6VU2Hro9znaBYBj0ZWg9e55WIr6XrFgzEw==
X-Received: by 2002:a19:435b:: with SMTP id m27mr8189493lfj.40.1593400732903;
        Sun, 28 Jun 2020 20:18:52 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/6] drm/tegra: gr3d: Assert reset before power-gating
Date:   Mon, 29 Jun 2020 06:18:37 +0300
Message-Id: <20200629031842.32463-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra TRM documentation states that hardware should be in a default state
when power partition is turned off, i.e. reset should be asserted. This
patch adds the missing reset assertions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c0a528be0369..b0b8154e8104 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -381,10 +381,12 @@ static int gr3d_remove(struct platform_device *pdev)
 	}
 
 	if (gr3d->clk_secondary) {
+		reset_control_assert(gr3d->rst_secondary);
 		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
 		clk_disable_unprepare(gr3d->clk_secondary);
 	}
 
+	reset_control_assert(gr3d->rst);
 	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
 	clk_disable_unprepare(gr3d->clk);
 
-- 
2.26.0

