Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BC1140C8
	for <lists+linux-tegra@lfdr.de>; Sun,  5 May 2019 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfEEPsk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 May 2019 11:48:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41559 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbfEEPsk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 May 2019 11:48:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id k8so9025384lja.8;
        Sun, 05 May 2019 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Is7NmX5UnXjdWcJUgU4aSQ5SKJBDEdpo+OH4KhZo6k=;
        b=ouTMHb0dKJ3/2NQ+0uLXV+3VzPVW6BiTMkHTncSbuEaqYfYX+ppiNdwRkBtlGMlHOU
         6Ys3NGvQFtbh4COvsiuDYoEA6CKUai0xVHvSkQu1QnynUBKoyOcgWPkCZbD+4h/3zhN9
         FViSdjgZEfsZPwpefJcFjFm05zT49tDsEEV2RGD4YYVHnjKj+VX7HYnvoU8BMFfqDMAC
         rxcitTsDAynlK3njCVc+3+mNe0eQl4uxGS9uNxxEYLm+ZNMOeSG1mT/jzqTz4Qi8pH1b
         Xh/lBqPEXchftaBxo9AC0qMMaWa4IktbS3p04OdYVyYmFUZGUoGuYPzn7277JsV1OMww
         qgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Is7NmX5UnXjdWcJUgU4aSQ5SKJBDEdpo+OH4KhZo6k=;
        b=POg1w6SR/Qo1M6vZcenMuU3eBwY0PLwyrxTSWOFqUnbmKmA87Wp5WZppBZ+Uu/b0aM
         d9fbUZl8sa8ln5nKAL8KBzO9sQCnX/nCsXQoGnauKsSNnSGnlgMw2WIpHz29aaiK/ogk
         gdBFXVmVnfJVFTZI3AALh5oxtf2PgjeaHJAdwEjyNeIEggJj5e/ajt+27so6JGocw8aC
         DxC6uvC8niUlEFlC5xSlqEIzBkw6D7/Lqk/ejksWW8DczhfG9iuhFH03+Ht+pjmcoV/j
         jRH21nurn6b9K2l88ofBOjGG+vDymEVUyQ2xatrSdmf1oI4XHqQUPYmz6YULyfNSWOkU
         fnww==
X-Gm-Message-State: APjAAAUdk05PuNhrq/MfJ5pbxAb5DNU0YtAU3L1MwHFtGX+/xBBzADZi
        hv7U49K/K+J8Jque8pWhV0c=
X-Google-Smtp-Source: APXvYqySiQF9mSLTPDIN55kdRGrd6Jirts3C6dCAQVkapLw/kg7zqr1AkR4rMiQchnBhVJfY62nvXA==
X-Received: by 2002:a2e:80d4:: with SMTP id r20mr10970971ljg.173.1557071317757;
        Sun, 05 May 2019 08:48:37 -0700 (PDT)
Received: from localhost.localdomain (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.gmail.com with ESMTPSA id d16sm1595278lfi.75.2019.05.05.08.48.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 08:48:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mallikarjun Kasoju <mkasoju@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] mfd: max77620: Provide system power-off functionality
Date:   Sun,  5 May 2019 18:43:24 +0300
Message-Id: <20190505154325.30026-6-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505154325.30026-1-digetx@gmail.com>
References: <20190505154325.30026-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Provide system power-off functionality that allows to turn off machine
gracefully.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/max77620.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c2d88a5eca7a..436361ce3737 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -37,6 +37,8 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+static struct max77620_chip *max77620_scratch;
+
 static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
 };
@@ -481,6 +483,15 @@ static int max77620_read_es_version(struct max77620_chip *chip)
 	return ret;
 }
 
+static void max77620_pm_power_off(void)
+{
+	struct max77620_chip *chip = max77620_scratch;
+
+	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
+			   MAX77620_ONOFFCNFG1_SFT_RST,
+			   MAX77620_ONOFFCNFG1_SFT_RST);
+}
+
 static int max77620_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -488,6 +499,7 @@ static int max77620_probe(struct i2c_client *client,
 	struct max77620_chip *chip;
 	const struct mfd_cell *mfd_cells;
 	int n_mfd_cells;
+	bool pm_off;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -554,6 +566,12 @@ static int max77620_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	pm_off = of_device_is_system_power_controller(client->dev.of_node);
+	if (pm_off && !pm_power_off) {
+		max77620_scratch = chip;
+		pm_power_off = max77620_pm_power_off;
+	}
+
 	return 0;
 }
 
-- 
2.21.0

