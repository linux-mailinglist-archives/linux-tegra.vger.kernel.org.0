Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9253214190
	for <lists+linux-tegra@lfdr.de>; Sun,  5 May 2019 19:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfEERjv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 May 2019 13:39:51 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44203 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbfEERju (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 May 2019 13:39:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id n134so5727087lfn.11;
        Sun, 05 May 2019 10:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XT2iXDlEU6v0lNteGjb1DNAvzBwb+KsZ+Jk4cl51M84=;
        b=K8fENxB2VacBBLP3NUMvI7fVRVLSi7lZ3CIlki2EKyKs1L4awSmyH2lUMDfqO2WJTK
         KGTLrCsVUD1m4ISqtQFbZDWv94ylMr2qHtVRW6WgXPpHpZ2W0kD6KIalKko5l0SO5nxx
         sJVjYzaCnZ0gnkAglz0ScVSz44aS2srC28DXpiXQ1Z0v9u40wH6nE833LzDapt/BKQcP
         IEP1iCnG5l7ARQqiwXlN5sOTNDhRMDW0CHq6JHjQC90MmEaIvXiZxS3aqdNWGK89SbnB
         hZyRONX5NPvXm5SCCYmWdjySuBn7lAlIaKZ4IONG3fbr6k2VgE+rM6UZSgniHvGdLI0n
         0BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XT2iXDlEU6v0lNteGjb1DNAvzBwb+KsZ+Jk4cl51M84=;
        b=g7yZV0t2o8epHrTlEn+puSHlZI48lc0CIhwVAWTfcsqlxuZXhTAV0MsFTXrow2Jmrb
         CutFN8Qjfp+7yjsayHr2BCZEVOd3FVKZXwpPNjcr3LGXfCBkGwNmVwLBgyp+khiqGQch
         u/E39sL4o92ivqxnjPi6AwGEijXub/kpw2Dz8cmllOblvciXYYdub64NryXfA9+nBN+Z
         ZWZRoMEf4uCaKV6+akC6Fanw4g4UN5eIKwNQ1iHImRW2yK1bVyfiww31HRs3RlPOtUvg
         zIQImjSt0hCKXI1zaosya8cksZOgKLo1APTOLPEoZitxH8mVdt7Kx3jzIF79Cef17dvn
         reOw==
X-Gm-Message-State: APjAAAX9novz2UDLAmT6ciGK38MO1iA+dsYjo12ejmX4oexXZRxNGUm/
        aWaj+dumt2GY6u5JpIrDRQo=
X-Google-Smtp-Source: APXvYqyZocWedZVqGZOQeo8alH8Z9CYdqk1a+SwfInq6p9vkKQaTkWK0V8kDAlOnjWuK9P1JbC4MxQ==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr217591lfn.47.1557077988165;
        Sun, 05 May 2019 10:39:48 -0700 (PDT)
Received: from localhost.localdomain (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.gmail.com with ESMTPSA id z17sm1626938lja.26.2019.05.05.10.39.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 10:39:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] drm/tegra: dc: Tune up high priority request controls on Tegra20
Date:   Sun,  5 May 2019 20:37:05 +0300
Message-Id: <20190505173707.29282-2-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505173707.29282-1-digetx@gmail.com>
References: <20190505173707.29282-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 has a high priority request control that allow to configure
when display's memory client should perform read requests with a higher
priority (Tegra30+ uses other means). Set up the controls for a more
aggressive prefetching to reliably avoid FIFO underflow on a lower memory
frequency, this allow to safely drop the memory bandwidth requirement by
about two times in a most popular cases (only one display active, video
overlay inactive, no scaling is done).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 607a6ea17ecc..cf622a07e9b6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1833,12 +1833,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		tegra_dc_writel(dc, value, DC_CMD_INT_POLARITY);
 
 		/* initialize timer */
-		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0x20) |
-			WINDOW_B_THRESHOLD(0x20) | WINDOW_C_THRESHOLD(0x20);
+		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0x70) |
+			WINDOW_B_THRESHOLD(0x30) | WINDOW_C_THRESHOLD(0x70);
 		tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY);
 
-		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(1) |
-			WINDOW_B_THRESHOLD(1) | WINDOW_C_THRESHOLD(1);
+		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0) |
+			WINDOW_B_THRESHOLD(0) | WINDOW_C_THRESHOLD(0);
 		tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY_TIMER);
 
 		value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT |
-- 
2.21.0

