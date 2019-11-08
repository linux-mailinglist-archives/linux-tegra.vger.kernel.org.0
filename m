Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49136F4FDF
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Nov 2019 16:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfKHPgp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Nov 2019 10:36:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51401 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfKHPgp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Nov 2019 10:36:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id q70so6635390wme.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 Nov 2019 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCO8uSNpFMAvShY/DXN+FCc8qcnOaFbyEnfZvHLmgXI=;
        b=HHGBENAkOUkTjVvv2cb7I54L4i8/FPGJXWV/KdfUvP9cQY1omWx7uWTevnbN4ao4Wj
         DAquhhEwBxTsWLNGbCmk8+6fficIBhTAW9DJ9KQXxRhFcA5js7MeGIs0F57tGiZ/yKJ0
         u8mDwksQdpJtGI7bkdtTkuRV2XrmxvoWoWiI3hYItQoCnpShrGUB9eufTg9FgBIqfqgZ
         6mc7I/Y7UdLOdvkXerfuSw0KV/aAHcNVTzXre5iCRbsigPcHgjI6aRKeK7e7gfSzcLJd
         ffRxh4mJZuJBkeMf+oFeNEhOAQi8JucCgQ8RBVh66DA6SE4kFsAphZ30WCPAo3fji76a
         Ypzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCO8uSNpFMAvShY/DXN+FCc8qcnOaFbyEnfZvHLmgXI=;
        b=hf9mwz/0l/5+hB8E0iM6F61BzL633iauT5WGe0XlsczYzNuChJKDQIBbp9F37eykGt
         avyD4/m+H8W7DHqgdzcl7xSiJKsCMQsbBOkkB7kWAdtECVXIYqyTiQN218fSCXJMnuW/
         ltGkCPT4Ql1cTUemTqszlRpUAe3Vr0rvv/0mKodeTqs2oXGMOI3ue69IbYgZavaCRJ9m
         P1r0uKefqV2jHBDZDitD8hpfCSgh2vDWrCdIihzgiOVfs2YLFEmBdL7+WOraWGdvKZbK
         TNvvhTK2ztB1AHpfrbT2cxZKJAQgfXTJw6Ihe4g/US4TfrKs6YcCJdHff23ngmAIbK6+
         ZCPQ==
X-Gm-Message-State: APjAAAVxa+baFxKv6iHUHDeng3YZ07smgMFrFBPjVuOzUTptMFlJMvmh
        5q0lsgy9QDLEAB7dVh+BfB8=
X-Google-Smtp-Source: APXvYqwVEhSG9WAbhnBIf7SUZw8geyz8+fmpY7cV8jPGj9vAYyoQvLhomjx8Z6EfjuzarCHfDK569w==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr9222824wmk.50.1573227403259;
        Fri, 08 Nov 2019 07:36:43 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id m9sm5901157wro.66.2019.11.08.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:36:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Redefine force recovery key on Jetson AGX Xavier
Date:   Fri,  8 Nov 2019 16:36:40 +0100
Message-Id: <20191108153640.3163376-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The current BTN_1 code associated with the force-recovery key is not a
valid code for EV_KEY type input devices. This causes errors in the
libinput debug-events command.

There is no system level action that maps to the force-recovery key on
Jetson AGX Xavier, so assign it the KEY_SLEEP action, which at least
makes it do something marginally useful.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 353a6a22196d..985e7d84f161 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -152,7 +152,7 @@
 			gpios = <&gpio TEGRA194_MAIN_GPIO(G, 0)
 				       GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
+			linux,code = <KEY_SLEEP>;
 			debounce-interval = <10>;
 		};
 
-- 
2.23.0

