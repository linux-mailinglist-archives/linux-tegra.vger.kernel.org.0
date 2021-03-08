Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A897833115E
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Mar 2021 15:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhCHOzl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 8 Mar 2021 09:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhCHOzc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Mar 2021 09:55:32 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E17BC06175F
        for <linux-tegra@vger.kernel.org>; Mon,  8 Mar 2021 06:55:32 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id t1so15166647eds.7
        for <linux-tegra@vger.kernel.org>; Mon, 08 Mar 2021 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uperHqgKyTc1tpYFKXo+RhHx7BCtYMzrCs+Kkh1SsV0=;
        b=T9sWtAkX09RPxJYmWpMCkyvO0N9nQhxGEbDn+KEDTS5nEV/YHef85lYvq0w1BvgYOj
         7Z9g4YSYGA3M5uD4ee8zRrJS9MdhHO/Z+2WhBhgLgrEB8obKsVzl9NGILu5WmrvKd7YF
         5giXgpANgiUclo4RXurDAkMT7Fz4xAx1ZZWgsF8d5DG2D/1wZ3rSCQSWbyu7My+Hp4K7
         F/UZE5Ji01pJtmWBi2V8h4TeIGOGPA4FE81paGKhmeDUA+tHnl7EF1EL6OXMP+JG6LF3
         ukjBnNMeFDtaPoQL/UESzW4N40gp1/fGdaFLccqiWHnh3VYxy2qwlW7UPxcQ8Otvhx0G
         fL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uperHqgKyTc1tpYFKXo+RhHx7BCtYMzrCs+Kkh1SsV0=;
        b=llp21GcgWZLXFl97gPbdcVFYsjgo+CPnOJ7SkSvQF7hUwio2l1/Nohld9y0a96pce8
         abtZkxMFsOmTnolwZAXc+aIR+kb8cTAKz6w7Csz20dLrA4A4hqdoYaBdDc8g4IeMw3DY
         JipTuiC9yW+7qwg9xLYDjXTsOeSw67+bdnYA+K58DQf4pVza1uZ/Pce1Ps347ffPKHQ2
         INgBQHuwSt7O6PGBdfxd15Q84XhCGSYJ8+qmiY97yWsz/kKdzbPiN1oNCqRDon2lcHSV
         mIwu4lF7DVN8gaPGbU0L69ZVz+nho0fu6V20KQBJFVEDOfNsTKAoS59POyMNbvFt8+Xx
         jjww==
X-Gm-Message-State: AOAM533EEu3Fsz1WWDDWbXeH+N2FcVqhDH1ax/YobCCJ70ldufn1VL4L
        IngjuYy78PanxwhvcJyRuSDnLg==
X-Google-Smtp-Source: ABdhPJwPaZ3uD6Lhos/UbjXVxJWzoRqv4+WWiUx4IoveJlUHtsMTopNWyUeqtN/pd3JKBlgRsTvxgg==
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr22811140edr.316.1615215331116;
        Mon, 08 Mar 2021 06:55:31 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:55:30 -0800 (PST)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, elder@kernel.org,
        johan@kernel.org, vireshk@kernel.org, rmfrfs@gmail.com,
        f.fainelli@gmail.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 04/10] spi: spi-sh: replace 'delay_usecs' with 'delay.value' in pr_debug
Date:   Mon,  8 Mar 2021 16:54:56 +0200
Message-Id: <20210308145502.1075689-5-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'delay_usecs' field is going away. The replacement for it is the
'delay' field. So, we should print the 'delay.value' value instead.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/spi/spi-sh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh.c b/drivers/spi/spi-sh.c
index 15123a8f41e1..45f304935332 100644
--- a/drivers/spi/spi-sh.c
+++ b/drivers/spi/spi-sh.c
@@ -290,8 +290,8 @@ static void spi_sh_work(struct work_struct *work)
 		list_for_each_entry(t, &mesg->transfers, transfer_list) {
 			pr_debug("tx_buf = %p, rx_buf = %p\n",
 					t->tx_buf, t->rx_buf);
-			pr_debug("len = %d, delay_usecs = %d\n",
-					t->len, t->delay_usecs);
+			pr_debug("len = %d, delay.value = %d\n",
+					t->len, t->delay.value);
 
 			if (t->tx_buf) {
 				ret = spi_sh_send(ss, mesg, t);
-- 
2.29.2

