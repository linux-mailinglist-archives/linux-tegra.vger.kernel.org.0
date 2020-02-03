Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F93150869
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Feb 2020 15:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgBCObV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Feb 2020 09:31:21 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32881 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgBCObV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Feb 2020 09:31:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id u6so5176986wrt.0
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2020 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNoMOwJeW8EgketgclxMAlr5i9qU0i3JZKIs7PFn1Vg=;
        b=EtSDrviMMBX4kOtDykNCJ03p8JV1PS7RyBaz9tvnNPoHM4IbRcZhBtzcuYPpVwB0rY
         aj2SjTWyf3pKQ7KeX87hGLmuV6UZl9SFp8/BTqqQLkmPn31mj3ZYlAV9rl43fGlcIFT9
         UcNLBLF150Z559N5By6kgLzLUwPaZjs3aNH+VwRntQKSaswBlrGHpXMjVzBdw/fCK7Sm
         BR3z3y9l8AmKrY6rdgrfR1DWU7t7lBOYjZYE7PwWsvMkV236FMtapVFKwGfFAcG+Rd+t
         LTV7R65HwngGvuqo+4HUH1AHh3UK7U620h+VHzaHie0avbUfbglWOv7I+A85bP9gdxE7
         UnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNoMOwJeW8EgketgclxMAlr5i9qU0i3JZKIs7PFn1Vg=;
        b=qy+3uTALI3uvm7PBJRA7G+jdhIn3WzcwyDOJdrLwOmjgSKXRBaFZYOPRmFjqwg9iDR
         iSvpkUlzXHU+rJHwKS3Yu/WhBDf3qmr/Fy+ajnJIkFUuOngT2Hw4YthkeOSOXzaEchjG
         s7Yg5GFWsqBjWiCXVic7GoCwof4gIZDAzRgyZWHTDfOmiIRgLfTxrT6TRqbEwvO3cBug
         BRWJw/bzk21OIkn/FK67yvLn8D6/BQuMhEPbfapHhrH1yzUxTPHbcQJfp0ZZPG7YQATB
         J5pGE9fVObDGi78xqFoeCF5CgVZSw3BPz/DlXsStls59aC0090X8SvM/BHZ7kk0El/WW
         gisw==
X-Gm-Message-State: APjAAAXmVX3moMUVLxWLsEAgzgVyZuDthNxMMct3tQOoXL8obFtcbBP0
        6I1eJJXXM4u5QD0BG1RaNBw=
X-Google-Smtp-Source: APXvYqxlS8OBilqfV+m5qHqprzhR41Tb/xT/mrBGW7vYc5+COIwBydhOl3a+0mEeu4J7356ynIiytQ==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr16714227wrw.313.1580740279846;
        Mon, 03 Feb 2020 06:31:19 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id r6sm26388213wrq.92.2020.02.03.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 06:31:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] soc/tegra: fuse: Fix build with Tegra194 configuration
Date:   Mon,  3 Feb 2020 15:31:14 +0100
Message-Id: <20200203143114.3967295-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If only Tegra194 support is enabled, the tegra30_fuse_read() and
tegra30_fuse_init() function are not declared and cause a build failure.
Add Tegra194 to the preprocessor guard to make sure these functions are
available for Tegra194-only builds as well.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index f68f4e1c215d..e6037f900fb7 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -36,7 +36,8 @@
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_186_SOC)
+    defined(CONFIG_ARCH_TEGRA_186_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_194_SOC)
 static u32 tegra30_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	if (WARN_ON(!fuse->base))
-- 
2.24.1

