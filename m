Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF00103BF3
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Nov 2019 14:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbfKTNjD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 Nov 2019 08:39:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:46550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728317AbfKTNjD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Nov 2019 08:39:03 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20045224FC;
        Wed, 20 Nov 2019 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257142;
        bh=k/mv4PS0TLJKwjt0TZMF7T/0k8AV9H/Q16jTqG7uIuY=;
        h=From:To:Cc:Subject:Date:From;
        b=Rabewv/y32lMIGOLe4tNDHM38aoxfLCz6lEKA9krmxp1i7buorqMVPsyKrOo1GC1n
         NScw+IWF/K1O1L7Az40t5TzLAgzlyPC7uh+fotuimBAMHSnuqHsTZAUpNj2kSPkrbH
         gJQOEQls2mHu88UXqrVw5qIWyrHCA7zgpyWkILOc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH] staging: nvec: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:38:58 +0800
Message-Id: <20191120133858.13369-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/staging/nvec/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/nvec/Kconfig b/drivers/staging/nvec/Kconfig
index 5c12cacf75e1..9fa98c16f1d9 100644
--- a/drivers/staging/nvec/Kconfig
+++ b/drivers/staging/nvec/Kconfig
@@ -8,7 +8,7 @@ config MFD_NVEC
 	    controller.
 
 	    To compile this driver as a module, say M here: the module will be
-            called mfd-nvec
+	    called mfd-nvec
 
 config KEYBOARD_NVEC
 	tristate "Keyboard on nVidia compliant EC"
@@ -18,7 +18,7 @@ config KEYBOARD_NVEC
 	  a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called keyboard-nvec
+	  called keyboard-nvec
 
 config SERIO_NVEC_PS2
 	tristate "PS2 on nVidia EC"
@@ -28,7 +28,7 @@ config SERIO_NVEC_PS2
 	  to a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called serio-nvec-ps2
+	  called serio-nvec-ps2
 
 
 config NVEC_POWER
@@ -39,7 +39,7 @@ config NVEC_POWER
 	  nVidia compliant embedded controllers.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-power
+	  called nvec-power
 
 
 config NVEC_PAZ00
@@ -50,5 +50,5 @@ config NVEC_PAZ00
 	  devices, e.g. Toshbia AC100 and Dynabooks AZ netbooks.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-paz00
+	  called nvec-paz00
 
-- 
2.17.1

