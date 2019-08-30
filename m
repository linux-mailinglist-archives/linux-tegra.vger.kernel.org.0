Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F3EA3500
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 12:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfH3Kdy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 30 Aug 2019 06:33:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36835 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfH3Kdy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Aug 2019 06:33:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id p13so6957330wmh.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2019 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0yXewMaVdpAFpgvKr7VWpYIGNzWI9a9Z0cETjkzrhE=;
        b=hkqcRk/R0dfK8u5yi3RHDLXIJZKdObJVG6cORhxgj7fxKTHbSOTfqfxT/GZQheRmUn
         14zpx4buQahkbDRiX4iPSaXrkvhcRFOqwwLvKDX1Rm4D4qVRL2cPLKrxsFoGV4pUcScI
         qWfp5xLMf4PhR9h45F82HxHIucaa3nWXLpUdgHcrPa5RMhlppHoDW8vm5Fwz/gqk6Wx0
         axWn3UW5SCmuqx6+eOZ2PAFphNqw7JYn7nDHcYqq6kQ0kEaf5JNU1GI9b+Qrbb1tdt9F
         7AabJthg1thAlvo0OAWQ2+3y4H4C9G6xNjweQWkxziCtLmQrin7WGKCoemWAdr1wsx4B
         SZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0yXewMaVdpAFpgvKr7VWpYIGNzWI9a9Z0cETjkzrhE=;
        b=tLoCLMUTd+D0y5wqIaARKRSLTT3yBHzm85Sdc1x0bG+ajaAKA4U0HMdWheFC1B2Pvg
         lPIyN1317/FKQCJH0P/UmYZvG/n5oO66Lz5CIlxAYPfLKHOjZCMA7CPD9jj/D4epHGaX
         9ffY7us+gn/6zyc/GWU9hcvp5ZLKeagHF0AN4v9sUaij1jBSYgX9wihBAawGSz51zia+
         kt+oNYhmeGAvNLQp+XRA1nQTaapjf7A67S6dmDF6bgRtn+hawnR56QIK/IVMSHVjdXR9
         Y65/xxGLRScmT0satgjBUwtm9A0qV8E32Auvm68qygWN43iSfgS5KwMYqA9ObY4eERzH
         7mIg==
X-Gm-Message-State: APjAAAWNUqRMF2aXjQahvTSYRaoYBhVu+8ufoJVhO/HrQtAB2jHymzuo
        Zz+skHWUXhGGDKxKss8WBqA=
X-Google-Smtp-Source: APXvYqwM3hl9msnmYYeoJMmQk2gvmQDXNzhKsZuAjJp3cGSVdXiNC0Qo9czLErZTqIE8kGSQsRLUrg==
X-Received: by 2002:a1c:eb0a:: with SMTP id j10mr17918823wmh.125.1567161232261;
        Fri, 30 Aug 2019 03:33:52 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id b136sm10196862wme.18.2019.08.30.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 03:33:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     linux-firmware@kernel.org
Cc:     Takashi Iwai <tiwai@suse.de>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH] Add symlinks for Tegra VIC firmware binaries
Date:   Fri, 30 Aug 2019 12:33:50 +0200
Message-Id: <20190830103350.8273-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Create additional symlinks for these firmware binaries so that the Linux
drivers can refer to them by a more consistent name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Takashi,

I've noticed that the current Link: mechanism completely ignores the
target part of the link. Was this intended to allow creating symlinks
dynamically when copying the firmware, rather than just copying any
existing symlinks themselves?

Thierry

 WHENCE                  | 5 +++++
 nvidia/tegra124/vic.bin | 1 +
 nvidia/tegra186/vic.bin | 1 +
 nvidia/tegra210/vic.bin | 1 +
 4 files changed, 8 insertions(+)
 create mode 120000 nvidia/tegra124/vic.bin
 create mode 120000 nvidia/tegra186/vic.bin
 create mode 120000 nvidia/tegra210/vic.bin

diff --git a/WHENCE b/WHENCE
index 20eb4b8c718c..e7b8e40ab190 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3694,8 +3694,13 @@ Licence: Redistributable. See LICENCE.nvidia for details
 Driver: tegra-vic -- NVIDIA Tegra VIC driver
 
 File: nvidia/tegra124/vic03_ucode.bin
+Link: nvidia/tegra124/vic.bin -> vic03_ucode.bin
+
 File: nvidia/tegra210/vic04_ucode.bin
+Link: nvidia/tegra210/vic.bin -> vic03_ucode.bin
+
 File: nvidia/tegra186/vic04_ucode.bin
+Link: nvidia/tegra186/vic.bin -> vic04_ucode.bin
 
 Licence: Redistributable. See LICENCE.nvidia for details
 
diff --git a/nvidia/tegra124/vic.bin b/nvidia/tegra124/vic.bin
new file mode 120000
index 000000000000..968fcd4c9163
--- /dev/null
+++ b/nvidia/tegra124/vic.bin
@@ -0,0 +1 @@
+vic03_ucode.bin
\ No newline at end of file
diff --git a/nvidia/tegra186/vic.bin b/nvidia/tegra186/vic.bin
new file mode 120000
index 000000000000..d785732ba125
--- /dev/null
+++ b/nvidia/tegra186/vic.bin
@@ -0,0 +1 @@
+vic04_ucode.bin
\ No newline at end of file
diff --git a/nvidia/tegra210/vic.bin b/nvidia/tegra210/vic.bin
new file mode 120000
index 000000000000..d785732ba125
--- /dev/null
+++ b/nvidia/tegra210/vic.bin
@@ -0,0 +1 @@
+vic04_ucode.bin
\ No newline at end of file
-- 
2.22.0

