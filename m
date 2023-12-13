Return-Path: <linux-tegra+bounces-255-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6D80F489
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Dec 2023 18:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB0B1C20A86
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Dec 2023 17:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1577D896;
	Tue, 12 Dec 2023 17:27:06 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB199F
	for <linux-tegra@vger.kernel.org>; Tue, 12 Dec 2023 09:27:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-0001uQ-MT; Tue, 12 Dec 2023 18:26:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-00FOPP-2e; Tue, 12 Dec 2023 18:26:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-001nbl-Pg; Tue, 12 Dec 2023 18:26:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 4/5] memory: tegra30-emc: Simplify usage of clk_rate_exclusive_get()
Date: Tue, 12 Dec 2023 18:26:41 +0100
Message-ID:  <9cf2553c9da167ebf6654bbdeab6ce2a93232ca6.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=/SRuKBC39buZsWlbWBv7+96SVuuaEgkac/QXVMO5G6c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBleJfRwIcGicrAotiVL8mlo7dbUTNw3bWwZk8En opEt170hFKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXiX0QAKCRCPgPtYfRL+ TqCpCACiWCRhk+aAoozmvgJ1Fw+AsM0K4IA40aYwhkcIVdOH+ZZr84wat/ZtWuz5N+N3UFDmh/v iv1DF/WcewcwjYR4ml3iPgZEjM/We8quWlW0OPJSrsEnZcuh22Ot+V3AImmznPqfCnshummKZ2N plgA7zAtRsya5pZslCR086URGOednrRkNlYwjQj4FoFKR0fxtYE6aLdhDIWVtpZcNnHUVtTQRCg B12RA83tuk3xnBhW8NVxTE47uzUWgTIx0YmzNeCxGnif5JjBeV1aHncvjazdZUxseJntAdsbNS8 g2J3QHQGroWs7MItRSE9ow/JkUbKgaqy5DXxOsDAsDn2PBvt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org

clk_rate_exclusive_get() returns 0 unconditionally. So remove error
handling. This prepares making clk_rate_exclusive_get() return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/memory/tegra/tegra30-emc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 9eae25c57ec6..496b42c4c1a8 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1696,11 +1696,7 @@ static int tegra_emc_suspend(struct device *dev)
 	int err;
 
 	/* take exclusive control over the clock's rate */
-	err = clk_rate_exclusive_get(emc->clk);
-	if (err) {
-		dev_err(emc->dev, "failed to acquire clk: %d\n", err);
-		return err;
-	}
+	clk_rate_exclusive_get(emc->clk);
 
 	/* suspending in a bad state will hang machine */
 	if (WARN(emc->bad_state, "hardware in a bad state\n"))
-- 
2.42.0


