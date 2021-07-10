Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BA73C3900
	for <lists+linux-tegra@lfdr.de>; Sun, 11 Jul 2021 01:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhGJX5P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 10 Jul 2021 19:57:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234089AbhGJX4C (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 10 Jul 2021 19:56:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A7AE61403;
        Sat, 10 Jul 2021 23:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625961125;
        bh=DPYLXDBQlJ4xCJUeTqh/3nUbSMOGFtVr9aV+f0tGoH0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YXi8xCUTVj4g8MNmeGjoqJ4vKD9qKU2MwbLFOG7KWAxOHvQviz+bdH4EyHYwprZuz
         p/7zZbKgdR9oQcKe2ojY6g/qtq2ceRYa5a4FJ178HcTNXv15VXBBuLNmsHuXVghC7l
         0wFEWqgAL+281mJHpPqY+b2PrEgZrCu+9msgt+IeiH7sAmrTvd/dW70IBaOxp6r1l4
         E4GtVAg11mv0U0FunDy+DxnsWzsTMoDN9ZZ+LD7cm3dFLz1pB3HRsD8BorvNH0/9QJ
         vxY2S+7MxWKaf4q9MfzeidLTZltkhuxwkeKk5U11+HQkW4VNv4DEnMu2dH5fZR/Bzy
         dAUOw6sj7QSdQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-pwm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 17/22] pwm: tegra: Don't modify HW state in .remove callback
Date:   Sat, 10 Jul 2021 19:51:38 -0400
Message-Id: <20210710235143.3222129-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710235143.3222129-1-sashal@kernel.org>
References: <20210710235143.3222129-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[ Upstream commit 86f7fa71cd830d18d7ebcaf719dffd5ddfe1acdd ]

A consumer is expected to disable a PWM before calling pwm_put(). And if
they didn't there is hopefully a good reason (or the consumer needs
fixing). Also if disabling an enabled PWM was the right thing to do,
this should better be done in the framework instead of in each low level
driver.

So drop the hardware modification from the .remove() callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pwm/pwm-tegra.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index f8ebbece57b7..6be14e0f1dc3 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -245,7 +245,6 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 static int tegra_pwm_remove(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pc = platform_get_drvdata(pdev);
-	unsigned int i;
 	int err;
 
 	if (WARN_ON(!pc))
@@ -255,18 +254,6 @@ static int tegra_pwm_remove(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < pc->chip.npwm; i++) {
-		struct pwm_device *pwm = &pc->chip.pwms[i];
-
-		if (!pwm_is_enabled(pwm))
-			if (clk_prepare_enable(pc->clk) < 0)
-				continue;
-
-		pwm_writel(pc, i, 0);
-
-		clk_disable_unprepare(pc->clk);
-	}
-
 	reset_control_assert(pc->rst);
 	clk_disable_unprepare(pc->clk);
 
-- 
2.30.2

