Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40355184305
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 09:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCMI6L (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 04:58:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39716 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgCMI6L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 04:58:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id f10so9618208ljn.6
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Qd0FS+13R/cg1lkRBLN5R3iXvdjLcnj7kmiW6NoyUg=;
        b=q2YgbLpCb7aDN9+cn7eIb2ItnKJ0pwOYV1o3ZHcVZhp1U5h/E4nefoYE2HZVN9nRxT
         X4rVeX0ASpWaxv6zEAGB3SXhgZubWWJ1enaNjFHzvLHHj2RvJCO9JQSqctPG0Glne4N0
         zFhCfyPBrGrQWmlv/hhltB2S9rhR8Zcgc6mmhj/ItFXgPHXKKuZYNRwfpTEHw/9XK5XU
         XeJLXVe10/GM+X1P4IXVNVuFJEeiJuU+hV1+2MdIfb6ULGY5FUB8RP7g3v+C+Wl8ohkt
         H+G+KJf/1adCarP64ky/ktZEj89AkN7XBUHK2D2ncS5vFYSPT0h8QsQIJ/cbSjP+drB0
         Rekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Qd0FS+13R/cg1lkRBLN5R3iXvdjLcnj7kmiW6NoyUg=;
        b=XDalZwMewS8GeV7TB+y+0kRrmyaVFUHUL5UgiaKPqTGeqTVKR8vMye95/FyIILKwP6
         XceKSXzZbgc4w/OAQrdze7DdCDCfXN46zdii6lTMem5NYw/kTg6SxILp5p0ii5NaxzxS
         qy90MQktS6mgFHZ1GplAowmPB8MgpBjm1T7ceqJSuLAhurl5IEW4D9UdSakRRrv5JFC2
         mR8z+N5TkTKeiJMirMkI6jEchGolAtsjVG8seo74CuCw+fFk6vkFGWYFc1pEjwZZpsaR
         nr31skGoL85VvmHgZn4JMsfyKIjThSsynQQC4xpyVz+TwXRxfEq1fxA1+cCZZV99f9Du
         41lg==
X-Gm-Message-State: ANhLgQ1lj8TcPdZ+LDgaC0BMCwr2MmYEvcERqwxfqGqBhj4bwfGcFd3M
        ti4/mcGNYOhU0fmCK5u9d4TFVl6S
X-Google-Smtp-Source: ADFU+vvQcqy7NnToZEPGfI48g4d0GRyBKLkeyXpgHKH5BJTZt3HCCTjNoNrbtOgAgeqCwPn39k+yNQ==
X-Received: by 2002:a2e:9b87:: with SMTP id z7mr7505401lji.197.1584089889456;
        Fri, 13 Mar 2020 01:58:09 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id m18sm6032181ljj.52.2020.03.13.01.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 01:58:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra: Make debugfs permissions human-readable
Date:   Fri, 13 Mar 2020 11:57:39 +0300
Message-Id: <20200313085739.20172-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace the symbolic permissions with octals in order to make them
readable.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 6 +++---
 drivers/memory/tegra/tegra20-emc.c  | 6 +++---
 drivers/memory/tegra/tegra30-emc.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 33b8216bac30..d19fb7ae230d 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1178,11 +1178,11 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index b16715e9515d..f74dd417c874 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -647,11 +647,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index b42bdb667e85..727dc7153390 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1275,11 +1275,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
-- 
2.25.1

