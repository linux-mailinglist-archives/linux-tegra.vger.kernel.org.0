Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FCE1250FB
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfLRSu3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:50:29 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46338 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLRSu3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:50:29 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so868678ljc.13
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ZNN9U6On/C+JwxWbLcc0SMc7cfPY76e+jcFoyz7PMM=;
        b=f2FA+5IU6tXbsq5IRyFouUGnrFzfdmX/JI6KeJIZaYNJNbwxjczKa7kvvi+CD7F/yq
         P1K0cpBi41DCjELeBA8JwGTqLOTTgxporIUZNjcONbU/PVmrHOrdA3u0R4b+ZU4GtJTR
         KzeQfIEehNlZpDIZSUsI3SLXhhBt0vdwaJ88IH3wyW3mlCbnxGGlhtrSBc0UbIKoGRBN
         rs+csgjrUwQpwhqMooMqDmmryPt+mVXxPTrrLBC182lS9iyXhYjLnFHeL789tA3XfRxH
         oo6FWc250J6cM1Pp9PFw+6uYfN+B1mJ9+AtkJxPUvbx1GAe2LjnB31hQK8aB/siWprIV
         xfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ZNN9U6On/C+JwxWbLcc0SMc7cfPY76e+jcFoyz7PMM=;
        b=knjdTIMa0f7bYdKr4MnPassAOSkLkskBNtLTR9ZO5Vu1A8P0BLS81GPpOEYyku3IZa
         dUC6zKGgvWL/5w+eO+gMj74kRLHxy6JWVb24Mq1HbXfI0KyaqWt/4c7oIJoGosPyxLfx
         G+tpLGh9/TmBiAxpWgKj3XVUEiMOJBYsdD9y0O43ZMuX2LcbTP55+evbuxeTNHAqG6W8
         U09j2kggI0G9skWqIQw6DJo30pRMlsb4db8SME1HxCco86vj9W9LD0bfMb+jiu2RLlYi
         IzI7lJueMoqJJi/nyk5XtJE9fpJsdUB1NrmKMPH/gHockUiNvi/0LRlGaoloAZbw/C2M
         Wx6A==
X-Gm-Message-State: APjAAAUR4QGeBYp0I89TmqvodfFostaAn2EdOdsU1fG2VTedaN4PxP4v
        hO2fg8kQBqvH6iPe2yv6e/A=
X-Google-Smtp-Source: APXvYqxnHh2ASCSlPAbDrIz7L3QtxmFgz8xrTx/+oT5w7jrHGBhLy4giw4pHUtx+7ioa8J7l+hAv/g==
X-Received: by 2002:a2e:9bd9:: with SMTP id w25mr3061526ljj.212.1576695027103;
        Wed, 18 Dec 2019 10:50:27 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y7sm1592586ljn.31.2019.12.18.10.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:50:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] memory: tegra30-emc: Correct error message for timed out auto calibration
Date:   Wed, 18 Dec 2019 21:50:02 +0300
Message-Id: <20191218185002.26970-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218185002.26970-1-digetx@gmail.com>
References: <20191218185002.26970-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The code waits for auto calibration to be finished and not to be disabled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index cbc113ddd07c..29b29d0b3ab6 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -632,8 +632,7 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 				!(val & EMC_AUTO_CAL_STATUS_ACTIVE), 1, 300);
 			if (err) {
 				dev_err(emc->dev,
-					"failed to disable auto-cal: %d\n",
-					err);
+					"auto-cal finish timeout: %d\n", err);
 				return err;
 			}
 
-- 
2.24.0

