Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CBE1AA067
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 14:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369276AbgDOM0f (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 08:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369272AbgDOM0b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 08:26:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA42FC061A0C
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 05:26:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k21so3470528ljh.2
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkmmiF1XQ2RsXcgInA6IwLSuuiFHluAPXsS2Oe/IWDE=;
        b=u/1ndgfJrMrT+7oxzJUoB3LMRfaTpL/yt5Il3j37hI1RQMkiFRxref6uRk6DmeZ3MP
         hsX4Ml098bL/1oKRvw+OPWcZVFFThKTOOxqd+8+H+MO4HXW1eWvD9tysEYKAkqPG7GCD
         7A7J/Q7JcGi1C1MhUH5C54SgW4VGpafTg94MwUKWaFnkse+EF0geLlpCvvcyIN21Aymk
         xnYI1Yhwrke37XIZLyrDoimLZNMHXiDL0Rec+uxfppl15QfTZ1BAfksU8tTf4Mo4ISE3
         vBLxaN0rXIp6aXGXnlCEcK3+7gjXuK4+f9ifDVWSAr9rxdSL8sKc7Vekt+fZsa959zjz
         OiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkmmiF1XQ2RsXcgInA6IwLSuuiFHluAPXsS2Oe/IWDE=;
        b=DkdnPpt1tdCD7Tsn7dp79xcjw1Q2abdI3tw/naOW+JGMXU1Sh3NuIxYune2EF5j6rP
         LioycHdXJvdjsqrTuJNSnCxR0XFd4oM+XV5KH2+iSZj/eTpJR5YiUcjjJ4dQB5NeuSEu
         z2G/Nr8n6HvVi6HOccjKn/hTSH+s/MfYU8gSBDdMEgs0wBREQZVOqINUJIknV4FV4Ifu
         48UYDCXu2p6I9sB2RSnGLB134P/tAJ4S/b87jCj/qDz4Fl0mwncYIh7sJ/AxKfJJpGLb
         Ac5ZNhuWi8zdhC6fMfhgbxzV9y20pwLWJmHydE9drXf/NPaEPQrScSr7nEftvxaNCTp4
         RmAQ==
X-Gm-Message-State: AGi0PuYHMvb7ZMGG2MthrNZYJmVdkAgtem1MnePW5todm7Wf53doGUPm
        yxrEoCc4P6Q1+ZNCScVP2t2E9uxrthU=
X-Google-Smtp-Source: APiQypJFe7/3fHo/ERXXbzUML0AuJEny/et3ctB8MUPLhBr9ZgLHW/E0Mkl1bDVqEghMR2GdKdietA==
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr3075775lja.2.1586953589348;
        Wed, 15 Apr 2020 05:26:29 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id n9sm11248038ljo.89.2020.04.15.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:26:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] drm/tegra: Clean up GPIO includes
Date:   Wed, 15 Apr 2020 14:24:27 +0200
Message-Id: <20200415122427.111769-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra DRM drivers includes the legacy GPIO headers
<linux/gpio.h> and <linux/of_gpio.h> but what it really
uses is <linux/gpio/consumer.h> since only gpio_desc
structs are ever referenced.

Include the right header on the top level tegra/drm.h
file and drop all the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 2 --
 drivers/gpu/drm/tegra/drm.h   | 2 +-
 drivers/gpu/drm/tegra/hdmi.c  | 1 -
 drivers/gpu/drm/tegra/sor.c   | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7dfb50f65067..105fb9cdbb3b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -5,12 +5,10 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..bf0512177e8f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -9,7 +9,7 @@
 
 #include <linux/host1x.h>
 #include <linux/iova.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 38252c0f068d..94fb0193fa3d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/hdmi.h>
 #include <linux/math64.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..b010826e86da 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
-#include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-- 
2.25.2

