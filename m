Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FBB366D50
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Apr 2021 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243032AbhDUN5K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 21 Apr 2021 09:57:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243026AbhDUN4x (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 09:56:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23BFE61445;
        Wed, 21 Apr 2021 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619013380;
        bh=WriTCo0S6j+IjAPj6Z5yqE11oeq+w4YKDEuY4LaCLAA=;
        h=From:To:Cc:Subject:Date:From;
        b=lYNrwyHe5Wffdt7MP8/+/yxwH1NzaeuNbIYc3H4VjKowvtrlXbVP+1t9GfcEt5p43
         ZtbxCw53f1eUeY581aUtYVrtU8KddkQPx58r6YMOgMKnEnccBtklyuVgsJEEZk5Rbw
         /oRvUJY5UYc8xpezhBGJVxqgvGs8KYhkNoNmxZkHn7yMYw1FkYqvts9XJ1Gse/DsUf
         rr9jqEWY0ESAUgk8J0d3ZuF9E2VDGncThrY1dF8CBRQTJBm5i/Tx2exmf5fK7hPeuS
         jWPJgMXwhtYD1PF4wfoMF8mMTlZc2H+EdmUWQZ/mBhjgunr9NXOO5ae4Tq3Kthxe59
         a/UbyGPy0prnA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marc Zyngier <maz@kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] phy: tegra: xusb: annotate PM functions as __maybe_unused
Date:   Wed, 21 Apr 2021 15:56:07 +0200
Message-Id: <20210421135613.3560777-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Depending on the configuration, there are no references to these
two helpers:

drivers/phy/tegra/xusb.c:1286:12: error: 'tegra_xusb_padctl_resume_noirq' defined but not used [-Werror=unused-function]
 1286 | static int tegra_xusb_padctl_resume_noirq(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/phy/tegra/xusb.c:1276:12: error: 'tegra_xusb_padctl_suspend_noirq' defined but not used [-Werror=unused-function]

Mark them as __maybe_unused to shut up the warnings without adding
fragile #ifdefs.

Fixes: b8bb3d9c9b74 ("phy: tegra: xusb: Add sleepwalk and suspend/resume")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/tegra/xusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0aadac678191..963de5913e50 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1273,7 +1273,7 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+static __maybe_unused int tegra_xusb_padctl_suspend_noirq(struct device *dev)
 {
 	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
 
@@ -1283,7 +1283,7 @@ static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
 	return 0;
 }
 
-static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+static __maybe_unused int tegra_xusb_padctl_resume_noirq(struct device *dev)
 {
 	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
 
-- 
2.29.2

