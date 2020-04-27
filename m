Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED31BAB38
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2020 19:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgD0R2P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Apr 2020 13:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgD0R2O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Apr 2020 13:28:14 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4111BC03C1A7
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2020 10:28:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u10so14527857lfo.8
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2020 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dq6UXDEp+CfhWskvNuEfUSYYLoNA4rRIzRZcrwo0+MY=;
        b=x5Zqjzao8L+ufNxFV7ltgeMVwwgp9ywdXPktv0A4tuA/TaySL6cN2ioBLum7Civlu1
         mOWqG0GZaqxC6XmB2whqvkJ6yZkI0+6/1DldT4Rf69iCuuSf0fzdh+rzwK4wQWJ9NFAQ
         CToGTup9Wx28bgq1lK6Xy7mcBOZeXGt8wmg6wXw9RU/LEIAuwNm1SLphUKyKPYjRtniM
         CCzKJii7PGY4MRFaNyBL2QrXRc2B2UjrogvGv7J8dalEq2ezNIRUz+aHLTni/Xm5x/ve
         ThCVeWwgJaPSJBVccziQTvoX+uAfGA06P2WGFUEW+jeOhpkofx1dzeVWKGFdcZrbc/Vy
         9+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dq6UXDEp+CfhWskvNuEfUSYYLoNA4rRIzRZcrwo0+MY=;
        b=tp/+t1qMXYz8obHXN9KTj84Nx8t9OnoRLAUYG74AopJ9QEaVbrktO14671SPzO7wDZ
         AY7PSMGruUs85HQ63CaMZyFkQU87EpgOsDRhwT/qeY7BXJTcN63K2rEoJMblQE1uqhts
         ORJ0KL6Mtv/bX6GWe19Ge7QL5kntieuaqr0KTR8zJVqFD8y7co1SVOT7ge+445qC1NsK
         C0OTYeWytkK8v6L364287/8ISwbnfzpy+yp/BADhUffk+bP9M1Ww504wh4TgjUSWQjjo
         7n6FEv0ogTMFek7Nc13U2uxoCFsUP7kzh7do95CzDf+0qWh6AqyUDfU4dtzOxu4VxRDh
         Lumw==
X-Gm-Message-State: AGi0PuZcPFAOyPSdgIFyVWKTszc3/Bc5X0ih2JS9XzW1/BJu1mSQD7lu
        yxzRkDue553q1hIlnVMu0CduCA==
X-Google-Smtp-Source: APiQypJWv8O+pTWo8o5RVwex9KReKqhYTkJvhJxn5WYJuBnoQNeHME9vZsTS6HDD1lhOtGRpi+iE4w==
X-Received: by 2002:a19:5f4e:: with SMTP id a14mr16402967lfj.57.1588008492538;
        Mon, 27 Apr 2020 10:28:12 -0700 (PDT)
Received: from localhost (c-8c28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.140])
        by smtp.gmail.com with ESMTPSA id c19sm8058077lfj.18.2020.04.27.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 10:28:11 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] memory: tegra: mark PM functions as __maybe_unused
Date:   Mon, 27 Apr 2020 19:28:02 +0200
Message-Id: <20200427172802.17569-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Without this, we get a couple of warnings when CONFIG_PM_SLEEP is
disabled.

../drivers/memory/tegra/tegra186.c:1578:12: warning: ‘tegra186_mc_resume’ defined but not used [-Wunused-function]
 1578 | static int tegra186_mc_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~
../drivers/memory/tegra/tegra186.c:1573:12: warning: ‘tegra186_mc_suspend’ defined but not used [-Wunused-function]
 1573 | static int tegra186_mc_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~

Fixes: 177602b00641 ("memory: tegra: Add system sleep support")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/memory/tegra/tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 5d53f11ca7b6..e25c954dde2e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1570,12 +1570,12 @@ static const struct of_device_id tegra186_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
 
-static int tegra186_mc_suspend(struct device *dev)
+static int __maybe_unused tegra186_mc_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int tegra186_mc_resume(struct device *dev)
+static int __maybe_unused tegra186_mc_resume(struct device *dev)
 {
 	struct tegra186_mc *mc = dev_get_drvdata(dev);
 
-- 
2.20.1

