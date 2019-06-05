Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD66B358EE
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfFEIsF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:48:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46915 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEIsF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:48:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so13319486wrw.13
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLk/6EHVseWKSD89x+s3EZxLh+XcrFPOfmLMorC8Hwk=;
        b=PrKEISpyPxOcX/IyMTXMTKCqxj1eULOxK8PgVX26HS5ur47qHvfJyDSTMHnh8b+uEG
         ueCrq0N4yGcZxXJnAqWvcc0fMDYatwNvLNTeOqK2B1yVFlg01n0HcUoIlD05Nl0UBnYv
         CHkZSHVZP5cXeEfVIyolGl8TUVCFnTTpX9TUmgbGtBtXumgbWDIgpLT4piIKPXDIr7A3
         5a+nL5/p5KVy6KfGBTIKfmsrEm8mzwj4PRr4AzSASSY6Om2Cfsz7bgAsKMtU97k1q2Xi
         wmiC2mM/7d4ctgjnPOkqa0auso2olbXp9VZOgf7izorADpjMRUEkF5+XBCCggCvEfy2L
         vj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLk/6EHVseWKSD89x+s3EZxLh+XcrFPOfmLMorC8Hwk=;
        b=c1+pOv2BX1hfJGU+ZLnNLcSfe4kY67X+SyQW+WXRA2Rhe1kpJHoZqWL3jZzEEQkQAT
         n9z6J3151lreUfjhKlxUyLDEOuPGXvO09lSh2d/ym3mPqTdBxZZD3gK4qwEhgGoKwwts
         R1IjAVl9NIsMpku0PB1wEWQNm3V4A2U3NgRWhuIcXXg2Q5F45MI+y1Z1FJl7+IIiL44l
         gDiniLMr/Rvh2F3IaNYxFtTAlvPbU8+ndtpxWpH/xc9Xbx1VUlKe/26ztlfrG29diPgV
         QVbWA/XkLspcJXAi4qanzLPnF6qOesBJpUjU163in0oN59mUEsNhZDEFRE//U4bdoIlc
         h5uQ==
X-Gm-Message-State: APjAAAWgt5rABKviD02HrwAVFt5JmZiLSrYAoregMZJAXuXq+C1ZLOi3
        BS4O+Fg/M+f1Uor3LDeqawY=
X-Google-Smtp-Source: APXvYqzAs2MZwFX2wGsjtZBX8fbegNZm4Mv+J28FDMAKcVtKSTFypko4EDuavoOdhkcFAuRg+T3eqg==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr9618483wri.213.1559724483290;
        Wed, 05 Jun 2019 01:48:03 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id k66sm9919966wmb.34.2019.06.05.01.48.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:48:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: dpaux: Make VDD supply optional
Date:   Wed,  5 Jun 2019 10:48:01 +0200
Message-Id: <20190605084801.12599-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The VDD supply is only needed to supply power to eDP panels connected to
DPAUX. Technically that supply should be dealt with in the panel driver,
but for backwards-compatibility we need to keep this around anyway.

Also as a bit of background: the reason for why this supply is attached
to DPAUX is to make sure the panel is properly powered early on so that
it can generate a hotplug pulse at the appropriate time. This may no
longer be required given the support for deferred fbdev setup that was
"recently" introduced in DRM/KMS.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ee4180d8db14..65c389d9c85d 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -485,11 +485,16 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	dpaux->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	dpaux->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
-		dev_err(&pdev->dev, "failed to get VDD supply: %ld\n",
-			PTR_ERR(dpaux->vdd));
-		return PTR_ERR(dpaux->vdd);
+		if (PTR_ERR(dpaux->vdd) != -ENODEV) {
+			if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
+				dev_err(&pdev->dev,
+					"failed to get VDD supply: %ld\n",
+					PTR_ERR(dpaux->vdd));
+
+			return PTR_ERR(dpaux->vdd);
+		}
 	}
 
 	platform_set_drvdata(pdev, dpaux);
-- 
2.21.0

