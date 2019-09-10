Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06567AE6F3
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Sep 2019 11:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732045AbfIJJ3Y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Sep 2019 05:29:24 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4061 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfIJJ3Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Sep 2019 05:29:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d776cf60000>; Tue, 10 Sep 2019 02:29:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 10 Sep 2019 02:29:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 10 Sep 2019 02:29:22 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Sep
 2019 09:29:21 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 10 Sep 2019 09:29:21 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d776cf00002>; Tue, 10 Sep 2019 02:29:21 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] i2c: tegra: Move suspend handling to NOIRQ phase
Date:   Tue, 10 Sep 2019 10:29:17 +0100
Message-ID: <20190910092917.29901-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568107766; bh=9VpWoifspnjJDUrPjbyVtmdvu+NxGQlW+SISNVm0XC8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Dm+zaus4mQYhMwC7A5JM3QsFHDwd7jL5g0sKg2ZZKpxaI28yL7LjeWtnFPy0C63h8
         Y3M5YAjImG58BnwTczugLL0cHSDv7/xIHhe7uCG3Ru2NUbmLuZlLT37q1s2t9Zbdr7
         f5nkRS8B8363qP0bhYX+oDJCIhJ3cjLWSzDXbWgrXLonJgLnZju1OnUsznFeprizjw
         ahudgQmrPmCd6hiqlA2AuOIAapP7RT7RVsxsXx2rDNz3o//u+DZ4XrFWB+NGvrAnt0
         GgYegmAe1aWs9lwgEFP8eFRMOZ9DjRae4iqJBaDXqOhzcA5WaxqtYvXU+usAnHdBHW
         ZbIuBmNSnpw/A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit acc8abcb2a9c ("i2c: tegra: Add suspend-resume support") added
suspend support for the Tegra I2C driver and following this change on
Tegra30 the following WARNING is seen on entering suspend ...

 WARNING: CPU: 2 PID: 689 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/i2c/i2c-core.h:54 __i2c_transfer+0x35c/0x70c
 i2c i2c-4: Transfer while suspended
 Modules linked in: brcmfmac brcmutil
 CPU: 2 PID: 689 Comm: rtcwake Not tainted 5.3.0-rc7-g089cf7f6ecb2 #1
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 [<c0112264>] (unwind_backtrace) from [<c010ca94>] (show_stack+0x10/0x14)
 [<c010ca94>] (show_stack) from [<c0a77024>] (dump_stack+0xb4/0xc8)
 [<c0a77024>] (dump_stack) from [<c0124198>] (__warn+0xe0/0xf8)
 [<c0124198>] (__warn) from [<c01241f8>] (warn_slowpath_fmt+0x48/0x6c)
 [<c01241f8>] (warn_slowpath_fmt) from [<c06f6c40>] (__i2c_transfer+0x35c/0x70c)
 [<c06f6c40>] (__i2c_transfer) from [<c06f7048>] (i2c_transfer+0x58/0xf4)
 [<c06f7048>] (i2c_transfer) from [<c06f7130>] (i2c_transfer_buffer_flags+0x4c/0x70)
 [<c06f7130>] (i2c_transfer_buffer_flags) from [<c05bee78>] (regmap_i2c_write+0x14/0x30)
 [<c05bee78>] (regmap_i2c_write) from [<c05b9cac>] (_regmap_raw_write_impl+0x35c/0x868)
 [<c05b9cac>] (_regmap_raw_write_impl) from [<c05b984c>] (_regmap_update_bits+0xe4/0xec)
 [<c05b984c>] (_regmap_update_bits) from [<c05bad04>] (regmap_update_bits_base+0x50/0x74)
 [<c05bad04>] (regmap_update_bits_base) from [<c04d453c>] (regulator_disable_regmap+0x44/0x54)
 [<c04d453c>] (regulator_disable_regmap) from [<c04cf9d4>] (_regulator_do_disable+0xf8/0x268)
 [<c04cf9d4>] (_regulator_do_disable) from [<c04d1694>] (_regulator_disable+0xf4/0x19c)
 [<c04d1694>] (_regulator_disable) from [<c04d1770>] (regulator_disable+0x34/0x64)
 [<c04d1770>] (regulator_disable) from [<c04d2310>] (regulator_bulk_disable+0x28/0xb4)
 [<c04d2310>] (regulator_bulk_disable) from [<c0495cd4>] (tegra_pcie_power_off+0x64/0xa8)
 [<c0495cd4>] (tegra_pcie_power_off) from [<c0495f74>] (tegra_pcie_pm_suspend+0x25c/0x3f4)
 [<c0495f74>] (tegra_pcie_pm_suspend) from [<c05af48c>] (dpm_run_callback+0x38/0x1d4)
 [<c05af48c>] (dpm_run_callback) from [<c05afe30>] (__device_suspend_noirq+0xc0/0x2b8)
 [<c05afe30>] (__device_suspend_noirq) from [<c05b1c24>] (dpm_noirq_suspend_devices+0x100/0x37c)
 [<c05b1c24>] (dpm_noirq_suspend_devices) from [<c05b1ebc>] (dpm_suspend_noirq+0x1c/0x48)
 [<c05b1ebc>] (dpm_suspend_noirq) from [<c017d2c0>] (suspend_devices_and_enter+0x1d0/0xa00)
 [<c017d2c0>] (suspend_devices_and_enter) from [<c017dd10>] (pm_suspend+0x220/0x74c)
 [<c017dd10>] (pm_suspend) from [<c017c2c8>] (state_store+0x6c/0xc8)
 [<c017c2c8>] (state_store) from [<c02ef398>] (kernfs_fop_write+0xe8/0x1c4)
 [<c02ef398>] (kernfs_fop_write) from [<c0271e38>] (__vfs_write+0x2c/0x1c4)
 [<c0271e38>] (__vfs_write) from [<c02748dc>] (vfs_write+0xa4/0x184)
 [<c02748dc>] (vfs_write) from [<c0274b7c>] (ksys_write+0x9c/0xdc)
 [<c0274b7c>] (ksys_write) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
 Exception stack(0xe9f21fa8 to 0xe9f21ff0)
 1fa0:                   0000006c 004b2438 00000004 004b2438 00000004 00000000
 1fc0: 0000006c 004b2438 004b1228 00000004 00000004 00000004 0049e78c 004b1228
 1fe0: 00000004 be9809b8 b6f0bc0b b6e96206

The problem is that the Tegra PCIe driver indirectly uses I2C for
controlling some regulators and the I2C driver is now being suspended
before the PCIe driver causing the PCIe suspend to fail. The Tegra PCIe
driver is suspended during the NOIRQ phase and this cannot be changed
due to other dependencies. Therefore, we also need to move the suspend
handling for the Tegra I2C driver to the NOIRQ phase as well.

In order to move the I2C suspend handling to the NOIRQ phase we also
need to avoid calling pm_runtime_get/put() because per commit
1e2ef05bb8cf ("PM: Limit race conditions between runtime PM and system
sleep (v2)") these cannot be called early in resume. The function
tegra_i2c_init(), called during resume, calls pm_runtime_get/put() and
so move these calls outside of tegra_i2c_init(), so this function can
be used during the NOIRQ resume phase.

Fixes: acc8abcb2a9c ("i2c: tegra: Add suspend-resume support")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 40 +++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 18f0ceed9f1b..c1683f9338b4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -713,12 +713,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	err = pm_runtime_get_sync(i2c_dev->dev);
-	if (err < 0) {
-		dev_err(i2c_dev->dev, "runtime resume failed %d\n", err);
-		return err;
-	}
-
 	reset_control_assert(i2c_dev->rst);
 	udelay(2);
 	reset_control_deassert(i2c_dev->rst);
@@ -772,7 +766,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 		if (err) {
 			dev_err(i2c_dev->dev,
 				"failed changing clock rate: %d\n", err);
-			goto err;
+			return err;
 		}
 	}
 
@@ -787,23 +781,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
 	if (err)
-		goto err;
+		return err;
 
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
-		goto err;
+		return err;
 
 	if (i2c_dev->irq_disabled) {
 		i2c_dev->irq_disabled = false;
 		enable_irq(i2c_dev->irq);
 	}
 
-err:
-	pm_runtime_put(i2c_dev->dev);
-	return err;
+	return 0;
 }
 
 static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
@@ -1616,12 +1608,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
+	if (!pm_runtime_enabled(&pdev->dev))
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto unprepare_div_clk;
-		}
+	else
+		ret = pm_runtime_get_sync(i2c_dev->dev);
+
+	if (ret < 0) {
+		dev_err(&pdev->dev, "runtime resume failed\n");
+		goto unprepare_div_clk;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1666,6 +1660,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto release_dma;
 
+	pm_runtime_put(&pdev->dev);
+
 	return 0;
 
 release_dma:
@@ -1725,17 +1721,25 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int err;
 
+	err = tegra_i2c_runtime_resume(dev);
+	if (err)
+		return err;
+
 	err = tegra_i2c_init(i2c_dev, false);
 	if (err)
 		return err;
 
+	err = tegra_i2c_runtime_suspend(dev);
+	if (err)
+		return err;
+
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
 }
 
 static const struct dev_pm_ops tegra_i2c_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
-- 
2.17.1

