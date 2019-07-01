Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CAB44128
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732887AbfFMQMa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:12:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43134 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732462AbfFMQM3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:12:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so11318056wru.10;
        Thu, 13 Jun 2019 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s0i9gRi09/oGUA11For9Kvn21dqQw45xZsXt0yfAJX0=;
        b=g/3vTUcZq4KHkSNqTUEoDTziVddP4E2+sRb0suzuTmXWBVLcI4Qu7qrWpkE+D2q73z
         a7vWmWJYx4yIOgESu8aall9prIBvgVMyWp3PRpEte4Mag7lPM3/K4B/+x5SGlK9CHaQD
         YccP9Q2DCpJ0SEds6hXZE8DlJgKS3gjpGKwUkcxtSZuAm9Vauqk+p2OikNIxL2J0FzEZ
         638d0epGL5jZ4iQAIggFil6KvDYvcxoqcZ/srADn3yZdIFmpQCoVZiRIIKKA02pxXmAa
         wHxwtJ8q5DA8y3p3V5av26hJd7OpzSDVJhAMvUYOZONQLl2gZDxUNIEjkc7VeWWzU6JZ
         nSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s0i9gRi09/oGUA11For9Kvn21dqQw45xZsXt0yfAJX0=;
        b=JUTDTlisL5kW44WqaIrmgNkGVd33j/BDQ7Yt+CrsHLU/JFMKQPRsnWli3AOkriTj8V
         3BcYdL7C2wUAM++2zUmu+8vzTeB9ojo6vtGNzu/ZQgkBFf55ULiMS9Q7IuT63Y0Ashh4
         brPIRMel/S8LGS48VaMC5UEea5uitdSkI6QAUBFRnXLGNfzsWHQrWXJrzn+A/db1Enlo
         N6nRqY5IA8pfaoAYGxDa02qo0r8RqqeMhHO9KK7siSm7z+L27oSMrgf/wjmgBzVLu4st
         kqj408LIKMIn4oKBl+zW9e329wcTSNlebMV1fbbF6x3RmNTvCVTyQVKuIzkk8/LlvBR5
         h3ew==
X-Gm-Message-State: APjAAAU1UI8K+mB7heDNdKLfN+OaEwL7UoOHj1pjm+MRKu42NXq2p6MU
        VoGRcAfd8xf7HKYJbpEW5kY=
X-Google-Smtp-Source: APXvYqyDKiWVEjncCAs2vzL/67ex2a37zE8LDO8ZxjMgJuX4cz9eVwGbTbFJJusBTTt8Zs3IFHiXeA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr6428366wrt.233.1560442348024;
        Thu, 13 Jun 2019 09:12:28 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d3sm179133wrs.8.2019.06.13.09.12.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:12:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] clk: tegra: Warn if an enabled PLL is in IDDQ
Date:   Thu, 13 Jun 2019 18:12:24 +0200
Message-Id: <20190613161225.2531-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613161225.2531-1-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

A PLL in IDDQ doesn't work, whether it's enabled or not. This is not a
configuration that makes sense, so warn about it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 4904ac4a75db..793c7acaf4e2 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1003,8 +1003,12 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
 		_pll_misc_chk_default(clk_base, pllre->params, 0, val,
 				~mask & PLLRE_MISC0_WRITE_MASK);
 
-		/* Enable lock detect */
+		/* The PLL doesn't work if it's in IDDQ. */
 		val = readl_relaxed(clk_base + pllre->params->ext_misc_reg[0]);
+		if (val & PLLRE_MISC0_IDDQ)
+			pr_warn("unexpected IDDQ bit set for enabled clock\n");
+
+		/* Enable lock detect */
 		val &= ~mask;
 		val |= PLLRE_MISC0_DEFAULT_VALUE & mask;
 		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);
-- 
2.21.0

