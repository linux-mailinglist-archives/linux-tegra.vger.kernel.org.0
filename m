Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5408D3A2999
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Jun 2021 12:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhFJKs5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Jun 2021 06:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhFJKs4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 06:48:56 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E13C061574
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Y8+gufHKaH39W9y7rNWO46TEJr/U8t/p/zVeccLFh94=; b=aXlXdm3NuMhAPM0nPYZfs0P9x3
        aXf1354I5256HymfSt7+GKaACYs3L6CZ78Vbi1Ro0Rsfc4318aim1QgaIz9wQiaNAC4IY734qH4Nt
        zz9ahJTiJVca9awuKInBocq6kCU+N0r4eS5js5DY9Jhe0TIqOTKo30GgtizdRE8HZC2JVyb1PCtAf
        O/8nMJftCqd7PmGYLHB9TQrtdo4rSoaf4nrLbFt0CG5LJfS12M5UjFOJMU0ksskKzhiVd7vOyncUS
        kqXhy1IHgyoM5ZaTv2XOCoQaC4osDD+wCMsvW3I043vhqSORpakctqM6SsbCfh5j4DYJK5OZj0xjK
        ij7kMt7w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrID6-0005RD-Vs; Thu, 10 Jun 2021 13:46:53 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: Don't call SET_APPLICATION_ID in VIC boot
Date:   Thu, 10 Jun 2021 13:46:09 +0300
Message-Id: <20210610104609.3654717-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The application should be programming the application ID, not
the kernel, as there can be several options to choose from,
and setting the application ID multiple times can cause issues.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 2 --
 drivers/gpu/drm/tegra/vic.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 72aea1cc0cfa..c9d55a9a3180 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -148,8 +148,6 @@ static int vic_boot(struct vic *vic)
 	hdr = vic->falcon.firmware.virt;
 	fce_bin_data_offset = *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
 
-	falcon_execute_method(&vic->falcon, VIC_SET_APPLICATION_ID, 1);
-
 	/* Old VIC firmware needs kernel help with setting up FCE microcode. */
 	if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 0xa5a5a5a5) {
 		hdr = vic->falcon.firmware.virt +
diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
index be898bee6a57..acf35aac948b 100644
--- a/drivers/gpu/drm/tegra/vic.h
+++ b/drivers/gpu/drm/tegra/vic.h
@@ -8,7 +8,6 @@
 
 /* VIC methods */
 
-#define VIC_SET_APPLICATION_ID			0x00000200
 #define VIC_SET_FCE_UCODE_SIZE			0x0000071C
 #define VIC_SET_FCE_UCODE_OFFSET		0x0000072C
 
-- 
2.30.1

