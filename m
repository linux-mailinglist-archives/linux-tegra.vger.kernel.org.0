Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39E738B591
	for <lists+linux-tegra@lfdr.de>; Thu, 20 May 2021 19:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbhETRzs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 May 2021 13:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbhETRzr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 May 2021 13:55:47 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4556C061574;
        Thu, 20 May 2021 10:54:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s25so20815768ljo.11;
        Thu, 20 May 2021 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WThPHKM7iSba8Whu/G9QUXQ8YH93gA2YmlB6ZOz1qoA=;
        b=YBMu4GlMCvn+hO0b3zU9L4KLg/GYY1HMLc+ebHWRqVjq3maTtrVeao26FpmL2fyftc
         6OHKbnneDfUGbCfRj9SdEGuxHGYhCWFzhj5YjdeH/JV8Wu/volHOZqYzHcF73Yd3f5Gv
         JYm6mHluQjbhyIPWCtHThDvEKL1URyCadBITsQ9KySnsVuL1mFl9dcTizt0lxTROGihK
         wfGJgH9cwOC9FLb14wKUWiT8DSPagQ9ktvGJ9CE1ldExMQ5pk/sdaJq32aR3kj+MJQnc
         ODlB61WG2w8z2LRj2iypp7zoLm7pNbwYjHaNrRp9OGP55EnWwF8HKfCi4ibyM3aQfq5X
         1w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WThPHKM7iSba8Whu/G9QUXQ8YH93gA2YmlB6ZOz1qoA=;
        b=b/DL+yLE9mO5lLdW3Rp+vOplbUPdYnK2yQlocjdtwgyddwOwY71OcIo/5oS1KvRNdw
         Fjo22FoJPSheQ6PRSAm6IELqkgMS0IWqrmhNcr4AQgyqpMJKNqVV7/1B9oZ3lsVEqG7M
         UTaEQQshdCur0B8gL5BYid7lLCLVjdyRnFMnn35AJTO9faa6DN3sBDYdc9UdMM1d6fwd
         L7Kt19nQRZ7Dj0rsAe13ACkGZ4GfW2heVgxzxwjiggYhZqntwfNL7gJswQERDDjEuGEl
         OS+wFB+kNQrDLFDUDixvdZgl+1iWMj4vANx51PgGkIBUYAJarmkc1MENgyAZZKZGUHPN
         8+4A==
X-Gm-Message-State: AOAM531JRjT3FUohbBGhwAV70M+6qk9Z6dl26hcNXZOobuvMk70FjkpB
        RJZpWPcR4IJtGb8IKOl7ms/NmbgDaa0=
X-Google-Smtp-Source: ABdhPJxhqeu/pnINJiLZI5usPw0N2F3gPnqxt5mNwx1+lXSpa7/y2PPsPPRoHG7yiqhQPqxKdhqAFA==
X-Received: by 2002:a2e:9682:: with SMTP id q2mr3752256lji.104.1621533264092;
        Thu, 20 May 2021 10:54:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-88.dynamic.spd-mgts.ru. [109.252.193.88])
        by smtp.gmail.com with ESMTPSA id h16sm362972ljb.128.2021.05.20.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:54:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: tegra: Set driver_name=tegra for all machine drivers
Date:   Thu, 20 May 2021 20:50:53 +0300
Message-Id: <20210520175054.28308-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520175054.28308-1-digetx@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver_name="tegra" is now required by the newer ALSA UCMs, otherwise
Tegra UCMs don't match by the path/name.

All Tegra machine drivers are specifying the card's name, but it has no
effect if model name is specified in the device-tree since it overrides
the card's name. We need to set the driver_name to "tegra" in order to
get a usable lookup path for the updated ALSA UCMs. The new UCM lookup
path has a form of driver_name/card_name.

The old lookup paths that are based on driver module name continue to
work as before. Note that UCM matching never worked for Tegra ASoC drivers
if they were compiled as built-in, this is fixed by supporting the new
naming scheme.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_ac97.c   | 1 +
 sound/soc/tegra/tegra_alc5632.c  | 1 +
 sound/soc/tegra/tegra_max98090.c | 1 +
 sound/soc/tegra/tegra_rt5640.c   | 1 +
 sound/soc/tegra/tegra_rt5677.c   | 1 +
 sound/soc/tegra/tegra_sgtl5000.c | 1 +
 sound/soc/tegra/tegra_wm8753.c   | 1 +
 sound/soc/tegra/tegra_wm8903.c   | 1 +
 sound/soc/tegra/tegra_wm9712.c   | 1 +
 sound/soc/tegra/trimslice.c      | 1 +
 10 files changed, 10 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index c454a34c15c4..66828c1a2a3a 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -220,6 +220,7 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 
 static struct snd_soc_dai_driver tegra20_ac97_dai = {
 	.name = "tegra-ac97-pcm",
+	.driver_name = "tegra",
 	.probe = tegra20_ac97_probe,
 	.playback = {
 		.stream_name = "PCM Playback",
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 0a0efd24e4b0..81ea6ceba689 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -139,6 +139,7 @@ static struct snd_soc_dai_link tegra_alc5632_dai = {
 
 static struct snd_soc_card snd_soc_tegra_alc5632 = {
 	.name = "tegra-alc5632",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_alc5632_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 00c19704057b..5a649810c0c8 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -182,6 +182,7 @@ static struct snd_soc_dai_link tegra_max98090_dai = {
 
 static struct snd_soc_card snd_soc_tegra_max98090 = {
 	.name = "tegra-max98090",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_max98090_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 9afba37a3b08..3344f16258be 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -132,6 +132,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
 	.name = "tegra-rt5640",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index d30f8b6deda4..0f03e97d9355 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -175,6 +175,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
 	.name = "tegra-rt5677",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 885332170c77..ef6a553e0b7d 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -97,6 +97,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
 	.name = "tegra-sgtl5000",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index efd793886689..27089077f2ea 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -101,6 +101,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
 	.name = "tegra-wm8753",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index e4863fa37b0c..f219c26d66a3 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -235,6 +235,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.name = "tegra-wm8903",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 4f09a178049d..c66da161c85a 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -54,6 +54,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
 	.name = "tegra-wm9712",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 6c1cc3d0ac33..cb4c8f72e4e6 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -94,6 +94,7 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 
 static struct snd_soc_card snd_soc_trimslice = {
 	.name = "tegra-trimslice",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &trimslice_tlv320aic23_dai,
 	.num_links = 1,
-- 
2.30.2

