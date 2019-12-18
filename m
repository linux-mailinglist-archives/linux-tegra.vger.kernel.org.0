Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67239125082
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfLRSYE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:24:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46424 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLRSYD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:24:03 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so786614ljc.13
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e9ZPaIdtRatUUkVItFCyqVU4YKM3IlyB5EhAbZjnKfA=;
        b=qJ9GrhNeEVEILE67S4vqwXeqDQ9HNasMFOlyiO61CNn8soBAPK6WioxNI8Yp9kW7zt
         2bP1kFMY5Mxm3nATkNA9RMq6yuldjzJfiGlFXgSUJQLF+/ZIIOof4IQ3p+LC/NDDlykF
         zm8HifpvlEmZ/WCqfXRok9/d5ZFVUVIKK5LbdgBF7yQHNwlmOKHGYCE0CsGv3crWPgwh
         iqzQja8jhxhjy9lXFrkpzcdGhpAr7tBwvE9WaUtTUZcZi56Hd3O6pPwi8bnnrGSaDqqe
         Q1tClsCjEcTqmkAE4avaK3G1ZCO9Kx4Cx/l6kdECMSUiNeWppxKZiHZI4Bt2r1QC9JoW
         ZJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e9ZPaIdtRatUUkVItFCyqVU4YKM3IlyB5EhAbZjnKfA=;
        b=feWiJFhaiP6a27UpcyNxTIISVOKLpopbCoRWOpWX0zum4Ag48ErU687FAKo7b9oU/G
         O58fNbpdL1oGt+ADOt/MsZI9qpcD4kniHY56mSGyrkCIGy4D8MNnATThM9x78UEMxMQe
         kimDq5ZBMMiZRk6L5UuyW53vfz/UDv1sZjAGRFCHWJTlpehEnCXQx45Fx2Ypfdhr/mBU
         mFILASwILuqC51SRdRwDZ4Sq5E8k+1m/KQ7yhp9lquWYwb/fXJWp5tm91NGKYemXh56y
         dIMm3ZkULSXuYlwfQwBKpESAvjXIGmtk9uds85t5cGFZwesJCbZM205YvJXCpu7/H3wR
         CCEg==
X-Gm-Message-State: APjAAAWu+7E/AHzReoKxMDlLCTSxyxKgoM8xFxAojCEKfUhQhL8sO+2X
        /jVN/HJkwIRxkR1U5JbuCzU=
X-Google-Smtp-Source: APXvYqwIxbdtpALb6f+/vTQ9HtT4SfDvg4sSvXzAI9aB4p3CZejMqIqg6u02FRJvFpefUoc8jPhlhg==
X-Received: by 2002:a05:651c:1032:: with SMTP id w18mr2901539ljm.61.1576693441974;
        Wed, 18 Dec 2019 10:24:01 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s7sm1588154ljo.43.2019.12.18.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:24:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v4 3/4] soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
Date:   Wed, 18 Dec 2019 21:23:03 +0300
Message-Id: <20191218182304.21956-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218182304.21956-1-digetx@gmail.com>
References: <20191218182304.21956-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Trying to read out Chip ID before APBMISC registers are mapped won't
succeed, in a result Tegra124 gets a wrong address for the HW straps
register if machine uses an old outdated device tree.

Fixes: 297c4f3dcbff ("soc/tegra: fuse: Restrict legacy code to 32-bit ARM")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 8d26bee3cedc..1f4308be6ec4 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -120,7 +120,7 @@ void __init tegra_init_apbmisc(void)
 			apbmisc.flags = IORESOURCE_MEM;
 
 			/* strapping options */
-			if (tegra_get_chip_id() == TEGRA124) {
+			if (of_machine_is_compatible("nvidia,tegra124")) {
 				straps.start = 0x7000e864;
 				straps.end = 0x7000e867;
 			} else {
-- 
2.24.0

