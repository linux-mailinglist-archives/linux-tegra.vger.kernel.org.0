Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FCD4D46D
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 19:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfFTRBA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 13:01:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38354 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfFTRA7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 13:00:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so3875140wmj.3
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hT3+SBsf+AUXx1QiSpxys3xa4V/+u8aITm7Mir20SXo=;
        b=LjEDLNIUH6aubho1KJeQHb69KFH7EtxOsyLREyQHIUNfKJbyN309/hk5zmfd/wc9tO
         9aXJpZa3Tusv9TijQjcjpugqzwpvNcPSfww0fi2KcalxgrMdqolqBVuMAqzOF+Gqw26A
         tK0J+6/gNqdo8HCP4ZS7EcnniTdT3wLwyH5CpojFXITvedm/3C6+qvUNmAR/4UxfBIe3
         ETWFq1c8lLyXTYfyNtkW0eP8ZD50k+2G0phFP5pIcdomoXR6G0k5EtyOQsfS0RYCJlVA
         kGyoywUgyuw124PF+puneap12+obsSeTE+tmopEa+P3rfQ3+1FdOH0Fg3Kin0PeBgpaR
         55cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hT3+SBsf+AUXx1QiSpxys3xa4V/+u8aITm7Mir20SXo=;
        b=GSIj4Q2QNPGlmURpSz5FZeowuKbavU26Gt9xhMhuN3OiRQiR9ci26plZR0T2c9ojZc
         ZayqsLxH4VexOAvjOjzX8Od+EPMCK7gDyaklMzehcMGRG4ymbfA+ABmoDN+e8ct5bWUA
         cXHzsRcYtFMFrUjn1r6ADV2WnEB6y7etVNI/THXyrKmb0OlU9UKW0ApXl65pSBRUnMy3
         +I14JT9Ms/q6y8+ZfqjEQLToscTQ/5WGMGwzG52it/QKBnraqIk9x3iMlCMb7pHDnSvF
         3d3GxZbeDkmdKH9mV/1EMP1vqksiXbhmgH+Fq3g6nVUdd7xJ+dmLDi8cuRL8PpHs3Hik
         ei7A==
X-Gm-Message-State: APjAAAXJqjsB2FmQuDbNjx2WIFzaakRVRbbQKkJMNgg72PyrwKQdCI4d
        pATpzrTYw9YebJ0ZVXy9VAIEby2GZbA=
X-Google-Smtp-Source: APXvYqxjEvdOk2ZzL1IBou3yKPNf9KYXrduldQ3ONgN+FDHvu44nfDeii8HWKO1TZFH0E0ZKik5Utw==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr408764wmf.153.1561050057191;
        Thu, 20 Jun 2019 10:00:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q20sm308052wra.36.2019.06.20.10.00.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 10:00:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org
Subject: [pinmux scripts PATCH 1/3] Update kernel driver template
Date:   Thu, 20 Jun 2019 19:00:53 +0200
Message-Id: <20190620170055.19771-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some changes in recent years have modified the upstream kernel driver in
some ways that make it incompatible with the current template. Update
the template to take into account changes introduced by the following
commits:

	commit e3d2160f12d6aa7a87d9db09d8458b4a3492cd45
	Author: Paul Gortmaker <paul.gortmaker@windriver.com>
	Date:   Mon May 22 16:56:47 2017 -0400

	    pinctrl: tegra: clean up modular vs. non-modular distinctions

	    None of the Kconfigs for any of these drivers are tristate,
	    meaning that they currently are not being built as a module by anyone.

	    Lets remove the modular code that is essentially orphaned, so that
	    when reading the drivers there is no doubt they are builtin-only.  All
	    drivers get similar changes, so they are handled in batch.

	    We remove module.h from code that isn't doing anything modular at
	    all;  if they have __init sections, then replace it with init.h.

	    A couple drivers have module_exit() code that is essentially orphaned,
	    and so we remove that.

	    Quite a few bool drivers (hence non-modular) are converted over to
	    to builtin_platform_driver().

	    Since module_platform_driver() uses the same init level priority as
	    builtin_platform_driver() the init ordering remains unchanged with
	    this commit.

	    Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

	    We also delete the MODULE_LICENSE tag etc. since all that information
	    was (or is now) contained at the top of the file in the comments.

	    Cc: Linus Walleij <linus.walleij@linaro.org>
	    Cc: Stephen Warren <swarren@wwwdotorg.org>
	    Cc: Thierry Reding <thierry.reding@gmail.com>
	    Cc: Alexandre Courbot <gnurou@gmail.com>
	    Cc: Pritesh Raithatha <praithatha@nvidia.com>
	    Cc: Ashwini Ghuge <aghuge@nvidia.com>
	    Cc: linux-gpio@vger.kernel.org
	    Cc: linux-tegra@vger.kernel.org
	    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

	commit 3c94d2d08a032d911bbe34f2edb24cb63a63644a
	Author: Stefan Agner <stefan@agner.ch>
	Date:   Thu Jul 26 17:40:24 2018 +0200

	    pinctrl: tegra: define GPIO compatible node per SoC

	    Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
	    compatible string.

	    Make the compatible string the GPIO node is using a SoC specific
	    property. This prevents the kernel from registering the GPIO range
	    twice in case the GPIO range is specified in the device tree.

	    Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if needed")
	    Signed-off-by: Stefan Agner <stefan@agner.ch>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

	commit 1e0813ee5599932c856bda64a568895ed7a33d3a
	Author: Dmitry Osipenko <digetx@gmail.com>
	Date:   Thu Aug 2 14:11:43 2018 +0300

	    pinctrl: tegra: Move drivers registration to arch_init level

	    There is a bug in regards to deferred probing within the drivers core
	    that causes GPIO-driver to suspend after its users. The bug appears if
	    GPIO-driver probe is getting deferred, which happens after introducing
	    dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
	    property in device-tree. The bug in the drivers core is old (more than 4
	    years now) and is well known, unfortunately there is no easy fix for it.
	    The good news is that we can workaround the deferred probe issue by
	    changing GPIO / PINCTRL drivers registration order and hence by moving
	    PINCTRL driver registration to the arch_init level and GPIO to the
	    subsys_init.

	    Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
	    Acked-by: Stefan Agner <stefan@agner.ch>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Note that the last one is something that we probably should fix
correctly by using device links rather than working around it by playing
init level tricks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 soc-to-kernel-pinctrl-driver.py | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 65e4c604f1c9..37f34b15db2b 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -41,22 +41,16 @@ if dbg: print(args)
 soc = tegra_pmx_soc_parser.load_soc(args.soc)
 
 print('''\
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl data for the NVIDIA %s pinmux
  *
- * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
+ * Author: %s
  *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
+ * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -68,7 +62,7 @@ print('''\
  * Most pins affected by the pinmux can also be GPIOs. Define these first.
  * These must match how the GPIO driver names/numbers its pins.
  */
-''' % (soc.titlename, soc.kernel_copyright_years), end='')
+''' % (soc.titlename, soc.kernel_author, soc.kernel_copyright_years), end='')
 
 # Do not add any more exceptions here; new SoCs should be formatted correctly
 if soc.name == 'tegra30':
@@ -615,6 +609,7 @@ print('''\
 
 static const struct tegra_pinctrl_soc_data %(soc)s_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,%(soc)s-gpio",
 	.pins = %(soc)s_pins,
 	.npins = ARRAY_SIZE(%(soc)s_pins),
 	.functions = %(soc)s_functions,
@@ -635,7 +630,6 @@ static const struct of_device_id %(soc)s_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,%(soc)s-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, %(soc)s_pinctrl_of_match);
 
 static struct platform_driver %(soc)s_pinctrl_driver = {
 	.driver = {
@@ -644,9 +638,10 @@ static struct platform_driver %(soc)s_pinctrl_driver = {
 	},
 	.probe = %(soc)s_pinctrl_probe,
 };
-module_platform_driver(%(soc)s_pinctrl_driver);
 
-MODULE_AUTHOR("%(author)s");
-MODULE_DESCRIPTION("NVIDIA %(usoc)s pinctrl driver");
-MODULE_LICENSE("GPL v2");
+static int __init %(soc)s_pinctrl_init(void)
+{
+	return platform_driver_register(&%(soc)s_pinctrl_driver);
+}
+arch_initcall(%(soc)s_pinctrl_init);
 ''' % socvars, end='')
-- 
2.21.0

