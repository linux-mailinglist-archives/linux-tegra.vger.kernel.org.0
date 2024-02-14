Return-Path: <linux-tegra+bounces-786-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740E854916
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Feb 2024 13:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A6941F2A416
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Feb 2024 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C641B81A;
	Wed, 14 Feb 2024 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="sMkVIARR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F21B95C
	for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707913301; cv=none; b=VsVA1WCuybwMLajt0aIcy9FbETWOM4nUEBRhBW/3VzygLkBt6PBjukKfkcUPVGji9L6+aImfQQpuWUvudDOEYQ9GSEbVp2bUxfHCKsb/k847APbmi2ZztogTMc7JQYFWFpsjw0Gj/sUYgRTnfqH4EJuXMG3TEZTC1ELVqWn+2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707913301; c=relaxed/simple;
	bh=C8k3ZC2ooU0lqoBxRoFNYIQlhqrzT+TxMtBbqLX1yuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MafRJtJmZ/rETdMk/l+R9ymYbOBtuqCfAqUHvZHBFXkc5zc14Lt3oFSOoqKFHXGFYaesmexnhVfO2GPDnW1Lzq++2EGhGnZojNQqhSdcE5dn142jgKmGMYkshSlnNSFKJaAVd0XHNDJr1xtEkgxgwDZQmDcB23RvfmIpOtlNwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=sMkVIARR; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RzxRRhtdAnPm0aM2h8vavNmIk+E7Tg9BqH5yNtCHY5Y=; b=sMkVIARRDo2Z0YF97eLEIbunGL
	g6UAVfZQ6BOec6wHg5lB95LiExD63s4N9kht2mbKrHL0dxX8a432fZT7ivNNx8+CQJIE88YI9uYB8
	bGXG9HrJM4YAuFLE+ljdsoHyyg2CH12sZQELBtj/wCsvc0EVIdT+DTAMVMD0nhKahDz8XKoFDLsW+
	WQBzgu0ktcPg5LRgBdq1oDu0F2Xc7LPSffhAknnFbJ6xkBleOwggnvh5vUvgSAt41u8nJinLiOyQr
	roUmsbQTFHUYVR3uxMW2hwo59d0nfwUShJVwPs3e62YJSqW1EU/fxtFpDkmjXpjpjOvH+LDBKP/wT
	CR+j+wzA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1raDdd-00ChIO-0X;
	Wed, 14 Feb 2024 13:41:17 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Date: Wed, 14 Feb 2024 13:40:49 +0200
Message-ID: <20240214114049.1421463-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra186, other software components may rely on the kernel to
keep Host1x operational even during suspend. As such, as a quirk,
skip asserting Host1x's reset on Tegra186.

We don't need to keep the clocks enabled, as BPMP ensures the clock
stays on while Host1x is being used. On newer SoC's, the reset line
is inaccessible, so there is no need for the quirk.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++------
 drivers/gpu/host1x/dev.h |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 42fd504abbcd..89983d7d73ca 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -169,6 +169,7 @@ static const struct host1x_info host1x06_info = {
 	.num_sid_entries = ARRAY_SIZE(tegra186_sid_table),
 	.sid_table = tegra186_sid_table,
 	.reserve_vblank_syncpts = false,
+	.skip_reset_assert = true,
 };
 
 static const struct host1x_sid_entry tegra194_sid_table[] = {
@@ -680,13 +681,15 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	host1x_intr_stop(host);
 	host1x_syncpt_save(host);
 
-	err = reset_control_bulk_assert(host->nresets, host->resets);
-	if (err) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		goto resume_host1x;
-	}
+	if (!host->info->skip_reset_assert) {
+		err = reset_control_bulk_assert(host->nresets, host->resets);
+		if (err) {
+			dev_err(dev, "failed to assert reset: %d\n", err);
+			goto resume_host1x;
+		}
 
-	usleep_range(1000, 2000);
+		usleep_range(1000, 2000);
+	}
 
 	clk_disable_unprepare(host->clk);
 	reset_control_bulk_release(host->nresets, host->resets);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index c8e302de7625..9c13e71a31ff 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -116,6 +116,7 @@ struct host1x_info {
 	 * the display driver disables VBLANK increments.
 	 */
 	bool reserve_vblank_syncpts;
+	bool skip_reset_assert;
 };
 
 struct host1x {
-- 
2.42.0


