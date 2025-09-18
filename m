Return-Path: <linux-tegra+bounces-9259-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3CB57987
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Sep 2025 13:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B912818935D6
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Sep 2025 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4132E2EA482;
	Mon, 15 Sep 2025 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m7lzQF6b"
X-Original-To: linux-tegra@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE842765FF
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937416; cv=none; b=OLiO0m59v2kIqYeSxp4oiO61yCTwDBDpnWYOzEhzp2IG6i5G+5XhU53LcO1O/2odKYSgoJ1jMgWe8gXlTHSXT69S7pNBlR7fEx0ZRMrzQU22sSR0aPWut5KN4R91wVln7tz2ELg8kdPfM4MIxdNapgfF97AZFOCtdD5J0sdrSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937416; c=relaxed/simple;
	bh=fA4MlAIn7P1pBX/89vOZIi4pnvENU8A6OalvZ9lhyUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9rYqei2eSvze7tfamBecldZ0XuRj3CkY8VfY7e7OSZ4XYqaoHifNxRTt+0XMHDKI26L6WMuDcZBXwvSocD+Aads/Aka3vEuErbFs8D/2S8WfwDYB5Ensbx965AgI4voaxltHlCbq1Y8FTpglWOmzelARp0x6U2RWGRuQCYQbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m7lzQF6b; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757937410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JVVGhrqsmL4odmIDg4NNn1VRpJaq1RD433dc/e6m7/I=;
	b=m7lzQF6bpIU0zWTJt4VYQVIVA5KoWH3Oha1hmVSrZEtMQYWjg3kW7Hm+dYfGTh8JudNVrJ
	fSL4UxEAOoeJsp2jwXemfRNXbxPh4LGp9Jdd44m4/7CLvDvRzdeGP8Nc/kJm+va1WRSJG8
	68Ts/yJrq7PM2lIdeI/peOOK5+IueG0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PM / devfreq: tegra30: use designated initializers for tegra_actmon_emc_ratio
Date: Mon, 15 Sep 2025 13:55:55 +0200
Message-ID: <20250915115554.2150603-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Switch actmon_emc_ratios[] to the more modern and flexible designated
initializers. This improves readability and allows struct fields to be
reordered.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/devfreq/tegra30-devfreq.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 4a4f0106ab9d..890990e03335 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -206,13 +206,13 @@ struct tegra_actmon_emc_ratio {
 };
 
 static const struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
-	{ 1400000,    KHZ_MAX },
-	{ 1200000,    750000 },
-	{ 1100000,    600000 },
-	{ 1000000,    500000 },
-	{  800000,    375000 },
-	{  500000,    200000 },
-	{  250000,    100000 },
+	{ .cpu_freq = 1400000, .emc_freq = KHZ_MAX },
+	{ .cpu_freq = 1200000, .emc_freq = 750000 },
+	{ .cpu_freq = 1100000, .emc_freq = 600000 },
+	{ .cpu_freq = 1000000, .emc_freq = 500000 },
+	{ .cpu_freq =  800000, .emc_freq = 375000 },
+	{ .cpu_freq =  500000, .emc_freq = 200000 },
+	{ .cpu_freq =  250000, .emc_freq = 100000 },
 };
 
 static u32 actmon_readl(struct tegra_devfreq *tegra, u32 offset)
-- 
2.51.0


