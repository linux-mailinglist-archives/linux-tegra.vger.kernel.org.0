Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C8C110203
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfLCQTf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37323 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so4426159wru.4
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZUbS0TeYBzQ9xk9jMtykFneTa+bnz9xud3h/IgQhWg=;
        b=eN5IzUQCemF0bgf3FTV4edwXbi6ykbiMEJouleU81zoKuGgtGnVQLIKdjE6tEhRorq
         rInLv03umG3yQQHl1hiEEn0XyXvu6qwyF9IhnG8Js7Dj+dOTxir8buiq+YjlmBtrOZ1T
         uWXnRYPjvJYmAV9/UPpB3/P4ehCmkfhOVUbV1JK18P7ACMMH2HtYpxBT8uCpdccOiFdc
         5wd5HHR6BnP9yGXBfADW9dBbzzL5ctgWGcPsGKu8odsuuMk49/Ok3EXsQUdMzo1Ml55X
         me5sY71lOEJiGjgQ0dU91sIXl743A/0sfOoHYRv+FPYrbXXf11Kue3L/ehZRy6ccyC36
         9oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZUbS0TeYBzQ9xk9jMtykFneTa+bnz9xud3h/IgQhWg=;
        b=Qok52EKHVknDBkL4OQ054Lq4pRcNZqwQAGqJ7n+R7nWLtdv3MXyxG4lsLgNZHqAUs0
         sP7mOLejucF8wx3lfp6Y3vcIDyoUG36wgE3f+wRJYZSwnfggVvrSwdZxxkpWPVyvODrX
         xBloiQHUXzXdiwmvR7J9k6H9o8F+QDox2J6WTC8qqOXldlnrDZ9abYuFFbscAt7wMh/G
         89osxlrkivYhFCTi3KPbqs1MdIvKAJ/EWC3pfQNKewF/xt8PxrYkKQWXSjYKSi1tlzqa
         Kcerp1I/CUATXXADW06cNgnRq8qUl0KNxqwFk4M0G+M2MgYaCazCKYYFAJpkr6Qpwigm
         NTAA==
X-Gm-Message-State: APjAAAWWTun2ol1wO6txCjLi6MzuxPXlg3dOfUINuQ2B7HNFUzAEcr3M
        2qFq6VBk9Tb8yEBUw0UE9fU=
X-Google-Smtp-Source: APXvYqzWo0gREb/Y/VCXKo/0ClOxouv66LLO/irvpmA8yTiFb7RYnplsoFlnrS0PpVvJEFD65Slbsg==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr5980329wru.350.1575389972842;
        Tue, 03 Dec 2019 08:19:32 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id b67sm3523453wmc.38.2019.12.03.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 8/9] drm/tegra: sor: Make the +5V HDMI supply optional
Date:   Tue,  3 Dec 2019 17:19:13 +0100
Message-Id: <20191203161914.1312555-8-thierry.reding@gmail.com>
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

The SOR supports multiple display modes, but only when driving an HDMI
monitor does it make sense to control the +5V power supply. eDP and DP
don't need this, so make it optional.

This fixes a crash observed during system suspend/resume.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2200f4cd397a..a68d3b36b972 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3970,15 +3970,29 @@ static int tegra_sor_runtime_resume(struct device *dev)
 static int tegra_sor_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
+	int err;
+
+	if (sor->hdmi_supply) {
+		err = regulator_disable(sor->hdmi_supply);
+		if (err < 0)
+			return err;
+	}
 
-	return regulator_disable(sor->hdmi_supply);
+	return 0;
 }
 
 static int tegra_sor_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
+	int err;
+
+	if (sor->hdmi_supply) {
+		err = regulator_enable(sor->hdmi_supply);
+		if (err < 0)
+			return err;
+	}
 
-	return regulator_enable(sor->hdmi_supply);
+	return 0;
 }
 
 static const struct dev_pm_ops tegra_sor_pm_ops = {
-- 
2.23.0

