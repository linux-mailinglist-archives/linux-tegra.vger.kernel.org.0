Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912401AEB63
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Apr 2020 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgDRJgm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Apr 2020 05:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725856AbgDRJgm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Apr 2020 05:36:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19CBC061A0C;
        Sat, 18 Apr 2020 02:36:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a25so5785452wrd.0;
        Sat, 18 Apr 2020 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
        b=Tb+VfyjCYOWDy0PsTMFPIeg6WnHIszFF59D9PjMUUN0svKLTjpF3sZyl8H3Co1dk1l
         D1IMe2542AOhP/cWtXp06jpZhMqZJ2BJoQRz9spW1Xg1zAObvwCgMXOwepeCGJGWeNGW
         N0P4haKVg4K0BRpas6bIX1+Bnr4FVIv8OeoorUMBA4fRnsia+1lhZ7HudEYL56Mbcwhe
         5qNE1ifOcKOUjKeJZossp3FYEzCrN/tzL6xjWouAJFs7pg9xpGak6nN4yMiaZeQgKYXs
         XENhLmqeK43ZT7BrVNpnfFHYAB/vIKiHYiSVJzfWrnw+xAabKU8ccD3mra38zKJ4fY04
         kWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
        b=A6FlAianYAp1iuCWM/bj0NfSOIxRoydPLnvKfuMI8Z3hAGHaG9gCHb8glPhGwdThN+
         HAL4PzAgGz9i/VNn59GBz1v+1+NSq82PLWggxSsfj959/68KG7TzrFteGSQ+zVyMZaRO
         qmXuoVMNH5GqXyRFvNBpx1gUfbB+LM0rkpkg3ln36DxmmPLY7icBkrwO2M2FoJvdvGh6
         W5NYbTWtRosIhjAlyocKiuDKAyz6Xyy4zL/ceChyvYLBcqnI+torgysBjwPMeNTOIkAi
         K0X4/G6nIjknesqetGLEcpimQhFhPIelaXXSdZqwfNmfSm78UxvIbYetnnKuhMn7a/gh
         hbYg==
X-Gm-Message-State: AGi0Pubya5l8r1JfB+gh5sxBRas4pabmWjemsQNCU0nBjyiLnK/H/9G5
        SJaIYsJB/8gaVenn9O6EIs0=
X-Google-Smtp-Source: APiQypIcLoxJQNQyMnGc2ZI2HXyHFpNGpG/umKJLNyhN05r5WvOL5tqpbb3JhDDJb77z7YfCVPUx1g==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr3726868wrn.396.1587202600229;
        Sat, 18 Apr 2020 02:36:40 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d7a:4700:391d:588b:ee8c:e294])
        by smtp.gmail.com with ESMTPSA id d133sm11782497wmc.27.2020.04.18.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 02:36:39 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, Joe Perches <joe@perches.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust entries to moving CEC platform drivers
Date:   Sat, 18 Apr 2020 11:36:30 +0200
Message-Id: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
directory") moved various files into a new directory structure, but did
not adjust the entries in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/platform/s5p-cec/
  warning: no file matches F: drivers/media/platform/tegra-cec/
  warning: no file matches F: drivers/media/platform/cec-gpio/
  warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
  warning: no file matches F: drivers/media/platform/meson/ao-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
  warning: no file matches F: drivers/media/platform/sti/cec/

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC platform driver moves.

applies cleanly on next-20200417

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3083282134de..a708773e1af7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,7 +2373,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2518,7 +2518,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -3932,7 +3932,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11027,8 +11027,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15063,8 +15062,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16089,7 +16087,7 @@ STI CEC DRIVER
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
-F:	drivers/media/platform/sti/cec/
+F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
2.17.1

