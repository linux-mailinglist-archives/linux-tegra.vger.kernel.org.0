Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39AE1F4DB7
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 08:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFJGE1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 02:04:27 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10484 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgFJGCr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 02:02:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee077790000>; Tue, 09 Jun 2020 23:02:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 09 Jun 2020 23:02:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:46 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:46 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee077860000>; Tue, 09 Jun 2020 23:02:46 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 05/18] i2c: tegra: Fix runtime resume to re-init VI I2C
Date:   Tue, 9 Jun 2020 23:02:27 -0700
Message-ID: <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768953; bh=h4CM4t4WxMI9i7DgepTWXatjnwpkOJJzA9gzSaOBero=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=KAjrC9lD0p/HvNV61ho+4D29CRe13r1QQelSD0lkdVUxrhyJwewXgsliDUjLa7aeq
         9RGh+Fr4XSMtRjbW6Oi2Fy8XFBlIvs2jzKJPYQTkA6b0xtw46+tplCdtJW4vFkA54+
         vCbPSoblOG3V2h4d2WaeiaGMg8WnF1PfCkZwHfAswCg3u2yy/ZqaYYUcE0u4vSG1z3
         LJRgBE3zaXnLtxMsku4auiVJ5qya8P0zRYRS2yeHzP8M/98tU8/PF3ZBGDfPQ+clc1
         aOYI79FoRW6xTSn+OfgjtZg3zyq9Sfh3jUXKu9baRRmtz8I9/F/LHyM5mG81yWA1dY
         LbCjKEXIwTCpA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

VI I2C is on host1x bus and is part of VE power domain.

During suspend/resume VE power domain goes through power off/on.

So, controller reset followed by i2c re-initialization is required
after the domain power up.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index dba38a5..650240d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -293,6 +293,8 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
+
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
@@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		goto disable_slow_clk;
 	}
 
+	/*
+	 * VI I2C device is attached to VE power domain which goes through
+	 * power ON/OFF during PM runtime resume/suspend. So, controller
+	 * should go through reset and need to re-initialize after power
+	 * domain ON.
+	 */
+	if (i2c_dev->is_vi) {
+		ret = tegra_i2c_init(i2c_dev, true);
+		if (ret)
+			goto disable_div_clk;
+	}
+
 	return 0;
 
+disable_div_clk:
+	clk_disable(i2c_dev->div_clk);
 disable_slow_clk:
 	if (i2c_dev->slow_clk)
 		clk_disable(i2c_dev->slow_clk);
-- 
2.7.4

