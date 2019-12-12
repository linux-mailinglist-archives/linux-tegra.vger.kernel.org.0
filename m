Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6EC911CC11
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Dec 2019 12:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfLLLTf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Dec 2019 06:19:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52327 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfLLLTf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Dec 2019 06:19:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so1940515wmc.2
        for <linux-tegra@vger.kernel.org>; Thu, 12 Dec 2019 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvzqdcYxA2Ih2nOFsGjLKz4QF8pvHLdubZ66hDHBrao=;
        b=cVBfRO8mU1WGThZ2ndtOWSZqkIkx1um8Amx/yPLyePvs8UMXsL7fTGyLx0YxVzjh+U
         2nPg1yBkUnuCj/bJ0jzh2DT5Ay6KKumycuUvbkarnP2ScDpOgOdS8EbwJXfVCgEcy5a2
         2RfJVlCmNTNYWfI0L3AN0tYNw2ucbnwZ8MpPFzvyZMoIVrh+oYLSxaThMyGHa8Extldl
         W/Jc+ex4gYM/Xvv1BAMG62Vv6mK4dF3OU7IfXsZxPg2ivD3lNicz2OnoMe0lYSNkZkCi
         rOSkKN8kpxLSCnB0rWzXsxDp25sGZ1lWOVhB6UHnfSF/vOXAl8/BOHER5By9MkWCe4NP
         WUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvzqdcYxA2Ih2nOFsGjLKz4QF8pvHLdubZ66hDHBrao=;
        b=sSKwM8/KYmVpFE6BhVWLBVZFB8rMyKHQFNukkDZPmUawc/auM7HTMF11/lFyA5dO5M
         M3LRga9tv83bV3ai5ggQaYV4o+dnFhOVJnf/8oeiPrZ049ALN1Qj/TG5S9gzdq+C1CRe
         j8C5+rHSMHZtfOBdO6aRD2TNmoIXMzfPNi2V490Tpxenw+O9SjSeUsO6923jsOkoEHNl
         fMD0PQEf5yuKQoW+gFIzngytupz8u+TNoOZLLh/NFqS0bFn1M8zdM0Q5YDv0qV3YHDpS
         lrpyXlqSNKpuH0XqX2sS0vy3sWaAAys3kCgb8TNx3kidnuQ1uFSJEiLIxOyh4s4Y1jWC
         3u7A==
X-Gm-Message-State: APjAAAXMQ2OHdcV1ZsZbI9RsOEl5AnTUpGKvcWXEPbPS7dvdNj07EbLn
        zlUmj8YAXQOQKtaZVSEfooM=
X-Google-Smtp-Source: APXvYqy3ADNkXi49Zs+iSOmxIDNi2tv5viAIj0F9iFvK64Elr5OIsXB08Wmm9n783/JaACLFnDVNEg==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr5775813wmi.57.1576149572891;
        Thu, 12 Dec 2019 03:19:32 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 2sm5727134wrq.31.2019.12.12.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 03:19:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] ALSA: hda/tegra: Remove unused "bus" variable
Date:   Thu, 12 Dec 2019 12:19:30 +0100
Message-Id: <20191212111930.3076101-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

After commit f36da9406e66 ("ALSA: hda: Support PCM sync_stop"), the
local "bus" variable is no longer used. Remove it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index fc2e0a294bc1..269f242fcbfd 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -166,7 +166,6 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
-	struct hdac_bus *bus = azx_bus(chip);
 
 	if (chip && chip->running) {
 		azx_stop_chip(chip);
-- 
2.23.0

