Return-Path: <linux-tegra+bounces-9184-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4DB51447
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Sep 2025 12:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1FB3A4F62
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Sep 2025 10:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B119B31AF2D;
	Wed, 10 Sep 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyYjyERU"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD731A548
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501071; cv=none; b=WRl/mi1H1x0v5Mn1o77K9V2PpoqCLb7XSlMIu2EVV8NPC989XrbEuFRyiBtVuk2sQPHNAXbt3a9koHg/nvUGscgSBOAzX+6vriNUyRryNj/3EHP+dbjQ13MvpjUYoOvZZPb2iuCOrw5qUCI2AMhZrt/mcb4oNogDKamAxpOiIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501071; c=relaxed/simple;
	bh=VIT4BVi7PGamIjlHfjP1qCV0HY0GyKrHNwwafRKVOd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Szu7tyKcN1Fwcgz6gRrlSD+TqF2tinbOEfsOlEKW7adaOdgFfogLelYlqEiNqEaM2nQcE6yp2SvpKIX4ueanE2xvrMzWg5VXX0dHa/yIQWzty5ohuOb/jafhB/pBDPYBtLACAZYj4jrwZbjBjbbcAq3evXGVKMI77M1DUouXEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyYjyERU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-629f06935e6so684444a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501068; x=1758105868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMhep867hi/WSPi221RnZKx2fygpfaLD3zan7lNwq6o=;
        b=DyYjyERUrXAG4jLLd15cLFb2rugB+8W1MRpOOtTA3sS451q+PYL9kTxqcdKQM3hJ/x
         hzXc9rcpdOi9SvTgw1hAU3ObL6vFz5WcushjKxhNVQ64qdGjSHR4zzbTEFOaaU6wvTxZ
         VviwnYbPkXBB5IAN7f45MKtDbFg9104PJRsHIGKmgwLV8LBCBwXMm3rpNfnE43wNmttN
         DsvvapaRIgUElAJfXe6vDck0+DPL69P199T7kYaFPfquGUV0BS92fA4F0pojdu8mKsHf
         UCjuIlOB55wpxVSWbrHQtJOkPwg1Ntb4/GCYlypye2yqPh046iGHzb6pmeQUD8kWH/Xn
         OALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501068; x=1758105868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMhep867hi/WSPi221RnZKx2fygpfaLD3zan7lNwq6o=;
        b=rCURhlkXwvn5qmXI2ovPevTO3/hzqDxBjXHY93k/OpjlQ6uBpm1iKm+AI7IbZaRv10
         BT3TtfR1PDdFX9BgoPG/NMddbmwTViWxtg8zRUlDqkdkq0iT2XPRV6mlA7KkzzyQd9dB
         AdCPE6PAgxhNFsVEu3RZ14EjOJ2ovcDoEenSYUxqOpqasKcLeXS/v6GTtwIPjxxfwlS9
         wG7dRdmMGeGRVEgDw8a3Ltwh33JspMxVSw4Ca92CC6ZCcvFFbKaZuitdrSRlIrqYSoB7
         hlABXmCjjAgO2B4/QpIyyPlzfvGJgYhIfzq/QY1N2LX1PDvywgg6A3q45eEtpknSOqLd
         +C5w==
X-Forwarded-Encrypted: i=1; AJvYcCXSLzY47MM85pw7SI1x2UC307Gf/tIsmuqKRz8ZHM6OxHGvQ5ZOfvOm2DSAF9nMxKMecD/XiJYJg9dOKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85/3YOW87FbwTH5XUQmdqU/B2fEbcRCbf8zanGyX3uvK5jPTP
	Mh/DdpkIcw3kxWJhqSolDtG5hH3dguxeAelC+OiNpmI7GM70JptCeyou5qrdlrMOT7Q=
X-Gm-Gg: ASbGncvemGIwWXL6gVe7j5QlnOdk5RAmfApiV05XXDJvbk0cTVSLW5XDxulRN+FBgt+
	wVuZhExRXDqsewpp7pCH58AAHbuZSAtcvyWUBc/SJxlP+twXiE9TeH8FOyEA9LYyfybPHKuAOfD
	AiitH2lSXVh2fJYId8c2Y4WiBjDd9YJNAB/iG57nJW6sEpH3LR/S9g03tL6t+yzABV+TRSgX5Gf
	zfALwLQ0KyEEdgmG0OQHe5yuVYUFTz4DUiuvxJJmFVYHVN13oV6gnoJ/fclVJgM9BfF6jd/iuhJ
	0vKBQV26t2JWV1OnQjycJhLkzxeQguaCxCCV2819RMNhcf2CLSf8S8hvoXS2WtGqWkQsFdsmOgx
	0WGmS0SqhXCQV+FAUsHeTfzeIwnWbRywpS0fbGN0=
X-Google-Smtp-Source: AGHT+IFzf0g0NWfkrve+N7cuLykZWPWms9zeLTyEANk1GoJ2ax587AmJmXhxcd7kpirVpRJ6NIlPOw==
X-Received: by 2002:a05:6402:2345:b0:628:3c12:8732 with SMTP id 4fb4d7f45d1cf-6283c1294c9mr5449285a12.8.1757501067604;
        Wed, 10 Sep 2025 03:44:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:08 +0200
Subject: [PATCH 12/13] memory: tegra20-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-12-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13253;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VIT4BVi7PGamIjlHfjP1qCV0HY0GyKrHNwwafRKVOd8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZ5CgpYqYKDVYneA/z1dP3fWU06KkvdXodpi
 U57l9+4suaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWeQAKCRDBN2bmhouD
 189yD/9RWm5boPty65v9D7YeaRJ0V/X8esPnWWkPKKbmSFJfTS4ZKbMiCoqXCCMgGAADDiToxwq
 G5YkgFb7yp8a95+mRxcCwjmI712eBDdJ8K5cV4AANi16JOqLie2yNsel0VH4QHjUw0K0CBdZjUF
 SpYRsksaoV9shiQv1dJaEt20qle1B9zFgYsObJbQK6L3lGLwkuGPaBneqqxfLvLfV4XIQo9Q3+V
 5ETqJ9Pok58S2lVDnPXBVajX8clIchlc6EtEN7eNxKB/jagvszDp1q1UdDnSWPE16majXALMkVa
 15nF5TmOROEyc8P+dtsqP3MsgWpNtGgYYbDcoQXeeG9mPcKxWvNSBo696LdMUqsdH3DBpYwawDT
 lxUEcKX7Q2mCt3ysNtL+FTVdsf3mQM1EsfExzRvZOWDnZtONGl/h6OzbrZG7KLxGDhk1UlzHbgC
 nPxVjsVNB/Se6eGN6T/UOult89EqW+4r6vKYN0V9dUeqZyYs3eJs6detENVEkA4cgDhYVZgWkKD
 /9c8+8jL5U4cKmFbXYQEQXyzUJomv7oZyfcikujBd4XkaTN9y09g1gpK5fUgiC7GyY1XW1j48Lj
 YvJj7e09dmgqUXVvNLXhlOIFFv/onD14bAcXBVvvFJlxaAMuzYKIg3q7JaQ6aSKD6BvU/7Wq9mj
 OSN+J4ZrQlrrkCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra124_emc" in all functions to:
1. Avoid name clashing with other Tegra EMC drivers which makes it
   easier to jump to function definitions,
2. Decode the calltraces a bit easier,
3. Unify with other Tegra MC and EMC drivers, which use the SoC model
   prefixes.

No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 120 ++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 18e266dde5d2a0fb962fadc04161b03fb79f76cb..398cb8ae2e38736fcac04d71738b11b3d5b75f4e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -232,7 +232,7 @@ struct tegra_emc {
 	bool mrr_error;
 };
 
-static irqreturn_t tegra_emc_isr(int irq, void *data)
+static irqreturn_t tegra20_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
@@ -253,8 +253,8 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
-						unsigned long rate)
+static struct emc_timing *tegra20_emc_find_timing(struct tegra_emc *emc,
+						  unsigned long rate)
 {
 	struct emc_timing *timing = NULL;
 	unsigned int i;
@@ -276,7 +276,7 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 
 static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 {
-	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *timing = tegra20_emc_find_timing(emc, rate);
 	unsigned int i;
 
 	if (!timing)
@@ -321,8 +321,8 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 	return 0;
 }
 
-static int tegra_emc_clk_change_notify(struct notifier_block *nb,
-				       unsigned long msg, void *data)
+static int tegra20_emc_clk_change_notify(struct notifier_block *nb,
+					 unsigned long msg, void *data)
 {
 	struct tegra_emc *emc = container_of(nb, struct tegra_emc, clk_nb);
 	struct clk_notifier_data *cnd = data;
@@ -407,8 +407,8 @@ static int cmp_timings(const void *_a, const void *_b)
 	return 0;
 }
 
-static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
-					  struct device_node *node)
+static int tegra20_emc_load_timings_from_dt(struct tegra_emc *emc,
+					    struct device_node *node)
 {
 	struct emc_timing *timing;
 	int child_count;
@@ -452,7 +452,7 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 }
 
 static struct device_node *
-tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
+tegra20_emc_find_node_by_ram_code(struct tegra_emc *emc)
 {
 	struct device *dev = emc->dev;
 	struct device_node *np;
@@ -710,7 +710,7 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+static void tegra20_emc_rate_requests_init(struct tegra_emc *emc)
 {
 	unsigned int i;
 
@@ -812,7 +812,7 @@ static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
  *       valid range.
  */
 
-static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+static bool tegra20_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 {
 	unsigned int i;
 
@@ -823,7 +823,7 @@ static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 	return false;
 }
 
-static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
+static int tegra20_emc_debug_available_rates_show(struct seq_file *s, void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
@@ -838,9 +838,9 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
+DEFINE_SHOW_ATTRIBUTE(tegra20_emc_debug_available_rates);
 
-static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+static int tegra20_emc_debug_min_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -849,12 +849,12 @@ static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+static int tegra20_emc_debug_min_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
@@ -866,11 +866,11 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
-			tegra_emc_debug_min_rate_get,
-			tegra_emc_debug_min_rate_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(tegra20_emc_debug_min_rate_fops,
+			tegra20_emc_debug_min_rate_get,
+			tegra20_emc_debug_min_rate_set, "%llu\n");
 
-static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+static int tegra20_emc_debug_max_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -879,12 +879,12 @@ static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+static int tegra20_emc_debug_max_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
@@ -896,11 +896,11 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
-			tegra_emc_debug_max_rate_get,
-			tegra_emc_debug_max_rate_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(tegra20_emc_debug_max_rate_fops,
+			tegra20_emc_debug_max_rate_get,
+			tegra20_emc_debug_max_rate_set, "%llu\n");
 
-static void tegra_emc_debugfs_init(struct tegra_emc *emc)
+static void tegra20_emc_debugfs_init(struct tegra_emc *emc)
 {
 	struct device *dev = emc->dev;
 	unsigned int i;
@@ -933,11 +933,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
-			    emc, &tegra_emc_debug_available_rates_fops);
+			    emc, &tegra20_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_min_rate_fops);
+			    emc, &tegra20_emc_debug_min_rate_fops);
 	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_max_rate_fops);
+			    emc, &tegra20_emc_debug_max_rate_fops);
 }
 
 static inline struct tegra_emc *
@@ -1000,7 +1000,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	return 0;
 }
 
-static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+static int tegra20_emc_interconnect_init(struct tegra_emc *emc)
 {
 	const struct tegra_mc_soc *soc;
 	struct icc_node *node;
@@ -1055,25 +1055,25 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
-static void devm_tegra_emc_unset_callback(void *data)
+static void devm_tegra20_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 }
 
-static void devm_tegra_emc_unreg_clk_notifier(void *data)
+static void devm_tegra20_emc_unreg_clk_notifier(void *data)
 {
 	struct tegra_emc *emc = data;
 
 	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 }
 
-static int tegra_emc_init_clk(struct tegra_emc *emc)
+static int tegra20_emc_init_clk(struct tegra_emc *emc)
 {
 	int err;
 
 	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
 
-	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
+	err = devm_add_action_or_reset(emc->dev, devm_tegra20_emc_unset_callback,
 				       NULL);
 	if (err)
 		return err;
@@ -1088,15 +1088,15 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 		return dev_err_probe(emc->dev, err, "failed to register clk notifier\n");
 
 	err = devm_add_action_or_reset(emc->dev,
-				       devm_tegra_emc_unreg_clk_notifier, emc);
+				       devm_tegra20_emc_unreg_clk_notifier, emc);
 	if (err)
 		return err;
 
 	return 0;
 }
 
-static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
-				    u32 flags)
+static int tegra20_emc_devfreq_target(struct device *dev, unsigned long *freq,
+				      u32 flags)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
@@ -1114,8 +1114,8 @@ static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
 	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
 }
 
-static int tegra_emc_devfreq_get_dev_status(struct device *dev,
-					    struct devfreq_dev_status *stat)
+static int tegra20_emc_devfreq_get_dev_status(struct device *dev,
+					      struct devfreq_dev_status *stat)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 
@@ -1137,13 +1137,13 @@ static int tegra_emc_devfreq_get_dev_status(struct device *dev,
 	return 0;
 }
 
-static struct devfreq_dev_profile tegra_emc_devfreq_profile = {
+static struct devfreq_dev_profile tegra20_emc_devfreq_profile = {
 	.polling_ms = 30,
-	.target = tegra_emc_devfreq_target,
-	.get_dev_status = tegra_emc_devfreq_get_dev_status,
+	.target = tegra20_emc_devfreq_target,
+	.get_dev_status = tegra20_emc_devfreq_get_dev_status,
 };
 
-static int tegra_emc_devfreq_init(struct tegra_emc *emc)
+static int tegra20_emc_devfreq_init(struct tegra_emc *emc)
 {
 	struct devfreq *devfreq;
 
@@ -1165,7 +1165,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 	writel_relaxed(0x00000000, emc->regs + EMC_STAT_LLMC_CONTROL);
 	writel_relaxed(0xffffffff, emc->regs + EMC_STAT_PWR_CLOCK_LIMIT);
 
-	devfreq = devm_devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
+	devfreq = devm_devfreq_add_device(emc->dev, &tegra20_emc_devfreq_profile,
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
 					  &emc->ondemand_data);
 	if (IS_ERR(devfreq))
@@ -1175,7 +1175,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 	return 0;
 }
 
-static int tegra_emc_probe(struct platform_device *pdev)
+static int tegra20_emc_probe(struct platform_device *pdev)
 {
 	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
@@ -1191,7 +1191,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mutex_init(&emc->rate_lock);
-	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
+	emc->clk_nb.notifier_call = tegra20_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1202,22 +1202,22 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	np = tegra_emc_find_node_by_ram_code(emc);
+	np = tegra20_emc_find_node_by_ram_code(emc);
 	if (np) {
-		err = tegra_emc_load_timings_from_dt(emc, np);
+		err = tegra20_emc_load_timings_from_dt(emc, np);
 		of_node_put(np);
 		if (err)
 			return err;
 	}
 
-	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
+	err = devm_request_irq(&pdev->dev, irq, tegra20_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err) {
 		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
 		return err;
 	}
 
-	err = tegra_emc_init_clk(emc);
+	err = tegra20_emc_init_clk(emc);
 	if (err)
 		return err;
 
@@ -1228,10 +1228,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra_emc_rate_requests_init(emc);
-	tegra_emc_debugfs_init(emc);
-	tegra_emc_interconnect_init(emc);
-	tegra_emc_devfreq_init(emc);
+	tegra20_emc_rate_requests_init(emc);
+	tegra20_emc_debugfs_init(emc);
+	tegra20_emc_interconnect_init(emc);
+	tegra20_emc_devfreq_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -1243,22 +1243,22 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id tegra_emc_of_match[] = {
+static const struct of_device_id tegra20_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra20-emc", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
+MODULE_DEVICE_TABLE(of, tegra20_emc_of_match);
 
-static struct platform_driver tegra_emc_driver = {
-	.probe = tegra_emc_probe,
+static struct platform_driver tegra20_emc_driver = {
+	.probe = tegra20_emc_probe,
 	.driver = {
 		.name = "tegra20-emc",
-		.of_match_table = tegra_emc_of_match,
+		.of_match_table = tegra20_emc_of_match,
 		.suppress_bind_attrs = true,
 		.sync_state = icc_sync_state,
 	},
 };
-module_platform_driver(tegra_emc_driver);
+module_platform_driver(tegra20_emc_driver);
 
 MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra20 EMC driver");

-- 
2.48.1


