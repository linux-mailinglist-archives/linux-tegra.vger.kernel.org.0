Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D9116B61C
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2020 00:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgBXX7l (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Feb 2020 18:59:41 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36427 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgBXX7l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Feb 2020 18:59:41 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so12059950ljg.3
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2020 15:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7huog+IHSp9ffZ5JpctU4MpKi70tneZIHShuG9qDPyY=;
        b=oq7tabT4uM6bkLnzNJePe7HWAnP59D5x+ZJwC6I91aD4PFddZqtHURP00aY/7Rf7y3
         4g/sDM7OktbNG8ODQd4WRy+YW22A4F5M7iZucSmGzgnBExyGQWNWWrHJJA6KehPEPxKr
         nYidoBhM35P83Ku0Xc8HeoR4eNup76cYANFafmKlDJpBy6O0pg2AM0Jj+WY4DWcMof8R
         q1VFh8Y0VOWFsl9BrfQbe3lLpnvpofolX6TW5uJGMW+msUmc4RQ1czPwsLopDHJyMxdc
         U/Yb2kJA0zpuYkDiEcl2E2cXtQ0WSCLnLhNUW3VaDRPwlvEQuvVqnC6h03ePRIQaYlEG
         c3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7huog+IHSp9ffZ5JpctU4MpKi70tneZIHShuG9qDPyY=;
        b=UM4NTIgDUgFepmFh8KkW3meq8RHMzFw2/omepkahUAz+TSWP0Mi1Jj8s2yrZ60pAeH
         X91YN6LHduzTQ1h0KD2IGaqUYCjyAhpvfKLuwtc9FEBmV922C4lRUVTPoolXRziV1G9H
         9FaheZHSW/yE2bRx9Vx2n8IrKCC4ZoZdsXlDpbFJRx/PvD333Nwkt4UC86VrvjllnvIP
         zHGqZ4xXXH008hYIF0yQeIBUsb254lKiLbAXRNnoDtR4qql7lE3Dc+RJ1KdDQDCUOwNT
         nitLb4qgG7ZzL9pfALops8KmszH8Ciz+lPoOWR/G4I/B7KsC+oinjk4Dqfzl9rLVpYep
         8GGQ==
X-Gm-Message-State: APjAAAWbtx1WABgVcMOQw/xtLbXCO6xaxxiItDTARM69yX4IHmUW+Cf5
        C2+q1nTDrw95CPePHrr42NA=
X-Google-Smtp-Source: APXvYqyMJhn9t5+Z7nDDwKxjA+8ZE3lCmsjVhe2vgLrla/ebduZ2Ju3c4qKJYP7+tLTURwbrYm+gBw==
X-Received: by 2002:a2e:6a19:: with SMTP id f25mr33346311ljc.27.1582588779266;
        Mon, 24 Feb 2020 15:59:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d26sm6323774lfa.44.2020.02.24.15.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 15:59:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] memory: tegra: Correct debugfs clk rate-range on Tegra20
Date:   Tue, 25 Feb 2020 02:58:34 +0300
Message-Id: <20200224235836.30694-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Correctly set clk rate-range if number of available timings is zero.
This fixes noisy "invalid range [4294967295, 0]" error messages during
boot.

Fixes: 8209eefa3d37 ("memory: tegra: Implement EMC debugfs interface on Tegra20")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 313a95fa23d4..eb30484656bc 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -637,6 +637,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
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

