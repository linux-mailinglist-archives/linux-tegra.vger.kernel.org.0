Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0106F4224E0
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Oct 2021 13:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233727AbhJELWx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Oct 2021 07:22:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234217AbhJELWw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 5 Oct 2021 07:22:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D25261425;
        Tue,  5 Oct 2021 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633432862;
        bh=fvJpMHHEet+MaQV3Zx/ytB8336I76r/NnwK/oIOSVQg=;
        h=From:To:Cc:Subject:Date:From;
        b=Eu4FspsPS6S0lAkM8OXIpTWEuaWMOKYH8hGAEjkmHlox0ju828ZBmYSFq8cVKdhXi
         rOXXJqoPeLfDUtz6ZWW62u1qbyCLQhlFie34tILjIfW1L+x5K82lR1JeT246u0WdAF
         snOcyfvK8a3nal06gmex7k+cV4VwzbkvvdFYZV7oX0e8UzufkR/3jF7V76WUv99M/W
         qRP8tTz8gV2P6ctjnhCtzqqmAvqywPyFZs2cXCP95VTYlAPnRJBccVHee2p26BGIe5
         dZrb4vSCzE5zLhBdBX1CK9ZY/R2EgCNvIaqD5z0DIakK3MgF/nW4XUNhRmOjL4pUzv
         tNN0wxt5ooNxg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] usb: xhci: tegra: mark PM functions as __maybe_unused
Date:   Tue,  5 Oct 2021 13:20:28 +0200
Message-Id: <20211005112057.2700888-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The added #ifdefs in the PM rework were almost correct, but still
cause warnings in some randconfig builds:

drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined but not used [-Werror=unused-function]
 2147 | static int tegra_xusb_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~
drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' defined but not used [-Werror=unused-function]
 2105 | static int tegra_xusb_suspend(struct device *dev)

Replace the #ifdef checks with simpler __maybe_unused annotations to
reliably shut up these warnings.

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Link: https://lore.kernel.org/all/20210421135613.3560777-2-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: fix reference to original commit.
---
 drivers/usb/host/xhci-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 575fa89a783f..1bf494b649bd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1787,7 +1787,6 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
 static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 {
 	struct device *dev = hub->hcd->self.controller;
@@ -2102,7 +2101,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	return err;
 }
 
-static int tegra_xusb_suspend(struct device *dev)
+static __maybe_unused int tegra_xusb_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2144,7 +2143,7 @@ static int tegra_xusb_suspend(struct device *dev)
 	return err;
 }
 
-static int tegra_xusb_resume(struct device *dev)
+static __maybe_unused int tegra_xusb_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2174,10 +2173,8 @@ static int tegra_xusb_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
-static int tegra_xusb_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra_xusb_runtime_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int ret;
@@ -2190,7 +2187,7 @@ static int tegra_xusb_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int tegra_xusb_runtime_resume(struct device *dev)
+static __maybe_unused int tegra_xusb_runtime_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2201,7 +2198,6 @@ static int tegra_xusb_runtime_resume(struct device *dev)
 
 	return err;
 }
-#endif
 
 static const struct dev_pm_ops tegra_xusb_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_xusb_runtime_suspend,
-- 
2.29.2

