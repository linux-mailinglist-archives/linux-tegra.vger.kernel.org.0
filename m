Return-Path: <linux-tegra+bounces-4898-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE9A2AD2C
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Feb 2025 16:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 481613A4BB3
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Feb 2025 15:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0248F1F417F;
	Thu,  6 Feb 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GDpLc7DU"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2701F416B
	for <linux-tegra@vger.kernel.org>; Thu,  6 Feb 2025 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857576; cv=none; b=HA7xPQRuwc/+O+/1gLSZBy1OK/GbRbdx8Z6vARoMKgC155Gc9QosphfbnkM666Tag8JTtGEQ6AUEEilDRYsHmLMPsFkCaPX+JIGg8iKzDKm9GgAZi3gyhvEl7iKtZi2mmkv7HXS8NAg9FhXv+JNgAnE2nF1Ob6udnRHKD72tnJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857576; c=relaxed/simple;
	bh=u0/jakFwfN9d76kGg7FvdUfkSfylz69ks8azTcR7B0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrNRY8jqiVNTB3wWeWTk9b93YAv2DRc6bR5OyfKG38GGvt6+QRzlEAMCJPmfrsavo2fK3esQZVye8l+NtEng5xBbIxNOEsOYS5lTEelDGvqlgR6/CHW/s6o4aPjoQpvN6+CqG7kD/9mHT8sOw3JHe7R+qc8cpb0UkdSgCxRrnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GDpLc7DU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738857574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Asmk/CC4AQOrPth5nbCgXULyPrJ8HPnOEMPbaEn44k=;
	b=GDpLc7DUxtVaHUS5Qdmc6/HQlYeRy6FJ7Kayv69IqB0Nk75R+U1FECThSX/rlBnFoIttwD
	jITz1UkCHOzZ5pE1DHPWuJvLQLxHnobXv0+9iyxsvJ4yG3tvxk3HWplyYPp35yks4WIEUG
	V51PAG1wDlDmQBE72PHG7/CQe8xqtWI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-UY2LpMBiOAuySItftVIU_g-1; Thu,
 06 Feb 2025 10:59:29 -0500
X-MC-Unique: UY2LpMBiOAuySItftVIU_g-1
X-Mimecast-MFC-AGG-ID: UY2LpMBiOAuySItftVIU_g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 532A21800989;
	Thu,  6 Feb 2025 15:59:28 +0000 (UTC)
Received: from rusingh-thinkpadt14gen4.remote.csb (unknown [10.42.28.157])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78D2D30001AB;
	Thu,  6 Feb 2025 15:59:25 +0000 (UTC)
From: rusingh@redhat.com
To: thierry.reding@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com,
	mperttunen@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupinderjit Singh <rusingh@redhat.com>
Subject: [PATCH] gpu: host1x: Fix a use of uninitialized mutex
Date: Thu,  6 Feb 2025 15:58:03 +0000
Message-ID: <20250206155803.201942-1-rusingh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Rupinderjit Singh <rusingh@redhat.com>

commit c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
caused a use of uninitialized mutex leading to below warning when
CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC are enabled.

[   41.662843] ------------[ cut here ]------------
[   41.663012] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
[   41.663035] WARNING: CPU: 4 PID: 794 at kernel/locking/mutex.c:587 __mutex_lock+0x670/0x878
[   41.663458] Modules linked in: rtw88_8822c(+) bluetooth(+) rtw88_pci rtw88_core mac80211 aquantia libarc4 crc_itu_t cfg80211 tegra194_cpufreq dwmac_tegra(+) arm_dsu_pmu stmmac_platform stmmac pcs_xpcs rfkill at24 host1x(+) tegra_bpmp_thermal ramoops reed_solomon fuse loop nfnetlink xfs mmc_block rpmb_core ucsi_ccg ina3221 crct10dif_ce xhci_tegra ghash_ce lm90 sha2_ce sha256_arm64 sha1_ce sdhci_tegra pwm_fan sdhci_pltfm sdhci gpio_keys rtc_tegra cqhci mmc_core phy_tegra_xusb i2c_tegra tegra186_gpc_dma i2c_tegra_bpmp spi_tegra114 dm_mirror dm_region_hash dm_log dm_mod
[   41.665078] CPU: 4 UID: 0 PID: 794 Comm: (udev-worker) Not tainted 6.11.0-29.31_1538613708.el10.aarch64+debug #1
[   41.665838] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS 36.3.0-gcid-35594366 02/26/2024
[   41.672555] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   41.679636] pc : __mutex_lock+0x670/0x878
[   41.683834] lr : __mutex_lock+0x670/0x878
[   41.688035] sp : ffff800084b77090
[   41.691446] x29: ffff800084b77160 x28: ffffdd4bebf7b000 x27: ffffdd4be96b1000
[   41.698799] x26: 1fffe0002308361c x25: 1ffff0001096ee18 x24: 0000000000000000
[   41.706149] x23: 0000000000000000 x22: 0000000000000002 x21: ffffdd4be6e3c7a0
[   41.713500] x20: ffff800084b770f0 x19: ffff00011841b1e8 x18: 0000000000000000
[   41.720675] x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007200720
[   41.728023] x14: 0000000000000000 x13: 0000000000000001 x12: ffff6001a96eaab3
[   41.735375] x11: 1fffe001a96eaab2 x10: ffff6001a96eaab2 x9 : ffffdd4be4838bbc
[   41.742723] x8 : 00009ffe5691554e x7 : ffff000d4b755593 x6 : 0000000000000001
[   41.749985] x5 : ffff000d4b755590 x4 : 1fffe0001d88f001 x3 : dfff800000000000
[   41.756988] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000ec478000
[   41.764251] Call trace:
[   41.766695]  __mutex_lock+0x670/0x878
[   41.770373]  mutex_lock_nested+0x2c/0x40
[   41.774134]  host1x_intr_start+0x54/0xf8 [host1x]
[   41.778863]  host1x_runtime_resume+0x150/0x228 [host1x]
[   41.783935]  pm_generic_runtime_resume+0x84/0xc8
[   41.788485]  __rpm_callback+0xa0/0x478
[   41.792422]  rpm_callback+0x15c/0x1a8
[   41.795922]  rpm_resume+0x698/0xc08
[   41.799597]  __pm_runtime_resume+0xa8/0x140
[   41.803621]  host1x_probe+0x810/0xbc0 [host1x]
[   41.807909]  platform_probe+0xcc/0x1a8
[   41.811845]  really_probe+0x188/0x800
[   41.815347]  __driver_probe_device+0x164/0x360
[   41.819810]  driver_probe_device+0x64/0x1a8
[   41.823834]  __driver_attach+0x180/0x490
[   41.827773]  bus_for_each_dev+0x104/0x1a0
[   41.831797]  driver_attach+0x44/0x68
[   41.835296]  bus_add_driver+0x23c/0x4e8
[   41.839235]  driver_register+0x15c/0x3a8
[   41.843170]  __platform_register_drivers+0xa4/0x208
[   41.848159]  tegra_host1x_init+0x4c/0xff8 [host1x]
[   41.853147]  do_one_initcall+0xd4/0x380
[   41.856997]  do_init_module+0x1dc/0x698
[   41.860758]  load_module+0xc70/0x1300
[   41.864435]  __do_sys_init_module+0x1a8/0x1d0
[   41.868721]  __arm64_sys_init_module+0x74/0xb0
[   41.873183]  invoke_syscall.constprop.0+0xdc/0x1e8
[   41.877997]  do_el0_svc+0x154/0x1d0
[   41.881671]  el0_svc+0x54/0x140
[   41.884820]  el0t_64_sync_handler+0x120/0x130
[   41.889285]  el0t_64_sync+0x1a4/0x1a8
[   41.892960] irq event stamp: 69737
[   41.896370] hardirqs last  enabled at (69737): [<ffffdd4be6d7768c>] _raw_spin_unlock_irqrestore+0x44/0xe8
[   41.905739] hardirqs last disabled at (69736): [<ffffdd4be59dcd40>] clk_enable_lock+0x98/0x198
[   41.914314] softirqs last  enabled at (68082): [<ffffdd4be466b1d0>] handle_softirqs+0x4c8/0x890
[   41.922977] softirqs last disabled at (67945): [<ffffdd4be44f02a4>] __do_softirq+0x1c/0x28
[   41.931289] ---[ end trace 0000000000000000 ]---

Inside the probe function when pm_runtime_enable() is called,
the PM core invokes a resume callback if the device Host1x is
in a suspended state. As it can be seen in the logs above,
this leads to host1x_intr_start() function call which is
trying to acquire a mutex lock. But, the function
host_intr_init() only gets called after the pm_runtime_enable()
where mutex is initialised leading to the use of mutex
prior to its initialisation.

Fix this by moving the mutex initialisation prior to the runtime
PM enablement function pm_runtime_enable() in probe.

Fixes: c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
Signed-off-by: Rupinderjit Singh <rusingh@redhat.com>
---
 drivers/gpu/host1x/dev.c  | 2 ++
 drivers/gpu/host1x/intr.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 7b1d091f3c09..46cae925b095 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -619,6 +619,8 @@ static int host1x_probe(struct platform_device *pdev)
 		goto free_contexts;
 	}
 
+	mutex_init(&host->intr_mutex);
+
 	pm_runtime_enable(&pdev->dev);
 
 	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index b3285dd10180..f77a678949e9 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -104,8 +104,6 @@ int host1x_intr_init(struct host1x *host)
 	unsigned int id;
 	int i, err;
 
-	mutex_init(&host->intr_mutex);
-
 	for (id = 0; id < host1x_syncpt_nb_pts(host); ++id) {
 		struct host1x_syncpt *syncpt = &host->syncpt[id];
 
-- 
2.48.1


