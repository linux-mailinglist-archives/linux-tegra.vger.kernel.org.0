Return-Path: <linux-tegra+bounces-1520-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4BE89D5E4
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Apr 2024 11:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E8E2857C3
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Apr 2024 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126058003B;
	Tue,  9 Apr 2024 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="lb/eQvDn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AD7FBBC
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656020; cv=none; b=dwmmKlXebYrjegPLKFCNSXLMcid68PRHZwt9YYi0AHkydmySgUANUSsNKzvimmHL/B4baVW347DaNyK81TA/kFddDdcoVQYlFh2/COxK0u/Yh2lUBnLA927naPthSfeq9Z6e58YdSjhXIzL5WAhXzq8VVxOja4RSM4O3/hUbWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656020; c=relaxed/simple;
	bh=K7vEYFpI6UBBggsgXQUgyYcA6qspofnmNPNo0H1AcD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHpsG3cMBFoAWViJ89/l622uOpXx5f4lOSMVfHtDhDYf7YbkHjVJyBbkLdwjnHybg0uo47ZxmzGZOinjM6Had9MoxjgeS08wYNvBtdSbiKHUPXUkCp4NP/FM2Li5e8Zj99qhTZP7sk2yoEDjv9mFh2YuyoENq2FSQoRk2L+sH7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=lb/eQvDn; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6E0B360022E1;
	Tue,  9 Apr 2024 10:46:52 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Yuy0Kz57yZAF; Tue,  9 Apr 2024 10:46:50 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2949F60022E0;
	Tue,  9 Apr 2024 10:46:50 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1712656010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OX4n/8d/Mwq9mu+rJ9bMxzvAYFs9eWH4VbzUE4pdjOM=;
	b=lb/eQvDnCBgCHO61SxrC57j//Kll13ShMqfSTJRHo7ZMq+X92czPpDbm3RD6gCFylQb3YN
	TP7PAMDkQtyM1EQovESAYSBbmAmCLhczsIldPsywRqoekpkB3h2mTjY02cnC/515prhT5x
	g53CCweag4GXGiwTOZT9M7BajrG5nl4=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0A3EB360030;
	Tue,  9 Apr 2024 10:46:50 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 6/7] memory: tegra: Move compare/update current delay values to a function
Date: Tue,  9 Apr 2024 10:46:29 +0100
Message-ID: <20240409094632.62916-7-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the comparison/updating of the measured delay values with the
values currently programmed into a separate function to simplify the
code.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 84 +++++++++----------
 1 file changed, 38 insertions(+), 46 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 566e5c65c854..ec2f84758d55 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -113,19 +113,35 @@ enum {
 #define __MOVAVG(timing, dev)                      \
 	((timing)->ptfv_list[dev])
 
+static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing,
+					      u32 measured, u32 idx)
+{
+	u32 *curr = &timing->current_dram_clktree[idx];
+	u32 rate_mhz = timing->rate / 1000;
+	u32 tmdel;
+
+	tmdel = abs(*curr - measured);
+
+	if (tmdel * 128 * rate_mhz / 1000000 > timing->tree_margin) {
+		*curr = measured;
+		return true;
+	}
+
+	return false;
+}
+
 static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 {
 	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
 	struct tegra210_emc_timing *last = emc->last;
 	struct tegra210_emc_timing *next = emc->next;
 	u32 last_timing_rate_mhz = last->rate / 1000;
-	u32 next_timing_rate_mhz = next->rate / 1000;
 	bool dvfs_update = type == DVFS_UPDATE;
-	s32 tdel = 0, tmdel = 0, adel = 0;
 	bool dvfs_pt1 = type == DVFS_PT1;
 	u32 temp[2][2], value, udelay;
 	unsigned long cval = 0;
 	unsigned int c, d, idx;
+	bool over = false;
 
 	if (dvfs_pt1 || periodic_training_update) {
 		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
@@ -174,17 +190,9 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 			else if (periodic_training_update)
 				__WEIGHTED_UPDATE_PTFV(idx, cval);
 
-			if (dvfs_update || periodic_training_update) {
-				tdel = next->current_dram_clktree[idx] -
-						__MOVAVG_AC(next, idx);
-				tmdel = (tdel < 0) ? -1 * tdel : tdel;
-				adel = tmdel;
-
-				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-				    next->tree_margin)
-					next->current_dram_clktree[idx] =
-						__MOVAVG_AC(next, idx);
-			}
+			if (dvfs_update || periodic_training_update)
+				over |= tegra210_emc_compare_update_delay(next,
+							__MOVAVG_AC(next, idx), idx);
 
 			/* C[c]D[d]U[1] */
 			idx++;
@@ -202,35 +210,26 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 			else if (periodic_training_update)
 				__WEIGHTED_UPDATE_PTFV(idx, cval);
 
-			if (dvfs_update || periodic_training_update) {
-				tdel = next->current_dram_clktree[idx] -
-						__MOVAVG_AC(next, idx);
-				tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-				if (tmdel > adel)
-					adel = tmdel;
-
-				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-				    next->tree_margin)
-					next->current_dram_clktree[idx] =
-						__MOVAVG_AC(next, idx);
-			}
+			if (dvfs_update || periodic_training_update)
+				over |= tegra210_emc_compare_update_delay(next,
+							__MOVAVG_AC(next, idx), idx);
 		}
 	}
 
-	return adel;
+	return over;
 }
 
-static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
-					 struct tegra210_emc_timing *last,
-					 struct tegra210_emc_timing *next)
+static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
+					  struct tegra210_emc_timing *last,
+					  struct tegra210_emc_timing *next)
 {
 #define __COPY_EMA(nt, lt, dev)						\
 	({ __MOVAVG(nt, dev) = __MOVAVG(lt, dev) *			\
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
-	u32 i, adel = 0, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 i, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
 	u32 idx;
+	bool over = false;
 
 	if (!next->periodic_training)
 		return 0;
@@ -253,23 +252,23 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 
 			for (i = 0; i < samples; i++) {
 				/* Generate next sample of data. */
-				adel = update_clock_tree_delay(emc, DVFS_PT1);
+				update_clock_tree_delay(emc, DVFS_PT1);
 			}
 		}
 
 		/* Do the division part of the moving average */
-		adel = update_clock_tree_delay(emc, DVFS_UPDATE);
+		over = update_clock_tree_delay(emc, DVFS_UPDATE);
 	}
 
 	if (type == PERIODIC_TRAINING_SEQUENCE)
-		adel = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
+		over = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
 
-	return adel;
+	return over;
 }
 
 static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 {
-	u32 emc_cfg, emc_cfg_o, emc_cfg_update, del, value;
+	u32 emc_cfg, emc_cfg_o, emc_cfg_update, value;
 	static const u32 list[] = {
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
@@ -327,15 +326,12 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 		 * 4. Check delta wrt previous values (save value if margin
 		 *    exceeds what is set in table).
 		 */
-		del = periodic_compensation_handler(emc,
-						    PERIODIC_TRAINING_SEQUENCE,
-						    last, last);
-
+		if (periodic_compensation_handler(emc, PERIODIC_TRAINING_SEQUENCE,
+						  last, last)) {
 		/*
 		 * 5. Apply compensation w.r.t. trained values (if clock tree
 		 *    has drifted more than the set margin).
 		 */
-		if (last->tree_margin < ((del * 128 * (last->rate / 1000)) / 1000000)) {
 			for (i = 0; i < items; i++) {
 				value = tegra210_emc_compensate(last, list[i]);
 				emc_dbg(emc, EMA_WRITES, "0x%08x <= 0x%08x\n",
@@ -516,11 +512,7 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 						     EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK,
 						     0);
 
-		value = periodic_compensation_handler(emc, DVFS_SEQUENCE, fake,
-						      next);
-		value = (value * 128 * next->rate / 1000) / 1000000;
-
-		if (next->periodic_training && value > next->tree_margin)
+		if (periodic_compensation_handler(emc, DVFS_SEQUENCE, fake, next))
 			compensate_trimmer_applicable = true;
 	}
 
-- 
2.44.0


