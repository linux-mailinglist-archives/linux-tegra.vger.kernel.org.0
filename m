Return-Path: <linux-tegra+bounces-5580-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BCA5FE5A
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Mar 2025 18:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E76188E2CF
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Mar 2025 17:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7285B1AA786;
	Thu, 13 Mar 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hOZKRNeP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="keaLKqTP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hOZKRNeP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="keaLKqTP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6DB1940A1
	for <linux-tegra@vger.kernel.org>; Thu, 13 Mar 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887739; cv=none; b=YGr8BKKDt89RwQz8n+P8DdLMDmZ+ev5apKEQ/LzCSX2vNMATbPnn/KolPwQR6gEM/r9HDFY604egQgvtibOzAzVfdHcdUBekbcxB1KK4icvkmS3dYxQwcEqjT3IHn37Ht9Q+0lOVESpmZKrqJXS43G97zecWsk8VgnaEMF19/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887739; c=relaxed/simple;
	bh=iIvbVzMcFcwDv56juXKSPMxS+wYnIL+MESafUX06zGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbbwht5UeXVkqDlAOzE0HlI56oXzexWZIfaOfQ1Y0r3qOqfLbX+MFcS+keBVh2tCvLZ1ItDTT0SYUrlmVjg42z0Tv9L8rrDuuZVRtUELUuOgweN38hdXQFPexs8/NJ1ZhRynPAjBlqmAEseiY1XsN1nmiJ2w4ODeAsPemzfygdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hOZKRNeP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=keaLKqTP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hOZKRNeP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=keaLKqTP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD1A31F7B5;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTU1WzqZhhuIljaNNNNzSyShixVU996Re2We29m17Ok=;
	b=hOZKRNePI4s3HzHtMDQC4gqsv79hnYB6H2NllSD7eNVTY+wVeV2yZiH4OcjHy05LfN2dkF
	xJae4nrFvirmEEILmup7SVO6EQt26tDWPxoCX1FH9wd3iZZtHX2H2aOdGA9Aqf0lldMOja
	ZVUwjPrYmFyrcNYrbAdZW2R4tqy9MQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTU1WzqZhhuIljaNNNNzSyShixVU996Re2We29m17Ok=;
	b=keaLKqTPJVKtcA+6WbSIf+sf/r4F/+bY73AkonqktPU5GuxueyK8B/yENHpdVmGYtTEUXI
	QhmPtgup8w2f16CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTU1WzqZhhuIljaNNNNzSyShixVU996Re2We29m17Ok=;
	b=hOZKRNePI4s3HzHtMDQC4gqsv79hnYB6H2NllSD7eNVTY+wVeV2yZiH4OcjHy05LfN2dkF
	xJae4nrFvirmEEILmup7SVO6EQt26tDWPxoCX1FH9wd3iZZtHX2H2aOdGA9Aqf0lldMOja
	ZVUwjPrYmFyrcNYrbAdZW2R4tqy9MQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTU1WzqZhhuIljaNNNNzSyShixVU996Re2We29m17Ok=;
	b=keaLKqTPJVKtcA+6WbSIf+sf/r4F/+bY73AkonqktPU5GuxueyK8B/yENHpdVmGYtTEUXI
	QhmPtgup8w2f16CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7DD4137BA;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UAipK/AY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 84/89] ASoC: tegra210: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:29 +0100
Message-ID: <20250313174139.29942-85-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: linux-tegra@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra210_admaif.c | 13 ++++++-------
 sound/soc/tegra/tegra210_adx.c    | 13 ++++++-------
 sound/soc/tegra/tegra210_ahub.c   | 13 ++++++-------
 sound/soc/tegra/tegra210_amx.c    | 13 ++++++-------
 sound/soc/tegra/tegra210_dmic.c   | 13 ++++++-------
 sound/soc/tegra/tegra210_i2s.c    | 13 ++++++-------
 sound/soc/tegra/tegra210_mixer.c  | 13 ++++++-------
 sound/soc/tegra/tegra210_mvc.c    | 13 ++++++-------
 sound/soc/tegra/tegra210_ope.c    | 13 ++++++-------
 sound/soc/tegra/tegra210_sfc.c    | 13 ++++++-------
 10 files changed, 60 insertions(+), 70 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index f56d1e03239d..76ff4fe40f65 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -220,7 +220,7 @@ static const struct regmap_config tegra186_admaif_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
-static int __maybe_unused tegra_admaif_runtime_suspend(struct device *dev)
+static int tegra_admaif_runtime_suspend(struct device *dev)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
 
@@ -230,7 +230,7 @@ static int __maybe_unused tegra_admaif_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra_admaif_runtime_resume(struct device *dev)
+static int tegra_admaif_runtime_resume(struct device *dev)
 {
 	struct tegra_admaif *admaif = dev_get_drvdata(dev);
 
@@ -877,10 +877,9 @@ static void tegra_admaif_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra_admaif_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra_admaif_runtime_suspend,
-			   tegra_admaif_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra_admaif_runtime_suspend,
+		       tegra_admaif_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_admaif_driver = {
@@ -889,7 +888,7 @@ static struct platform_driver tegra_admaif_driver = {
 	.driver = {
 		.name = "tegra210-admaif",
 		.of_match_table = tegra_admaif_of_match,
-		.pm = &tegra_admaif_pm_ops,
+		.pm = pm_ptr(&tegra_admaif_pm_ops),
 	},
 };
 module_platform_driver(tegra_admaif_driver);
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 0aa93b948378..ff34682ebb15 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -84,7 +84,7 @@ static int tegra210_adx_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int __maybe_unused tegra210_adx_runtime_suspend(struct device *dev)
+static int tegra210_adx_runtime_suspend(struct device *dev)
 {
 	struct tegra210_adx *adx = dev_get_drvdata(dev);
 
@@ -94,7 +94,7 @@ static int __maybe_unused tegra210_adx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_adx_runtime_resume(struct device *dev)
+static int tegra210_adx_runtime_resume(struct device *dev)
 {
 	struct tegra210_adx *adx = dev_get_drvdata(dev);
 
@@ -524,17 +524,16 @@ static void tegra210_adx_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_adx_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_adx_runtime_suspend,
-			   tegra210_adx_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_adx_runtime_suspend,
+		       tegra210_adx_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra210_adx_driver = {
 	.driver = {
 		.name = "tegra210-adx",
 		.of_match_table = tegra210_adx_of_match,
-		.pm = &tegra210_adx_pm_ops,
+		.pm = pm_ptr(&tegra210_adx_pm_ops),
 	},
 	.probe = tegra210_adx_platform_probe,
 	.remove = tegra210_adx_platform_remove,
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 1920b996e9aa..99683f292b5d 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -1319,7 +1319,7 @@ static const struct of_device_id tegra_ahub_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_ahub_of_match);
 
-static int __maybe_unused tegra_ahub_runtime_suspend(struct device *dev)
+static int tegra_ahub_runtime_suspend(struct device *dev)
 {
 	struct tegra_ahub *ahub = dev_get_drvdata(dev);
 
@@ -1331,7 +1331,7 @@ static int __maybe_unused tegra_ahub_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra_ahub_runtime_resume(struct device *dev)
+static int tegra_ahub_runtime_resume(struct device *dev)
 {
 	struct tegra_ahub *ahub = dev_get_drvdata(dev);
 	int err;
@@ -1408,10 +1408,9 @@ static void tegra_ahub_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra_ahub_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra_ahub_runtime_suspend,
-			   tegra_ahub_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra_ahub_runtime_suspend,
+		       tegra_ahub_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_ahub_driver = {
@@ -1420,7 +1419,7 @@ static struct platform_driver tegra_ahub_driver = {
 	.driver = {
 		.name = "tegra210-ahub",
 		.of_match_table = tegra_ahub_of_match,
-		.pm = &tegra_ahub_pm_ops,
+		.pm = pm_ptr(&tegra_ahub_pm_ops),
 	},
 };
 module_platform_driver(tegra_ahub_driver);
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index a9ef22c19e81..1981b94009cf 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -98,7 +98,7 @@ static int tegra210_amx_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int __maybe_unused tegra210_amx_runtime_suspend(struct device *dev)
+static int tegra210_amx_runtime_suspend(struct device *dev)
 {
 	struct tegra210_amx *amx = dev_get_drvdata(dev);
 
@@ -108,7 +108,7 @@ static int __maybe_unused tegra210_amx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_amx_runtime_resume(struct device *dev)
+static int tegra210_amx_runtime_resume(struct device *dev)
 {
 	struct tegra210_amx *amx = dev_get_drvdata(dev);
 
@@ -581,17 +581,16 @@ static void tegra210_amx_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_amx_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_amx_runtime_suspend,
-			   tegra210_amx_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_amx_runtime_suspend,
+		       tegra210_amx_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra210_amx_driver = {
 	.driver = {
 		.name = "tegra210-amx",
 		.of_match_table = tegra210_amx_of_match,
-		.pm = &tegra210_amx_pm_ops,
+		.pm = pm_ptr(&tegra210_amx_pm_ops),
 	},
 	.probe = tegra210_amx_platform_probe,
 	.remove = tegra210_amx_platform_remove,
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 7986be71f43d..e4a144571265 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -40,7 +40,7 @@ static const struct reg_default tegra210_dmic_reg_defaults[] = {
 	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0 },
 };
 
-static int __maybe_unused tegra210_dmic_runtime_suspend(struct device *dev)
+static int tegra210_dmic_runtime_suspend(struct device *dev)
 {
 	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
 
@@ -52,7 +52,7 @@ static int __maybe_unused tegra210_dmic_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_dmic_runtime_resume(struct device *dev)
+static int tegra210_dmic_runtime_resume(struct device *dev)
 {
 	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
 	int err;
@@ -543,10 +543,9 @@ static void tegra210_dmic_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_dmic_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_dmic_runtime_suspend,
-			   tegra210_dmic_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_dmic_runtime_suspend,
+		       tegra210_dmic_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra210_dmic_of_match[] = {
@@ -559,7 +558,7 @@ static struct platform_driver tegra210_dmic_driver = {
 	.driver = {
 		.name = "tegra210-dmic",
 		.of_match_table = tegra210_dmic_of_match,
-		.pm = &tegra210_dmic_pm_ops,
+		.pm = pm_ptr(&tegra210_dmic_pm_ops),
 	},
 	.probe = tegra210_dmic_probe,
 	.remove = tegra210_dmic_remove,
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 07ce2dbe6c00..766cddebd5f6 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -166,7 +166,7 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 	return tegra210_i2s_sw_reset(compnt, stream);
 }
 
-static int __maybe_unused tegra210_i2s_runtime_suspend(struct device *dev)
+static int tegra210_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
 
@@ -178,7 +178,7 @@ static int __maybe_unused tegra210_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_i2s_runtime_resume(struct device *dev)
+static int tegra210_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
 	int err;
@@ -1010,10 +1010,9 @@ static void tegra210_i2s_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_i2s_runtime_suspend,
-			   tegra210_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_i2s_runtime_suspend,
+		       tegra210_i2s_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra210_i2s_of_match[] = {
@@ -1026,7 +1025,7 @@ static struct platform_driver tegra210_i2s_driver = {
 	.driver = {
 		.name = "tegra210-i2s",
 		.of_match_table = tegra210_i2s_of_match,
-		.pm = &tegra210_i2s_pm_ops,
+		.pm = pm_ptr(&tegra210_i2s_pm_ops),
 	},
 	.probe = tegra210_i2s_probe,
 	.remove = tegra210_i2s_remove,
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 410259d98dfb..95d69a7e027f 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -73,7 +73,7 @@ static const struct tegra210_mixer_gain_params gain_params = {
 	{ 0, 0, 0x400, 0x8000000 },
 };
 
-static int __maybe_unused tegra210_mixer_runtime_suspend(struct device *dev)
+static int tegra210_mixer_runtime_suspend(struct device *dev)
 {
 	struct tegra210_mixer *mixer = dev_get_drvdata(dev);
 
@@ -83,7 +83,7 @@ static int __maybe_unused tegra210_mixer_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_mixer_runtime_resume(struct device *dev)
+static int tegra210_mixer_runtime_resume(struct device *dev)
 {
 	struct tegra210_mixer *mixer = dev_get_drvdata(dev);
 
@@ -666,17 +666,16 @@ static void tegra210_mixer_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_mixer_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_mixer_runtime_suspend,
-			   tegra210_mixer_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_mixer_runtime_suspend,
+		       tegra210_mixer_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra210_mixer_driver = {
 	.driver = {
 		.name = "tegra210_mixer",
 		.of_match_table = tegra210_mixer_of_match,
-		.pm = &tegra210_mixer_pm_ops,
+		.pm = pm_ptr(&tegra210_mixer_pm_ops),
 	},
 	.probe = tegra210_mixer_platform_probe,
 	.remove = tegra210_mixer_platform_remove,
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 119f17501478..35b14c8396f4 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -47,7 +47,7 @@ static const struct tegra210_mvc_gain_params gain_params = {
 	.duration_inv = 14316558,
 };
 
-static int __maybe_unused tegra210_mvc_runtime_suspend(struct device *dev)
+static int tegra210_mvc_runtime_suspend(struct device *dev)
 {
 	struct tegra210_mvc *mvc = dev_get_drvdata(dev);
 
@@ -59,7 +59,7 @@ static int __maybe_unused tegra210_mvc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_mvc_runtime_resume(struct device *dev)
+static int tegra210_mvc_runtime_resume(struct device *dev)
 {
 	struct tegra210_mvc *mvc = dev_get_drvdata(dev);
 
@@ -758,17 +758,16 @@ static void tegra210_mvc_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_mvc_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_mvc_runtime_suspend,
-			   tegra210_mvc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_mvc_runtime_suspend,
+		       tegra210_mvc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra210_mvc_driver = {
 	.driver = {
 		.name = "tegra210-mvc",
 		.of_match_table = tegra210_mvc_of_match,
-		.pm = &tegra210_mvc_pm_ops,
+		.pm = pm_ptr(&tegra210_mvc_pm_ops),
 	},
 	.probe = tegra210_mvc_platform_probe,
 	.remove = tegra210_mvc_platform_remove,
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index c595cec9baab..5036bcfe0828 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -356,7 +356,7 @@ static void tegra210_ope_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused tegra210_ope_runtime_suspend(struct device *dev)
+static int tegra210_ope_runtime_suspend(struct device *dev)
 {
 	struct tegra210_ope *ope = dev_get_drvdata(dev);
 
@@ -374,7 +374,7 @@ static int __maybe_unused tegra210_ope_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_ope_runtime_resume(struct device *dev)
+static int tegra210_ope_runtime_resume(struct device *dev)
 {
 	struct tegra210_ope *ope = dev_get_drvdata(dev);
 
@@ -393,10 +393,9 @@ static int __maybe_unused tegra210_ope_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops tegra210_ope_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_ope_runtime_suspend,
-			   tegra210_ope_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_ope_runtime_suspend,
+		       tegra210_ope_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra210_ope_of_match[] = {
@@ -409,7 +408,7 @@ static struct platform_driver tegra210_ope_driver = {
 	.driver = {
 		.name = "tegra210-ope",
 		.of_match_table = tegra210_ope_of_match,
-		.pm = &tegra210_ope_pm_ops,
+		.pm = pm_ptr(&tegra210_ope_pm_ops),
 	},
 	.probe = tegra210_ope_probe,
 	.remove = tegra210_ope_remove,
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index df88708c733c..a0bd36f12c68 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3056,7 +3056,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 	},
 };
 
-static int __maybe_unused tegra210_sfc_runtime_suspend(struct device *dev)
+static int tegra210_sfc_runtime_suspend(struct device *dev)
 {
 	struct tegra210_sfc *sfc = dev_get_drvdata(dev);
 
@@ -3066,7 +3066,7 @@ static int __maybe_unused tegra210_sfc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra210_sfc_runtime_resume(struct device *dev)
+static int tegra210_sfc_runtime_resume(struct device *dev)
 {
 	struct tegra210_sfc *sfc = dev_get_drvdata(dev);
 
@@ -3623,17 +3623,16 @@ static void tegra210_sfc_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra210_sfc_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra210_sfc_runtime_suspend,
-			   tegra210_sfc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra210_sfc_runtime_suspend,
+		       tegra210_sfc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra210_sfc_driver = {
 	.driver = {
 		.name = "tegra210-sfc",
 		.of_match_table = tegra210_sfc_of_match,
-		.pm = &tegra210_sfc_pm_ops,
+		.pm = pm_ptr(&tegra210_sfc_pm_ops),
 	},
 	.probe = tegra210_sfc_platform_probe,
 	.remove = tegra210_sfc_platform_remove,
-- 
2.43.0


