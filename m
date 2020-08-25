Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7B5251171
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Aug 2020 07:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgHYFYe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Aug 2020 01:24:34 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2897 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgHYFYd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 01:24:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f44a01a0000>; Mon, 24 Aug 2020 22:22:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 22:24:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 24 Aug 2020 22:24:33 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:24:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 25 Aug 2020 05:24:33 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f44a08f0000>; Mon, 24 Aug 2020 22:24:32 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <aplattner@nvidia.com>, <spujar@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH 2/2] ALSA: hda/tegra: Program WAKEEN register for Tegra
Date:   Tue, 25 Aug 2020 10:54:15 +0530
Message-ID: <20200825052415.20626-3-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825052415.20626-1-mkumard@nvidia.com>
References: <20200825052415.20626-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598332954; bh=V3k7pXWGgN/GZqoe8TtrBUUNuwi6xsjpgkCnABrzqZw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=Ed1atWGoVtIPM0hItslm2xpcLvv1ty/Cmb0WPt+BLSTIwtfDYU8ZC0npsWBS6olqn
         EqsQ34LoR4h9BiKTZcm2WTSBtQtModoyvIe5JAVez7opiWjWocHg2X1tAnNXOB0WUb
         gIrYFFrj14MQIiQt1/9baPSCyuWBUjqs7cmrvboJOIHnpAosflz5wU5lfq0nSzIp7F
         2piJJEfpJ46LWhUydEFewcY8a71Or78RoTpAQGGvU0fFWdxitKnUHQ6uQ5Sk11MYuX
         ocDenPh9tg4+wJh7/J93aBgH+mgkC0Lwh8IyL+NdVV5Pc/2keCTu9e6tG245apwXCK
         jd4buSbx4WnrQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The WAKEEN bits are used to indicate which bits in the
STATESTS register may cause wake event during the codec
state change request. Configure the WAKEEN register for
the Tegra to detect the wake events.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index c94553bcca88..70164d1428d4 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -179,6 +179,10 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 
 	if (chip && chip->running) {
+		/* enable controller wake up event */
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+			   STATESTS_INT_MASK);
+
 		azx_stop_chip(chip);
 		azx_enter_link_reset(chip);
 	}
@@ -200,6 +204,9 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	if (chip && chip->running) {
 		hda_tegra_init(hda);
 		azx_init_chip(chip, 1);
+		/* disable controller wake up event*/
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
+			   ~STATESTS_INT_MASK);
 	}
 
 	return 0;
-- 
2.17.1

