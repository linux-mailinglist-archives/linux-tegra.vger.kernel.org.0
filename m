Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25901A2837
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2020 20:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgDHSCw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Apr 2020 14:02:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38122 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgDHSCv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Apr 2020 14:02:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so8948108wre.5
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2020 11:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aEcQ55ibRFK7AXPn8tBuEBfXFG9cbhFC58mmg9uXPtg=;
        b=lf9Ts6U3jCUsqBGgmBxLulZ73U60x2S9pa76VvVszJnbPdvtYQ9W03I6zarSOjxquI
         irDxo9wy1Q8TjRSiQ4877luhVhJISMxrvQV77w4PxJi2kpvHOFXgcA7nqRD/SOhBc7XL
         owtIwDaoRaEHteth91tQjFbd+OXTX5ORu1BANT36apSN4kbkhJ+T3fXtgUFFGOXfNOfT
         1vRm3LaHANUexcyGxozZAl52w27oUPo+2a+vg7glZiyvdWMMn9JANFwqoTLlbbeSoyIK
         CYu1bey/UrsYZWYVj+v3kF95wEoDHbgjWn97XxU1ewe03hG0G4/5PX8SP4GCqhfiGyn6
         6I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aEcQ55ibRFK7AXPn8tBuEBfXFG9cbhFC58mmg9uXPtg=;
        b=aaTfb1eU7S01J+HqeO1UAWmLzksd9wx7WMFctLKCcIZGlG2boxUmGf+pa1fBz4y4KV
         kO9ybgPgvrW1BEEv7VmXO/NkHToGbnh9zZXTjaQ8Rq7fvVmWckqx6dCmXSHO8fLGW++G
         3umTFOyDYPFcfvwkfdmXA2Lh7tc/mwZwD33drQwPcM+WHVApdcjWSuluIftzngWOGRA3
         OPeKEEUMnP7yHQcVCT6L7iwFeC/aIeFhCq/o95QBWyjvVN3i+CmDMnC5J3/u0ga9Wr+4
         SUxf+tVaZJtWwqFfnnWjvk/r5mIN7droxi9/lScgW7ZyQgrorbh4NvDinSR0ee6bt3cI
         p46A==
X-Gm-Message-State: AGi0Puag+Br7MBd9V6Vo8VhNnMn3tv25p0qKAcg56OrSWBMjXSYgA9c/
        LTnlUIUW8wHn0DHGYQ3GFKRXCNEZ
X-Google-Smtp-Source: APiQypIvpKUxxFoSuOVyu3jyunFbDt5AMBn6/R62J/u8KG+Ic2bfo8fZLnJQ2UZyDBBT3/2jHqkxsw==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr9165884wrl.278.1586368969830;
        Wed, 08 Apr 2020 11:02:49 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id z8sm6681209wrr.86.2020.04.08.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 11:02:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Use i2c_put_adapter() instead of put_device()
Date:   Wed,  8 Apr 2020 20:02:44 +0200
Message-Id: <20200408180244.3079849-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to properly release the I2C adapter used for DDC/CI, use the
i2c_put_adapter() function provided by the I2C subsystem rather than the
put_device() function which doesn't include code to drop a reference to
the adapter's owner module.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..136fd2f56af0 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -177,7 +177,7 @@ void tegra_output_remove(struct tegra_output *output)
 		free_irq(output->hpd_irq, output);
 
 	if (output->ddc)
-		put_device(&output->ddc->dev);
+		i2c_put_adapter(output->ddc);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
-- 
2.24.1

