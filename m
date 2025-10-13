Return-Path: <linux-tegra+bounces-9835-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BABD32DC
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Oct 2025 15:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 319974F320E
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Oct 2025 13:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314F27144E;
	Mon, 13 Oct 2025 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gcX5/t0H"
X-Original-To: linux-tegra@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D61547D2
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361647; cv=none; b=rIrsD7fgNIRphAq43MB3OhtwAKOGeRkH1eGtRHwxnBGU5oxYBgcluBp7GTt0RnKfeKAvo25T8OwCWOQzrZwFw8i3DuIV0U85d2REtjBjtBnEns++hLlCcICY/swvANQHmG2k7wj3Dfk+CdCHDQnNja1SZzhZsFYI9eC70jlthyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361647; c=relaxed/simple;
	bh=wBV+1aZnEOkyIM0jJ14iKfrdBgNi5hFTOoCrxqQghPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUYNTr5OQy2gyjak1psq3lAXuwMLgRhuqL7zZucJl+qJDS8A1NpkrRzRsDWkFWTA81BRGmEkqRl7HQgUePhr0Jt76OUNc60UiunTPbNg1pwrLAYeWYUlaE7ybYllE4Po0le9W8/Z+UJ48A9/LLO/ymfQitsWK1ULpARAAcJ+5Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gcX5/t0H; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760361642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B4FedS6ZPBrFJ1RksF5rENktGQfjCc8C/sdHc03ViEQ=;
	b=gcX5/t0H15SwwR/UtEHIJ+3WQg5ow0yzmPRycjb8uC6aZwIFdstYxyFNEOE8nSSY5jKLhH
	ju0ui6O1KpCdRN5UoeU5/10ZtPh6TlAiQ/WjYTnJkRiWrta6X0wn/va77b7iJ8keCktSLP
	wlTC6xPta2ATdVoU7cwFwE3ABz0MmkI=
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
Subject: [PATCH RESEND] PM / devfreq: tegra30: use min to simplify actmon_cpu_to_emc_rate
Date: Mon, 13 Oct 2025 15:18:26 +0200
Message-ID: <20251013131825.31400-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to improve the readability of actmon_cpu_to_emc_rate() and
remove any unnecessary curly braces.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/devfreq/tegra30-devfreq.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 4a4f0106ab9d..2c9813bd697e 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -326,14 +327,9 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
 	unsigned int i;
 	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
 
-	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
-		if (cpu_freq >= ratio->cpu_freq) {
-			if (ratio->emc_freq >= tegra->max_freq)
-				return tegra->max_freq;
-			else
-				return ratio->emc_freq;
-		}
-	}
+	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++)
+		if (cpu_freq >= ratio->cpu_freq)
+			return min(ratio->emc_freq, tegra->max_freq);
 
 	return 0;
 }
-- 
2.51.0


