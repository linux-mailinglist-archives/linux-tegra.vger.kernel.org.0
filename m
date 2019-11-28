Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D831A10CBD6
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfK1Phr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:47 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34320 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Phr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:47 -0500
Received: by mail-wm1-f65.google.com with SMTP id j18so7697073wmk.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FuaMjHIYXz5VbkPp7vbASLG/rrUrkAh/Y4RiebzPwjs=;
        b=arJ/EiNSglJZooI0IbSwGn/phEGeIcEiQBRbY5c79Z0DlyHqdtluiaLR8Umjwj+K/+
         1V2gaVPdNHfbO1Oa0zuObZ20yVDuGnjpXTByLmvFY/zbZnFRMhBSnDrMbM9nPByW0xAO
         oSoqpOBVKIH269zBTr7Wjv1c0Qlfq1ijiLjD7Xin5qStp+tKNaAGTmBkdHhT+Zq55z/S
         1PjTtUTJvXCBbKODwbRivMN7UA5CoQJNWDih6P9uADojnFjgSa2nXpfMRGawWneF+leT
         vSvXQDF4m71q+JqhUarq963w0+jl22pGjJdF9Age5CIRDEozWdOZGrPG11SwN3CIvSDx
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FuaMjHIYXz5VbkPp7vbASLG/rrUrkAh/Y4RiebzPwjs=;
        b=YaxThG44sP4K6ivzCzAMifzjg3+ZnndwyspAaTXIKDS5ojUY5Y6t+5uybVvBHubHIw
         5woosJjM7FrfXJzhseqUYntWaN8GNDceqWkk3IK6+M3ky1aaZUT7xmEC8bSSc5tGXtc/
         vGuxY5PC1NJIp+THMml6/zP2c9qaFVcPodsM8o5ByoRGJgxPovGTxVnAWJU9zl5cWeXR
         4Gs1hwb4wnMwX8gHtmp+3jf4sauKn5E0Sk7/FWviwiOWeMVBYEvY4pE4xSfUX6dxIC5i
         bUKNg7UmK2+8nN7/O9oavAprbVIVmIfpfXGQakiPs6Wz4hCXQpiwOAMLKmKbF83tRBXL
         xITQ==
X-Gm-Message-State: APjAAAUOt/HM9iOA0+BjDNBvUX/V37UlRCoPNC0GAGDVftSHEBxYH49z
        GJKF7NizeRzJMy9FEixRFzRfXxHdjzE=
X-Google-Smtp-Source: APXvYqz3xn9e/51N3n2xNkmI65xr2AXQvgtC2eYygg+gDmItvMgd2G741V/Gq9zZHrNaDz+YYsbjIQ==
X-Received: by 2002:a1c:2b82:: with SMTP id r124mr10347797wmr.112.1574955465466;
        Thu, 28 Nov 2019 07:37:45 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c1sm23139312wrs.24.2019.11.28.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Date:   Thu, 28 Nov 2019 16:37:33 +0100
Message-Id: <20191128153741.2380419-2-thierry.reding@gmail.com>
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

I have no recollection why that check is there, but it seems to trigger
all the time, so remove it. Everything works fine without.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/hub.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 6aca0fd5a8e5..e56c0f7d3a13 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
 tegra_display_hub_get_state(struct tegra_display_hub *hub,
 			    struct drm_atomic_state *state)
 {
-	struct drm_device *drm = dev_get_drvdata(hub->client.parent);
 	struct drm_private_state *priv;
 
-	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex));
-
 	priv = drm_atomic_get_private_obj_state(state, &hub->base);
 	if (IS_ERR(priv))
 		return ERR_CAST(priv);
-- 
2.23.0

