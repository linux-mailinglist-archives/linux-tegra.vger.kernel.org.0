Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1459310CBE1
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfK1PiC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:38:02 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43560 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK1PiC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:38:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id n1so31686783wra.10
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dzbVXJ7V8hcU1LtMIPexGVLsK0+2tdodZ/4GZpJrGQ=;
        b=WqZ/47EKwwoGBWxgT/2GeoCq0+nbfB28gH8NAOmaWg8LYI9qJGORY/MDy1ojv8+P38
         AvNWstImqj2TYDREPetx+/GdEXvi+K81npK6H7j3fMrhLsQxuFQnQ2HW2y7DQ/h5cYQ+
         MPJHNqxmCWDQVav3wIPaYhGVn5VJqEFUQ+snIlTO+A84tSHnbGpRSf4nYXQlUNgJf6Cg
         eYc3l7NeJSfXrBQDC5dwmFawt/Prsuxu/42NCoOVgTqvrzWs9vayr1VzFoXY/1VUKeRU
         rLjD6DeIr3/G+R7rHqo0ezvBQfUH850fgrY0kcPYjlx7JkVm/+YuAad3CoGDKOzhenkC
         bsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dzbVXJ7V8hcU1LtMIPexGVLsK0+2tdodZ/4GZpJrGQ=;
        b=cgnGGcIG6WLXMTpc6YAC0he17atEX0Rcy4wNDxWqxGTKF86HAX0jiDkHQX0R11WYpj
         Ca/g5cWuJAsQBznrhKTlN1gZFWbqkxhBOkYxpVQC+xj8KJ2SOxitN6ye78TJgY0UrAhM
         dm3TDk4bt+7mBdMqht/NOaMh4Dh1b2LiWDGDPjUl3p8gd6fKxxL8Ooh8S+v9y+3tPJHq
         FQOUKEv0FwXKB3/6OyywZo1BeQe0lh1ah6tvehb+QI5VGpTb02lVp+yGJcHO2tcS22cx
         DAwKIs2SLcwSdhFO35J9ZD0NFCB3UsyxyKzJZ4+EnU/6Ceczzb8SyXpN3limia4/tMKY
         65eA==
X-Gm-Message-State: APjAAAXDaNpnKo8j6jhCZsgUDoKSqyoVa/E+Kbv4NPFJdEg9lg1q7Izr
        N6x4T3TwqLTUZf+3Qiolupw=
X-Google-Smtp-Source: APXvYqwN6jeHqpiergoAp6H44RRaiLz+Bep/6Nl1tHZ/cpDeXEHqkAVIY9PD5yeg/w5+Yv36571D4A==
X-Received: by 2002:adf:f802:: with SMTP id s2mr17381533wrp.201.1574955478979;
        Thu, 28 Nov 2019 07:37:58 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id q3sm1858695wrn.33.2019.11.28.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Date:   Thu, 28 Nov 2019 16:37:40 +0100
Message-Id: <20191128153741.2380419-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Ensure that a runtime PM reference is acquired each time the DPAUX
registers are accessed. Otherwise the code may end up running without
the controller being powered, out-of-reset or clocked in some corner
cases, resulting in a crash.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 622cdf1ad246..4b2b86aed1a5 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_dev *pinctrl,
 			       unsigned int function, unsigned int group)
 {
 	struct tegra_dpaux *dpaux = pinctrl_dev_get_drvdata(pinctrl);
+	int err;
+
+	pm_runtime_get_sync(dpaux->dev);
+	err = tegra_dpaux_pad_config(dpaux, function);
+	pm_runtime_put(dpaux->dev);
 
-	return tegra_dpaux_pad_config(dpaux, function);
+	return err;
 }
 
 static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
@@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux)
 int drm_dp_aux_enable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
+	int err;
+
+	pm_runtime_get_sync(dpaux->dev);
+	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
+	pm_runtime_put(dpaux->dev);
 
-	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
+	return err;
 }
 
 int drm_dp_aux_disable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
 
+	pm_runtime_get_sync(dpaux->dev);
 	tegra_dpaux_pad_power_down(dpaux);
+	pm_runtime_put(dpaux->dev);
 
 	return 0;
 }
-- 
2.23.0

