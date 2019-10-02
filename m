Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D70BC45A7
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbfJBBmG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:06 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45315 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbfJBBmF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id c21so24229024qtj.12
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t9GlVxQX/IFyF0QIkGVj1OHSVsaUChx5FuOCdw1CGdk=;
        b=Yy7ku3Sq3yBlfAIW5rBv9+DWgX7i9B8T2viE2EnaEJ1noLL7A550Kbafc2Bo5mDqYh
         6S13TwJGH1S1bWYH1axAsSI2mdkmhib10AktnIQ090tSqfVQydQ9h+kMvTs3RBYidN/L
         jeoFz5K8sbhrID6cxFCX/hc3PM7dEoxqoaW3hyB86kN4TNPL8WP9JjpCMPx4piJh2v+h
         rNBswUV52zHZk/ifSdQadCdDm/WdONGkms0vlHJCdSOpDbjlys9wjtsF1hZaecaXVBkl
         DMHPuVVFDSS/sSZr6JkQ+RBSf1eqQV3UYqnWQAEo6lQm6VSJ6R/955ICGyPoYhFsMYwN
         g67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t9GlVxQX/IFyF0QIkGVj1OHSVsaUChx5FuOCdw1CGdk=;
        b=b5ELKUhIGqJnu/vTAL85Wtgo3/KHNY9lvebSqm3K3oaqFXmba7oH058wlEV5/ZioJL
         flyPYOPO+EflMJp08cQNAXgoNJ3J0cDJWZGXMK+eehfFxRPzFVCLiNsmFTDa2sxTLoXq
         hLknq8NqviXQ2B99gfctn+FYnFawGujFRfZ9DV6YIIdsRqni1L85Cf0Fn3lOabdKhsU3
         PrKpebayp7ltIXSXkyBs9NypRJwIOAWgGDLirvJDswOBSPrboFuxCPUkWuypd4JgH3yJ
         9eusJz8BJSO7yg4BWQKy1Kchspw/E+0IGmdsIOvK0otS5iRp8fLblCrGJoyKah7xunQV
         HUdA==
X-Gm-Message-State: APjAAAUa94pPiTw50GKgfUWICrNgGZTY4x4Ph6o0bp1DQIpyNyBFfnXW
        r25KegT6jnnKTS5H4xKWPaY=
X-Google-Smtp-Source: APXvYqwmUAx6vicvqmvF9Ekd/jQZCSHyjCAHP5YYIJiNPJwgTXFqtyTyi9TSwb7QdxnT9x2kHWOy/A==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr1522715qtm.332.1569980524763;
        Tue, 01 Oct 2019 18:42:04 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:04 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH 2/5] usb: chipidea: tegra: clean up tegra_udc flag code
Date:   Tue,  1 Oct 2019 21:41:50 -0400
Message-Id: <20191002014153.29831-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All Tegra devices handled by tegra-udc use the same flags.
Consolidate all the entries under one roof.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 12025358bb3c..0c9911d44ee5 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -24,35 +24,23 @@ struct tegra_udc_soc_info {
 	unsigned long flags;
 };
 
-static const struct tegra_udc_soc_info tegra20_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra124_udc_soc_info = {
+static const struct tegra_udc_soc_info tegra_udc_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
 static const struct of_device_id tegra_udc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra20-udc",
-		.data = &tegra20_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra30-udc",
-		.data = &tegra30_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra114-udc",
-		.data = &tegra114_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra124-udc",
-		.data = &tegra124_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1

