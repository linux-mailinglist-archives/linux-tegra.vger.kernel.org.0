Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B011604C3
	for <lists+linux-tegra@lfdr.de>; Sun, 16 Feb 2020 17:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgBPQRx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 16 Feb 2020 11:17:53 -0500
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:39591 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbgBPQRx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 Feb 2020 11:17:53 -0500
Received: from localhost.localdomain ([92.148.185.249])
        by mwinf5d27 with ME
        id 3UHp220015PGiUk03UHpqB; Sun, 16 Feb 2020 17:17:51 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Feb 2020 17:17:51 +0100
X-ME-IP: 92.148.185.249
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        gregkh@linuxfoundation.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] firmware: tegra: Fix a typo in Kconfig
Date:   Sun, 16 Feb 2020 17:17:48 +0100
Message-Id: <20200216161748.21894-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A 'n' is mising in 'commuication'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index a887731f50d6..1c8ba1f47c7c 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -7,7 +7,7 @@ config TEGRA_IVC
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
-	  data and the different commuication channels in SysRAM or RAM and
+	  data and the different communication channels in SysRAM or RAM and
 	  keeps the content is synchronization between host CPU and remote
 	  processors.
 
-- 
2.20.1

