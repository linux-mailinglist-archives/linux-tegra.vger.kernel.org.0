Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA27D4AEA7
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 01:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfFRXVV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 19:21:21 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5934 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRXVU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 19:21:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0971ec0000>; Tue, 18 Jun 2019 16:21:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 16:21:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 16:21:17 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 23:21:16 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 23:21:16 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0971ec0002>; Tue, 18 Jun 2019 16:21:16 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <linux-tegra@vger.kernel.org>
CC:     <skomatineni@nvidia.com>
Subject: [PATCH V1] update to use bitmask instead of bit for parked configuration
Date:   Tue, 18 Jun 2019 16:21:15 -0700
Message-ID: <1560900075-22610-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560900076; bh=p83DP1VgLl6Q37GsMohwLRreUCcYQ7vdtxYfNhuPlgs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=VbqYVR5gDVFlvt/9HbeneubuvQjSWSpg0Nuhbw1JG/aacgyVrKpcaTvlqQrtqwUKN
         3fMjKlwm+3LoxhAN/fHDinc1QD9T/vRmgjGPP9HOauH/R9XJ0/Unjv7FCoCKhEwGwu
         ZKof0z9g3KGeJQ93qpRKGdeQ9ABHSwFggdCGUgMuIY1S0gmqDnaDzBBXEu+XKudSd2
         ceNan2CJ820fax2uM/nLYVP2VpWi/wrxfJR37xmCLg3EsBu9fXnH00JIa2QVC/vIS8
         rc6WQLwMZ5ZjtRMjyLHShOP2A52DuL4dhjgwOU9x8529VSqb59W9abtr+cPS43VE65
         +DXuidDezWXsQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Parked bits for SDMMC2 and SDMMC4 are part of CFGPAD register rather
than pinmux registers and contains bit for each of their pins.

So updating pinctrl Tegra driver to use bitmask for parked
configuration rather than bit.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 configs/tegra114.soc            |   1 +
 configs/tegra124.soc            |   1 +
 configs/tegra210.soc            | 301 ++++++++++++++++++++--------------------
 configs/tegra30.soc             |   1 +
 soc-to-kernel-pinctrl-driver.py |  17 ++-
 tegra_pmx_soc_parser.py         |   3 +
 6 files changed, 171 insertions(+), 153 deletions(-)

diff --git a/configs/tegra114.soc b/configs/tegra114.soc
index a70bdf9bdc49..34eaccdb372b 100644
--- a/configs/tegra114.soc
+++ b/configs/tegra114.soc
@@ -12,6 +12,7 @@ soc_drvgroups_have_drvtype = True
 soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
+soc_drvgroups_have_parked = False
 soc_pins_all_have_od = False
 soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 1012c7c76e75..e0e2595ab405 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -13,6 +13,7 @@ soc_drvgroups_have_drvtype = True
 soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
+soc_drvgroups_have_parked = False
 soc_pins_all_have_od = False
 soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
diff --git a/configs/tegra210.soc b/configs/tegra210.soc
index 970802bef512..771459d32fe8 100644
--- a/configs/tegra210.soc
+++ b/configs/tegra210.soc
@@ -9,6 +9,7 @@ soc_drvgroups_have_drvtype = False
 soc_drvgroups_have_hsm = False
 soc_drvgroups_have_lpmd = False
 soc_drvgroups_have_schmitt = False
+soc_drvgroups_have_parked = True
 soc_pins_all_have_od = True
 soc_pins_all_have_parked = True
 soc_pins_all_have_schmitt = True
@@ -195,156 +196,156 @@ pins = (
 )
 
 drive_groups = (
-    #name, r, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w
-    ('als_prox_int',    0x8e4, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('ap_ready',        0x8e8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('ap_wake_bt',      0x8ec, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('ap_wake_nfc',     0x8f0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('aud_mclk',        0x8f4, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('batt_bcl',        0x8f8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('bt_rst',          0x8fc, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('bt_wake_ap',      0x900, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('button_home',     0x904, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('button_power_on', 0x908, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('button_slide_sw', 0x90c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('button_vol_down', 0x910, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('button_vol_up',   0x914, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam1_mclk',       0x918, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam1_pwdn',       0x91c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam1_strobe',     0x920, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam2_mclk',       0x924, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam2_pwdn',       0x928, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam_af_en',       0x92c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam_flash_en',    0x930, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam_i2c_scl',     0x934, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam_i2c_sda',     0x938, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cam_rst',         0x93c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('clk_32k_in',      0x940, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('clk_32k_out',     0x944, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('clk_req',         0x948, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('core_pwr_req',    0x94c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('cpu_pwr_req',     0x950, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dap1_din',        0x954, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap1_dout',       0x958, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap1_fs',         0x95c, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap1_sclk',       0x960, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap2_din',        0x964, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap2_dout',       0x968, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap2_fs',         0x96c, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap2_sclk',       0x970, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('dap4_din',        0x974, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dap4_dout',       0x978, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dap4_fs',         0x97c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dap4_sclk',       0x980, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('sdmmc1',          0xa98, 12, 7,  20, 7,  28, 2,  30, 2),
-    ('sdmmc3',          0xab0, 12, 7,  20, 7,  28, 2,  30, 2),
-    ('sdmmc2',          0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
-    ('sdmmc4',          0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
-    ('dmic1_clk',       0x984, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dmic1_dat',       0x988, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dmic2_clk',       0x98c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dmic2_dat',       0x990, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dmic3_clk',       0x994, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dmic3_dat',       0x998, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dp_hpd0',         0x99c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dvfs_clk',        0x9a0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('dvfs_pwm',        0x9a4, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen1_i2c_scl',    0x9a8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen1_i2c_sda',    0x9ac, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen2_i2c_scl',    0x9b0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen2_i2c_sda',    0x9b4, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen3_i2c_scl',    0x9b8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gen3_i2c_sda',    0x9bc, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pa6',             0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pcc7',            0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pe6',             0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pe7',             0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('ph6',             0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pk0',             0x9d4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk1',             0x9d8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk2',             0x9dc, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk3',             0x9e0, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk4',             0x9e4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk5',             0x9e8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk6',             0x9ec, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pk7',             0x9f0, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pl0',             0x9f4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pl1',             0x9f8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('pz0',             0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('pz1',             0xa00, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('pz2',             0xa04, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('pz3',             0xa08, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('pz4',             0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('pz5',             0xa10, 12, 7,  20, 7,  -1, -1, -1, -1),
-    ('gpio_x1_aud',     0xa14, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gpio_x3_aud',     0xa18, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gps_en',          0xa1c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('gps_rst',         0xa20, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('hdmi_cec',        0xa24, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('hdmi_int_dp_hpd', 0xa28, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('jtag_rtck',       0xa2c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_bl_en',       0xa30, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_bl_pwm',      0xa34, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_gpio1',       0xa38, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_gpio2',       0xa3c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_rst',         0xa40, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('lcd_te',          0xa44, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('modem_wake_ap',   0xa48, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('motion_int',      0xa4c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('nfc_en',          0xa50, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('nfc_int',         0xa54, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pex_l0_clkreq_n', 0xa58, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pex_l0_rst_n',    0xa5c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pex_l1_clkreq_n', 0xa60, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pex_l1_rst_n',    0xa64, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pex_wake_n',      0xa68, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pwr_i2c_scl',     0xa6c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pwr_i2c_sda',     0xa70, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('pwr_int_n',       0xa74, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('qspi_sck',        0xa90, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('sata_led_active', 0xa94, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('shutdown',        0xac8, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('spdif_in',        0xacc, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('spdif_out',       0xad0, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('spi1_cs0',        0xad4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi1_cs1',        0xad8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi1_mosi',       0xae0, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi1_miso',       0xadc, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi1_sck',        0xae4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi2_cs0',        0xae8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi2_cs1',        0xaec, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi2_mosi',       0xaf4, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi2_miso',       0xaf0, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi2_sck',        0xaf8, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi4_cs0',        0xafc, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi4_mosi',       0xb04, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi4_miso',       0xb00, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('spi4_sck',        0xb08, -1, -1, -1, -1, 28, 2,  30, 2),
-    ('temp_alert',      0xb0c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('touch_clk',       0xb10, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('touch_int',       0xb14, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('touch_rst',       0xb18, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart1_cts',       0xb1c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart1_rts',       0xb20, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart1_rx',        0xb24, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart1_tx',        0xb28, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart2_cts',       0xb2c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart2_rts',       0xb30, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart2_rx',        0xb34, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart2_tx',        0xb38, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart3_cts',       0xb3c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart3_rts',       0xb40, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart3_rx',        0xb44, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart3_tx',        0xb48, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart4_cts',       0xb4c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart4_rts',       0xb50, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart4_rx',        0xb54, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('uart4_tx',        0xb58, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('usb_vbus_en0',    0xb5c, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('usb_vbus_en1',    0xb60, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('wifi_en',         0xb64, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('wifi_rst',        0xb68, 12, 5,  20, 5,  -1, -1, -1, -1),
-    ('wifi_wake_ap',    0xb6c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    #name, r, prk_mask, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w
+    ('als_prox_int',    0x8e4, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_ready',        0x8e8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_bt',      0x8ec, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_nfc',     0x8f0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('aud_mclk',        0x8f4, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('batt_bcl',        0x8f8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_rst',          0x8fc, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_wake_ap',      0x900, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_home',     0x904, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_power_on', 0x908, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_slide_sw', 0x90c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_down', 0x910, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_up',   0x914, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_mclk',       0x918, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_pwdn',       0x91c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_strobe',     0x920, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_mclk',       0x924, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_pwdn',       0x928, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_af_en',       0x92c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_flash_en',    0x930, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_scl',     0x934, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_sda',     0x938, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_rst',         0x93c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_in',      0x940, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_out',     0x944, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_req',         0x948, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('core_pwr_req',    0x94c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cpu_pwr_req',     0x950, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap1_din',        0x954, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_dout',       0x958, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_fs',         0x95c, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_sclk',       0x960, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_din',        0x964, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_dout',       0x968, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_fs',         0x96c, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_sclk',       0x970, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap4_din',        0x974, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_dout',       0x978, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_fs',         0x97c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_sclk',       0x980, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('sdmmc1',          0xa98, -1, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc3',          0xab0, -1, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc2',          0xa9c, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('sdmmc4',          0xab4, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('dmic1_clk',       0x984, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic1_dat',       0x988, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_clk',       0x98c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_dat',       0x990, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_clk',       0x994, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_dat',       0x998, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dp_hpd0',         0x99c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_clk',        0x9a0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_pwm',        0x9a4, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_scl',    0x9a8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_sda',    0x9ac, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_scl',    0x9b0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_sda',    0x9b4, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_scl',    0x9b8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_sda',    0x9bc, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pa6',             0x9c0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pcc7',            0x9c4, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe6',             0x9c8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe7',             0x9cc, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ph6',             0x9d0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pk0',             0x9d4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk1',             0x9d8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk2',             0x9dc, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk3',             0x9e0, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk4',             0x9e4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk5',             0x9e8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk6',             0x9ec, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk7',             0x9f0, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl0',             0x9f4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl1',             0x9f8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pz0',             0x9fc, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz1',             0xa00, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz2',             0xa04, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz3',             0xa08, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz4',             0xa0c, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz5',             0xa10, -1, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('gpio_x1_aud',     0xa14, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gpio_x3_aud',     0xa18, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_en',          0xa1c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_rst',         0xa20, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_cec',        0xa24, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_int_dp_hpd', 0xa28, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('jtag_rtck',       0xa2c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_en',       0xa30, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_pwm',      0xa34, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio1',       0xa38, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio2',       0xa3c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_rst',         0xa40, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_te',          0xa44, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('modem_wake_ap',   0xa48, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('motion_int',      0xa4c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_en',          0xa50, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_int',         0xa54, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_clkreq_n', 0xa58, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_rst_n',    0xa5c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_clkreq_n', 0xa60, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_rst_n',    0xa64, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_wake_n',      0xa68, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_scl',     0xa6c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_sda',     0xa70, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_int_n',       0xa74, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('qspi_sck',        0xa90, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('sata_led_active', 0xa94, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('shutdown',        0xac8, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_in',        0xacc, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_out',       0xad0, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spi1_cs0',        0xad4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_cs1',        0xad8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_mosi',       0xae0, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_miso',       0xadc, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_sck',        0xae4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs0',        0xae8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs1',        0xaec, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_mosi',       0xaf4, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_miso',       0xaf0, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_sck',        0xaf8, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_cs0',        0xafc, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_mosi',       0xb04, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_miso',       0xb00, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_sck',        0xb08, -1, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('temp_alert',      0xb0c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_clk',       0xb10, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_int',       0xb14, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_rst',       0xb18, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_cts',       0xb1c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rts',       0xb20, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rx',        0xb24, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_tx',        0xb28, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_cts',       0xb2c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rts',       0xb30, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rx',        0xb34, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_tx',        0xb38, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_cts',       0xb3c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rts',       0xb40, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rx',        0xb44, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_tx',        0xb48, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_cts',       0xb4c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rts',       0xb50, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rx',        0xb54, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_tx',        0xb58, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en0',    0xb5c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en1',    0xb60, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_en',         0xb64, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_rst',        0xb68, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_wake_ap',    0xb6c, -1, 12, 5,  20, 5,  -1, -1, -1, -1),
 )
 
 drive_group_pins = {
diff --git a/configs/tegra30.soc b/configs/tegra30.soc
index 28073c11b21a..1279bdc5e936 100644
--- a/configs/tegra30.soc
+++ b/configs/tegra30.soc
@@ -9,6 +9,7 @@ soc_drvgroups_have_drvtype = False
 soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
+soc_drvgroups_have_parked = False
 soc_pins_all_have_od = False
 soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 65e4c604f1c9..fb7fbb458d75 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -261,11 +261,11 @@ s += '''\
 
 if soc.soc_pins_all_have_parked:
     s += '''\
-		.parked_bit = %s,
+		.parked_bitmask = BIT(%s),
 ''' % (soc.soc_parked_bit)
 else:
     s+= '''\
-		.parked_bit = -1,
+		.parked_bitmask = -1,
 '''
 
 if soc.soc_pins_have_hsm:
@@ -326,6 +326,8 @@ if soc.soc_drvgroups_have_schmitt:
     params += ['schmitt_b',]
 if soc.soc_drvgroups_have_lpmd:
     params += ['lpmd_b',]
+if soc.soc_drvgroups_have_parked:
+    params += ['prk_mask',]
 params += drive_params
 if soc.soc_drvgroups_have_drvtype:
     params += ['drvtype',]
@@ -347,6 +349,11 @@ if soc.soc_drvgroups_have_lpmd:
 else:
     lpmd_bit_val = '-1'
 
+if soc.soc_drvgroups_have_parked:
+    parked_bit_mask = 'prk_mask'
+else:
+    parked_bit_mask = '-1'
+
 if soc.soc_drvgroups_have_drvtype:
     drvtype_bit_val = 'PINGROUP_BIT_##drvtype(6),'
 else:
@@ -367,7 +374,7 @@ s += '''\
 		.rcv_sel_bit = -1,
 		.drv_reg = DRV_PINGROUP_REG(r),
 		.drv_bank = 0,
-		.parked_bit = -1,
+		.parked_bitmask = %(parked_bit_mask)s,
 		.hsm_bit = %(hsm_bit_val)s,
 		.schmitt_bit = %(schmitt_bit_val)s,
 		.lpmd_bit = %(lpmd_bit_val)s,
@@ -540,6 +547,8 @@ if soc.soc_drvgroups_have_schmitt:
     print('schmitt_b, ', end='')
 if soc.soc_drvgroups_have_lpmd:
     print('lpmd_b, ', end='')
+if soc.soc_drvgroups_have_parked:
+    print('prk_mask, ', end='')
 print('drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w', end='')
 if soc.soc_drvgroups_have_drvtype:
     print(', drvtype', end='')
@@ -571,6 +580,8 @@ for drvgroup in f():
         row += (repr(drvgroup.schmitt_b),)
     if soc.soc_drvgroups_have_lpmd:
         row += (repr(drvgroup.lpmd_b),)
+    if soc.soc_drvgroups_have_parked:
+        row += (hex(drvgroup.prk_mask),)
     row += (
         repr(drvgroup.drvdn_b),
         repr(drvgroup.drvdn_w),
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index 891a68f34f4a..42af629a6e60 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -102,6 +102,8 @@ class DriveGroup(ReprDictObj):
             fields += ('schmitt_b',)
         if soc.soc_drvgroups_have_lpmd:
             fields += ('lpmd_b',)
+        if soc.soc_drvgroups_have_parked:
+            fields += ('prk_mask',)
         fields += ('drvdn_b', 'drvdn_w', 'drvup_b', 'drvup_w', 'slwr_b',
             'slwr_w', 'slwf_b', 'slwf_w')
         if soc.soc_drvgroups_have_drvtype:
@@ -148,6 +150,7 @@ class Soc(TopLevelParsedObj):
             ('soc_drvgroups_have_drvtype', None),
             ('soc_drvgroups_have_hsm', None),
             ('soc_drvgroups_have_lpmd', None),
+            ('soc_drvgroups_have_parked', None),
             ('soc_drvgroups_have_schmitt', None),
             ('soc_pins_all_have_od', None),
             ('soc_pins_all_have_parked', None),
-- 
2.7.4

