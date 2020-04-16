Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ADB1ACEAD
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393426AbgDPR00 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgDPR0Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:26:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81823C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:25 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so6220752lfq.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/MhmV+tzvMVyTZ+hbXLTjNNEHkIH/FwOHSo977XNI0=;
        b=h4emgDt+LvITvR7yotrGC7DQa7Wpeu0jeqRjX8y+OXCYOSzN4A5WVfyJuLh+XxftJu
         lsY5lmDYAgOQqvpprcdlY3BK6hx54CxljSyam7qdjJaCrD4nBrtyCsIJWcblqGVkPV6b
         6sKk0X8ZPJarvyEUe3Hdda88110MRwsK/Fdfrsu/GfqjnGxED2CVpgTqZyKwSNz0yBOT
         w5a3yCiP4y2iMbEsGwOji8ES9i+84U/qC7x6KtJWz4lik4w0YM8Fz70kkeZbQmNLb1kI
         tEwZosvRjowapArxaeFrlEc9c9QpjHWRZc7ZJQO9GCkUy+Z99Z0pGjAchEaje3JFUT+r
         +oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/MhmV+tzvMVyTZ+hbXLTjNNEHkIH/FwOHSo977XNI0=;
        b=DGBPjUO4OtSBuS1cp0qvrygIfFQ3viAKhrSM/DtoGHZDcYeD4Blg6YjoyZ3Q0Gn25j
         VJvB0f/PnMJI/BD9YCs9wxwkfLSled8qTpw+Ps75Ey/CLNNRsfRtAdtDaIGR4Dtc7UnS
         5/9ceaBP0naiNHmWNdZDEy2wE9pyw7Xx8KfK1rhEpulgvEV6QsL09Jl1fxUp0t7sfWAg
         zmrbVo2Evl8zg3R+Nb5biIjsNvn2xTMM1+QlRiRU7Znpw1JkaPn8YuCuZJr/eUroFRsC
         4ImvX7XrCA4gBysAuYUKbZAJRXW4DABDUkDiIlUqkd6OIIWX0AhlxgmCisNnsxNI/spY
         GrQA==
X-Gm-Message-State: AGi0PuY2XPIJI7Ha+oJMYTLvLGHCvhyguxocx3s93uRFVXqe0eKBQg2t
        Tz1aVW1Uob/JjAJoH2uiCHSXTUDu
X-Google-Smtp-Source: APiQypL6WC/JhsvoIKdwk+ofEsGfvm5ZkWQ1KcRrCNOVS+Ec4rlqGkCk2QwMltYmTa896nctz0qz0g==
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr6829502lfp.160.1587057983693;
        Thu, 16 Apr 2020 10:26:23 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 10:26:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Date:   Thu, 16 Apr 2020 20:24:04 +0300
Message-Id: <20200416172405.5051-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416172405.5051-1-digetx@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OF node should be put before returning error in tegra_output_probe(),
otherwise node's refcount will be leaked.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..a6a711d54e88 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
+		of_node_put(panel);
+
 		if (IS_ERR(output->panel))
 			return PTR_ERR(output->panel);
-
-		of_node_put(panel);
 	}
 
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
@@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
-
-		of_node_put(ddc);
 	}
 
 	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-- 
2.26.0

