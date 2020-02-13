Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BF215B571
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Feb 2020 00:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729581AbgBLXxP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 12 Feb 2020 18:53:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35017 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgBLXwO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Feb 2020 18:52:14 -0500
Received: by mail-lf1-f68.google.com with SMTP id z18so2887454lfe.2;
        Wed, 12 Feb 2020 15:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j1CisKYbxPt5wQIWr6MTpB6aHV/SdlOnTS8Sglhfi+o=;
        b=QCN4z80F7O70Tce8ANrE7wiSIBUiMSskDKPTp6DsdX9MiEFrkUwk+5h1fDbFM6e7Gg
         dI+mgb/0BflLGKZPdwyOBIluc7l59gmXSRBf6dx/Rzr0JQvnHY5Zi2wPykzT+nXnI6Kd
         6fN2vYEHpLaO3s2jyouykkjKQWJEe6ZxTcaHhAoTsG4+pKs+zNop2iBPv7DyPrJeONZj
         Bjw3GkkOxwCoM07fFB45bKjySCmCIEJvNO7LUP05GwpfYHqQoZAfvwPsSul3pDthqiMC
         FaP0vb7Ko29kffC6eA14hdsgVg5o5C9rKxAKt/udGW7G37roNzBWmAIHvSmB/Hz6oQ9O
         J4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j1CisKYbxPt5wQIWr6MTpB6aHV/SdlOnTS8Sglhfi+o=;
        b=IELBP3wnIRfbBSVu56HD4gAAu1cgjf5+BhsaSTVGZS+qUFSGJFnupq3QPdkZYKGqcd
         1NkYmGCZNJr/L4jfFjZmkyhGgdOdxbCpC0X4m75526EI6AyCN5ezXgATrt/zTBk142Gc
         kvg39dbUhfjLzngpOepo9y0/5Eg8D+Gpv8k4eJ8VgUOCWTOLLPCWys0XhPz4Kxyqm50N
         IP8GqlPP3SkyVHcr3FgvjyBmu6XawYs7PvqHDRTGluw/W68v+rk78Box/yjHTA+x8dGa
         0Q4uzQNVhEyuLD8UmqXReefp4enBf4C25FbYLF/wBgBAW210KkILSSRzJPSt69Dsr1fp
         TYvA==
X-Gm-Message-State: APjAAAUiWtlBxpvHV53stc3e+WIBGMzh89+juQ5AWMbq9jdowgk1bpB0
        xN7/qQxlS4Zqh2T1DdVo1SA=
X-Google-Smtp-Source: APXvYqxJZh33CDIpUwKFgDIxsjsqtVxZ5X4/L7jN3UAPJzD8Nzr4J0O7Ft60OZm0t6Xjl4gNAhAHdA==
X-Received: by 2002:ac2:515b:: with SMTP id q27mr7468187lfd.119.1581551531909;
        Wed, 12 Feb 2020 15:52:11 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d5sm251686lfb.20.2020.02.12.15.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 15:52:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/17] ARM: tegra: Remove pen-locking from cpuidle-tegra20
Date:   Thu, 13 Feb 2020 02:51:20 +0300
Message-Id: <20200212235134.12638-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200212235134.12638-1-digetx@gmail.com>
References: <20200212235134.12638-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Pen-locking is meant to block CPU0 if CPU1 wakes up during of entering
into LP2 because of some interrupt firing up, preventing unnecessary LP2
enter that will be resumed immediately. Apparently this case doesn't
happen often in practice, I checked how often it takes place and found
that after ~20 hours of browsing web, managing email, watching videos and
idling (15+ hours) there is only a dozen of early LP2 entering abortions
and they all happened while device was idling. Thus let's remove the
pen-locking and make LP2 entering uninterruptible, simplifying code quite
a lot. This will also become very handy for the upcoming unified cpuidle
driver, allowing to have a common LP2 code-path across of different
hardware generations.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c |  46 +------
 arch/arm/mach-tegra/pm.c              |   7 --
 arch/arm/mach-tegra/pm.h              |   1 -
 arch/arm/mach-tegra/reset-handler.S   |  11 --
 arch/arm/mach-tegra/reset.h           |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S   | 170 --------------------------
 arch/arm/mach-tegra/sleep.h           |  12 --
 7 files changed, 5 insertions(+), 251 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 69f3fa270fbe..f7d5041e73cc 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -15,6 +15,7 @@
 #include <linux/cpuidle.h>
 #include <linux/cpu_pm.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 
 #include <soc/tegra/flowctrl.h>
@@ -65,28 +66,8 @@ static struct cpuidle_driver tegra_idle_driver = {
 
 #ifdef CONFIG_PM_SLEEP
 #ifdef CONFIG_SMP
-static int tegra20_reset_sleeping_cpu_1(void)
-{
-	int ret = 0;
-
-	tegra_pen_lock();
-
-	if (readb(tegra20_cpu1_resettable_status) == CPU_RESETTABLE)
-		tegra20_cpu_shutdown(1);
-	else
-		ret = -EINVAL;
-
-	tegra_pen_unlock();
-
-	return ret;
-}
-
 static void tegra20_wake_cpu1_from_reset(void)
 {
-	tegra_pen_lock();
-
-	tegra20_cpu_clear_resettable();
-
 	/* enable cpu clock on cpu */
 	tegra_enable_cpu_clock(1);
 
@@ -95,39 +76,20 @@ static void tegra20_wake_cpu1_from_reset(void)
 
 	/* unhalt the cpu */
 	flowctrl_write_cpu_halt(1, 0);
-
-	tegra_pen_unlock();
-}
-
-static int tegra20_reset_cpu_1(void)
-{
-	if (!cpu_online(1) || !tegra20_reset_sleeping_cpu_1())
-		return 0;
-
-	tegra20_wake_cpu1_from_reset();
-	return -EBUSY;
 }
 #else
 static inline void tegra20_wake_cpu1_from_reset(void)
 {
 }
-
-static inline int tegra20_reset_cpu_1(void)
-{
-	return 0;
-}
 #endif
 
 static bool tegra20_cpu_cluster_power_down(struct cpuidle_device *dev,
 					   struct cpuidle_driver *drv,
 					   int index)
 {
-	while (tegra20_cpu_is_resettable_soon())
+	while (!tegra_cpu_rail_off_ready())
 		cpu_relax();
 
-	if (tegra20_reset_cpu_1() || !tegra_cpu_rail_off_ready())
-		return false;
-
 	tegra_idle_lp2_last();
 
 	if (cpu_online(1))
@@ -141,9 +103,7 @@ static bool tegra20_idle_enter_lp2_cpu_1(struct cpuidle_device *dev,
 					 struct cpuidle_driver *drv,
 					 int index)
 {
-	cpu_suspend(0, tegra20_sleep_cpu_secondary_finish);
-
-	tegra20_cpu_clear_resettable();
+	cpu_suspend(dev->cpu, tegra_pm_park_secondary_cpu);
 
 	return true;
 }
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index f5ff3dd1dd81..1ff499068bb1 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -137,18 +137,11 @@ bool tegra_set_cpu_in_lp2(void)
 
 	if ((phy_cpu_id == 0) && cpumask_equal(cpu_lp2_mask, cpu_online_mask))
 		last_cpu = true;
-	else if (tegra_get_chip_id() == TEGRA20 && phy_cpu_id == 1)
-		tegra20_cpu_set_resettable_soon();
 
 	spin_unlock(&tegra_lp2_lock);
 	return last_cpu;
 }
 
-int tegra_cpu_do_idle(void)
-{
-	return cpu_do_idle();
-}
-
 static int tegra_sleep_cpu(unsigned long v2p)
 {
 	/*
diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
index 9a790f00237f..b9cc12222bb1 100644
--- a/arch/arm/mach-tegra/pm.h
+++ b/arch/arm/mach-tegra/pm.h
@@ -25,7 +25,6 @@ void tegra30_sleep_core_init(void);
 
 void tegra_clear_cpu_in_lp2(void);
 bool tegra_set_cpu_in_lp2(void);
-int tegra_cpu_do_idle(void);
 void tegra_idle_lp2_last(void);
 extern void (*tegra_tear_down_cpu)(void);
 
diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index e3f34815c9da..53123ae4ac3b 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -183,17 +183,6 @@ after_errata:
 	bleq	__die				@ CPU not present (to OS)
 #endif
 
-#ifdef CONFIG_ARCH_TEGRA_2x_SOC
-	/* Are we on Tegra20? */
-	cmp	r6, #TEGRA20
-	bne	1f
-	/* If not CPU0, don't let CPU0 reset CPU1 now that CPU1 is coming up. */
-	mov	r0, #CPU_NOT_RESETTABLE
-	cmp	r10, #0
-	strbne	r0, [r12, #RESET_DATA(RESETTABLE_STATUS)]
-1:
-#endif
-
 	/* Waking up from LP1? */
 	ldr	r8, [r12, #RESET_DATA(MASK_LP1)]
 	tst	r8, r11				@ if in_lp1
diff --git a/arch/arm/mach-tegra/reset.h b/arch/arm/mach-tegra/reset.h
index a4cfc08159f6..51265592cb1a 100644
--- a/arch/arm/mach-tegra/reset.h
+++ b/arch/arm/mach-tegra/reset.h
@@ -16,9 +16,8 @@
 #define TEGRA_RESET_STARTUP_SECONDARY	3
 #define TEGRA_RESET_STARTUP_LP2		4
 #define TEGRA_RESET_STARTUP_LP1		5
-#define TEGRA_RESET_RESETTABLE_STATUS	6
-#define TEGRA_RESET_TF_PRESENT		7
-#define TEGRA_RESET_DATA_SIZE		8
+#define TEGRA_RESET_TF_PRESENT		6
+#define TEGRA_RESET_DATA_SIZE		7
 
 #define RESET_DATA(x)	((TEGRA_RESET_##x)*4)
 
@@ -42,10 +41,6 @@ void __tegra_cpu_reset_handler_end(void);
 	(IO_ADDRESS(TEGRA_IRAM_BASE + TEGRA_IRAM_RESET_HANDLER_OFFSET + \
 	((u32)&__tegra_cpu_reset_handler_data[TEGRA_RESET_MASK_LP2] - \
 	 (u32)__tegra_cpu_reset_handler_start)))
-#define tegra20_cpu1_resettable_status \
-	(IO_ADDRESS(TEGRA_IRAM_BASE + TEGRA_IRAM_RESET_HANDLER_OFFSET + \
-	((u32)&__tegra_cpu_reset_handler_data[TEGRA_RESET_RESETTABLE_STATUS] - \
-	 (u32)__tegra_cpu_reset_handler_start)))
 #endif
 
 #define tegra_cpu_reset_handler_offset \
diff --git a/arch/arm/mach-tegra/sleep-tegra20.S b/arch/arm/mach-tegra/sleep-tegra20.S
index 9a89f30d53ca..0e00ba8cf646 100644
--- a/arch/arm/mach-tegra/sleep-tegra20.S
+++ b/arch/arm/mach-tegra/sleep-tegra20.S
@@ -43,9 +43,6 @@
 #define APB_MISC_XM2CFGCPADCTRL2	0x8e4
 #define APB_MISC_XM2CFGDPADCTRL2	0x8e8
 
-#define __tegra20_cpu1_resettable_status_offset \
-	(__tegra_cpu_reset_handler_data_offset + RESET_DATA(RESETTABLE_STATUS))
-
 .macro pll_enable, rd, r_car_base, pll_base
 	ldr	\rd, [\r_car_base, #\pll_base]
 	tst	\rd, #(1 << 30)
@@ -90,10 +87,6 @@ ENDPROC(tegra20_hotplug_shutdown)
 ENTRY(tegra20_cpu_shutdown)
 	cmp	r0, #0
 	reteq	lr			@ must not be called for CPU 0
-	mov32	r1, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r2, =__tegra20_cpu1_resettable_status_offset
-	mov	r12, #CPU_RESETTABLE
-	strb	r12, [r1, r2]
 
 	cpu_to_halt_reg r1, r0
 	ldr	r3, =TEGRA_FLOW_CTRL_VIRT
@@ -116,107 +109,6 @@ ENDPROC(tegra20_cpu_shutdown)
 #endif
 
 #ifdef CONFIG_PM_SLEEP
-/*
- * tegra_pen_lock
- *
- * spinlock implementation with no atomic test-and-set and no coherence
- * using Peterson's algorithm on strongly-ordered registers
- * used to synchronize a cpu waking up from wfi with entering lp2 on idle
- *
- * The reference link of Peterson's algorithm:
- * http://en.wikipedia.org/wiki/Peterson's_algorithm
- *
- * SCRATCH37 = r1 = !turn (inverted from Peterson's algorithm)
- * on cpu 0:
- * r2 = flag[0] (in SCRATCH38)
- * r3 = flag[1] (in SCRATCH39)
- * on cpu1:
- * r2 = flag[1] (in SCRATCH39)
- * r3 = flag[0] (in SCRATCH38)
- *
- * must be called with MMU on
- * corrupts r0-r3, r12
- */
-ENTRY(tegra_pen_lock)
-	mov32	r3, TEGRA_PMC_VIRT
-	cpu_id	r0
-	add	r1, r3, #PMC_SCRATCH37
-	cmp	r0, #0
-	addeq	r2, r3, #PMC_SCRATCH38
-	addeq	r3, r3, #PMC_SCRATCH39
-	addne	r2, r3, #PMC_SCRATCH39
-	addne	r3, r3, #PMC_SCRATCH38
-
-	mov	r12, #1
-	str	r12, [r2]		@ flag[cpu] = 1
-	dsb
-	str	r12, [r1]		@ !turn = cpu
-1:	dsb
-	ldr	r12, [r3]
-	cmp	r12, #1			@ flag[!cpu] == 1?
-	ldreq	r12, [r1]
-	cmpeq	r12, r0			@ !turn == cpu?
-	beq	1b			@ while !turn == cpu && flag[!cpu] == 1
-
-	ret	lr			@ locked
-ENDPROC(tegra_pen_lock)
-
-ENTRY(tegra_pen_unlock)
-	dsb
-	mov32	r3, TEGRA_PMC_VIRT
-	cpu_id	r0
-	cmp	r0, #0
-	addeq	r2, r3, #PMC_SCRATCH38
-	addne	r2, r3, #PMC_SCRATCH39
-	mov	r12, #0
-	str	r12, [r2]
-	ret     lr
-ENDPROC(tegra_pen_unlock)
-
-/*
- * tegra20_cpu_clear_resettable(void)
- *
- * Called to clear the "resettable soon" flag in IRAM variable when
- * it is expected that the secondary CPU will be idle soon.
- */
-ENTRY(tegra20_cpu_clear_resettable)
-	mov32	r1, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r2, =__tegra20_cpu1_resettable_status_offset
-	mov	r12, #CPU_NOT_RESETTABLE
-	strb	r12, [r1, r2]
-	ret	lr
-ENDPROC(tegra20_cpu_clear_resettable)
-
-/*
- * tegra20_cpu_set_resettable_soon(void)
- *
- * Called to set the "resettable soon" flag in IRAM variable when
- * it is expected that the secondary CPU will be idle soon.
- */
-ENTRY(tegra20_cpu_set_resettable_soon)
-	mov32	r1, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r2, =__tegra20_cpu1_resettable_status_offset
-	mov	r12, #CPU_RESETTABLE_SOON
-	strb	r12, [r1, r2]
-	ret	lr
-ENDPROC(tegra20_cpu_set_resettable_soon)
-
-/*
- * tegra20_cpu_is_resettable_soon(void)
- *
- * Returns true if the "resettable soon" flag in IRAM variable has been
- * set because it is expected that the secondary CPU will be idle soon.
- */
-ENTRY(tegra20_cpu_is_resettable_soon)
-	mov32	r1, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r2, =__tegra20_cpu1_resettable_status_offset
-	ldrb	r12, [r1, r2]
-	cmp	r12, #CPU_RESETTABLE_SOON
-	moveq	r0, #1
-	movne	r0, #0
-	ret	lr
-ENDPROC(tegra20_cpu_is_resettable_soon)
-
 /*
  * tegra20_sleep_core_finish(unsigned long v2p)
  *
@@ -242,68 +134,6 @@ ENTRY(tegra20_sleep_core_finish)
 	ret	r3
 ENDPROC(tegra20_sleep_core_finish)
 
-/*
- * tegra20_sleep_cpu_secondary_finish(unsigned long v2p)
- *
- * Enters WFI on secondary CPU by exiting coherency.
- */
-ENTRY(tegra20_sleep_cpu_secondary_finish)
-	stmfd	sp!, {r4-r11, lr}
-
-	mrc	p15, 0, r11, c1, c0, 1  @ save actlr before exiting coherency
-
-	/* Flush and disable the L1 data cache */
-	mov	r0, #TEGRA_FLUSH_CACHE_LOUIS
-	bl	tegra_disable_clean_inv_dcache
-
-	mov32	r0, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r4, =__tegra20_cpu1_resettable_status_offset
-	mov	r3, #CPU_RESETTABLE
-	strb	r3, [r0, r4]
-
-	bl	tegra_cpu_do_idle
-
-	/*
-	 * cpu may be reset while in wfi, which will return through
-	 * tegra_resume to cpu_resume
-	 * or interrupt may wake wfi, which will return here
-	 * cpu state is unchanged - MMU is on, cache is on, coherency
-	 * is off, and the data cache is off
-	 *
-	 * r11 contains the original actlr
-	 */
-
-	bl	tegra_pen_lock
-
-	mov32	r0, TEGRA_IRAM_RESET_BASE_VIRT
-	ldr	r4, =__tegra20_cpu1_resettable_status_offset
-	mov	r3, #CPU_NOT_RESETTABLE
-	strb	r3, [r0, r4]
-
-	bl	tegra_pen_unlock
-
-	/* Re-enable the data cache */
-	mrc	p15, 0, r10, c1, c0, 0
-	orr	r10, r10, #CR_C
-	mcr	p15, 0, r10, c1, c0, 0
-	isb
-
-	mcr	p15, 0, r11, c1, c0, 1	@ reenable coherency
-
-	/* Invalidate the TLBs & BTAC */
-	mov	r1, #0
-	mcr	p15, 0, r1, c8, c3, 0	@ invalidate shared TLBs
-	mcr	p15, 0, r1, c7, c1, 6	@ invalidate shared BTAC
-	dsb
-	isb
-
-	/* the cpu was running with coherency disabled,
-	 * caches may be out of date */
-	bl	v7_flush_kern_cache_louis
-
-	ldmfd	sp!, {r4 - r11, pc}
-ENDPROC(tegra20_sleep_cpu_secondary_finish)
-
 /*
  * tegra20_tear_down_cpu
  *
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 63e2205cbc82..4978def9db46 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -114,8 +114,6 @@
 .endm
 
 #else
-void tegra_pen_lock(void);
-void tegra_pen_unlock(void);
 void tegra_resume(void);
 int tegra_sleep_cpu_finish(unsigned long);
 void tegra_disable_clean_inv_dcache(u32 flag);
@@ -123,16 +121,6 @@ void tegra_disable_clean_inv_dcache(u32 flag);
 void tegra20_hotplug_shutdown(void);
 void tegra30_hotplug_shutdown(void);
 
-void tegra20_cpu_shutdown(int cpu);
-int tegra20_cpu_is_resettable_soon(void);
-void tegra20_cpu_clear_resettable(void);
-#ifdef CONFIG_ARCH_TEGRA_2x_SOC
-void tegra20_cpu_set_resettable_soon(void);
-#else
-static inline void tegra20_cpu_set_resettable_soon(void) {}
-#endif
-
-int tegra20_sleep_cpu_secondary_finish(unsigned long);
 void tegra20_tear_down_cpu(void);
 int tegra30_sleep_cpu_secondary_finish(unsigned long);
 void tegra30_tear_down_cpu(void);
-- 
2.24.0

