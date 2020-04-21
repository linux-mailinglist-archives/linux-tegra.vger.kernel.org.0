Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84B21B326E
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 00:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDUWBB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Apr 2020 18:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgDUWBB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 18:01:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F64C0610D5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 15:01:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u127so22362wmg.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6AyHLOTZao8epI2YFOeKhft6dXxmLHMbz1NBrxSQgIU=;
        b=DrJU+M4rLkdb8ASj/JJsH3Gh6B42FOHsIOYnm9QZ9q6Z4z5m5qewETOsHDnB56Jw5Y
         njqqrfHM9Mzq3LHVChjx54D5FqFtEnikIjaPBQSaLB3n09NI6VSybXZ86yWo9sjbfnzo
         9aTrtKj0aPf11+FZ0pWu3f99BeOuGlWUP9N6BcRsbYrw4FWKZ1CiVjzFkBea1R/xt5D/
         OP4By5NgzSn0R6buB37OWWV3pOlA05rf9ZlogWO+n5UIef+DP4wmg1eL1F3BCjX2koxY
         nPU2utw8XiRw3WR/PbF9jJIJdXhZpC3U+c47q6zO1BTNgt7QbjkS3AkyWA1hrDdyzZ49
         bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6AyHLOTZao8epI2YFOeKhft6dXxmLHMbz1NBrxSQgIU=;
        b=e+fGn+Ct8J/Yl2EGMUeUQc3I0Q0zuHUkqSM9sKYI9vr9NsVBYJXxEA+IOi0AQUoEHL
         yaQ0aIiACfdd34ucoenWGMjg99fMfNwx/hwz8CS5+wLNuW2JC52iUuH85ERZCqmBPc+1
         N8HTyZEoqOfYxnO7QTyXbynf2n2h+DlsQ9cS6e245ZTS3n7LgUwmi75gmI9pIBggjD2V
         Blib+/f1+6nNINhX0dLgBZCJ6gbb2Ibq/oxLceCP4DrVWP4+yBrMhBAmJ1NGtKVTvB3K
         HO+xQW0kAzaf3uQHK2pZiT0wJYigZxzhjGMYHIiyz/NdLc153BZUzIyt8aA9cDZWmGJA
         sbPQ==
X-Gm-Message-State: AGi0PuY8G54XLlYKJM2BOyRtp5FCjfVLsBOTE4l8oxJznx701MZK8Gee
        tCBgS+BiY1mgWyHpPAVEHAMxH4RC
X-Google-Smtp-Source: APiQypJGHMIeDkpwNvyI+qkhVGVIY4+32vcT29mvquU8eOzHfdr5ghoBLU3cBzaJzInvcOKVg82FNg==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr6721404wmi.187.1587506459564;
        Tue, 21 Apr 2020 15:00:59 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h6sm5303447wmf.31.2020.04.21.15.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 15:00:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] firmware: tegra: Make BPMP a regular driver
Date:   Wed, 22 Apr 2020 00:00:53 +0200
Message-Id: <20200421220053.3442050-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra BPMP driver typically ends up deferring probe because it wants
to attach to the SMMU, so there's little sense in registering it at the
core init-level.

One side-effect of this is that the driver will be probed later even if
it doesn't want to attach to an SMMU, which means that consumers will
end up deferring probe, which in turn takes care of ordering the suspend
and resume queue in the correct way. Currently since suspend/resume
order depends on instantiation order, and because BPMP is listed at the
very end of the device tree (after most of its consumers), the suspend
and resume queue is ordered wrongly, which can cause issues for drivers
(like I2C) which suspend after and resume before BPMP. In the case of
I2C this typically leads to the clock failing to enable.

Besides fixing this suspend/resume ordering issue, this also has the
added benefit of allowing the driver to be built as a loadable module,
which can help decrease the size of multiplatform kernel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- make driver a builtin platform driver and suppress sysfs bind/unbind

 drivers/firmware/tegra/bpmp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 6741fcda0c37..fe6702df24bf 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -6,6 +6,7 @@
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -869,12 +870,8 @@ static struct platform_driver tegra_bpmp_driver = {
 		.name = "tegra-bpmp",
 		.of_match_table = tegra_bpmp_match,
 		.pm = &tegra_bpmp_pm_ops,
+		.suppress_bind_attrs = true,
 	},
 	.probe = tegra_bpmp_probe,
 };
-
-static int __init tegra_bpmp_init(void)
-{
-	return platform_driver_register(&tegra_bpmp_driver);
-}
-core_initcall(tegra_bpmp_init);
+builtin_platform_driver(tegra_bpmp_driver);
-- 
2.24.1

