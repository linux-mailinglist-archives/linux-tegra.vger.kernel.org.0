Return-Path: <linux-tegra+bounces-1966-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AE8B5514
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 12:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E871F222D9
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 10:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7FB3612D;
	Mon, 29 Apr 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="T3bH0UUm"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A20C2E41C
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386004; cv=none; b=qUclieaB97zI6xj2FzvVR519D/iX1I54GvtXDJFRybJEVVIP3IkWZoW80GxN0gR3GXrFXLap8Ft8x/um4spbLzqBWKAozftOr33MjLev2O/F93ORrENRTWZ693ki+g+Xy5l/r+OJFrpgDVn68hWUrvHvN8+2KF3/8Q+lozT+cN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386004; c=relaxed/simple;
	bh=2EEHLXvFZKEvM3p+IA8HJtwhMV6/KWLwIP6c0wbA0y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFv2eYVDpQxBzMNRFniZAkdz+Jrw4MGTGUgHDz3BTfoi8YoHMcP6BS07GRmBtMLlPft6bMmeasS3nVl2Z5TxGCExX4yF9I8nwsI7b04ks+oohNren81cfI0z8kfzpndwfHC1n3Jzu11BSEaqA2WPlDX+KPpo6waAIfGSQI5oNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=T3bH0UUm; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4959B60020D0;
	Mon, 29 Apr 2024 11:19:52 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id mS220WER9HSJ; Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0302460020D1;
	Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4J6jstmmKwKcTayN6R9Vo+zp1KLOD0HdL/ySZEB4fQ=;
	b=T3bH0UUmd7DMiOXam3FNGogwFXgIFWbK5qjlMA8C32mUBBLrTTdlIt1vhPANkIFtRT70fR
	55/rfW1dijQr3ixyzZ0782yJJhLZYsAp7D0PPRiBqngIY/RAnI7hsvXtcR0WTmvbDqvAvr
	mqqHL6DtMjrTE6HsK+AajE+1WhUVnG8=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D8B2A360083;
	Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 6/7] memory: tegra: Move compare/update current delay values to a function
Date: Mon, 29 Apr 2024 11:19:29 +0100
Message-ID: <20240429101933.11500-7-diogo.ivo@tecnico.ulisboa.pt>
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

Separate the comparison/updating of the measured delay values with the
values currently programmed into a separate function to simplify the
code.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - Correct return value of update_clock_tree_delay() to bool

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 86 +++++++++----------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 9262da658189..a8a217502f0c 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -113,19 +113,35 @@ enum {
 #define __MOVAVG(timing, dev)                      \
 	((timing)->ptfv_list[(dev)])
 
-static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
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
+static bool update_clock_tree_delay(struct tegra210_emc *emc, int type)
 {
 	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
 	struct tegra210_emc_timing *last = emc->last;
 	struct tegra210_emc_timing *next = emc->next;
 	u32 last_timing_rate_mhz = last->rate / 1000;
-	u32 next_timing_rate_mhz = next->rate / 1000;
 	bool dvfs_update = type == DVFS_UPDATE;
-	s32 tdel = 0, tmdel = 0, adel = 0;
 	bool dvfs_pt1 = type == DVFS_PT1;
 	u32 temp[2][2], value, delay_us;
 	unsigned long cval = 0;
 	unsigned int c, d, idx;
+	bool over = false;
 
 	if (dvfs_pt1 || periodic_training_update) {
 		delay_us = tegra210_emc_actual_osc_clocks(last->run_clocks);
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
@@ -202,34 +210,25 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
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
+	bool over = false;
 	u32 idx;
 
 	if (!next->periodic_training)
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


