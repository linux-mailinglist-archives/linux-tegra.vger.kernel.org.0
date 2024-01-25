Return-Path: <linux-tegra+bounces-554-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61D83C21E
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jan 2024 13:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41A0290ACC
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jan 2024 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F11F45026;
	Thu, 25 Jan 2024 12:11:07 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E43B19D
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jan 2024 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706184667; cv=none; b=JnR+2tduX7g5fkgqe2dJhQXOItHQkz5yyk+9TaA4MHj6fZkC8/3PsvpyjcBrKJjuGtVssmZrWA5ktgUUoIOGsIErLf9WHa3Pu0VDvvX+RLKylWMsa873Fw8J/KQa956UU9qj4YQuSi7897lAlmOayzUD7ruoV6j/aVgplnFHP9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706184667; c=relaxed/simple;
	bh=ebKMXnAsgUoMVzGUKzFok8qdL3jXBmTQSndbavx1WdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WapUxUs5jXbjQjQBaSqf/vkH3Y4CzFGQ4G0P4/DCGdxcok5AyoWRf+iAAUgxG3bb7MlvR3CJ80Z8qAFuLAVSac7FopM2u+8PXLnXST/QliaVy6jl4frr8bLp9KdWI1+q8y+4N1ZVnQLUz1ZcV+/JMu1hQq/xzxFa4/pUwnuNMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZQ-0004Zg-3r; Thu, 25 Jan 2024 13:11:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZO-002HUr-FP; Thu, 25 Jan 2024 13:10:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZO-007n4b-1H;
	Thu, 25 Jan 2024 13:10:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pwm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v5 096/111] pwm: tegra: Make use of devm_pwmchip_alloc() function
Date: Thu, 25 Jan 2024 13:09:58 +0100
Message-ID:  <f347f9227d39ca9a495fbae7ba10e048f49f95f7.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ebKMXnAsgUoMVzGUKzFok8qdL3jXBmTQSndbavx1WdA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk+qHIDcLPfYn7CK5Z8mvB4QNx2K5SFvDhho8 3UzfloHJkyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPqgAKCRCPgPtYfRL+ TiJlCACrg8Ww/TyKGjGSMip6A+aCOpbJ3cjZsxfto0eOAf3m/sgDWrZZt5ENN+bC4shKeLRJbnM UTNDkphMi5tDU/H95wWoYHvbtHzJIsTQUeG985nrBIy4meoIU7iIIK7bMwh2H5+dQT8Bf63pisz AysAj58eQ/gFLTYiyDBRns+2IWEMW5UYHWX7/VBVM4sYoc6oRqmwZeIfh7S5U/zDJGILnzQR0wI F4JcF87NSu+0aCqSL17jpr8SiH7Jx586yifeTFPwBxSiCKRu/UUQfGu2YHTa6Jy9tPbcEitrhsT e3bVQWiTgRC3WMZITKuGdVRrx55u6EwU1e/eJOlCiRHNBu6F
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org

This prepares the pwm-tegra driver to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-tegra.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 82ee2f0754f9..5eb7bdfb84d8 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -65,7 +65,6 @@ struct tegra_pwm_soc {
 };
 
 struct tegra_pwm_chip {
-	struct pwm_chip chip;
 	struct device *dev;
 
 	struct clk *clk;
@@ -81,7 +80,7 @@ struct tegra_pwm_chip {
 
 static inline struct tegra_pwm_chip *to_tegra_pwm_chip(struct pwm_chip *chip)
 {
-	return container_of(chip, struct tegra_pwm_chip, chip);
+	return pwmchip_get_drvdata(chip);
 }
 
 static inline u32 pwm_readl(struct tegra_pwm_chip *pc, unsigned int offset)
@@ -272,14 +271,19 @@ static const struct pwm_ops tegra_pwm_ops = {
 
 static int tegra_pwm_probe(struct platform_device *pdev)
 {
+	struct pwm_chip *chip;
 	struct tegra_pwm_chip *pc;
+	const struct tegra_pwm_soc *soc;
 	int ret;
 
-	pc = devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
-	if (!pc)
-		return -ENOMEM;
+	soc = of_device_get_match_data(&pdev->dev);
 
-	pc->soc = of_device_get_match_data(&pdev->dev);
+	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_channels, sizeof(*pc));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	pc = to_tegra_pwm_chip(chip);
+
+	pc->soc = soc;
 	pc->dev = &pdev->dev;
 
 	pc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -328,11 +332,9 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 
 	reset_control_deassert(pc->rst);
 
-	pc->chip.dev = &pdev->dev;
-	pc->chip.ops = &tegra_pwm_ops;
-	pc->chip.npwm = pc->soc->num_channels;
+	chip->ops = &tegra_pwm_ops;
 
-	ret = pwmchip_add(&pc->chip);
+	ret = pwmchip_add(chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		reset_control_assert(pc->rst);
@@ -350,9 +352,10 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 
 static void tegra_pwm_remove(struct platform_device *pdev)
 {
-	struct tegra_pwm_chip *pc = platform_get_drvdata(pdev);
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
 
-	pwmchip_remove(&pc->chip);
+	pwmchip_remove(chip);
 
 	reset_control_assert(pc->rst);
 
-- 
2.43.0


