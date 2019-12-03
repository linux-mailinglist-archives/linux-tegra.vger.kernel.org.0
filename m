Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD9E1101F6
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLCQTT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41173 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id b18so4382441wrj.8
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjYPQ2k6428g0Cg1s43bFBcw4e2+WGwefK1SwWebzQU=;
        b=W681X+pYik3350bfuhteJclqkTvrQYBYxsAGfZE3S4lrFo+RCgdGHU564bQsdGMfm/
         8Cjcg6tmXKoAI+3Z2mVVcWJ+scF9ZE0NyFtg6kvvy67fnI5uIwaxdJT2gybqDl6lkA2v
         /R3bt0HrLoeKNPGKIqhz9Zp1ooKY4L0JU0aZ9GrBWRbVgbLMAwHx0iM4XAFsa0X3JCUG
         9Sz5EyPwMKE8GKpDO6rkbRUtj7Qq2W81LwQM15rqP4f03mhiZj2F0rI55qX8CDfw8dEt
         Vo12BUhV4SuW+2DgVoASxuHfUhqwXV4JOrDn5s2YLMIDAQ7SE7jJDnnhj4nxLhqgw921
         uXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjYPQ2k6428g0Cg1s43bFBcw4e2+WGwefK1SwWebzQU=;
        b=CwssWv89GnvXsMCZrb9l4tg80lidUbd5jf8j+04pGjFQKk9aVTkuO2xoJzmm90zcEi
         9A/67XWmk73isfqvWJeJOeYe/BDtw+lWrVr1VXmReshj8SQchp1FVTD6md/cBaq3d9RK
         vEMPfRRjJTBK2t0lBjsKYOcVWNZRBoD0Jr3m4OVRhF/iK0WI/kw3jNIDPkkO3feZANEs
         01Tyw63eM+6JPI2V2NtX/4Z7u3Hf3fj18ucEV08jo2Y3VnGl7lyAys2fm8rHmIOWnHuC
         sjrSMvGkmsol7uCb1sLGzODIMGlIbeuLIN03orzgAKciL6saDvgZySZ1n4fuV/gqQ9ze
         XVTA==
X-Gm-Message-State: APjAAAVx/AZHC1DHt8NEaGlDODk+2Z4ZaG98o//Xr/rqsUUSc5Ul4SYL
        TCZUhRrmhw7A9wrb/iKZ15StDPYdOiA=
X-Google-Smtp-Source: APXvYqwdCR2ddyErXa8r9O+qWPWJ+/tZW2/osXU5f7BU/Bytj2oFg0HdQ2sBwLYJVead4gikfjt+kQ==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr4573223wrr.98.1575389957119;
        Tue, 03 Dec 2019 08:19:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l17sm3518398wme.45.2019.12.03.08.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 1/9] drm/tegra: hub: Remove bogus connection mutex check
Date:   Tue,  3 Dec 2019 17:19:06 +0100
Message-Id: <20191203161914.1312555-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra DRM never actually took that lock, so the driver was broken
until generic locking was added in commit:

	commit b962a12050a387e4bbf3a48745afe1d29d396b0d
	Author: Rob Clark <robdclark@gmail.com>
	Date:   Mon Oct 22 14:31:22 2018 +0200

	    drm/atomic: integrate modeset lock with private objects

It's now no longer necessary to take that lock, so drop the check.

v2: add rationale for why it is now safe to drop the check (Daniel)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

