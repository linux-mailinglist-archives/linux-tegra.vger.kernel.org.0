Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF6F8D62FD
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731415AbfJNMvE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36195 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id m18so16648310wmc.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8Ip/N74ctxJJIwGKeqriyFtdTULY1VY4q99IhD7qRM=;
        b=a6UPelncewmDN9UTVzqDbpUmI9eu9bTh6bxy9nRXld4JwG3EVLAm3e06C3HA577Sv1
         QHP5J78GPFogvs6g3WMyHnKzY9Oqw94QVzNn1g9OrBs3Oj07LAkxqz5I8WNR5ZZi8MHR
         iLsysrgZLneZNwqixOsZUzJaKfimn+4au/Ai31U/WASpDeF9WweuGelfgEN4OvxznALR
         lTR5/bvHA824s1VLAWOzUWEvLosCs/f8LeECsUD2aQTrR+61yvSqi+Q3OyQw4nYhtybO
         Act5WdkDXd+GYETwDO+CWFi2NiopIvXTHNJKkZstRgJQulH4eHae5YnT717G65LEiWLH
         Itpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8Ip/N74ctxJJIwGKeqriyFtdTULY1VY4q99IhD7qRM=;
        b=gbsoaZ/9Q6D21CnJCnAB7mSvTz5QfaBlr9CJl3TnhtT5CKfChvMKDqjuNvX9EthQCL
         80ziFNlhCIRy8Jfe1V2FkNF9VDvzE40beCBtrCghqLe57GMB+GuX+ZQmZ6Bwn3dr+9Tt
         f2Ttk0FnF7RJ+ut5q1K7GGjzEC7qAt0UoTvMMfzrJgTlw3YmcbO71SKlcsdAX0dj7RTW
         2PuJpLJG0h7cYdxRwxryxxR/cZPWK0HeX6efQ2krTXkJMZPiewal9suLLp6I1msM4WcO
         2nqrO4USwwPcOVx6LsMVFeoty0vTkBlOUHCcxESv/e7BzdT+uDJv2Sd2GTTGHI/ufc8y
         R6rA==
X-Gm-Message-State: APjAAAWTh0CTWKtrQrYyR6ZvNiplO6p5BzFRGvhZzlp3W7yWVrOKQPnq
        BjCwqK5YewskZ88mqtpLcXY=
X-Google-Smtp-Source: APXvYqwy8ad1by41Gb786EPOSxMUzFJ4fHUkh7WWE+RcLVZpFH7w5ydP5oTR7CWjvEhiKXk3grAFmQ==
X-Received: by 2002:a1c:ac02:: with SMTP id v2mr11162902wme.85.1571057462130;
        Mon, 14 Oct 2019 05:51:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l7sm18312749wrv.77.2019.10.14.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/14] drm/tegra: Inherit device DMA parameters from host1x
Date:   Mon, 14 Oct 2019 14:50:40 +0200
Message-Id: <20191014125049.425101-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The display controllers and VIC don't have any limitations on the
DMA segment size. Inherit the DMA parameters from the parent device,
which also doesn't have any such limitations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 9 +++++++++
 drivers/gpu/drm/tegra/vic.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fbf57bc3cdab..f7f7984bb749 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2074,6 +2074,12 @@ static int tegra_dc_init(struct host1x_client *client)
 		goto cleanup;
 	}
 
+	/*
+	 * Inherit the DMA parameters (such as maximum segment size) from the
+	 * parent device.
+	 */
+	client->dev->dma_parms = client->parent->dma_parms;
+
 	return 0;
 
 cleanup:
@@ -2097,6 +2103,9 @@ static int tegra_dc_exit(struct host1x_client *client)
 	if (!tegra_dc_has_window_groups(dc))
 		return 0;
 
+	/* avoid a dangling pointer just in case this disappears */
+	client->dev->dma_parms = NULL;
+
 	devm_free_irq(dc->dev, dc->irq, dc);
 
 	err = tegra_dc_rgb_exit(dc);
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c97a61c877af..8d98b0cfc47b 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -214,6 +214,12 @@ static int vic_init(struct host1x_client *client)
 	if (err < 0)
 		goto free_syncpt;
 
+	/*
+	 * Inherit the DMA parameters (such as maximum segment size) from the
+	 * parent device.
+	 */
+	client->dev->dma_parms = client->parent->dma_parms;
+
 	return 0;
 
 free_syncpt:
@@ -236,6 +242,9 @@ static int vic_exit(struct host1x_client *client)
 	struct vic *vic = to_vic(drm);
 	int err;
 
+	/* avoid a dangling pointer just in case this disappears */
+	client->dev->dma_parms = NULL;
+
 	err = tegra_drm_unregister_client(tegra, drm);
 	if (err < 0)
 		return err;
-- 
2.23.0

