Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F25D8AAA3
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Aug 2019 00:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfHLWl0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Aug 2019 18:41:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36316 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfHLWl0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Aug 2019 18:41:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so50430124pfl.3;
        Mon, 12 Aug 2019 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CMz7i9qw+sOH5k0dxWaG58ILkYNVc1L40HPXdZwUwoY=;
        b=JT6Sj7wj9J0P2CanFSptW2tpxN5c3aNuFz/bFRJLsCNHmLBzMnOOxQ3GkBD4Fg4v+z
         7TcWjaZyQJ1D/adzvGa/s1MMKgL4Bv7O+FKDnhVrcPXxd5if9NyyXG9bL783ozjA/8mm
         IocUptMXLMRoto3PE6yiIOkXM02tI+ocGOypfqgRT6JSe4kFQJtiSzRXrZIjP4tRCl+V
         +nOvEgM5u5OjdEL9GxKhVKUDAGQNHysc9NMJddkttfzkwGn9ICs4MbNoZpax+I7DO1xp
         7Dx8HmJ6JxRZZMOskxW8hXC7BkpXYFAd4X4D+zIxB7wkvJasKByrORCuEwl3aDAAU6B3
         oUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CMz7i9qw+sOH5k0dxWaG58ILkYNVc1L40HPXdZwUwoY=;
        b=bE2wKTHoFNJ75veHtnp4Ap2Wgu3p2/RxHWu/ubHu9dgGMORLv5gmAirkGrSurwTzXP
         VtYcChu2Wa6E4sj4W4S+JRAAo/a1wSJpzIO2bPqiVteBr5IU9aL3ojyDpkqI26WAtN1i
         oY9tFT4MHurxVK+ohK3G8hTszBYADLw3JWkLoLp9OuIzRkubkTqXsVgOSbtgL1aj1tWb
         n/PuxIrubDea8IEkTmctl5iW3MS8ScKpuI9cKpPWVdTU4qYhFgHjK4B4NF7UcPUqM2xe
         AviablnpZyV6RbURDRIyJ/i2krqhVQezFwO2evhUHguDchIlL5xBi15RU8mycayUojOV
         cuRg==
X-Gm-Message-State: APjAAAWQSClc4Ql4AiJ1jvYd1hcR4RxCBXrBxOLZSDZSW3Vmpmljz4aR
        YFVeJqC36a5I7j6o4+DHWlU=
X-Google-Smtp-Source: APXvYqzPGgD8yq7ImIrKtk8x8BMHHumX1bpuHOOoNv6ukNJWAzfAaf/wxd88FUW1vPOkDz2Vcn4bKA==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr32754296pga.334.1565649685155;
        Mon, 12 Aug 2019 15:41:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w1sm584147pjt.30.2019.08.12.15.41.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 15:41:24 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, vdumpa@nvidia.com
Subject: [PATCH] mmc: tegra: Implement enable_dma() to set dma_mask
Date:   Mon, 12 Aug 2019 15:42:17 -0700
Message-Id: <20190812224217.12423-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 68481a7e1c84 ("mmc: tegra: Mark 64 bit dma broken on Tegra186")
added a SDHCI_QUIRK2_BROKEN_64_BIT_DMA flag to let sdhci core fallback
to 32-bit DMA so as to fit the 40-bit addressing on Tegra186. However,
there's a common way, being mentioned in sdhci.c file, to set dma_mask
via enable_dma() callback in the device driver directly.

So this patch implements an enable_dma() callback in the sdhci-tegra,
in order to set an accurate DMA_BIT_MASK, other than 32-bit or 64-bit.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index f4d4761cf20a..23289adb78d6 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -16,6 +16,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/dma-mapping.h>
 #include <linux/mmc/card.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
@@ -104,6 +105,7 @@
 
 struct sdhci_tegra_soc_data {
 	const struct sdhci_pltfm_data *pdata;
+	u64 dma_bit_mask;
 	u32 nvquirks;
 	u8 min_tap_delay;
 	u8 max_tap_delay;
@@ -749,6 +751,19 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	}
 }
 
+static int tegra_sdhci_enable_dma(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_tegra_soc_data *soc_data = tegra_host->soc_data;
+	struct device *dev = mmc_dev(host->mmc);
+
+	if (soc_data->dma_bit_mask)
+		return dma_set_mask_and_coherent(dev, soc_data->dma_bit_mask);
+
+	return 0;
+}
+
 static unsigned int tegra_sdhci_get_max_clock(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1370,6 +1385,7 @@ static const struct sdhci_ops tegra186_sdhci_ops = {
 	.write_l    = tegra_sdhci_writel,
 	.set_clock  = tegra_sdhci_set_clock,
 	.set_bus_width = sdhci_set_bus_width,
+	.enable_dma = tegra_sdhci_enable_dma,
 	.reset      = tegra_sdhci_reset,
 	.set_uhs_signaling = tegra_sdhci_set_uhs_signaling,
 	.voltage_switch = tegra_sdhci_voltage_switch,
@@ -1384,20 +1400,13 @@ static const struct sdhci_pltfm_data sdhci_tegra186_pdata = {
 		  SDHCI_QUIRK_NO_HISPD_BIT |
 		  SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC |
 		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
-		   /* SDHCI controllers on Tegra186 support 40-bit addressing.
-		    * IOVA addresses are 48-bit wide on Tegra186.
-		    * With 64-bit dma mask used for SDHCI, accesses can
-		    * be broken. Disable 64-bit dma, which would fall back
-		    * to 32-bit dma mask. Ideally 40-bit dma mask would work,
-		    * But it is not supported as of now.
-		    */
-		   SDHCI_QUIRK2_BROKEN_64_BIT_DMA,
+	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
 	.ops  = &tegra186_sdhci_ops,
 };
 
 static const struct sdhci_tegra_soc_data soc_data_tegra186 = {
 	.pdata = &sdhci_tegra186_pdata,
+	.dma_bit_mask = DMA_BIT_MASK(40),
 	.nvquirks = NVQUIRK_NEEDS_PAD_CONTROL |
 		    NVQUIRK_HAS_PADCALIB |
 		    NVQUIRK_DIS_CARD_CLK_CONFIG_TAP |
@@ -1410,6 +1419,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra186 = {
 
 static const struct sdhci_tegra_soc_data soc_data_tegra194 = {
 	.pdata = &sdhci_tegra186_pdata,
+	.dma_bit_mask = DMA_BIT_MASK(39),
 	.nvquirks = NVQUIRK_NEEDS_PAD_CONTROL |
 		    NVQUIRK_HAS_PADCALIB |
 		    NVQUIRK_DIS_CARD_CLK_CONFIG_TAP |
-- 
2.17.1

