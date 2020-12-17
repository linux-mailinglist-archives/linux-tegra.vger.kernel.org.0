Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FE22DD7C6
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Dec 2020 19:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgLQSMa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Dec 2020 13:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgLQSI5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA28C061794;
        Thu, 17 Dec 2020 10:07:49 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o19so34209261lfo.1;
        Thu, 17 Dec 2020 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2xd7/yRqQ1bpLSBqqvPYmX9y9km1o1DPCdEu2/xdf8k=;
        b=knjqp1xwmZY1uipSsuIrAKlbV0FPromBnLXJv9W83vZ4UUD9iS/WzmlpXNbZhD+xJn
         SVAeMUogtUbshBqLuRHfAQSoeEPnAUD2yOgO+lP8Bv5/lzDv8qlofpqMefqRFy+qnU8y
         cmQWdkpzg8Ar4Ggr1+b1gKRJeePAZtWXiDMoiFncDbrbrSMtUGmP/E6F80FzVADdQkzy
         obs4CCg1a82jm+Qbii45XqQPDlOvSM0QVnq93k4Ac/PIR/SMRe3nDMizmTePuRTNAgHV
         BgBWlE/0wpha34e9hCrNtqDLLb1/sEbxoNPJESoXU299byDkUHyj1fP1p1mFO/Rl8rs3
         DTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xd7/yRqQ1bpLSBqqvPYmX9y9km1o1DPCdEu2/xdf8k=;
        b=MZ1qSwhU1K9I9oTToP03+AhcFbm5CbWoo18ehBbi1rHt22ffm9MV1HNRlk0F/8jwfd
         seicjEMzZ3fMYSvZWRqkwurH2Wi//XPC/G9loyxFMz97ZEBWhE1cQSnZ6DpyAq83G4rc
         5reGST/R8iXnr3nCs+ipQrHVh3fNlellFf2pObHChVfeoilexOWx2KIjoL+hqTTWZmlP
         zgfmcZ1PErAJJFGtlywawLBRUZeqHz9c6qw/qGzigodQINaXIM3oqVS1ZuH+i1PP0/8C
         go7QXOF3fIx9E7aU/IzjxnhmIRStZ+M6SzEgT/wPDVgRZk1QRVw/bouzfvkBeFOAJLWN
         rIpw==
X-Gm-Message-State: AOAM532LphPMkjHSKJbNO5J/5B6ghdLpm66MmDlzx6iD/Zoze0TmEuyt
        acOxf2WHYBbyW546+2BfIDU=
X-Google-Smtp-Source: ABdhPJxl5RroGj+GTUW6FyPBVu/AN/pYFQvr0N2HeyHSfmpalUAs6qNcm/28WYlCJIdj+T+0fIA9GQ==
X-Received: by 2002:a19:9d8:: with SMTP id 207mr8275737lfj.581.1608228467753;
        Thu, 17 Dec 2020 10:07:47 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 24/48] soc/tegra: pmc: Ensure that clock rates aren't too high
Date:   Thu, 17 Dec 2020 21:06:14 +0300
Message-Id: <20201217180638.22748-25-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Switch all clocks of a power domain to a safe rate which is suitable
for all possible voltages in order to ensure that hardware constraints
aren't violated when power domain state toggles.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 92 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 985373ce52b1..8edcd5b319f6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -237,6 +237,7 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
+	unsigned long *clk_rates;
 	struct reset_control *reset;
 };
 
@@ -586,6 +587,57 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 	return 0;
 }
 
+static int tegra_powergate_prepare_clocks(struct tegra_powergate *pg)
+{
+	unsigned long safe_rate = 100 * 1000 * 1000;
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < pg->num_clks; i++) {
+		pg->clk_rates[i] = clk_get_rate(pg->clks[i]);
+
+		if (!pg->clk_rates[i]) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		if (pg->clk_rates[i] <= safe_rate)
+			continue;
+
+		/*
+		 * We don't know whether voltage state is okay for the
+		 * current clock rate, hence it's better to temporally
+		 * switch clock to a safe rate which is suitable for
+		 * all voltages, before enabling the clock.
+		 */
+		err = clk_set_rate(pg->clks[i], safe_rate);
+		if (err)
+			goto out;
+	}
+
+	return 0;
+
+out:
+	while (i--)
+		clk_set_rate(pg->clks[i], pg->clk_rates[i]);
+
+	return err;
+}
+
+static int tegra_powergate_unprepare_clocks(struct tegra_powergate *pg)
+{
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < pg->num_clks; i++) {
+		err = clk_set_rate(pg->clks[i], pg->clk_rates[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static void tegra_powergate_disable_clocks(struct tegra_powergate *pg)
 {
 	unsigned int i;
@@ -636,10 +688,14 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
-	err = tegra_powergate_enable_clocks(pg);
+	err = tegra_powergate_prepare_clocks(pg);
 	if (err)
 		goto powergate_off;
 
+	err = tegra_powergate_enable_clocks(pg);
+	if (err)
+		goto unprepare_clks;
+
 	usleep_range(10, 20);
 
 	err = __tegra_powergate_remove_clamping(pg->pmc, pg->id);
@@ -670,12 +726,19 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 	if (disable_clocks)
 		tegra_powergate_disable_clocks(pg);
 
+	err = tegra_powergate_unprepare_clocks(pg);
+	if (err)
+		return err;
+
 	return 0;
 
 disable_clks:
 	tegra_powergate_disable_clocks(pg);
 	usleep_range(10, 20);
 
+unprepare_clks:
+	tegra_powergate_unprepare_clocks(pg);
+
 powergate_off:
 	tegra_powergate_set(pg->pmc, pg->id, false);
 
@@ -686,10 +749,14 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 {
 	int err;
 
-	err = tegra_powergate_enable_clocks(pg);
+	err = tegra_powergate_prepare_clocks(pg);
 	if (err)
 		return err;
 
+	err = tegra_powergate_enable_clocks(pg);
+	if (err)
+		goto unprepare_clks;
+
 	usleep_range(10, 20);
 
 	err = reset_control_assert(pg->reset);
@@ -706,6 +773,10 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 	if (err)
 		goto assert_resets;
 
+	err = tegra_powergate_unprepare_clocks(pg);
+	if (err)
+		return err;
+
 	return 0;
 
 assert_resets:
@@ -717,6 +788,9 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 disable_clks:
 	tegra_powergate_disable_clocks(pg);
 
+unprepare_clks:
+	tegra_powergate_unprepare_clocks(pg);
+
 	return err;
 }
 
@@ -834,6 +908,12 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	if (!pg)
 		return -ENOMEM;
 
+	pg->clk_rates = kzalloc(sizeof(*pg->clk_rates), GFP_KERNEL);
+	if (!pg->clk_rates) {
+		kfree(pg->clks);
+		return -ENOMEM;
+	}
+
 	pg->id = id;
 	pg->clks = &clk;
 	pg->num_clks = 1;
@@ -845,6 +925,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 		dev_err(pmc->dev, "failed to turn on partition %d: %d\n", id,
 			err);
 
+	kfree(pg->clk_rates);
 	kfree(pg);
 
 	return err;
@@ -995,6 +1076,12 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 	if (!pg->clks)
 		return -ENOMEM;
 
+	pg->clk_rates = kcalloc(count, sizeof(*pg->clk_rates), GFP_KERNEL);
+	if (!pg->clk_rates) {
+		kfree(pg->clks);
+		return -ENOMEM;
+	}
+
 	for (i = 0; i < count; i++) {
 		pg->clks[i] = of_clk_get(np, i);
 		if (IS_ERR(pg->clks[i])) {
@@ -1011,6 +1098,7 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 	while (i--)
 		clk_put(pg->clks[i]);
 
+	kfree(pg->clk_rates);
 	kfree(pg->clks);
 
 	return err;
-- 
2.29.2

