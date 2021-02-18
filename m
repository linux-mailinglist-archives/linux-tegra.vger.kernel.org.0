Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC331F0A4
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Feb 2021 21:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhBRT7R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Feb 2021 14:59:17 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38361 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbhBRT4v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Feb 2021 14:56:51 -0500
X-Originating-IP: 86.211.141.229
Received: from localhost (lfbn-cor-1-49-229.w86-211.abo.wanadoo.fr [86.211.141.229])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C50E624000A;
        Thu, 18 Feb 2021 19:56:06 +0000 (UTC)
Date:   Thu, 18 Feb 2021 20:56:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: [bug] RTC alarm vs system suspend race condition
Message-ID: <YC7GVnhsOmQ3uCnL@piout.net>
References: <0a82c37e-ba83-a853-1db8-ba267f7728d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a82c37e-ba83-a853-1db8-ba267f7728d7@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

I just wanted to thank you for reporting this issue. I didn't yet have
the time to work on that but this is on my radar. There is also another
issue when resuming and I'm not yet sure how we can solve it for all
platforms.

On 12/01/2021 10:58:07+0300, Dmitry Osipenko wrote:
> Hello RTC maintainers,
> 
> A day ago we were testing RTC alarm on NVIDIA Tegra devices and noticed that there is a problem in the RTC core where it schedules __rtc_set_alarm work when alarm is set, but this work isn't flushed before RTC drivers are suspended. In general RTC devices can't be accessed once driver's suspend is invoked, creating the problem.
> 
> Please see this example:
> 
> # rtcwake -s15 -mmem
> 
> On Ouya board:
> 
> PM: suspend entry (deep)
> Filesystems sync: 0.001 seconds
> Freezing user space processes ... (elapsed 0.002 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> smsc95xx 1-1:1.0 enxb85af7003b21: entering SUSPEND2 mode
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 1337 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0x6d0/0x6ec
> i2c i2c-1: Transfer while suspended
> Modules linked in: brcmfmac brcmutil
> CPU: 1 PID: 1337 Comm: kworker/1:3 Not tainted 5.11.0-rc2-next-20210108-15881-g0baf1450b32d #196
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c0110fd8>] (unwind_backtrace) from [<c010b90c>] (show_stack+0x10/0x14)
> [<c010b90c>] (show_stack) from [<c0c5ca44>] (dump_stack+0xc4/0xd8)
> [<c0c5ca44>] (dump_stack) from [<c0124c94>] (__warn+0xec/0x104)
> [<c0124c94>] (__warn) from [<c0c5a06c>] (warn_slowpath_fmt+0x98/0xc8)
> [<c0c5a06c>] (warn_slowpath_fmt) from [<c082e850>] (__i2c_transfer+0x6d0/0x6ec)
> [<c082e850>] (__i2c_transfer) from [<c082e908>] (i2c_transfer+0x9c/0x108)
> [<c082e908>] (i2c_transfer) from [<c06f43a4>] (regmap_i2c_read+0x60/0x9c)
> [<c06f43a4>] (regmap_i2c_read) from [<c06ef848>] (_regmap_raw_read+0x104/0x314)
> [<c06ef848>] (_regmap_raw_read) from [<c06efa9c>] (_regmap_bus_read+0x44/0x70)
> Disabling non-boot CPUs ...
> [<c06efa9c>] (_regmap_bus_read) from [<c06ee3a8>] (_regmap_read+0x60/0x180)
> [<c06ee3a8>] (_regmap_read) from [<c06eea38>] (_regmap_update_bits+0xbc/0xf8)
> [<c06eea38>] (_regmap_update_bits) from [<c06f004c>] (regmap_update_bits_base+0x4c/0x70)
> [<c06f004c>] (regmap_update_bits_base) from [<c082c2b8>] (tps65910_rtc_read_time+0x50/0x134)
> [<c082c2b8>] (tps65910_rtc_read_time) from [<c0822c94>] (__rtc_read_time+0x48/0x94)
> [<c0822c94>] (__rtc_read_time) from [<c0822ed8>] (__rtc_set_alarm+0x80/0x1dc)
> [<c0822ed8>] (__rtc_set_alarm) from [<c0824cf4>] (rtc_timer_do_work+0x254/0x448)
> [<c0824cf4>] (rtc_timer_do_work) from [<c0140b9c>] (process_one_work+0x1dc/0x5a0)
> [<c0140b9c>] (process_one_work) from [<c0140fac>] (worker_thread+0x4c/0x520)
> [<c0140fac>] (worker_thread) from [<c0148618>] (kthread+0x18c/0x190)
> [<c0148618>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc5709fb0 to 0xc5709ff8)
> 9fa0:                                     00000000 00000000 00000000 00000000
> 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace 2df194007d41e38b ]---
> tps65910-rtc tps65910-rtc: RTC CTRL reg update failed with err:-108
> tps65910-rtc tps65910-rtc: RTC CTRL reg update failed with err:-108
> tps65910-rtc tps65910-rtc: RTC CTRL reg update failed with err:-108
> tps65910-rtc tps65910-rtc: RTC CTRL reg update failed with err:-108
> rtc rtc0: __rtc_set_alarm: err=-108
> tps65910-rtc tps65910-rtc: RTC CTRL reg update failed with err:-108
> IRQ 26: no longer affine to CPU1
> IRQ 27: no longer affine to CPU2
> IRQ 28: no longer affine to CPU3
> Entering suspend state LP1
> Enabling non-boot CPUs ...
> CPU1 is up
> 
> On PAZ00 board:
> 
> PM: suspend entry (deep)
> Filesystems sync: 0.697 seconds
> Freezing user space processes ... (elapsed 0.002 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> printk: Suspending console(s) (use no_console_suspend to debug)
> Disabling non-boot CPUs ...
> IRQ 26: no longer affine to CPU1
> Entering suspend state LP1
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0x400/0x458
> i2c i2c-2: Transfer while suspended
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Not tainted 5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events_power_efficient sync_hw_clock
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83cb4>] (warn_slowpath_fmt+0x98/0xc0)
> [<c0a83cb4>] (warn_slowpath_fmt) from [<c071a990>] (__i2c_transfer+0x400/0x458)
> [<c071a990>] (__i2c_transfer) from [<c071aa84>] (i2c_transfer+0x9c/0x108)
> [<c071aa84>] (i2c_transfer) from [<c05d66f4>] (regmap_i2c_read+0x60/0x90)
> [<c05d66f4>] (regmap_i2c_read) from [<c05d2060>] (_regmap_raw_read+0xe0/0x160)
> [<c05d2060>] (_regmap_raw_read) from [<c05d2124>] (_regmap_bus_read+0x44/0x70)
> [<c05d2124>] (_regmap_bus_read) from [<c05d1144>] (_regmap_read+0x60/0xb8)
> [<c05d1144>] (_regmap_read) from [<c05d160c>] (_regmap_update_bits+0xb0/0xec)
> [<c05d160c>] (_regmap_update_bits) from [<c05d2740>] (regmap_update_bits_base+0x50/0x74)
> [<c05d2740>] (regmap_update_bits_base) from [<c05e5b80>] (tps6586x_clr_bits+0x24/0x2c)
> [<c05e5b80>] (tps6586x_clr_bits) from [<c0718138>] (tps6586x_rtc_set_time+0x68/0x104)
> [<c0718138>] (tps6586x_rtc_set_time) from [<c071120c>] (rtc_set_time+0xcc/0x178)
> [<c071120c>] (rtc_set_time) from [<c01a3078>] (sync_hw_clock+0x1d0/0x250)
> [<c01a3078>] (sync_hw_clock) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea228 ]---
> tps6586x-rtc tps6586x-rtc: failed to clear RTC_ENABLE
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> rtc rtc0: __rtc_set_alarm: err=-108
> tps6586x-rtc tps6586x-rtc: read counter failed with err -108
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/mfd/tps6586x.c:266 tps6586x_irq_sync_unlock+0x6c/0x70
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Tainted: G        W         5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83c80>] (warn_slowpath_fmt+0x64/0xc0)
> [<c0a83c80>] (warn_slowpath_fmt) from [<c05e5d6c>] (tps6586x_irq_sync_unlock+0x6c/0x70)
> [<c05e5d6c>] (tps6586x_irq_sync_unlock) from [<c0182cb0>] (__disable_irq_nosync+0x58/0x88)
> [<c0182cb0>] (__disable_irq_nosync) from [<c01854b0>] (disable_irq+0xc/0x20)
> [<c01854b0>] (disable_irq) from [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable+0x4c/0x58)
> [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable) from [<c0711b38>] (rtc_timer_do_work+0xfc/0x1dc)
> [<c0711b38>] (rtc_timer_do_work) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea229 ]---
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/mfd/tps6586x.c:266 tps6586x_irq_sync_unlock+0x6c/0x70
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Tainted: G        W         5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83c80>] (warn_slowpath_fmt+0x64/0xc0)
> [<c0a83c80>] (warn_slowpath_fmt) from [<c05e5d6c>] (tps6586x_irq_sync_unlock+0x6c/0x70)
> [<c05e5d6c>] (tps6586x_irq_sync_unlock) from [<c0182cb0>] (__disable_irq_nosync+0x58/0x88)
> [<c0182cb0>] (__disable_irq_nosync) from [<c01854b0>] (disable_irq+0xc/0x20)
> [<c01854b0>] (disable_irq) from [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable+0x4c/0x58)
> [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable) from [<c0711b38>] (rtc_timer_do_work+0xfc/0x1dc)
> [<c0711b38>] (rtc_timer_do_work) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea22a ]---
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/mfd/tps6586x.c:266 tps6586x_irq_sync_unlock+0x6c/0x70
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Tainted: G        W         5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83c80>] (warn_slowpath_fmt+0x64/0xc0)
> [<c0a83c80>] (warn_slowpath_fmt) from [<c05e5d6c>] (tps6586x_irq_sync_unlock+0x6c/0x70)
> [<c05e5d6c>] (tps6586x_irq_sync_unlock) from [<c0182cb0>] (__disable_irq_nosync+0x58/0x88)
> [<c0182cb0>] (__disable_irq_nosync) from [<c01854b0>] (disable_irq+0xc/0x20)
> [<c01854b0>] (disable_irq) from [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable+0x4c/0x58)
> [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable) from [<c0711b38>] (rtc_timer_do_work+0xfc/0x1dc)
> [<c0711b38>] (rtc_timer_do_work) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea22b ]---
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/mfd/tps6586x.c:266 tps6586x_irq_sync_unlock+0x6c/0x70
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Tainted: G        W         5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83c80>] (warn_slowpath_fmt+0x64/0xc0)
> [<c0a83c80>] (warn_slowpath_fmt) from [<c05e5d6c>] (tps6586x_irq_sync_unlock+0x6c/0x70)
> [<c05e5d6c>] (tps6586x_irq_sync_unlock) from [<c0182cb0>] (__disable_irq_nosync+0x58/0x88)
> [<c0182cb0>] (__disable_irq_nosync) from [<c01854b0>] (disable_irq+0xc/0x20)
> [<c01854b0>] (disable_irq) from [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable+0x4c/0x58)
> [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable) from [<c0711b38>] (rtc_timer_do_work+0xfc/0x1dc)
> [<c0711b38>] (rtc_timer_do_work) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea22c ]---
> Enabling non-boot CPUs ...
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 83 at drivers/mfd/tps6586x.c:266 tps6586x_irq_sync_unlock+0x6c/0x70
> Modules linked in: rt2800usb rt2x00usb rt2800lib rt2x00lib xfs libcrc32c fuse crc32_generic f2fs tegra_drm gpu_sched panel_simple tegra20_emc ci_hdrc_tegra host1x_drv iova
> CPU: 0 PID: 83 Comm: kworker/0:2 Tainted: G        W         5.11.0-rc2-next-20210106-tegra+ #181
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: events rtc_timer_do_work
> [<c010ec60>] (unwind_backtrace) from [<c010a1f8>] (show_stack+0x10/0x14)
> [<c010a1f8>] (show_stack) from [<c0a86fe4>] (dump_stack+0xc0/0xd4)
> [<c0a86fe4>] (dump_stack) from [<c0a83bc0>] (__warn+0xc0/0x11c)
> [<c0a83bc0>] (__warn) from [<c0a83c80>] (warn_slowpath_fmt+0x64/0xc0)
> [<c0a83c80>] (warn_slowpath_fmt) from [<c05e5d6c>] (tps6586x_irq_sync_unlock+0x6c/0x70)
> [<c05e5d6c>] (tps6586x_irq_sync_unlock) from [<c0182cb0>] (__disable_irq_nosync+0x58/0x88)
> [<c0182cb0>] (__disable_irq_nosync) from [<c01854b0>] (disable_irq+0xc/0x20)
> [<c01854b0>] (disable_irq) from [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable+0x4c/0x58)
> [<c0717e2c>] (tps6586x_rtc_alarm_irq_enable) from [<c0711b38>] (rtc_timer_do_work+0xfc/0x1dc)
> [<c0711b38>] (rtc_timer_do_work) from [<c013e080>] (process_one_work+0x1e8/0x44c)
> [<c013e080>] (process_one_work) from [<c013e348>] (worker_thread+0x64/0x5a8)
> [<c013e348>] (worker_thread) from [<c014402c>] (kthread+0x148/0x14c)
> [<c014402c>] (kthread) from [<c01001b0>] (ret_from_fork+0x14/0x24)
> Exception stack(0xc59d5fb0 to 0xc59d5ff8)
> 5fa0:                                     00000000 00000000 00000000 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace f97d91a3f84ea22d ]---

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
