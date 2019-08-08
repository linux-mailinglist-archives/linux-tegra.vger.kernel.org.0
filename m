Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D5986D2D
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Aug 2019 00:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404679AbfHHWZr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 8 Aug 2019 18:25:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39456 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732708AbfHHWZq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Aug 2019 18:25:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so90278587ljh.6;
        Thu, 08 Aug 2019 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q9p8dp4Vwd7zb49ZfmkHjOde2lTf1kQmZ0LZmoXXg+Y=;
        b=X/HCeJp6SdIpegsENNIX5jnBFbtDSt0UzsTUaN0a3V8l4KnCb/S47gsOo5w4dI/NuL
         V5etWewZyguGVw5FG6KZWbW1LS15klZZSFCTiM7xpoSJFKT0PQDSyqOStwc5XptUNDIb
         qgY409tTcnSLMME5LL0QF9qUqJEJ5eul/A29A05dpYuiAE/VlwyFHs9wqNchY3n6E3tm
         PvQ0AGqmCEPC4oalZvcTWwYpZWM+7HKgb3eXOP5yluvevmLCNFylOeAYk+oId8vPdONf
         JOWaRweXeFZl1b7jrY0HUlayIuG7iqV2+q/o6hzKZx9BLRodDP11LPPM9cHiWEb3wN3X
         4CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q9p8dp4Vwd7zb49ZfmkHjOde2lTf1kQmZ0LZmoXXg+Y=;
        b=JGAzGWjuAZo8BCyJ+jFiDtGtbpEogcNiooDB8Q1/3nLH0goLK+zBDHd1O9vjLhGwy2
         AMGb5hZq8/csTSRCwTLpO0XWbLb+GETMzbiW7kBz5wrUIXdMfnxkVrAemaUbPFFPp8jh
         17jh5PvWtDEfBiixw6hba23owcAHs9TZ6s+6adekP+0J4Rw+hLjVuJQ1J/eIcS8Ea5T5
         9pj9rHF7cZ+CvccJTgTk45Q6YVjZIVbOTZmvvRTVwNULu29Op2EPzwI9oTVQj75V+RpE
         QFGIAEgayyd0hCaz93b9eC/4UjtpyX3SLjqWLNoa7OgLy2F+D3tQzZ+dzq1ljGT2bwWt
         UnPA==
X-Gm-Message-State: APjAAAUx1JJ0CXUgSqw4EMqq5ZYk57Si1XVKMzl5tKnOckrzsVCbL18C
        y0L1c2r4HgvumbNZx1lPlCY=
X-Google-Smtp-Source: APXvYqyRb0wvQlmXB+gXw3/gwm+pd7UaBZTu3orpe9dFWQXE6Yy8xkJqi7BlFLmgkM9E0td9w8j+IQ==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr9572286ljj.122.1565303144838;
        Thu, 08 Aug 2019 15:25:44 -0700 (PDT)
Received: from localhost.localdomain ([94.29.34.218])
        by smtp.gmail.com with ESMTPSA id g5sm19318415ljj.69.2019.08.08.15.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 15:25:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] Revert "mmc: sdhci-tegra: drop ->get_ro() implementation"
Date:   Fri,  9 Aug 2019 01:24:30 +0300
Message-Id: <20190808222430.28477-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The WRITE_PROTECT bit is always in a "protected mode" on Tegra and
WP-GPIO state need to be used instead. In a case of the GPIO absence,
write-enable should be assumed. External SD is writable once again as
a result of this patch because the offending commit changed behaviour for
the case of a missing WP-GPIO to fall back to WRITE_PROTECT bit-checking,
which is incorrect for Tegra.

Cc: stable@vger.kernel.org # v5.1+
Fixes: e8391453e27f ("mmc: sdhci-tegra: drop ->get_ro() implementation")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index f4d4761cf20a..02d8f524bb9e 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -258,6 +258,16 @@ static void tegra210_sdhci_writew(struct sdhci_host *host, u16 val, int reg)
 	}
 }
 
+static unsigned int tegra_sdhci_get_ro(struct sdhci_host *host)
+{
+	/*
+	 * Write-enable shall be assumed if GPIO is missing in a board's
+	 * device-tree because SDHCI's WRITE_PROTECT bit doesn't work on
+	 * Tegra.
+	 */
+	return mmc_gpio_get_ro(host->mmc);
+}
+
 static bool tegra_sdhci_is_pad_and_regulator_valid(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1224,6 +1234,7 @@ static const struct cqhci_host_ops sdhci_tegra_cqhci_ops = {
 };
 
 static const struct sdhci_ops tegra_sdhci_ops = {
+	.get_ro     = tegra_sdhci_get_ro,
 	.read_w     = tegra_sdhci_readw,
 	.write_l    = tegra_sdhci_writel,
 	.set_clock  = tegra_sdhci_set_clock,
@@ -1279,6 +1290,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra30 = {
 };
 
 static const struct sdhci_ops tegra114_sdhci_ops = {
+	.get_ro     = tegra_sdhci_get_ro,
 	.read_w     = tegra_sdhci_readw,
 	.write_w    = tegra_sdhci_writew,
 	.write_l    = tegra_sdhci_writel,
@@ -1332,6 +1344,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra124 = {
 };
 
 static const struct sdhci_ops tegra210_sdhci_ops = {
+	.get_ro     = tegra_sdhci_get_ro,
 	.read_w     = tegra_sdhci_readw,
 	.write_w    = tegra210_sdhci_writew,
 	.write_l    = tegra_sdhci_writel,
@@ -1366,6 +1379,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra210 = {
 };
 
 static const struct sdhci_ops tegra186_sdhci_ops = {
+	.get_ro     = tegra_sdhci_get_ro,
 	.read_w     = tegra_sdhci_readw,
 	.write_l    = tegra_sdhci_writel,
 	.set_clock  = tegra_sdhci_set_clock,
-- 
2.22.0

