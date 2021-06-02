Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D318399004
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Jun 2021 18:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFBQeT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Jun 2021 12:34:19 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:44640 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFBQeS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:34:18 -0400
Received: by mail-ed1-f49.google.com with SMTP id u24so3627052edy.11
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EH1amLDQoNXYOA+sU+ROQwDvPCW2wHFhVk9BVJXjIKE=;
        b=nIvU8uKkEuICbVogY8g2fAja6OIq91/8ZJyLDykAVG1YY69o0RoAJNPhDt/24+NNCB
         nOiyJmrdcqddo8nNy+QEIKGuiYMXU61H/z6KCqZwARSL2ULDADLx0d7QEcxbnigjUbUo
         XiaX75bSoNn9VBEIKI5eJ9iDYHx6fCMrtGXronq7rQpECJ8BMmRv8QcaS6vwIIGg+Qdw
         7mOZYD2W9xcuRCNdBw8+DfhnUP3uoV6/ip1ZSCAPrbc8CxKeqSVlOPXj0MIqlXVx6uRM
         fLwafTXECvdnsCz1Izu9ZNLsWQwl9ITyyTiWfsDXPCeRG+5OBlxO+9Pe/XT3PtpVCfog
         nNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EH1amLDQoNXYOA+sU+ROQwDvPCW2wHFhVk9BVJXjIKE=;
        b=rYTrbHtha3sQlDhkgILThVCrvFKDU+zdWw+ZHGvVDv5cSBQ4KxL/oUAE7sRltOhM4/
         nDQjVKYCEc8P/HOSMd0OYf24r6D4HFGD8vj5eo7D6kaI0dyvaFGzK9bTYhThRxhyvBmw
         v9vO6XThBKeb/gsuU4SM5VcYT+oc8H9c0CjzdGz9dAlb7BqjQIeMzYZd4XVtBCu4ZoM8
         kvtfkMSMn+ZA0GdnWONoCwNxMG1ydPbkJ4PF9vHWM2/tiobu6CrRlx+XEXuCNZmJxFNt
         zpcXySplqThX9DvGYQTslxiu4ApM3mHkf3YZij3oQLdO57yuQXOjz3E+dUO94VUHjMVS
         SQyg==
X-Gm-Message-State: AOAM531PuhWaunVVc0bx6gHaObbV8pmySxEd5hH8ut/L6lzNB3G5UgT2
        hb/zUGhvR7cl1Oi2dr3NY8o=
X-Google-Smtp-Source: ABdhPJzRck0Vfnc2cI7yRq9EnfA5+HJXk+yHSO/q6YIx+gu4HgY/Uf3pCgPLboCo8hsPWpKs1Nih/w==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr35078782edw.346.1622651494527;
        Wed, 02 Jun 2021 09:31:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id mh14sm255965ejb.17.2021.06.02.09.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/12] memory: tegra: Unify struct tegra_mc across SoC generations
Date:   Wed,  2 Jun 2021 18:32:52 +0200
Message-Id: <20210602163302.120041-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As another step towards unifying both the Tegra210 (and earlier) and
Tegra186 (and later) memory controller drivers, unify the structures
that are used to represent them.

Note that this comes at a slight space penalty since some fields are
not used on all generations, but the benefits of unifying the driver
outweigh the downsides.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 1281 ++++++++++++++++++++-----------
 include/soc/tegra/mc.h          |   18 +-
 2 files changed, 852 insertions(+), 447 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index e25c954dde2e..8e77567d1378 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -9,6 +9,8 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+#include <soc/tegra/mc.h>
+
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 #include <dt-bindings/memory/tegra186-mc.h>
 #endif
@@ -17,47 +19,26 @@
 #include <dt-bindings/memory/tegra194-mc.h>
 #endif
 
-struct tegra186_mc_client {
-	const char *name;
-	unsigned int sid;
-	struct {
-		unsigned int override;
-		unsigned int security;
-	} regs;
-};
-
-struct tegra186_mc_soc {
-	const struct tegra186_mc_client *clients;
-	unsigned int num_clients;
-};
-
-struct tegra186_mc {
-	struct device *dev;
-	void __iomem *regs;
-
-	const struct tegra186_mc_soc *soc;
-};
-
-static void tegra186_mc_program_sid(struct tegra186_mc *mc)
+static void tegra186_mc_program_sid(struct tegra_mc *mc)
 {
 	unsigned int i;
 
 	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra186_mc_client *client = &mc->soc->clients[i];
+		const struct tegra_mc_client *client = &mc->soc->clients[i];
 		u32 override, security;
 
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
+		override = readl(mc->regs + client->regs.sid.override);
+		security = readl(mc->regs + client->regs.sid.security);
 
 		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
 			client->name, override, security);
 
 		dev_dbg(mc->dev, "setting SID %u for %s\n", client->sid,
 			client->name);
-		writel(client->sid, mc->regs + client->regs.override);
+		writel(client->sid, mc->regs + client->regs.sid.override);
 
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
+		override = readl(mc->regs + client->regs.sid.override);
+		security = readl(mc->regs + client->regs.sid.security);
 
 		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
 			client->name, override, security);
@@ -65,1457 +46,1867 @@ static void tegra186_mc_program_sid(struct tegra186_mc *mc)
 }
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
-static const struct tegra186_mc_client tegra186_mc_clients[] = {
+static const struct tegra_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x000,
-			.security = 0x004,
+			.sid = {
+				.override = 0x000,
+				.security = 0x004,
+			},
 		},
 	}, {
 		.name = "afir",
 		.sid = TEGRA186_SID_AFI,
 		.regs = {
-			.override = 0x070,
-			.security = 0x074,
+			.sid = {
+				.override = 0x070,
+				.security = 0x074,
+			},
 		},
 	}, {
 		.name = "hdar",
 		.sid = TEGRA186_SID_HDA,
 		.regs = {
-			.override = 0x0a8,
-			.security = 0x0ac,
+			.sid = {
+				.override = 0x0a8,
+				.security = 0x0ac,
+			},
 		},
 	}, {
 		.name = "host1xdmar",
 		.sid = TEGRA186_SID_HOST1X,
 		.regs = {
-			.override = 0x0b0,
-			.security = 0x0b4,
+			.sid = {
+				.override = 0x0b0,
+				.security = 0x0b4,
+			},
 		},
 	}, {
 		.name = "nvencsrd",
 		.sid = TEGRA186_SID_NVENC,
 		.regs = {
-			.override = 0x0e0,
-			.security = 0x0e4,
+			.sid = {
+				.override = 0x0e0,
+				.security = 0x0e4,
+			},
 		},
 	}, {
 		.name = "satar",
 		.sid = TEGRA186_SID_SATA,
 		.regs = {
-			.override = 0x0f8,
-			.security = 0x0fc,
+			.sid = {
+				.override = 0x0f8,
+				.security = 0x0fc,
+			},
 		},
 	}, {
 		.name = "mpcorer",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x138,
-			.security = 0x13c,
+			.sid = {
+				.override = 0x138,
+				.security = 0x13c,
+			},
 		},
 	}, {
 		.name = "nvencswr",
 		.sid = TEGRA186_SID_NVENC,
 		.regs = {
-			.override = 0x158,
-			.security = 0x15c,
+			.sid = {
+				.override = 0x158,
+				.security = 0x15c,
+			},
 		},
 	}, {
 		.name = "afiw",
 		.sid = TEGRA186_SID_AFI,
 		.regs = {
-			.override = 0x188,
-			.security = 0x18c,
+			.sid = {
+				.override = 0x188,
+				.security = 0x18c,
+			},
 		},
 	}, {
 		.name = "hdaw",
 		.sid = TEGRA186_SID_HDA,
 		.regs = {
-			.override = 0x1a8,
-			.security = 0x1ac,
+			.sid = {
+				.override = 0x1a8,
+				.security = 0x1ac,
+			},
 		},
 	}, {
 		.name = "mpcorew",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x1c8,
-			.security = 0x1cc,
+			.sid = {
+				.override = 0x1c8,
+				.security = 0x1cc,
+			},
 		},
 	}, {
 		.name = "sataw",
 		.sid = TEGRA186_SID_SATA,
 		.regs = {
-			.override = 0x1e8,
-			.security = 0x1ec,
+			.sid = {
+				.override = 0x1e8,
+				.security = 0x1ec,
+			},
 		},
 	}, {
 		.name = "ispra",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
-			.override = 0x220,
-			.security = 0x224,
+			.sid = {
+				.override = 0x220,
+				.security = 0x224,
+			},
 		},
 	}, {
 		.name = "ispwa",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
-			.override = 0x230,
-			.security = 0x234,
+			.sid = {
+				.override = 0x230,
+				.security = 0x234,
+			},
 		},
 	}, {
 		.name = "ispwb",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
-			.override = 0x238,
-			.security = 0x23c,
+			.sid = {
+				.override = 0x238,
+				.security = 0x23c,
+			},
 		},
 	}, {
 		.name = "xusb_hostr",
 		.sid = TEGRA186_SID_XUSB_HOST,
 		.regs = {
-			.override = 0x250,
-			.security = 0x254,
+			.sid = {
+				.override = 0x250,
+				.security = 0x254,
+			},
 		},
 	}, {
 		.name = "xusb_hostw",
 		.sid = TEGRA186_SID_XUSB_HOST,
 		.regs = {
-			.override = 0x258,
-			.security = 0x25c,
+			.sid = {
+				.override = 0x258,
+				.security = 0x25c,
+			},
 		},
 	}, {
 		.name = "xusb_devr",
 		.sid = TEGRA186_SID_XUSB_DEV,
 		.regs = {
-			.override = 0x260,
-			.security = 0x264,
+			.sid = {
+				.override = 0x260,
+				.security = 0x264,
+			},
 		},
 	}, {
 		.name = "xusb_devw",
 		.sid = TEGRA186_SID_XUSB_DEV,
 		.regs = {
-			.override = 0x268,
-			.security = 0x26c,
+			.sid = {
+				.override = 0x268,
+				.security = 0x26c,
+			},
 		},
 	}, {
 		.name = "tsecsrd",
 		.sid = TEGRA186_SID_TSEC,
 		.regs = {
-			.override = 0x2a0,
-			.security = 0x2a4,
+			.sid = {
+				.override = 0x2a0,
+				.security = 0x2a4,
+			},
 		},
 	}, {
 		.name = "tsecswr",
 		.sid = TEGRA186_SID_TSEC,
 		.regs = {
-			.override = 0x2a8,
-			.security = 0x2ac,
+			.sid = {
+				.override = 0x2a8,
+				.security = 0x2ac,
+			},
 		},
 	}, {
 		.name = "gpusrd",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
-			.override = 0x2c0,
-			.security = 0x2c4,
+			.sid = {
+				.override = 0x2c0,
+				.security = 0x2c4,
+			},
 		},
 	}, {
 		.name = "gpuswr",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
-			.override = 0x2c8,
-			.security = 0x2cc,
+			.sid = {
+				.override = 0x2c8,
+				.security = 0x2cc,
+			},
 		},
 	}, {
 		.name = "sdmmcra",
 		.sid = TEGRA186_SID_SDMMC1,
 		.regs = {
-			.override = 0x300,
-			.security = 0x304,
+			.sid = {
+				.override = 0x300,
+				.security = 0x304,
+			},
 		},
 	}, {
 		.name = "sdmmcraa",
 		.sid = TEGRA186_SID_SDMMC2,
 		.regs = {
-			.override = 0x308,
-			.security = 0x30c,
+			.sid = {
+				.override = 0x308,
+				.security = 0x30c,
+			},
 		},
 	}, {
 		.name = "sdmmcr",
 		.sid = TEGRA186_SID_SDMMC3,
 		.regs = {
-			.override = 0x310,
-			.security = 0x314,
+			.sid = {
+				.override = 0x310,
+				.security = 0x314,
+			},
 		},
 	}, {
 		.name = "sdmmcrab",
 		.sid = TEGRA186_SID_SDMMC4,
 		.regs = {
-			.override = 0x318,
-			.security = 0x31c,
+			.sid = {
+				.override = 0x318,
+				.security = 0x31c,
+			},
 		},
 	}, {
 		.name = "sdmmcwa",
 		.sid = TEGRA186_SID_SDMMC1,
 		.regs = {
-			.override = 0x320,
-			.security = 0x324,
+			.sid = {
+				.override = 0x320,
+				.security = 0x324,
+			},
 		},
 	}, {
 		.name = "sdmmcwaa",
 		.sid = TEGRA186_SID_SDMMC2,
 		.regs = {
-			.override = 0x328,
-			.security = 0x32c,
+			.sid = {
+				.override = 0x328,
+				.security = 0x32c,
+			},
 		},
 	}, {
 		.name = "sdmmcw",
 		.sid = TEGRA186_SID_SDMMC3,
 		.regs = {
-			.override = 0x330,
-			.security = 0x334,
+			.sid = {
+				.override = 0x330,
+				.security = 0x334,
+			},
 		},
 	}, {
 		.name = "sdmmcwab",
 		.sid = TEGRA186_SID_SDMMC4,
 		.regs = {
-			.override = 0x338,
-			.security = 0x33c,
+			.sid = {
+				.override = 0x338,
+				.security = 0x33c,
+			},
 		},
 	}, {
 		.name = "vicsrd",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
-			.override = 0x360,
-			.security = 0x364,
+			.sid = {
+				.override = 0x360,
+				.security = 0x364,
+			},
 		},
 	}, {
 		.name = "vicswr",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
-			.override = 0x368,
-			.security = 0x36c,
+			.sid = {
+				.override = 0x368,
+				.security = 0x36c,
+			},
 		},
 	}, {
 		.name = "viw",
 		.sid = TEGRA186_SID_VI,
 		.regs = {
-			.override = 0x390,
-			.security = 0x394,
+			.sid = {
+				.override = 0x390,
+				.security = 0x394,
+			},
 		},
 	}, {
 		.name = "nvdecsrd",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
-			.override = 0x3c0,
-			.security = 0x3c4,
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
 		},
 	}, {
 		.name = "nvdecswr",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
-			.override = 0x3c8,
-			.security = 0x3cc,
+			.sid = {
+				.override = 0x3c8,
+				.security = 0x3cc,
+			},
 		},
 	}, {
 		.name = "aper",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
-			.override = 0x3d0,
-			.security = 0x3d4,
+			.sid = {
+				.override = 0x3d0,
+				.security = 0x3d4,
+			},
 		},
 	}, {
 		.name = "apew",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
-			.override = 0x3d8,
-			.security = 0x3dc,
+			.sid = {
+				.override = 0x3d8,
+				.security = 0x3dc,
+			},
 		},
 	}, {
 		.name = "nvjpgsrd",
 		.sid = TEGRA186_SID_NVJPG,
 		.regs = {
-			.override = 0x3f0,
-			.security = 0x3f4,
+			.sid = {
+				.override = 0x3f0,
+				.security = 0x3f4,
+			},
 		},
 	}, {
 		.name = "nvjpgswr",
 		.sid = TEGRA186_SID_NVJPG,
 		.regs = {
-			.override = 0x3f8,
-			.security = 0x3fc,
+			.sid = {
+				.override = 0x3f8,
+				.security = 0x3fc,
+			},
 		},
 	}, {
 		.name = "sesrd",
 		.sid = TEGRA186_SID_SE,
 		.regs = {
-			.override = 0x400,
-			.security = 0x404,
+			.sid = {
+				.override = 0x400,
+				.security = 0x404,
+			},
 		},
 	}, {
 		.name = "seswr",
 		.sid = TEGRA186_SID_SE,
 		.regs = {
-			.override = 0x408,
-			.security = 0x40c,
+			.sid = {
+				.override = 0x408,
+				.security = 0x40c,
+			},
 		},
 	}, {
 		.name = "etrr",
 		.sid = TEGRA186_SID_ETR,
 		.regs = {
-			.override = 0x420,
-			.security = 0x424,
+			.sid = {
+				.override = 0x420,
+				.security = 0x424,
+			},
 		},
 	}, {
 		.name = "etrw",
 		.sid = TEGRA186_SID_ETR,
 		.regs = {
-			.override = 0x428,
-			.security = 0x42c,
+			.sid = {
+				.override = 0x428,
+				.security = 0x42c,
+			},
 		},
 	}, {
 		.name = "tsecsrdb",
 		.sid = TEGRA186_SID_TSECB,
 		.regs = {
-			.override = 0x430,
-			.security = 0x434,
+			.sid = {
+				.override = 0x430,
+				.security = 0x434,
+			},
 		},
 	}, {
 		.name = "tsecswrb",
 		.sid = TEGRA186_SID_TSECB,
 		.regs = {
-			.override = 0x438,
-			.security = 0x43c,
+			.sid = {
+				.override = 0x438,
+				.security = 0x43c,
+			},
 		},
 	}, {
 		.name = "gpusrd2",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
-			.override = 0x440,
-			.security = 0x444,
+			.sid = {
+				.override = 0x440,
+				.security = 0x444,
+			},
 		},
 	}, {
 		.name = "gpuswr2",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
-			.override = 0x448,
-			.security = 0x44c,
+			.sid = {
+				.override = 0x448,
+				.security = 0x44c,
+			},
 		},
 	}, {
 		.name = "axisr",
 		.sid = TEGRA186_SID_GPCDMA_0,
 		.regs = {
-			.override = 0x460,
-			.security = 0x464,
+			.sid = {
+				.override = 0x460,
+				.security = 0x464,
+			},
 		},
 	}, {
 		.name = "axisw",
 		.sid = TEGRA186_SID_GPCDMA_0,
 		.regs = {
-			.override = 0x468,
-			.security = 0x46c,
+			.sid = {
+				.override = 0x468,
+				.security = 0x46c,
+			},
 		},
 	}, {
 		.name = "eqosr",
 		.sid = TEGRA186_SID_EQOS,
 		.regs = {
-			.override = 0x470,
-			.security = 0x474,
+			.sid = {
+				.override = 0x470,
+				.security = 0x474,
+			},
 		},
 	}, {
 		.name = "eqosw",
 		.sid = TEGRA186_SID_EQOS,
 		.regs = {
-			.override = 0x478,
-			.security = 0x47c,
+			.sid = {
+				.override = 0x478,
+				.security = 0x47c,
+			},
 		},
 	}, {
 		.name = "ufshcr",
 		.sid = TEGRA186_SID_UFSHC,
 		.regs = {
-			.override = 0x480,
-			.security = 0x484,
+			.sid = {
+				.override = 0x480,
+				.security = 0x484,
+			},
 		},
 	}, {
 		.name = "ufshcw",
 		.sid = TEGRA186_SID_UFSHC,
 		.regs = {
-			.override = 0x488,
-			.security = 0x48c,
+			.sid = {
+				.override = 0x488,
+				.security = 0x48c,
+			},
 		},
 	}, {
 		.name = "nvdisplayr",
 		.sid = TEGRA186_SID_NVDISPLAY,
 		.regs = {
-			.override = 0x490,
-			.security = 0x494,
+			.sid = {
+				.override = 0x490,
+				.security = 0x494,
+			},
 		},
 	}, {
 		.name = "bpmpr",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
-			.override = 0x498,
-			.security = 0x49c,
+			.sid = {
+				.override = 0x498,
+				.security = 0x49c,
+			},
 		},
 	}, {
 		.name = "bpmpw",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
-			.override = 0x4a0,
-			.security = 0x4a4,
+			.sid = {
+				.override = 0x4a0,
+				.security = 0x4a4,
+			},
 		},
 	}, {
 		.name = "bpmpdmar",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
-			.override = 0x4a8,
-			.security = 0x4ac,
+			.sid = {
+				.override = 0x4a8,
+				.security = 0x4ac,
+			},
 		},
 	}, {
 		.name = "bpmpdmaw",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
-			.override = 0x4b0,
-			.security = 0x4b4,
+			.sid = {
+				.override = 0x4b0,
+				.security = 0x4b4,
+			},
 		},
 	}, {
 		.name = "aonr",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
-			.override = 0x4b8,
-			.security = 0x4bc,
+			.sid = {
+				.override = 0x4b8,
+				.security = 0x4bc,
+			},
 		},
 	}, {
 		.name = "aonw",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
-			.override = 0x4c0,
-			.security = 0x4c4,
+			.sid = {
+				.override = 0x4c0,
+				.security = 0x4c4,
+			},
 		},
 	}, {
 		.name = "aondmar",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
-			.override = 0x4c8,
-			.security = 0x4cc,
+			.sid = {
+				.override = 0x4c8,
+				.security = 0x4cc,
+			},
 		},
 	}, {
 		.name = "aondmaw",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
-			.override = 0x4d0,
-			.security = 0x4d4,
+			.sid = {
+				.override = 0x4d0,
+				.security = 0x4d4,
+			},
 		},
 	}, {
 		.name = "scer",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
-			.override = 0x4d8,
-			.security = 0x4dc,
+			.sid = {
+				.override = 0x4d8,
+				.security = 0x4dc,
+			},
 		},
 	}, {
 		.name = "scew",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
-			.override = 0x4e0,
-			.security = 0x4e4,
+			.sid = {
+				.override = 0x4e0,
+				.security = 0x4e4,
+			},
 		},
 	}, {
 		.name = "scedmar",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
-			.override = 0x4e8,
-			.security = 0x4ec,
+			.sid = {
+				.override = 0x4e8,
+				.security = 0x4ec,
+			},
 		},
 	}, {
 		.name = "scedmaw",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
-			.override = 0x4f0,
-			.security = 0x4f4,
+			.sid = {
+				.override = 0x4f0,
+				.security = 0x4f4,
+			},
 		},
 	}, {
 		.name = "apedmar",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
-			.override = 0x4f8,
-			.security = 0x4fc,
+			.sid = {
+				.override = 0x4f8,
+				.security = 0x4fc,
+			},
 		},
 	}, {
 		.name = "apedmaw",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
-			.override = 0x500,
-			.security = 0x504,
+			.sid = {
+				.override = 0x500,
+				.security = 0x504,
+			},
 		},
 	}, {
 		.name = "nvdisplayr1",
 		.sid = TEGRA186_SID_NVDISPLAY,
 		.regs = {
-			.override = 0x508,
-			.security = 0x50c,
+			.sid = {
+				.override = 0x508,
+				.security = 0x50c,
+			},
 		},
 	}, {
 		.name = "vicsrd1",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
-			.override = 0x510,
-			.security = 0x514,
+			.sid = {
+				.override = 0x510,
+				.security = 0x514,
+			},
 		},
 	}, {
 		.name = "nvdecsrd1",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
-			.override = 0x518,
-			.security = 0x51c,
+			.sid = {
+				.override = 0x518,
+				.security = 0x51c,
+			},
 		},
 	},
 };
 
-static const struct tegra186_mc_soc tegra186_mc_soc = {
+static const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
 };
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
-static const struct tegra186_mc_client tegra194_mc_clients[] = {
+static const struct tegra_mc_client tegra194_mc_clients[] = {
 	{
 		.name = "ptcr",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x000,
-			.security = 0x004,
+			.sid = {
+				.override = 0x000,
+				.security = 0x004,
+			},
 		},
 	}, {
 		.name = "miu7r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x008,
-			.security = 0x00c,
+			.sid = {
+				.override = 0x008,
+				.security = 0x00c,
+			},
 		},
 	}, {
 		.name = "miu7w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x010,
-			.security = 0x014,
+			.sid = {
+				.override = 0x010,
+				.security = 0x014,
+			},
 		},
 	}, {
 		.name = "hdar",
 		.sid = TEGRA194_SID_HDA,
 		.regs = {
-			.override = 0x0a8,
-			.security = 0x0ac,
+			.sid = {
+				.override = 0x0a8,
+				.security = 0x0ac,
+			},
 		},
 	}, {
 		.name = "host1xdmar",
 		.sid = TEGRA194_SID_HOST1X,
 		.regs = {
-			.override = 0x0b0,
-			.security = 0x0b4,
+			.sid = {
+				.override = 0x0b0,
+				.security = 0x0b4,
+			},
 		},
 	}, {
 		.name = "nvencsrd",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
-			.override = 0x0e0,
-			.security = 0x0e4,
+			.sid = {
+				.override = 0x0e0,
+				.security = 0x0e4,
+			},
 		},
 	}, {
 		.name = "satar",
 		.sid = TEGRA194_SID_SATA,
 		.regs = {
-			.override = 0x0f8,
-			.security = 0x0fc,
+			.sid = {
+				.override = 0x0f8,
+				.security = 0x0fc,
+			},
 		},
 	}, {
 		.name = "mpcorer",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x138,
-			.security = 0x13c,
+			.sid = {
+				.override = 0x138,
+				.security = 0x13c,
+			},
 		},
 	}, {
 		.name = "nvencswr",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
-			.override = 0x158,
-			.security = 0x15c,
+			.sid = {
+				.override = 0x158,
+				.security = 0x15c,
+			},
 		},
 	}, {
 		.name = "hdaw",
 		.sid = TEGRA194_SID_HDA,
 		.regs = {
-			.override = 0x1a8,
-			.security = 0x1ac,
+			.sid = {
+				.override = 0x1a8,
+				.security = 0x1ac,
+			},
 		},
 	}, {
 		.name = "mpcorew",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x1c8,
-			.security = 0x1cc,
+			.sid = {
+				.override = 0x1c8,
+				.security = 0x1cc,
+			},
 		},
 	}, {
 		.name = "sataw",
 		.sid = TEGRA194_SID_SATA,
 		.regs = {
-			.override = 0x1e8,
-			.security = 0x1ec,
+			.sid = {
+				.override = 0x1e8,
+				.security = 0x1ec,
+			},
 		},
 	}, {
 		.name = "ispra",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
-			.override = 0x220,
-			.security = 0x224,
+			.sid = {
+				.override = 0x220,
+				.security = 0x224,
+			},
 		},
 	}, {
 		.name = "ispfalr",
 		.sid = TEGRA194_SID_ISP_FALCON,
 		.regs = {
-			.override = 0x228,
-			.security = 0x22c,
+			.sid = {
+				.override = 0x228,
+				.security = 0x22c,
+			},
 		},
 	}, {
 		.name = "ispwa",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
-			.override = 0x230,
-			.security = 0x234,
+			.sid = {
+				.override = 0x230,
+				.security = 0x234,
+			},
 		},
 	}, {
 		.name = "ispwb",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
-			.override = 0x238,
-			.security = 0x23c,
+			.sid = {
+				.override = 0x238,
+				.security = 0x23c,
+			},
 		},
 	}, {
 		.name = "xusb_hostr",
 		.sid = TEGRA194_SID_XUSB_HOST,
 		.regs = {
-			.override = 0x250,
-			.security = 0x254,
+			.sid = {
+				.override = 0x250,
+				.security = 0x254,
+			},
 		},
 	}, {
 		.name = "xusb_hostw",
 		.sid = TEGRA194_SID_XUSB_HOST,
 		.regs = {
-			.override = 0x258,
-			.security = 0x25c,
+			.sid = {
+				.override = 0x258,
+				.security = 0x25c,
+			},
 		},
 	}, {
 		.name = "xusb_devr",
 		.sid = TEGRA194_SID_XUSB_DEV,
 		.regs = {
-			.override = 0x260,
-			.security = 0x264,
+			.sid = {
+				.override = 0x260,
+				.security = 0x264,
+			},
 		},
 	}, {
 		.name = "xusb_devw",
 		.sid = TEGRA194_SID_XUSB_DEV,
 		.regs = {
-			.override = 0x268,
-			.security = 0x26c,
+			.sid = {
+				.override = 0x268,
+				.security = 0x26c,
+			},
 		},
 	}, {
 		.name = "sdmmcra",
 		.sid = TEGRA194_SID_SDMMC1,
 		.regs = {
-			.override = 0x300,
-			.security = 0x304,
+			.sid = {
+				.override = 0x300,
+				.security = 0x304,
+			},
 		},
 	}, {
 		.name = "sdmmcr",
 		.sid = TEGRA194_SID_SDMMC3,
 		.regs = {
-			.override = 0x310,
-			.security = 0x314,
+			.sid = {
+				.override = 0x310,
+				.security = 0x314,
+			},
 		},
 	}, {
 		.name = "sdmmcrab",
 		.sid = TEGRA194_SID_SDMMC4,
 		.regs = {
-			.override = 0x318,
-			.security = 0x31c,
+			.sid = {
+				.override = 0x318,
+				.security = 0x31c,
+			},
 		},
 	}, {
 		.name = "sdmmcwa",
 		.sid = TEGRA194_SID_SDMMC1,
 		.regs = {
-			.override = 0x320,
-			.security = 0x324,
+			.sid = {
+				.override = 0x320,
+				.security = 0x324,
+			},
 		},
 	}, {
 		.name = "sdmmcw",
 		.sid = TEGRA194_SID_SDMMC3,
 		.regs = {
-			.override = 0x330,
-			.security = 0x334,
+			.sid = {
+				.override = 0x330,
+				.security = 0x334,
+			},
 		},
 	}, {
 		.name = "sdmmcwab",
 		.sid = TEGRA194_SID_SDMMC4,
 		.regs = {
-			.override = 0x338,
-			.security = 0x33c,
+			.sid = {
+				.override = 0x338,
+				.security = 0x33c,
+			},
 		},
 	}, {
 		.name = "vicsrd",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
-			.override = 0x360,
-			.security = 0x364,
+			.sid = {
+				.override = 0x360,
+				.security = 0x364,
+			},
 		},
 	}, {
 		.name = "vicswr",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
-			.override = 0x368,
-			.security = 0x36c,
+			.sid = {
+				.override = 0x368,
+				.security = 0x36c,
+			},
 		},
 	}, {
 		.name = "viw",
 		.sid = TEGRA194_SID_VI,
 		.regs = {
-			.override = 0x390,
-			.security = 0x394,
+			.sid = {
+				.override = 0x390,
+				.security = 0x394,
+			},
 		},
 	}, {
 		.name = "nvdecsrd",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
-			.override = 0x3c0,
-			.security = 0x3c4,
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
 		},
 	}, {
 		.name = "nvdecswr",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
-			.override = 0x3c8,
-			.security = 0x3cc,
+			.sid = {
+				.override = 0x3c8,
+				.security = 0x3cc,
+			},
 		},
 	}, {
 		.name = "aper",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
-			.override = 0x3c0,
-			.security = 0x3c4,
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
 		},
 	}, {
 		.name = "apew",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
-			.override = 0x3d0,
-			.security = 0x3d4,
+			.sid = {
+				.override = 0x3d0,
+				.security = 0x3d4,
+			},
 		},
 	}, {
 		.name = "nvjpgsrd",
 		.sid = TEGRA194_SID_NVJPG,
 		.regs = {
-			.override = 0x3f0,
-			.security = 0x3f4,
+			.sid = {
+				.override = 0x3f0,
+				.security = 0x3f4,
+			},
 		},
 	}, {
 		.name = "nvjpgswr",
 		.sid = TEGRA194_SID_NVJPG,
 		.regs = {
-			.override = 0x3f0,
-			.security = 0x3f4,
+			.sid = {
+				.override = 0x3f0,
+				.security = 0x3f4,
+			},
 		},
 	}, {
 		.name = "axiapr",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x410,
-			.security = 0x414,
+			.sid = {
+				.override = 0x410,
+				.security = 0x414,
+			},
 		},
 	}, {
 		.name = "axiapw",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x418,
-			.security = 0x41c,
+			.sid = {
+				.override = 0x418,
+				.security = 0x41c,
+			},
 		},
 	}, {
 		.name = "etrr",
 		.sid = TEGRA194_SID_ETR,
 		.regs = {
-			.override = 0x420,
-			.security = 0x424,
+			.sid = {
+				.override = 0x420,
+				.security = 0x424,
+			},
 		},
 	}, {
 		.name = "etrw",
 		.sid = TEGRA194_SID_ETR,
 		.regs = {
-			.override = 0x428,
-			.security = 0x42c,
+			.sid = {
+				.override = 0x428,
+				.security = 0x42c,
+			},
 		},
 	}, {
 		.name = "axisr",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x460,
-			.security = 0x464,
+			.sid = {
+				.override = 0x460,
+				.security = 0x464,
+			},
 		},
 	}, {
 		.name = "axisw",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x468,
-			.security = 0x46c,
+			.sid = {
+				.override = 0x468,
+				.security = 0x46c,
+			},
 		},
 	}, {
 		.name = "eqosr",
 		.sid = TEGRA194_SID_EQOS,
 		.regs = {
-			.override = 0x470,
-			.security = 0x474,
+			.sid = {
+				.override = 0x470,
+				.security = 0x474,
+			},
 		},
 	}, {
 		.name = "eqosw",
 		.sid = TEGRA194_SID_EQOS,
 		.regs = {
-			.override = 0x478,
-			.security = 0x47c,
+			.sid = {
+				.override = 0x478,
+				.security = 0x47c,
+			},
 		},
 	}, {
 		.name = "ufshcr",
 		.sid = TEGRA194_SID_UFSHC,
 		.regs = {
-			.override = 0x480,
-			.security = 0x484,
+			.sid = {
+				.override = 0x480,
+				.security = 0x484,
+			},
 		},
 	}, {
 		.name = "ufshcw",
 		.sid = TEGRA194_SID_UFSHC,
 		.regs = {
-			.override = 0x488,
-			.security = 0x48c,
+			.sid = {
+				.override = 0x488,
+				.security = 0x48c,
+			},
 		},
 	}, {
 		.name = "nvdisplayr",
 		.sid = TEGRA194_SID_NVDISPLAY,
 		.regs = {
-			.override = 0x490,
-			.security = 0x494,
+			.sid = {
+				.override = 0x490,
+				.security = 0x494,
+			},
 		},
 	}, {
 		.name = "bpmpr",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
-			.override = 0x498,
-			.security = 0x49c,
+			.sid = {
+				.override = 0x498,
+				.security = 0x49c,
+			},
 		},
 	}, {
 		.name = "bpmpw",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
-			.override = 0x4a0,
-			.security = 0x4a4,
+			.sid = {
+				.override = 0x4a0,
+				.security = 0x4a4,
+			},
 		},
 	}, {
 		.name = "bpmpdmar",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
-			.override = 0x4a8,
-			.security = 0x4ac,
+			.sid = {
+				.override = 0x4a8,
+				.security = 0x4ac,
+			},
 		},
 	}, {
 		.name = "bpmpdmaw",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
-			.override = 0x4b0,
-			.security = 0x4b4,
+			.sid = {
+				.override = 0x4b0,
+				.security = 0x4b4,
+			},
 		},
 	}, {
 		.name = "aonr",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
-			.override = 0x4b8,
-			.security = 0x4bc,
+			.sid = {
+				.override = 0x4b8,
+				.security = 0x4bc,
+			},
 		},
 	}, {
 		.name = "aonw",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
-			.override = 0x4c0,
-			.security = 0x4c4,
+			.sid = {
+				.override = 0x4c0,
+				.security = 0x4c4,
+			},
 		},
 	}, {
 		.name = "aondmar",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
-			.override = 0x4c8,
-			.security = 0x4cc,
+			.sid = {
+				.override = 0x4c8,
+				.security = 0x4cc,
+			},
 		},
 	}, {
 		.name = "aondmaw",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
-			.override = 0x4d0,
-			.security = 0x4d4,
+			.sid = {
+				.override = 0x4d0,
+				.security = 0x4d4,
+			},
 		},
 	}, {
 		.name = "scer",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
-			.override = 0x4d8,
-			.security = 0x4dc,
+			.sid = {
+				.override = 0x4d8,
+				.security = 0x4dc,
+			},
 		},
 	}, {
 		.name = "scew",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
-			.override = 0x4e0,
-			.security = 0x4e4,
+			.sid = {
+				.override = 0x4e0,
+				.security = 0x4e4,
+			},
 		},
 	}, {
 		.name = "scedmar",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
-			.override = 0x4e8,
-			.security = 0x4ec,
+			.sid = {
+				.override = 0x4e8,
+				.security = 0x4ec,
+			},
 		},
 	}, {
 		.name = "scedmaw",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
-			.override = 0x4f0,
-			.security = 0x4f4,
+			.sid = {
+				.override = 0x4f0,
+				.security = 0x4f4,
+			},
 		},
 	}, {
 		.name = "apedmar",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
-			.override = 0x4f8,
-			.security = 0x4fc,
+			.sid = {
+				.override = 0x4f8,
+				.security = 0x4fc,
+			},
 		},
 	}, {
 		.name = "apedmaw",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
-			.override = 0x500,
-			.security = 0x504,
+			.sid = {
+				.override = 0x500,
+				.security = 0x504,
+			},
 		},
 	}, {
 		.name = "nvdisplayr1",
 		.sid = TEGRA194_SID_NVDISPLAY,
 		.regs = {
-			.override = 0x508,
-			.security = 0x50c,
+			.sid = {
+				.override = 0x508,
+				.security = 0x50c,
+			},
 		},
 	}, {
 		.name = "vicsrd1",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
-			.override = 0x510,
-			.security = 0x514,
+			.sid = {
+				.override = 0x510,
+				.security = 0x514,
+			},
 		},
 	}, {
 		.name = "nvdecsrd1",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
-			.override = 0x518,
-			.security = 0x51c,
+			.sid = {
+				.override = 0x518,
+				.security = 0x51c,
+			},
 		},
 	}, {
 		.name = "miu0r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x530,
-			.security = 0x534,
+			.sid = {
+				.override = 0x530,
+				.security = 0x534,
+			},
 		},
 	}, {
 		.name = "miu0w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x538,
-			.security = 0x53c,
+			.sid = {
+				.override = 0x538,
+				.security = 0x53c,
+			},
 		},
 	}, {
 		.name = "miu1r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x540,
-			.security = 0x544,
+			.sid = {
+				.override = 0x540,
+				.security = 0x544,
+			},
 		},
 	}, {
 		.name = "miu1w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x548,
-			.security = 0x54c,
+			.sid = {
+				.override = 0x548,
+				.security = 0x54c,
+			},
 		},
 	}, {
 		.name = "miu2r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x570,
-			.security = 0x574,
+			.sid = {
+				.override = 0x570,
+				.security = 0x574,
+			},
 		},
 	}, {
 		.name = "miu2w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x578,
-			.security = 0x57c,
+			.sid = {
+				.override = 0x578,
+				.security = 0x57c,
+			},
 		},
 	}, {
 		.name = "miu3r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x580,
-			.security = 0x584,
+			.sid = {
+				.override = 0x580,
+				.security = 0x584,
+			},
 		},
 	}, {
 		.name = "miu3w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x588,
-			.security = 0x58c,
+			.sid = {
+				.override = 0x588,
+				.security = 0x58c,
+			},
 		},
 	}, {
 		.name = "miu4r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x590,
-			.security = 0x594,
+			.sid = {
+				.override = 0x590,
+				.security = 0x594,
+			},
 		},
 	}, {
 		.name = "miu4w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x598,
-			.security = 0x59c,
+			.sid = {
+				.override = 0x598,
+				.security = 0x59c,
+			},
 		},
 	}, {
 		.name = "dpmur",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
-			.override = 0x598,
-			.security = 0x59c,
+			.sid = {
+				.override = 0x598,
+				.security = 0x59c,
+			},
 		},
 	}, {
 		.name = "vifalr",
 		.sid = TEGRA194_SID_VI_FALCON,
 		.regs = {
-			.override = 0x5e0,
-			.security = 0x5e4,
+			.sid = {
+				.override = 0x5e0,
+				.security = 0x5e4,
+			},
 		},
 	}, {
 		.name = "vifalw",
 		.sid = TEGRA194_SID_VI_FALCON,
 		.regs = {
-			.override = 0x5e8,
-			.security = 0x5ec,
+			.sid = {
+				.override = 0x5e8,
+				.security = 0x5ec,
+			},
 		},
 	}, {
 		.name = "dla0rda",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
-			.override = 0x5f0,
-			.security = 0x5f4,
+			.sid = {
+				.override = 0x5f0,
+				.security = 0x5f4,
+			},
 		},
 	}, {
 		.name = "dla0falrdb",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
-			.override = 0x5f8,
-			.security = 0x5fc,
+			.sid = {
+				.override = 0x5f8,
+				.security = 0x5fc,
+			},
 		},
 	}, {
 		.name = "dla0wra",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
-			.override = 0x600,
-			.security = 0x604,
+			.sid = {
+				.override = 0x600,
+				.security = 0x604,
+			},
 		},
 	}, {
 		.name = "dla0falwrb",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
-			.override = 0x608,
-			.security = 0x60c,
+			.sid = {
+				.override = 0x608,
+				.security = 0x60c,
+			},
 		},
 	}, {
 		.name = "dla1rda",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
-			.override = 0x610,
-			.security = 0x614,
+			.sid = {
+				.override = 0x610,
+				.security = 0x614,
+			},
 		},
 	}, {
 		.name = "dla1falrdb",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
-			.override = 0x618,
-			.security = 0x61c,
+			.sid = {
+				.override = 0x618,
+				.security = 0x61c,
+			},
 		},
 	}, {
 		.name = "dla1wra",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
-			.override = 0x620,
-			.security = 0x624,
+			.sid = {
+				.override = 0x620,
+				.security = 0x624,
+			},
 		},
 	}, {
 		.name = "dla1falwrb",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
-			.override = 0x628,
-			.security = 0x62c,
+			.sid = {
+				.override = 0x628,
+				.security = 0x62c,
+			},
 		},
 	}, {
 		.name = "pva0rda",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x630,
-			.security = 0x634,
+			.sid = {
+				.override = 0x630,
+				.security = 0x634,
+			},
 		},
 	}, {
 		.name = "pva0rdb",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x638,
-			.security = 0x63c,
+			.sid = {
+				.override = 0x638,
+				.security = 0x63c,
+			},
 		},
 	}, {
 		.name = "pva0rdc",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x640,
-			.security = 0x644,
+			.sid = {
+				.override = 0x640,
+				.security = 0x644,
+			},
 		},
 	}, {
 		.name = "pva0wra",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x648,
-			.security = 0x64c,
+			.sid = {
+				.override = 0x648,
+				.security = 0x64c,
+			},
 		},
 	}, {
 		.name = "pva0wrb",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x650,
-			.security = 0x654,
+			.sid = {
+				.override = 0x650,
+				.security = 0x654,
+			},
 		},
 	}, {
 		.name = "pva0wrc",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x658,
-			.security = 0x65c,
+			.sid = {
+				.override = 0x658,
+				.security = 0x65c,
+			},
 		},
 	}, {
 		.name = "pva1rda",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x660,
-			.security = 0x664,
+			.sid = {
+				.override = 0x660,
+				.security = 0x664,
+			},
 		},
 	}, {
 		.name = "pva1rdb",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x668,
-			.security = 0x66c,
+			.sid = {
+				.override = 0x668,
+				.security = 0x66c,
+			},
 		},
 	}, {
 		.name = "pva1rdc",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x670,
-			.security = 0x674,
+			.sid = {
+				.override = 0x670,
+				.security = 0x674,
+			},
 		},
 	}, {
 		.name = "pva1wra",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x678,
-			.security = 0x67c,
+			.sid = {
+				.override = 0x678,
+				.security = 0x67c,
+			},
 		},
 	}, {
 		.name = "pva1wrb",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x680,
-			.security = 0x684,
+			.sid = {
+				.override = 0x680,
+				.security = 0x684,
+			},
 		},
 	}, {
 		.name = "pva1wrc",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x688,
-			.security = 0x68c,
+			.sid = {
+				.override = 0x688,
+				.security = 0x68c,
+			},
 		},
 	}, {
 		.name = "rcer",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
-			.override = 0x690,
-			.security = 0x694,
+			.sid = {
+				.override = 0x690,
+				.security = 0x694,
+			},
 		},
 	}, {
 		.name = "rcew",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
-			.override = 0x698,
-			.security = 0x69c,
+			.sid = {
+				.override = 0x698,
+				.security = 0x69c,
+			},
 		},
 	}, {
 		.name = "rcedmar",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
-			.override = 0x6a0,
-			.security = 0x6a4,
+			.sid = {
+				.override = 0x6a0,
+				.security = 0x6a4,
+			},
 		},
 	}, {
 		.name = "rcedmaw",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
-			.override = 0x6a8,
-			.security = 0x6ac,
+			.sid = {
+				.override = 0x6a8,
+				.security = 0x6ac,
+			},
 		},
 	}, {
 		.name = "nvenc1srd",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
-			.override = 0x6b0,
-			.security = 0x6b4,
+			.sid = {
+				.override = 0x6b0,
+				.security = 0x6b4,
+			},
 		},
 	}, {
 		.name = "nvenc1swr",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
-			.override = 0x6b8,
-			.security = 0x6bc,
+			.sid = {
+				.override = 0x6b8,
+				.security = 0x6bc,
+			},
 		},
 	}, {
 		.name = "pcie0r",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
-			.override = 0x6c0,
-			.security = 0x6c4,
+			.sid = {
+				.override = 0x6c0,
+				.security = 0x6c4,
+			},
 		},
 	}, {
 		.name = "pcie0w",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
-			.override = 0x6c8,
-			.security = 0x6cc,
+			.sid = {
+				.override = 0x6c8,
+				.security = 0x6cc,
+			},
 		},
 	}, {
 		.name = "pcie1r",
 		.sid = TEGRA194_SID_PCIE1,
 		.regs = {
-			.override = 0x6d0,
-			.security = 0x6d4,
+			.sid = {
+				.override = 0x6d0,
+				.security = 0x6d4,
+			},
 		},
 	}, {
 		.name = "pcie1w",
 		.sid = TEGRA194_SID_PCIE1,
 		.regs = {
-			.override = 0x6d8,
-			.security = 0x6dc,
+			.sid = {
+				.override = 0x6d8,
+				.security = 0x6dc,
+			},
 		},
 	}, {
 		.name = "pcie2ar",
 		.sid = TEGRA194_SID_PCIE2,
 		.regs = {
-			.override = 0x6e0,
-			.security = 0x6e4,
+			.sid = {
+				.override = 0x6e0,
+				.security = 0x6e4,
+			},
 		},
 	}, {
 		.name = "pcie2aw",
 		.sid = TEGRA194_SID_PCIE2,
 		.regs = {
-			.override = 0x6e8,
-			.security = 0x6ec,
+			.sid = {
+				.override = 0x6e8,
+				.security = 0x6ec,
+			},
 		},
 	}, {
 		.name = "pcie3r",
 		.sid = TEGRA194_SID_PCIE3,
 		.regs = {
-			.override = 0x6f0,
-			.security = 0x6f4,
+			.sid = {
+				.override = 0x6f0,
+				.security = 0x6f4,
+			},
 		},
 	}, {
 		.name = "pcie3w",
 		.sid = TEGRA194_SID_PCIE3,
 		.regs = {
-			.override = 0x6f8,
-			.security = 0x6fc,
+			.sid = {
+				.override = 0x6f8,
+				.security = 0x6fc,
+			},
 		},
 	}, {
 		.name = "pcie4r",
 		.sid = TEGRA194_SID_PCIE4,
 		.regs = {
-			.override = 0x700,
-			.security = 0x704,
+			.sid = {
+				.override = 0x700,
+				.security = 0x704,
+			},
 		},
 	}, {
 		.name = "pcie4w",
 		.sid = TEGRA194_SID_PCIE4,
 		.regs = {
-			.override = 0x708,
-			.security = 0x70c,
+			.sid = {
+				.override = 0x708,
+				.security = 0x70c,
+			},
 		},
 	}, {
 		.name = "pcie5r",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
-			.override = 0x710,
-			.security = 0x714,
+			.sid = {
+				.override = 0x710,
+				.security = 0x714,
+			},
 		},
 	}, {
 		.name = "pcie5w",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
-			.override = 0x718,
-			.security = 0x71c,
+			.sid = {
+				.override = 0x718,
+				.security = 0x71c,
+			},
 		},
 	}, {
 		.name = "ispfalw",
 		.sid = TEGRA194_SID_ISP_FALCON,
 		.regs = {
-			.override = 0x720,
-			.security = 0x724,
+			.sid = {
+				.override = 0x720,
+				.security = 0x724,
+			},
 		},
 	}, {
 		.name = "dla0rda1",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
-			.override = 0x748,
-			.security = 0x74c,
+			.sid = {
+				.override = 0x748,
+				.security = 0x74c,
+			},
 		},
 	}, {
 		.name = "dla1rda1",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
-			.override = 0x750,
-			.security = 0x754,
+			.sid = {
+				.override = 0x750,
+				.security = 0x754,
+			},
 		},
 	}, {
 		.name = "pva0rda1",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x758,
-			.security = 0x75c,
+			.sid = {
+				.override = 0x758,
+				.security = 0x75c,
+			},
 		},
 	}, {
 		.name = "pva0rdb1",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
-			.override = 0x760,
-			.security = 0x764,
+			.sid = {
+				.override = 0x760,
+				.security = 0x764,
+			},
 		},
 	}, {
 		.name = "pva1rda1",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x768,
-			.security = 0x76c,
+			.sid = {
+				.override = 0x768,
+				.security = 0x76c,
+			},
 		},
 	}, {
 		.name = "pva1rdb1",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
-			.override = 0x770,
-			.security = 0x774,
+			.sid = {
+				.override = 0x770,
+				.security = 0x774,
+			},
 		},
 	}, {
 		.name = "pcie5r1",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
-			.override = 0x778,
-			.security = 0x77c,
+			.sid = {
+				.override = 0x778,
+				.security = 0x77c,
+			},
 		},
 	}, {
 		.name = "nvencsrd1",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
-			.override = 0x780,
-			.security = 0x784,
+			.sid = {
+				.override = 0x780,
+				.security = 0x784,
+			},
 		},
 	}, {
 		.name = "nvenc1srd1",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
-			.override = 0x788,
-			.security = 0x78c,
+			.sid = {
+				.override = 0x788,
+				.security = 0x78c,
+			},
 		},
 	}, {
 		.name = "ispra1",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
-			.override = 0x790,
-			.security = 0x794,
+			.sid = {
+				.override = 0x790,
+				.security = 0x794,
+			},
 		},
 	}, {
 		.name = "pcie0r1",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
-			.override = 0x798,
-			.security = 0x79c,
+			.sid = {
+				.override = 0x798,
+				.security = 0x79c,
+			},
 		},
 	}, {
 		.name = "nvdec1srd",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
-			.override = 0x7c8,
-			.security = 0x7cc,
+			.sid = {
+				.override = 0x7c8,
+				.security = 0x7cc,
+			},
 		},
 	}, {
 		.name = "nvdec1srd1",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
-			.override = 0x7d0,
-			.security = 0x7d4,
+			.sid = {
+				.override = 0x7d0,
+				.security = 0x7d4,
+			},
 		},
 	}, {
 		.name = "nvdec1swr",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
-			.override = 0x7d8,
-			.security = 0x7dc,
+			.sid = {
+				.override = 0x7d8,
+				.security = 0x7dc,
+			},
 		},
 	}, {
 		.name = "miu5r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x7e0,
-			.security = 0x7e4,
+			.sid = {
+				.override = 0x7e0,
+				.security = 0x7e4,
+			},
 		},
 	}, {
 		.name = "miu5w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x7e8,
-			.security = 0x7ec,
+			.sid = {
+				.override = 0x7e8,
+				.security = 0x7ec,
+			},
 		},
 	}, {
 		.name = "miu6r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x7f0,
-			.security = 0x7f4,
+			.sid = {
+				.override = 0x7f0,
+				.security = 0x7f4,
+			},
 		},
 	}, {
 		.name = "miu6w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-			.override = 0x7f8,
-			.security = 0x7fc,
+			.sid = {
+				.override = 0x7f8,
+				.security = 0x7fc,
+			},
 		},
 	},
 };
 
-static const struct tegra186_mc_soc tegra194_mc_soc = {
+static const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
 };
@@ -1523,8 +1914,8 @@ static const struct tegra186_mc_soc tegra194_mc_soc = {
 
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
-	struct tegra186_mc *mc;
 	struct resource *res;
+	struct tegra_mc *mc;
 	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
@@ -1552,7 +1943,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 static int tegra186_mc_remove(struct platform_device *pdev)
 {
-	struct tegra186_mc *mc = platform_get_drvdata(pdev);
+	struct tegra_mc *mc = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(mc->dev);
 
@@ -1577,7 +1968,7 @@ static int __maybe_unused tegra186_mc_suspend(struct device *dev)
 
 static int __maybe_unused tegra186_mc_resume(struct device *dev)
 {
-	struct tegra186_mc *mc = dev_get_drvdata(dev);
+	struct tegra_mc *mc = dev_get_drvdata(dev);
 
 	tegra186_mc_program_sid(mc);
 
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index dd26505464c2..9da4ef52ce30 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -26,12 +26,20 @@ struct tegra_mc_timing {
 struct tegra_mc_client {
 	unsigned int id;
 	const char *name;
-	unsigned int swgroup;
+	/*
+	 * For Tegra210 and earlier, this is the SWGROUP ID used for IOVA translations in the
+	 * Tegra SMMU, whereas on Tegra186 and later this is the ID used to override the ARM SMMU
+	 * stream ID used for IOVA translations for the given memory client.
+	 */
+	union {
+		unsigned int swgroup;
+		unsigned int sid;
+	};
 
 	unsigned int fifo_size;
 
 	struct {
-		/* Tegra SMMU enable */
+		/* Tegra SMMU enable (Tegra210 and earlier) */
 		struct {
 			unsigned int reg;
 			unsigned int bit;
@@ -44,6 +52,12 @@ struct tegra_mc_client {
 			unsigned int mask;
 			unsigned int def;
 		} la;
+
+		/* stream ID overrides (Tegra186 and later) */
+		struct {
+			unsigned int override;
+			unsigned int security;
+		} sid;
 	} regs;
 };
 
-- 
2.31.1

