Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BAC2D884E
	for <lists+linux-tegra@lfdr.de>; Sat, 12 Dec 2020 17:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407573AbgLLQfc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 12 Dec 2020 11:35:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439403AbgLLQJ4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Dec 2020 11:09:56 -0500
From:   Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Deepak R Varma <mh12gx2825@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/14] drm/tegra: replace idr_init() by idr_init_base()
Date:   Sat, 12 Dec 2020 11:08:18 -0500
Message-Id: <20201212160831.2335172-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Deepak R Varma <mh12gx2825@gmail.com>

[ Upstream commit 41f71629b4c432f8dd47d70ace813be5f79d4d75 ]

idr_init() uses base 0 which is an invalid identifier for this driver.
The new function idr_init_base allows IDR to set the ID lookup from
base 1. This avoids all lookups that otherwise starts from 0 since
0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bc7cc32140f81..6833dfad7241b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -256,7 +256,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init(&fpriv->contexts);
+	idr_init_base(&fpriv->contexts, 1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
-- 
2.27.0

