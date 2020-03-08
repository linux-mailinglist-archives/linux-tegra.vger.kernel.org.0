Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77F717D6D1
	for <lists+linux-tegra@lfdr.de>; Sun,  8 Mar 2020 23:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCHWie (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 8 Mar 2020 18:38:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45475 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgCHWie (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 8 Mar 2020 18:38:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id e18so7942258ljn.12
        for <linux-tegra@vger.kernel.org>; Sun, 08 Mar 2020 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FL3h+cwZbCflVAndR4xdKBkAeyuMHCA8U7gScLSQOHY=;
        b=MAn0cLKAZHWrc94pPcfyc06cXQ1tIIh5eDouh2Kdz9liJN2PTfcSJ8gN8h7WFzxlPn
         3DVad+nEU4ZV571KhvzrWgscaBNGheZfYJV4IR85LyVAQit+mYWnFPtPcmjrWU+DuUZU
         vh92AyjHP9krKH08ncGfMQOvsr5H8NlGScwsPdEIt8BVLsedVqtmcG43WdnOh72nUouW
         YZ3HlPedxQCtQ9UM5uQqA+8IXnGRWvHRsOyb2G2NZc7OESIq6fpYSZ7ysBTnAAFpu5yw
         5ISdUtOVpTu++Mm09RMaVH+1ZgWbQ1bmU+Y5vrPQrohTMufNMt1mPmCSgvPMiXTOczNy
         4Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FL3h+cwZbCflVAndR4xdKBkAeyuMHCA8U7gScLSQOHY=;
        b=tUcZ9EQAdBk4CNNiYhUxNV09J3R5Klavqg5ztXLQzd5W+9LcDzdEo4VlHBDe5s7QB0
         OUPIw8lNxugrERib8rSRLxML5JnRbSAro7vF/M1fLiSU0JapEC23m80soUzC3/oIrNSC
         ixufKyrJ/lsWLGXLn9qf8cuy6mW/9lheCIb9hi20al1oGdCDEaLUyNBUQgzv6uUgMtlj
         CflrGptgEOOwWjEI/WATJ6GPxj5epj6bMHTPrVJ3fmzXruQJCLav63V18KepzMI1sAV0
         0l1Q+ulm1wbT9WIvvhkGv4b13At8iV2A0jukM0cB+Vq3b541BYXhenySnjLTc9+EDeqj
         xMzQ==
X-Gm-Message-State: ANhLgQ0DL/zqQnJf36CIyLy8j9IvciP0ywDsFT0UBzwV3bE2/tg6DPfV
        fDgOou8zsg+HjbaZLs5EFKB6F4Ya
X-Google-Smtp-Source: ADFU+vtzjE1ZJLaO3rZlQoL8vIdhE6Mf4SoDYV2M4VAmzeiq8fBRH5ED4Unb0x3lRKJkZTU50B1moQ==
X-Received: by 2002:a05:651c:1078:: with SMTP id y24mr8171476ljm.102.1583707112536;
        Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe error
Date:   Mon,  9 Mar 2020 01:38:09 +0300
Message-Id: <20200308223809.23549-3-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308223809.23549-1-digetx@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Driver fails to probe with -EPROBE_DEFER if display output isn't ready
yet. This produces a bit noisy error message in KMSG during kernel's boot
up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
than a corresponding voltage regulator driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 56d933e81797..d7f2c4654b6b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
+		if (err == -EPROBE_DEFER)
+			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
+		else
+			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
+				err);
 		return err;
 	}
 
-- 
2.25.1

