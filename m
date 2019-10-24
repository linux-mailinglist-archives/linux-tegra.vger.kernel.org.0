Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5ADE38A6
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439894AbfJXQqY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51994 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439902AbfJXQqY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id q70so3614228wme.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B2W0FUjPFjz/awt2KiXk3+qz+ONZRc0nBTwMiyV54YE=;
        b=Q7lVozVpvsSTvFjEghbOMjRYPRm8HJdTP4vBJd8u6LuWruyy4l/JjXD0mDO4V75JPb
         KD4qjgDfkz4FRnzJEsFdApLQ88eHvMgjPcggfqoeb2GbHLH92tEzAvc8eQCzZru295bD
         svNytTmSU+TjO3HzO7H+MPF02EepoF1gMro+cttUch/03GmbLCH3OkeIYlSwYdZVKzdC
         42pTM4N0Ws0Y7AFWX5xNx6cFCyVw8e/iroQCQQeP5qg5nk9z+9Y7hW+zhjwfDVV3CPYG
         N4siyklA0c2LjZsT3j4EL4A1r4wsoEinLmljbD7PQVVLYWnEmIadE84Qz0Q5IkeJ9Qf+
         uUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B2W0FUjPFjz/awt2KiXk3+qz+ONZRc0nBTwMiyV54YE=;
        b=lasuwsBOrwKYKde5aWsYUJgPIelv6jgjf6zAehTplNruYCv9Y6XL3MyGbhWQMLfybR
         NRhdW/p8/NhbFl/jVl8j/AryISPoSMdtmRcDLnwH3EX+zD1LnV1GelxcUc16pddB7UHA
         25qkKZELmsHtz95eVuD/KakXhd6mt+fnSec6JXRdUAL4RuQbEsSazu0HPVm2kWAN6cDd
         PhTV44BjQ9UaDk47cmHsr2TOMSt9f1hAmaiHDOEKZ+QIhiKcOu7gzaK+L/s1Dm1e8kmI
         GVSCGTvz9hg3agIv8xi+e4RzKcQcz0+ADvPj5XMo4CgTQH48fIZpoM8EsUR9Yfjeqs38
         DrRQ==
X-Gm-Message-State: APjAAAUcsMEVE68QzZQFUXQIJcGBTmURpl8deoy+h8hiN3vNnnHk+pTk
        b0ksg8VICIMEnfRbXvQwmes=
X-Google-Smtp-Source: APXvYqxRLZqfWu7td7gUGEzqcirQWei2SphFbGYqxcMNzUSvJoh7xEu7DmzUZV66IsIrwU9mrFFljQ==
X-Received: by 2002:a05:600c:22ce:: with SMTP id 14mr5564498wmg.71.1571935582454;
        Thu, 24 Oct 2019 09:46:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 1sm8264544wrr.16.2019.10.24.09.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 20/32] drm/tegra: sor: Filter eDP rates
Date:   Thu, 24 Oct 2019 18:45:22 +0200
Message-Id: <20191024164534.132764-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SOR found on Tegra SoCs does not support all the rates potentially
advertised by eDP 1.4. Make sure that the rates that are not supported
are filtered out.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2023244ad328..9e6a1ab7ef65 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -605,6 +605,30 @@ static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 	return clk;
 }
 
+static void tegra_sor_filter_rates(struct tegra_sor *sor)
+{
+	struct drm_dp_link *link = &sor->link;
+	unsigned int i;
+
+	/* Tegra only supports RBR, HBR and HBR2 */
+	for (i = 0; i < link->num_rates; i++) {
+		switch (link->rates[i]) {
+		case 1620000:
+		case 2700000:
+		case 5400000:
+			break;
+
+		default:
+			DRM_DEBUG_KMS("link rate %lu kHz not supported\n",
+				      link->rates[i]);
+			link->rates[i] = 0;
+			break;
+		}
+	}
+
+	drm_dp_link_update_rates(link);
+}
+
 static int tegra_sor_power_up_lanes(struct tegra_sor *sor, unsigned int lanes)
 {
 	unsigned long timeout;
@@ -1897,6 +1921,8 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
 
+	tegra_sor_filter_rates(sor);
+
 	err = drm_dp_link_choose(&sor->link, mode, info);
 	if (err < 0)
 		dev_err(sor->dev, "failed to choose link: %d\n", err);
-- 
2.23.0

