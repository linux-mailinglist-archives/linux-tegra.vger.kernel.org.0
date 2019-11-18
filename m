Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6A510092C
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKRQZv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:25:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33841 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfKRQZu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id 139so19672000ljf.1
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 08:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=fVwyyBu9xpmgqQHY6PjvUFa3xz4yh4a3FWSC/QncsygIygP15jaNX8DIlMq1+MzRlR
         lNd+jxZjUGpfLrx+HWbrC36Y3I3KDwIBnGHaJfUv/TGQyg7i471PgpzTEzSUs3Nsi0XS
         PtcSoAxXI8GpqwF0WySVXted1VBi7z0G2T9xfzcj9M/jk9htzRjMP1FplSFehRf4KBL9
         djvILAgRPFp9WpOixda2MyUpRnoXaWF4z1UAirdW1g8ylKjlvNCExoIgfFrk3Q2hhTKJ
         d7Dm4kvr7z3A8DFM4G6ShyvJNZvZjcJZdIQGB2wEdaofngRiZaBk4ch+lEk/tykqcObk
         82aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=COd1sL7ecKUE28SgC4tPWzMjK9OZnk8zwFa//q+pRnYFMQUGYd8GEnC8ukxsfOcK0W
         xgG1wQDzKaKM6tlKtoeY5pFaPPTUoBXOTixw0nDV+wkTvzQVMgzcBwEySO+f+6EsWmoR
         sL3IQcU6ZfzUbnci6cxdCy6lkLS8ynOMfmfSaG52xmv96DaYkEeV3tCVU+rA875eq0fH
         oHLpUTpmGKtF2/mCjsep0g3BGRXEvXIuMTdsW+7z/UmFO0a9oea3PZPbW1wwvqWVp16V
         54ak7N6bkXTPuvkIsA/hcCtiZ9htTyJCTLtS8UiIvfD+l/NJP9yuii+y7UKcxjaXOTPK
         aJrw==
X-Gm-Message-State: APjAAAU+sJ0xziVPcB+rE0GjRqghd4BAF+7YkpUwxqF806fHX/zPW/wg
        w1zjFKa31/1VCfip+MJIgeo=
X-Google-Smtp-Source: APXvYqwI60bDKAIeu2vp4aeKsTRMoUuKN+SwPo4O0LrPoBe4Rz+KKH3ij0viT6CR9sye1YnvUbq5MQ==
X-Received: by 2002:a2e:8855:: with SMTP id z21mr217062ljj.212.1574094348897;
        Mon, 18 Nov 2019 08:25:48 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d24sm8582872ljg.73.2019.11.18.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:25:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3 2/4] soc/tegra: fuse: Warn if straps are not ready
Date:   Mon, 18 Nov 2019 19:24:58 +0300
Message-Id: <20191118162500.6651-3-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118162500.6651-1-digetx@gmail.com>
References: <20191118162500.6651-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now both Chip ID and HW straps are becoming available at the same time,
thus we could simply check the availability of the ID in order to check
the availability of the straps. We couldn't check straps for 0x0 because
it could be a correct value.

This change didn't uncover any problems, but anyways it is nicer to have
straps verified for consistency with the Chip ID verification.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 54aeea1b4500..f580b3116bea 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -27,7 +27,7 @@ static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	WARN(!chipid, "Tegra Chip ID not yet available\n");
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
 
 	return chipid;
 }
@@ -39,6 +39,8 @@ u8 tegra_get_chip_id(void)
 
 u32 tegra_read_straps(void)
 {
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
+
 	return strapping;
 }
 
-- 
2.23.0

