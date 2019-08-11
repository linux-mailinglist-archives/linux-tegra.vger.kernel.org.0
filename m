Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7972F893FB
	for <lists+linux-tegra@lfdr.de>; Sun, 11 Aug 2019 23:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfHKVCX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 11 Aug 2019 17:02:23 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45253 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfHKVBf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Aug 2019 17:01:35 -0400
Received: by mail-lj1-f195.google.com with SMTP id t3so8053675ljj.12;
        Sun, 11 Aug 2019 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cHY/PWsCS9Gy0qH6S2V8hqONNTeRxBp0T3nKwM2El6E=;
        b=XsajvYfIrvqnSOATXw5LoOEjOBxqB5BHM8ePTK0OUIUtbOGI8wQ8Rh75tVnY5v4xk5
         piIu7n3FVh6P7MZywnL77+ZbnipQH4VRxMziKv8miByQus8yG1hJGuaESL7gpVwIIGSV
         1WnkEwyp1mtaHMNvYCg8fKhX4+1LANUZu+ALcAt0NHGGHfjWSze1D16AtrbRsXQy+RW3
         /oGkClZqUPvdZF2rrCBL2qrdvFV7noh06QlIyOpQ7UeVwJk5TfuFWY/rOUYLOjZlMgwq
         U8Wl3HVSGmuB1I2lzdAMpZkDjIQmXql7sLguiRQQiWWoftE+zvowkKAAtpU8jXtGonMH
         /R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cHY/PWsCS9Gy0qH6S2V8hqONNTeRxBp0T3nKwM2El6E=;
        b=MGQwI9Wqk1+PqTaeiQsl6CsJXahwqwZvTm3gSEiRxnX0q2R9C52EruofHSA7QMa0q9
         LvR5NRyy/3Tr3AsvfIBGeA8B/bqtBSJvkosr0MiI8QjZZuxZw1drLHL3dOT8rUjvm12R
         KfkiDMISvdAJjpRao+axhTVHRlorsiloyIxJySMVbog1rg/JGQDX0DFtZ6o8xEJEsIBC
         Tp8c6NRo74reYMDqBpw9TauAjPUWt2rl876s9e8q25E62QcbFz9qrhgKjYnjiPCpFYsa
         pqzbpoqJal2zrmZsvZSraAol6zfjU32qrgXDAKTKb9g1OnQrPR4zOlFnJQ0KO7SYy0cQ
         8jnw==
X-Gm-Message-State: APjAAAXpAdEugLHCnGBp67/brPQ3N7O/lltZoBl2tjrKDhB2bEKZGN8x
        ykuVf+jluqkvx2QRiN4NfI0=
X-Google-Smtp-Source: APXvYqxSXFRtlpyQJ1+QRkKz9tGMoMIDVCDC3Z1uGK7kdurpnRZ0Oqq1INaOLruxk4rOev4+y1oc0w==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr16721394ljg.197.1565557292777;
        Sun, 11 Aug 2019 14:01:32 -0700 (PDT)
Received: from localhost.localdomain ([94.29.34.218])
        by smtp.gmail.com with ESMTPSA id z25sm18708161lfi.51.2019.08.11.14.01.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 14:01:32 -0700 (PDT)
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
Subject: [PATCH v10 06/15] memory: tegra20-emc: Print a brief info message about the timings
Date:   Mon, 12 Aug 2019 00:00:34 +0300
Message-Id: <20190811210043.20122-7-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811210043.20122-1-digetx@gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

During boot print how many memory timings got the driver and what's the
RAM code. This is a very useful information when something is wrong with
boards memory timing.

Suggested-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 85c24f285fd4..25a6aad6a7a9 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -368,6 +368,13 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,
 	     NULL);
 
+	dev_info(emc->dev,
+		 "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
+		 emc->num_timings,
+		 tegra_read_ram_code(),
+		 emc->timings[0].rate / 1000000,
+		 emc->timings[emc->num_timings - 1].rate / 1000000);
+
 	return 0;
 }
 
-- 
2.22.0

