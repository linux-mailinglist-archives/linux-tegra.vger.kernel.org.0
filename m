Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285E62F3855
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Jan 2021 19:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405457AbhALSPi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Jan 2021 13:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406517AbhALSPf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 13:15:35 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FD4C061795
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:54 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m12so4760811lfo.7
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EhvpCXfXEGgbj1XNgFmk5csruT29p6F6IHATsZnGuB0=;
        b=saLNy4wrApcawB8BTgH8PDwcACYsJuO/sT58oEcMHmB4ix9U67QEkcsamzOrZC4Q98
         frmIKv2vNJ8d0ftt7CNMI7Eu0BKxAdQbKEcj0bXnhaxpq8ioPo0FoPD30dVroRE4+lgE
         BDGDQ3wuvILPrfsieF1PeRPJj1e2PtkHlvoeb+BImaqxp2/1QZ2O5WtnY0znouqcWBxw
         RdDAko/K6AT9ZlqYNdVY92fIjcUKXzdid8Cdw/Qit8+ceS7nCxHu8F0s0rjn+w1Pebr+
         Pq/ANxpHexVKXru4Es9hYpLBxtKtpadOOogkLu2Q0rLX9MvLc8z5tQHCEvN/ZU+wVCcd
         vVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EhvpCXfXEGgbj1XNgFmk5csruT29p6F6IHATsZnGuB0=;
        b=m+J7/4Dw+nYqHNuMhISC1jC3bJ7hiP0iBSlUKuOvJI9UWZvYz+R1prhCP7O8OszaXf
         b8lJqpn+hqBGDyYjytq19jONmdu7I37OyRtTDWXdFbZm1YhyiBl1shdOjzRIpr2fKPbG
         dh0JyT2icJxNrcH5TL+vN2+dmocxckJUbJ6N83jAEKsGiWGhrl5dc1UzuEFgE75FvFrM
         fmc71H6ahW18FgT7bWLAwImdj06CZXq8KZvItXuYi4kp3hk7ovjtCSgfd1GgEVrltehM
         LkIioHJ1GuytHqQ1H2ZLSYsmJ9Us2GMXWIcqJht/qpf7mpEVtgY1wRGABz8iAfFI4Atk
         W5yg==
X-Gm-Message-State: AOAM533Z+4z8afZI6gJZzQafR/EYMZSLjrnHlluadzc0IdBPzkk8+FvX
        U9pU/m5iIlh7UFcOkC3tXjg=
X-Google-Smtp-Source: ABdhPJx49e3mU5MGwu0rz7h3L5r7xsREqFiHciTjzQWB50fOLe08nTBrky2LB3Y0lLMj+cm0VdI+fg==
X-Received: by 2002:a05:6512:21a5:: with SMTP id c5mr64558lft.423.1610475293102;
        Tue, 12 Jan 2021 10:14:53 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 10:14:52 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] drm/tegra: gr2d: Add compatible for Tegra114
Date:   Tue, 12 Jan 2021 21:14:21 +0300
Message-Id: <20210112181421.21293-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra114 has GR2D hardware block, support it by the 2D driver.

Tested-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c  | 1 +
 drivers/gpu/drm/tegra/gr2d.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e24e05a47197..47e7945dbc3b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1318,6 +1318,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra114-dc", },
 	{ .compatible = "nvidia,tegra114-dsi", },
 	{ .compatible = "nvidia,tegra114-hdmi", },
+	{ .compatible = "nvidia,tegra114-gr2d", },
 	{ .compatible = "nvidia,tegra114-gr3d", },
 	{ .compatible = "nvidia,tegra124-dc", },
 	{ .compatible = "nvidia,tegra124-sor", },
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index f30aa86e4c9f..adbe2ddcda19 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -161,7 +161,12 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 	.version = 0x30,
 };
 
+static const struct gr2d_soc tegra114_gr2d_soc = {
+	.version = 0x35,
+};
+
 static const struct of_device_id gr2d_match[] = {
+	{ .compatible = "nvidia,tegra114-gr2d", .data = &tegra114_gr2d_soc },
 	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
 	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
-- 
2.29.2

