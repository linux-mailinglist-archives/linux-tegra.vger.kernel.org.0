Return-Path: <linux-tegra+bounces-1961-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C48B550F
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 12:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE1C1F22328
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6EC3E493;
	Mon, 29 Apr 2024 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="PMtZ38ZQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFB39FF7
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386000; cv=none; b=RA6ntCwM80cKPdfbgM5DZ5xslkL8AlOv9qKJkZ9Ihkmd0NoVJzkQZlNmX2l/NPgsl5vmDVNaFKvngNlldKbYtLT7ZBaOSKufSOqrZozHsoX439ljRi9v9hPVTNzdpA+1yKm48pmdrdg4HdMyeXyk9plrHF1zPwJkzxm4zUyAVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386000; c=relaxed/simple;
	bh=48e42rpGIqwsnSPcGfLXH8Uv/Hunfs2kOG892nNEFxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBFsjONxoqxJUQW0I5PiOickeM3Vw7kOp+9PBYKM7uS7+ZXd0TtQ/8XioIPhYtVUGMZeXqrh8kKV9SOyGp95YiJH8S7Ih12U6djEaz2U2WvJFEi35p7K4i0rxN/ULnQ1xnUPiZB8kkMWjP+HOp9DL8bvnOxq2r80M8qn9EcCs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=PMtZ38ZQ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B6C0760020CE;
	Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id EqQ3Yp3HwdIj; Mon, 29 Apr 2024 11:19:47 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 79DE56001407;
	Mon, 29 Apr 2024 11:19:47 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOWi5Kvsv8Ir9mYtzX4oMt7r57mv1EqWeeYXt47rh9o=;
	b=PMtZ38ZQPj6YGPgxMqFvgjqzprr2AmPmH6hOGiy86dXZLIXyFIPL/pj6CiI4WHSqQpCQLe
	oCVGspvn+a5UBUPmgFpwr2ccdAl0Gp7F6CxFkZTGn63aKYmCIq+pULUfBaswzpiCK0UEt9
	DNW2QVIMqu+w+KHsSeRRFooBlev0wq4=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 587D8360083;
	Mon, 29 Apr 2024 11:19:47 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 1/7] memory: tegra: Remove periodic compensation duplicate calls
Date: Mon, 29 Apr 2024 11:19:24 +0100
Message-ID: <20240429101933.11500-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to calling periodic_compensation_handler() the code is doing one
extra DRAM delay reading which is unnecessary as this is already done
in periodic_compensation_handler(), so remove these extra calls.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 4cb608c71ead..9ec49ced8f91 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -492,7 +492,6 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 	};
 	struct tegra210_emc_timing *last = emc->last;
 	unsigned int items = ARRAY_SIZE(list), i;
-	unsigned long delay;
 
 	if (last->periodic_training) {
 		emc_dbg(emc, PER_TRAIN, "Periodic training starting\n");
@@ -530,18 +529,9 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 		/*
 		 * 2. osc kick off - this assumes training and dvfs have set
 		 *    correct MR23.
-		 */
-		tegra210_emc_start_periodic_compensation(emc);
-
-		/*
+		 *
 		 * 3. Let dram capture its clock tree delays.
-		 */
-		delay = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		delay *= 1000;
-		delay /= last->rate + 1;
-		udelay(delay);
-
-		/*
+		 *
 		 * 4. Check delta wrt previous values (save value if margin
 		 *    exceeds what is set in table).
 		 */
@@ -734,11 +724,6 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 						     EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK,
 						     0);
 
-		tegra210_emc_start_periodic_compensation(emc);
-
-		delay = 1000 * tegra210_emc_actual_osc_clocks(last->run_clocks);
-		udelay((delay / last->rate) + 2);
-
 		value = periodic_compensation_handler(emc, DVFS_SEQUENCE, fake,
 						      next);
 		value = (value * 128 * next->rate / 1000) / 1000000;
-- 
2.44.0


