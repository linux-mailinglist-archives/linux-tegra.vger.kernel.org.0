Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B58AB16B61B
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2020 00:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgBXX7m (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Feb 2020 18:59:42 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33654 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgBXX7l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Feb 2020 18:59:41 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so8211475lfl.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2020 15:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ynhyMD8DXE00wajU9APZEqBUSQvr8FUxxlfgLm6/Do8=;
        b=JffDBgzMxbV+4g0aX/UgZbq+W5lSCNTicSK1BPBh74s9++7f+a61ApXHNzcnBVqft1
         vYea1jq/XuEcaQv59G5dOZ8TRLeJtjIi2dQhAlEbl3NO5mQ6SqI+xfF1GOjluMI8xBpA
         wiw0CmJZE0VU0QPuiBfBkQyiVHPv3it//gUfuqWgyPpbi7alnGA3tJ9q0not00xUzrpr
         H14pbf7wTTzJz2DgViU8/ZAZcb4bdCojqzIWKNapQFoQ2S8iG87vqB5YZPvXMkrOoWj4
         xEGdf2m5BvTgTOYPoWdmGVfOuTObNx4rxAd9qrE8I1wy1u+NEjagVWYRGI08lm3MICMr
         Kj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynhyMD8DXE00wajU9APZEqBUSQvr8FUxxlfgLm6/Do8=;
        b=A3WMNymqZCmfBasN0DExZYPaZc1p7Q6iPaOlX9RXX7RA5FvcZ6N+QdBVstZcGEIrDK
         pKahdMJkb7OvWHugIHb5QTr8dYog3phZscTdn7Tri/9BE2DNIWOCfnuu3D8vaFg3yScU
         vUZs3gnxaqOXjF3P+3k4GWhelu5lsAhvK6UZe9cvtqugU2NIJ8i+DSEFHhFsT1KcsWmv
         +BaomCHxpkYX0u5TWIT/Lf+ZN2n33WVpifYif+aDUS/GBXMpqrEqskbX3CSJg4cW6Zn9
         c1X/eRGQIAizThbm5KA4MwO2lLQHWftwt3p7mUDW69Veo+1f2zwUcfD7Kd0LBTuAAK0c
         firw==
X-Gm-Message-State: APjAAAVy5wVkU9OJOBLXQV1ytn4htB2LHx/L36PaO9NsgJNZajBbuAT6
        1sg3S5xafFvh+eovUKb+HYBzUIFP
X-Google-Smtp-Source: APXvYqy50z63Gu5j+h/BChDNJIPubpFYdyoXfeuWya7HqA3B3vK42Pe+JvYkS7BrGIG9LRMEAD/iVQ==
X-Received: by 2002:ac2:4c10:: with SMTP id t16mr527610lfq.38.1582588780027;
        Mon, 24 Feb 2020 15:59:40 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d26sm6323774lfa.44.2020.02.24.15.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 15:59:39 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] memory: tegra: Correct debugfs clk rate-range on Tegra30
Date:   Tue, 25 Feb 2020 02:58:35 +0300
Message-Id: <20200224235836.30694-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200224235836.30694-1-digetx@gmail.com>
References: <20200224235836.30694-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Correctly set clk rate-range if number of available timings is zero.
This fixes noisy "invalid range [4294967295, 0]" error messages during
boot.

Fixes: 8cee32b40040 ("memory: tegra: Implement EMC debugfs interface on Tegra30")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index d8372051963f..681fe2dde05d 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1264,6 +1264,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			emc->debugfs.max_rate = emc->timings[i].rate;
 	}
 
+	if (!emc->num_timings) {
+		emc->debugfs.min_rate = clk_get_rate(emc->clk);
+		emc->debugfs.max_rate = emc->debugfs.min_rate;
+	}
+
 	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
 				 emc->debugfs.max_rate);
 	if (err < 0) {
-- 
2.24.0

