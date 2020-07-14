Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733C821F6C0
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 18:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgGNQIy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 12:08:54 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6623 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgGNQIx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 12:08:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0dd85b0002>; Tue, 14 Jul 2020 09:07:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 09:08:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 09:08:53 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 16:08:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 14 Jul 2020 16:08:53 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.72.103]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0dd8930000>; Tue, 14 Jul 2020 09:08:52 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Mohan Kumar <mkumard@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ALSA: hda/tegra: Disable sync-write operation
Date:   Tue, 14 Jul 2020 17:08:41 +0100
Message-ID: <20200714160841.2293-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594742875; bh=i3gz+Ja8f4tqrDDaz10qB5uT8lawrEDmEtgIcA+J9Qo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=USlGF96EkTRhPtE8f3OM1kGfq3EBY1kAaLFAP6I2NTJxcUJxr1UxmVpKTXuZSZ4S4
         krtACtUZe1lGW5UPAM5tnY5hhRy6aux9FRXrXu3CiM8AAiFWXX6lSfWvdeEbipVZ1h
         5X640rG/Y0LR/I84AJ0905spH+jtI11NFjlV/83eT4o+S+IzAyTa69//jp08Nvq4uQ
         U2IK4nckWwHKysHYIqO26QFD4RicL7d9jT+NSRPdmRtaN2VaYRc2GrTCmr1cKsAgKZ
         dClcqy48FfjQmQ6MtYJ9jahRseEutcWG/hhqOsbyJCFBr2xzkgKbrWZNOMFGPwFxKd
         HXcRrgcbPY1Lw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit f34a4c9dd4ca ("ALSA: hda: Enable sync-write operation as default
for all controllers") enabled sync-write for all controllers and this is
causing audio playback on the Tegra186 HDA device to fail. For now,
disable sync-write support for Tegra to fix this.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 0cc5fad1af8a..5637f0129932 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
+	chip->bus.core.sync_write = 0;
 	chip->bus.core.needs_damn_long_delay = 1;
 	chip->bus.core.aligned_mmio = 1;
 
-- 
2.17.1

