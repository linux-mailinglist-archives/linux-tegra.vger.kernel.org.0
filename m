Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5D933114F
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Mar 2021 15:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhCHOzh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 8 Mar 2021 09:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbhCHOzb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Mar 2021 09:55:31 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB08C061765
        for <linux-tegra@vger.kernel.org>; Mon,  8 Mar 2021 06:55:29 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id m9so15135903edd.5
        for <linux-tegra@vger.kernel.org>; Mon, 08 Mar 2021 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1kerxlBQXsnkBW66DYRSLvt3f+bVaEYRPTXorPAb2o=;
        b=rFtmC2lX9bx1OJQsukKFxbVFYmys8q4JZilYPWNowCRpc+e/TA9cZqZuTTmo16QaR3
         Zts0P3qeGkvIV/+kY5d/R0/Gw7urqV7JEVAcqMz4uNzUhyurQ0hxY1RtoW1q0pXyENR2
         w2LLt4h6lI238BNd0PG6+9Q0us3AzZyEyTMu6vptP6nzK+wfcPqaXSegsOW7yGGHWTs4
         vqBks9FDZgZ3wwSatAgxdylkY+t4TBwvAV4tOIZ6nmLIL5Gc8pNQrKR+rl0KStooCfyt
         28nw+vmJGXOmQBlF/aBAwnrusLCaNg8aOw8HMdOocFZq4TxTqx7MmHm2sHqz19j4+89R
         kvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1kerxlBQXsnkBW66DYRSLvt3f+bVaEYRPTXorPAb2o=;
        b=slxcK9xIJBeKaN22CUTcLJLxSTE89DfRe818fwJDA4VwS+mgzPn4PRyrBWuSx9J//k
         4EKaBm9WekG4eFTYAIhnQQMnENG51WJPoFIqo3a6KX3K2UXXJ+wd78wLXqVHQexMwBwz
         m8EUkhHGS9pQMKYfZIgwebDdgJIZU4KgR05Xpi/o154XfTb37VpjShWKN1lVdj0OsM8k
         Llis0A7mCB7nUgoYq0WqG8csLGuqegJMXsNaKjqVmKmHIpf75nYvABw2LkAPjicaZaxN
         YC6/f4OhDVKu66ZRazxyIpHqCS8mCD9E4vIYUO4t6vBiP+JWpazpvib6n8MmXDOpbiXQ
         5+yw==
X-Gm-Message-State: AOAM532NznKGf3VEo34X2GgSSVWa1lk8QvX3VoOZ39dMSksENRplVe/I
        Epo48dQJ7/eb0rX2LvqVrLpVAQ==
X-Google-Smtp-Source: ABdhPJxEzekHbaS2S5/KEJAyRUXUwCnOcpb8YwShTRdZxuCkPKC3qM7GvCvE1zMb6YSlbV7UXjYPrg==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr23091988edl.32.1615215328449;
        Mon, 08 Mar 2021 06:55:28 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:55:28 -0800 (PST)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, elder@kernel.org,
        johan@kernel.org, vireshk@kernel.org, rmfrfs@gmail.com,
        f.fainelli@gmail.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 02/10] spi: bcm63xx-spi: don't check 'delay_usecs' field
Date:   Mon,  8 Mar 2021 16:54:54 +0200
Message-Id: <20210308145502.1075689-3-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'delay_usecs' field was handled for backwards compatibility in case
there were some users that still configured SPI delay transfers with
this field.

They should all be removed by now.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/spi/spi-bcm63xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index d08bb7600150..80fa0ef8909c 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -369,7 +369,7 @@ static int bcm63xx_spi_transfer_one(struct spi_master *master,
 		}
 
 		/* CS will be deasserted directly after transfer */
-		if (t->delay_usecs || t->delay.value) {
+		if (t->delay.value) {
 			dev_err(&spi->dev, "unable to keep CS asserted after transfer\n");
 			status = -EINVAL;
 			goto exit;
-- 
2.29.2

