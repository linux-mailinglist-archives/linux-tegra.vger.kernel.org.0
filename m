Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00087A97E
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jul 2019 15:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfG3N2S (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jul 2019 09:28:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41610 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfG3N2R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jul 2019 09:28:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so62576709wrm.8
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jul 2019 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8HpJQ8Csn2oCvlIjLZkM4twb5Crb9lG61RNcyiRdvQ=;
        b=GYXCVrUZ2Cze9JtnK2kieqUInX8jltjDg5SS9OovBlB9Gei6ORYhtNKwTMtTa0kbga
         IyVcBK8cllbcaJcbOT5c2PgmKirhCjVPydfzQfibzghq4VTJ2G39lZZgDFLPN/7IvL9D
         hDewUz/j4VfHOb6cx3hHTIcms4nvFHBCNqtNOZKCz8bXCg4YqeBHLHKK3aIb5lR6JxNt
         MavXpcB8MRYiTu4/pbDHSfgRBoq8qjb3HCrBybYWy7zanqumV9JnSf5PKSwL9mZeoMF3
         kzYpOwJXMoMxkQDod6fmhYjuhgFNO661suamDgCFslp8sHPgkpd/MOCu8gpTUrVClPlf
         aT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8HpJQ8Csn2oCvlIjLZkM4twb5Crb9lG61RNcyiRdvQ=;
        b=E2T5oAZy9Z7FQHWo8xP8baK0ur5d4zKnIDOSmGIZxzu8N+0KdapCC6LaUw5RE/JUOA
         2P7+xNCjO+9umcCp8953eCil1bjg4ZUGBcf/emRWQc0sC/Y3S289Tv/cwJWMyHbhD4Uw
         z3lXKlthZqKBOT+I22G9zJhBqED3mRP/Zwi7H0CQokbgQ69aH0SBCjR0kWYg553FH58E
         YCnDEJZ4VgyqmZtxAMwH4AkSfOAgqJKwKgCd00dNv7T5jnzvSY0bK7YcQeVNg2qwsu9c
         NDSYVx1QjKekh7WFI8l3PFfAMBFkz2RQeWHgEhN/WBOZiIhp2aH8NKVsOUukKmRCekXU
         bSbA==
X-Gm-Message-State: APjAAAXtKyRZIeSRxFjTGhW7IjLirt3YFOOX34BLJP/jG+ii9L0I/zHf
        AgMWBHJOjwrOISe2+OVX33vh1whM
X-Google-Smtp-Source: APXvYqwmyPPnjc9tGj0w2D3CHNytikY2bm1rck8/bVOACcbiCjXMqz9FvcQGCw1sMDLVjr9Gkn5JjA==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr122936960wrt.227.1564493295538;
        Tue, 30 Jul 2019 06:28:15 -0700 (PDT)
Received: from morpheus.roving-it.com.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id w67sm83197476wma.24.2019.07.30.06.28.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 06:28:14 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: tegra: Jetson TX2: Allow bootloader to configure Ethernet MAC
Date:   Tue, 30 Jul 2019 14:28:10 +0100
Message-Id: <20190730132810.3002-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add an ethernet alias so that a stable MAC address is added to the
device tree for the wired ethernet interface.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 5e18acf5cfad..947744d0f04c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -8,6 +8,7 @@
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
+		ethernet0 = "/ethernet@2490000";
 		sdhci0 = "/sdhci@3460000";
 		sdhci1 = "/sdhci@3400000";
 		serial0 = &uarta;
-- 
2.21.0

