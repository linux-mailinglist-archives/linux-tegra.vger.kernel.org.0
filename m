Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4592C4FF23
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Jun 2019 04:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfFXCLh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 23 Jun 2019 22:11:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41695 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfFXCLh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Jun 2019 22:11:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so8778227lfa.8;
        Sun, 23 Jun 2019 19:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PCQNSQK+2muyk726fUJhk7VrSnWFFmbUV5XprGSciK8=;
        b=aBw2Pi/g1EFggFSqM5ezLhR8jtsfNMeL+puTBkm1rfO1WCEiSaEWHRKZCeXPEaJl2f
         iZcLzfRW17n2YDzmAvw8gBlaL72KivYn6IsFTbzmGWpM6EB95L7qPrw+KGDdKehISGxP
         q1Z6pEbxu14hA5vo8AgD74xitmLlny8r6UahTjlvM0HhNj1E76OYi3D5wHdNgCJlvBUk
         VsajHWzXAzKl5rjX6nG4++9Srf0oVKaMp+jYYo8VPwoqt9qfmPeCNOOY45ukjxmRDySz
         ZcuXQE6Z2eDJuJZaeMlJemf0x9IMAgAtGjDSKLJPJBAkTJNz+4QfAG21bhYHNUpjzqpk
         GAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PCQNSQK+2muyk726fUJhk7VrSnWFFmbUV5XprGSciK8=;
        b=bdkU/B5yylW4fhlPbemuN9QlKYoL2L0haPH6Vst4qeitDlzTM7v66X228jMFbky/Oa
         00nYgA8z+LMNx+lbDZRRspHN5vtxYse7vU1ntkXUaMJkLdaKxlbVzZiD0Fp4YeVIjNXM
         dhlb+XVn+s2zmQIZcW+lgivAr8J1Kd1auzk13lh+qrFVU8N2nGnALoySYcgHxCMVwD3h
         C79L4HFDtsGQoQGpA+oHkUV5H5fPzpcBc1YUZ75LtdMb4v+dje6MsP1amKc4qftO4s3a
         89ib+4vHrEOKWFRqmBCvPiAS+P0QcAN6lEMiNDUQJLVG8BrnWWLopzwn3TDUjL3X9QP7
         HeeA==
X-Gm-Message-State: APjAAAXHZLL9UZlocAZokTPVjwpcrDQed2C9myQNK27Zg2Ucc+fF7f4A
        BP2aGqRF9qNqz+aud0mPPUkp88c8
X-Google-Smtp-Source: APXvYqwN9Hp8nL8bgaYziK3xwBIDMkDhRRwsgu4ZLjmJedVlV/eL7eCCcXOboZFOUlJrqk27ljj1Kg==
X-Received: by 2002:ac2:5337:: with SMTP id f23mr35362792lfh.15.1561336319655;
        Sun, 23 Jun 2019 17:31:59 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id y5sm1495146ljj.5.2019.06.23.17.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 17:31:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/10] memory: tegra20-emc: Adapt for clock driver changes
Date:   Mon, 24 Jun 2019 03:31:25 +0300
Message-Id: <20190624003132.29473-4-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624003132.29473-1-digetx@gmail.com>
References: <20190624003132.29473-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now Terga20 and Tegra30 EMC drivers should provide clock-rounding
functionality using the new Tegra-CLK driver API.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 50 ++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index da8fa592b071..b519f02b0ee9 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk/tegra.h>
 #include <linux/completion.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -421,6 +422,44 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	return 0;
 }
 
+static long emc_round_rate(unsigned long rate,
+			   unsigned long min_rate,
+			   unsigned long max_rate,
+			   void *arg)
+{
+	struct emc_timing *timing = NULL;
+	struct tegra_emc *emc = arg;
+	unsigned int i;
+
+	min_rate = min(min_rate, emc->timings[emc->num_timings - 1].rate);
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate < rate && i != emc->num_timings - 1)
+			continue;
+
+		if (emc->timings[i].rate > max_rate) {
+			i = max(i, 1u) - 1;
+
+			if (emc->timings[i].rate < min_rate)
+				break;
+		}
+
+		if (emc->timings[i].rate < min_rate)
+			continue;
+
+		timing = &emc->timings[i];
+		break;
+	}
+
+	if (!timing) {
+		dev_err(emc->dev, "no timing for rate %lu min %lu max %lu\n",
+			rate, min_rate, max_rate);
+		return -EINVAL;
+	}
+
+	return timing->rate;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -477,21 +516,28 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
+
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
 	if (IS_ERR(emc->clk)) {
 		err = PTR_ERR(emc->clk);
 		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
-		return err;
+		goto unset_cb;
 	}
 
 	err = clk_notifier_register(emc->clk, &emc->clk_nb);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
 			err);
-		return err;
+		goto unset_cb;
 	}
 
 	return 0;
+
+unset_cb:
+	tegra20_clk_set_emc_round_callback(NULL, NULL);
+
+	return err;
 }
 
 static const struct of_device_id tegra_emc_of_match[] = {
-- 
2.22.0

