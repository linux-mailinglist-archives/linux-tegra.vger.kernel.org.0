Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65909110204
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfLCQTh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55000 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so3536919wmj.4
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PwWQma+5Pqkctg0DzIuMrwRQe9FFZs9mcoeMD+RaeE=;
        b=nJrGvRP1wJU1oSWsRp5EnoobaFJ9zhQsNutzeCuPChjvEsRJdyhqa6k27WUpU7Ngeq
         oipxqLhPj2//BPhuh2AJWL+zxS9rIQ2e34yD4gvHjS47boCH3c1Kr7xAfp/dYM35Ig9l
         lPCFFSXnzoZz7TtHoGpiHixngXtc7171HVpuOLaZ28CwzMFitI1Ckxwz+QLipCnaHR0y
         qOwtofLBcgmENMSFPYqgRpARIGsPzG+wrpjvkk3SZNQFyc4o1cWs8SGbUQhYMdJITL+1
         KgJ6cXYgVTtwbgTIgeyT871H2iP+ECFMdkm7AMHE4tHOmnUC5gk6oPB99Ae8h8pRbR/e
         mtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PwWQma+5Pqkctg0DzIuMrwRQe9FFZs9mcoeMD+RaeE=;
        b=r3dijfnK0ejBfUvb5nHKQiWF30HE1SxMftlxvW2lmT3YYCUvCe7qLDOHc3K2U4S9Bh
         VpIgW9NmeRulywkEXtZ7e86CMwogcM6uzhdoAaysBW+vKQFZINB2MlT8SFjSGxsOxnJx
         uGbvCsXLG5/KD4SDWIZaIGNPDL1ELR72CHeh+KvnXRRvw4DTOeYeU3DOxPm6OBU/LnO+
         FOpXb3afIZ+3PH31waAoaTnleHmEO8cNgF5Vf2SOL+cV0ZS+UIDMkEAeMOUiWZDWe2jc
         7l0VO2rXasFpLLpySKv3s8tg2mVqd7BEbAR7pIrU649bWBSS7dCSQ5ArPMDkVwi0Bh+Q
         sH8g==
X-Gm-Message-State: APjAAAX5DFT3z1P6wbAjdOwS0gyT/rqtGgHN9yOmNn5wcdbaowtQMEyU
        /8j8ShAqguUTV6Uq651JKrs=
X-Google-Smtp-Source: APXvYqxOisZqSvaS/kGDwfMGxj2Ecv3XXSg0r7See1EWGq29HYu3V+oJdlDy2Gj75UilxKxpChqpdQ==
X-Received: by 2002:a1c:6207:: with SMTP id w7mr28616534wmb.16.1575389974756;
        Tue, 03 Dec 2019 08:19:34 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id x11sm4401057wre.68.2019.12.03.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 9/9] drm/tegra: Run hub cleanup on ->remove()
Date:   Tue,  3 Dec 2019 17:19:14 +0100
Message-Id: <20191203161914.1312555-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The call to tegra_display_hub_cleanup() that takes care of disabling the
window groups is missing from the driver's ->remove() callback. Call it
to make sure the runtime PM reference counts for the display controllers
are balanced.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7a16b51eaa2d..f455ce71e85d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1241,6 +1241,9 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	drm_atomic_helper_shutdown(drm);
 	drm_mode_config_cleanup(drm);
 
+	if (tegra->hub)
+		tegra_display_hub_cleanup(tegra->hub);
+
 	err = host1x_device_exit(dev);
 	if (err < 0)
 		dev_err(&dev->dev, "host1x device cleanup failed: %d\n", err);
-- 
2.23.0

