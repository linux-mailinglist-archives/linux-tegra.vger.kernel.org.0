Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBEA35AA9E
	for <lists+linux-tegra@lfdr.de>; Sat, 10 Apr 2021 05:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDJDw5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Apr 2021 23:52:57 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16881 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhDJDvx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Apr 2021 23:51:53 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FHLbx5cpVzkjvy;
        Sat, 10 Apr 2021 11:49:49 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Sat, 10 Apr 2021
 11:51:28 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-serial@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] serial: Add missing MODULE_DEVICE_TABLE
Date:   Sat, 10 Apr 2021 11:50:48 +0800
Message-ID: <20210410035048.11466-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/tty/serial/tegra-tcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/tegra-tcu.c b/drivers/tty/serial/tegra-tcu.c
index aaf8748a6147..52687c65ad74 100644
--- a/drivers/tty/serial/tegra-tcu.c
+++ b/drivers/tty/serial/tegra-tcu.c
@@ -282,6 +282,7 @@ static const struct of_device_id tegra_tcu_match[] = {
 	{ .compatible = "nvidia,tegra194-tcu" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, tegra_tcu_match);
 
 static struct platform_driver tegra_tcu_driver = {
 	.driver = {

