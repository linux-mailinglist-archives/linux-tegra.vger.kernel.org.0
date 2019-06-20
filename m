Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56DA4D46F
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 19:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfFTRBG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 13:01:06 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:34722 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732017AbfFTRBG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 13:01:06 -0400
Received: by mail-wr1-f53.google.com with SMTP id k11so3819022wrl.1
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 10:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WCxL/Gx7Z/QbEpqDVsqL0T2Eel8nVyryvJvRvTbXrPs=;
        b=CxgbgXniUVw7AXVWOa/D0yAfjxEnm0IVIQg0ZWZV38vDYiztaB/AVOmmUbKaBsBD0W
         TIhrVVNV2xBd/gzV9NGjeULtMzteFHdOX0hm/z4xechsikPI21hxiI6GYUBbfc+hJm7e
         vgbtK8tAptsOkloJk1KcH3QrkDIUWBO9W1E1Oxs2E29kV0lPY5dDnZMLBh18JLXIP6fj
         OQhMYD3aZ4hB0lMZP6mudxIYQFMBl2EQX4/w8Coabovh8kERvaKKCvnkeHBi9x+4nH13
         NzpEL0ilrxKSp0xNWa8K4hl19fbby+Ds151d5l/jmT/pgF8zKW2RAs+hXuww4vGHw7aR
         ahEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WCxL/Gx7Z/QbEpqDVsqL0T2Eel8nVyryvJvRvTbXrPs=;
        b=Xjd01ThLsgrxNemSA0SP76456zHnfHNLdYhcDN3ijj/xSGh0z21rZchO8e+seh9hOD
         6PS9Xnw6A9HreO4kYEOB3sBZ1L+NAtAdOpii6+x92RbNr3ZCFmaSDOqltOy4REnoBfDp
         UtvXM+TTxLOC0NV9H8jqknbknupscsHfCmoC7DoYmwPuoQk/gHNzL3Gq6T0vz0ikDDrW
         mwAH+AdK4cIxi1J/3n1rESHyC+4z+JqYd4PGDt7QlYv8cfZ7sUhrP1hpVbZPV6ZGLeic
         LqZAJf92j4TMp3tQlDFkB2+PbXkkDbMtmaOc0ZeSXj8n9ygxV2MhUQI4ell90WxyUK7w
         RTCg==
X-Gm-Message-State: APjAAAWbfSrWTSeQpb/B8p3zbICl8H2ryhcYOslaojTNqhiIwGFWwT1s
        hBN53erefsqjx/vVNW6Uktg=
X-Google-Smtp-Source: APXvYqwKPVSJoCXeVmqfI9sUf0X4kbidZCrWMbfa+Fhq4APWcBw1CbMyx4DyStINLzFTJkHIquFsiw==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr30671033wrp.312.1561050060208;
        Thu, 20 Jun 2019 10:01:00 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id k125sm55770wmf.41.2019.06.20.10.00.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 10:00:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org
Subject: [pinmux scripts PATCH 3/3] Update to use bitmask instead of bit for parked configuration
Date:   Thu, 20 Jun 2019 19:00:55 +0200
Message-Id: <20190620170055.19771-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620170055.19771-1-thierry.reding@gmail.com>
References: <20190620170055.19771-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sowjanya Komatineni <skomatineni@nvidia.com>

Parked bits for SDMMC2 and SDMMC4 are part of CFGPAD register rather
than pinmux registers and contains bit for each of their pins.

So updating pinctrl Tegra driver to use bitmask for parked
configuration rather than bit.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
[treding@nvidia.com: reshuffle fields to match driver order]
[treding@nvidia.com: use bitmask 0 for unsupported]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 configs/tegra114.soc            |   1 +
 configs/tegra124.soc            |   1 +
 configs/tegra210.soc            | 301 ++++++++++++++++----------------
 configs/tegra30.soc             |   1 +
 soc-to-kernel-pinctrl-driver.py |  34 ++--
 tegra_pmx_soc_parser.py         |   3 +
 6 files changed, 181 insertions(+), 160 deletions(-)

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
index 970802bef512..edfd0c549cd1 100644
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
+    ('als_prox_int',    0x8e4, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_ready',        0x8e8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_bt',      0x8ec, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_nfc',     0x8f0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('aud_mclk',        0x8f4, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('batt_bcl',        0x8f8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_rst',          0x8fc, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_wake_ap',      0x900, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_home',     0x904, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_power_on', 0x908, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_slide_sw', 0x90c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_down', 0x910, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_up',   0x914, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_mclk',       0x918, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_pwdn',       0x91c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_strobe',     0x920, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_mclk',       0x924, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_pwdn',       0x928, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_af_en',       0x92c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_flash_en',    0x930, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_scl',     0x934, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_sda',     0x938, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_rst',         0x93c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_in',      0x940, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_out',     0x944, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_req',         0x948, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('core_pwr_req',    0x94c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cpu_pwr_req',     0x950, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap1_din',        0x954, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_dout',       0x958, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_fs',         0x95c, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_sclk',       0x960, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_din',        0x964, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_dout',       0x968, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_fs',         0x96c, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_sclk',       0x970, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap4_din',        0x974, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_dout',       0x978, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_fs',         0x97c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_sclk',       0x980, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('sdmmc1',          0xa98, 0, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc3',          0xab0, 0, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc2',          0xa9c, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('sdmmc4',          0xab4, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('dmic1_clk',       0x984, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic1_dat',       0x988, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_clk',       0x98c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_dat',       0x990, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_clk',       0x994, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_dat',       0x998, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dp_hpd0',         0x99c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_clk',        0x9a0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_pwm',        0x9a4, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_scl',    0x9a8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_sda',    0x9ac, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_scl',    0x9b0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_sda',    0x9b4, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_scl',    0x9b8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_sda',    0x9bc, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pa6',             0x9c0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pcc7',            0x9c4, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe6',             0x9c8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe7',             0x9cc, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ph6',             0x9d0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pk0',             0x9d4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk1',             0x9d8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk2',             0x9dc, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk3',             0x9e0, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk4',             0x9e4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk5',             0x9e8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk6',             0x9ec, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk7',             0x9f0, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl0',             0x9f4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl1',             0x9f8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pz0',             0x9fc, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz1',             0xa00, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz2',             0xa04, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz3',             0xa08, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz4',             0xa0c, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz5',             0xa10, 0, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('gpio_x1_aud',     0xa14, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gpio_x3_aud',     0xa18, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_en',          0xa1c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_rst',         0xa20, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_cec',        0xa24, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_int_dp_hpd', 0xa28, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('jtag_rtck',       0xa2c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_en',       0xa30, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_pwm',      0xa34, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio1',       0xa38, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio2',       0xa3c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_rst',         0xa40, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_te',          0xa44, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('modem_wake_ap',   0xa48, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('motion_int',      0xa4c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_en',          0xa50, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_int',         0xa54, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_clkreq_n', 0xa58, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_rst_n',    0xa5c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_clkreq_n', 0xa60, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_rst_n',    0xa64, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_wake_n',      0xa68, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_scl',     0xa6c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_sda',     0xa70, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_int_n',       0xa74, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('qspi_sck',        0xa90, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('sata_led_active', 0xa94, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('shutdown',        0xac8, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_in',        0xacc, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_out',       0xad0, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spi1_cs0',        0xad4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_cs1',        0xad8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_mosi',       0xae0, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_miso',       0xadc, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_sck',        0xae4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs0',        0xae8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs1',        0xaec, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_mosi',       0xaf4, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_miso',       0xaf0, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_sck',        0xaf8, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_cs0',        0xafc, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_mosi',       0xb04, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_miso',       0xb00, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_sck',        0xb08, 0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('temp_alert',      0xb0c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_clk',       0xb10, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_int',       0xb14, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_rst',       0xb18, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_cts',       0xb1c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rts',       0xb20, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rx',        0xb24, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_tx',        0xb28, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_cts',       0xb2c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rts',       0xb30, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rx',        0xb34, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_tx',        0xb38, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_cts',       0xb3c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rts',       0xb40, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rx',        0xb44, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_tx',        0xb48, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_cts',       0xb4c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rts',       0xb50, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rx',        0xb54, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_tx',        0xb58, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en0',    0xb5c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en1',    0xb60, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_en',         0xb64, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_rst',        0xb68, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_wake_ap',    0xb6c, 0, 12, 5,  20, 5,  -1, -1, -1, -1),
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
index 0c04625b2e87..0f45e6fcf7c9 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -258,15 +258,6 @@ s += '''\
 		.rcv_sel_bit = %(rcv_sel_val)s
 ''' % globals()
 
-if soc.soc_pins_all_have_parked:
-    s += '''\
-		.parked_bit = %s,
-''' % (soc.soc_parked_bit)
-else:
-    s+= '''\
-		.parked_bit = -1,
-'''
-
 if soc.soc_pins_have_hsm:
     s += '''\
 		.hsm_bit = PINGROUP_BIT_##hsm(9),
@@ -310,6 +301,15 @@ else:
 		.drv_reg = -1,
 '''
 
+if soc.soc_pins_all_have_parked:
+    s += '''\
+		.parked_bitmask = BIT(%s),
+''' % (soc.soc_parked_bit)
+else:
+    s+= '''\
+		.parked_bitmask = 0,
+'''
+
 s = append_aligned_tabs_indent_with_tabs(s, 72)
 print(s)
 
@@ -325,6 +325,8 @@ if soc.soc_drvgroups_have_schmitt:
     params += ['schmitt_b',]
 if soc.soc_drvgroups_have_lpmd:
     params += ['lpmd_b',]
+if soc.soc_drvgroups_have_parked:
+    params += ['prk_mask',]
 params += drive_params
 if soc.soc_drvgroups_have_drvtype:
     params += ['drvtype',]
@@ -346,6 +348,11 @@ if soc.soc_drvgroups_have_lpmd:
 else:
     lpmd_bit_val = '-1'
 
+if soc.soc_drvgroups_have_parked:
+    parked_bit_mask = 'prk_mask'
+else:
+    parked_bit_mask = '0'
+
 if soc.soc_drvgroups_have_drvtype:
     drvtype_bit_val = 'PINGROUP_BIT_##drvtype(6),'
 else:
@@ -366,7 +373,6 @@ s += '''\
 		.rcv_sel_bit = -1,
 		.drv_reg = DRV_PINGROUP_REG(r),
 		.drv_bank = 0,
-		.parked_bit = -1,
 		.hsm_bit = %(hsm_bit_val)s,
 		.schmitt_bit = %(schmitt_bit_val)s,
 		.lpmd_bit = %(lpmd_bit_val)s,
@@ -379,6 +385,7 @@ s += '''\
 		.slwf_bit = slwf_b,
 		.slwf_width = slwf_w,
 		.drvtype_bit = %(drvtype_bit_val)s
+		.parked_bitmask = %(parked_bit_mask)s,
 ''' % globals()
 
 s = append_aligned_tabs_indent_with_tabs(s, 72)
@@ -539,6 +546,8 @@ if soc.soc_drvgroups_have_schmitt:
     print('schmitt_b, ', end='')
 if soc.soc_drvgroups_have_lpmd:
     print('lpmd_b, ', end='')
+if soc.soc_drvgroups_have_parked:
+    print('prk_mask, ', end='')
 print('drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w', end='')
 if soc.soc_drvgroups_have_drvtype:
     print(', drvtype', end='')
@@ -570,6 +579,11 @@ for drvgroup in f():
         row += (repr(drvgroup.schmitt_b),)
     if soc.soc_drvgroups_have_lpmd:
         row += (repr(drvgroup.lpmd_b),)
+    if soc.soc_drvgroups_have_parked:
+        if (drvgroup.prk_mask != -1):
+                row += (hex(drvgroup.prk_mask),)
+        else:
+                row += (repr(drvgroup.prk_mask),)
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
2.21.0

