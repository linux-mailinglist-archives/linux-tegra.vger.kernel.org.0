Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E817D6D2
	for <lists+linux-tegra@lfdr.de>; Sun,  8 Mar 2020 23:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgCHWif (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 8 Mar 2020 18:38:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44077 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgCHWie (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 8 Mar 2020 18:38:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id a10so7921068ljp.11
        for <linux-tegra@vger.kernel.org>; Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=756rkPJJl2bGPuKXslFucuMnGYV6EvOGDv872EgSIk4=;
        b=Dvm1pJzgRCqs5/znIAA6QdOvIEEvaI0HDuiwH2jMGSLc5tETgXc++bKdyGSg64NlAx
         mQn48NOIYUbPvwM14wl61MFZsMIHV9g7hyNXLn7esUKQEljSlTNDba/gyySMPe+VFYXP
         V3fBAfAwefXSq90PP0qfYFJwhpX87CbT/NTCQDkexiVHiJQYqGSDL8OvhCgxQMUBTxO1
         9oj8MzHkDD0PYCSO+VUlnvdZYP4S2O0iz8la/Xy8fnFRGeGeaGZtFYXEGTRa6G2i+gih
         se2WWdgNQZjMs/JEC37M5abtZj/inhW9AmWbkbp0gUh/KSZvKgFFXf4rshuEO5iUwIjt
         83gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=756rkPJJl2bGPuKXslFucuMnGYV6EvOGDv872EgSIk4=;
        b=PNfiV+fidpewhwA3kM0U8qa4L1VgdTY2KqRIjXR8lzaxCnls/Xz9ks27zab9Sa3OyJ
         mKoJNBad2V0Vz9gTrucrhvYI+XQ23epoNV88Bj98Iftuuh1qELQ9bxkJksL+Ckh85Vc+
         7PqO34Ad37n2INyHoVN1iOXZX2p7s/5iRDgLRTcvmOv0QdvzY5h6Utl8EWqDJhZTVVpz
         qfxo2efZCYneBFixXjXuxRNsCMhj/PhrwE6ZiHLHKQ1XX58DCNff6WDv9oGCx+xXV8yK
         mMYCE4Nt9vT9V2sLg91rW0KTAdC0arthnHskfjF96QmIRbQJTW2tCKp1bxNXQvfc2lEI
         hH8g==
X-Gm-Message-State: ANhLgQ1ZxFCdO2bvfcSYyb8fnfj1LuTy3mDyKftat+Juo+dQYwE/dZGE
        NYctNLKO2wfZ3Oq0ryTpPDCJGzEB
X-Google-Smtp-Source: ADFU+vvq2IKLjdguf2Yq2iAXj8IWRfLLbzwjgXMzUeZtZ0Ut1yCz9+H8DOWxDcHvROoD6dJxfghnnQ==
X-Received: by 2002:a2e:7c04:: with SMTP id x4mr8307885ljc.60.1583707111582;
        Sun, 08 Mar 2020 15:38:31 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 15:38:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] drm/tegra: dc: Release PM and RGB output when client's registration fails
Date:   Mon,  9 Mar 2020 01:38:08 +0300
Message-Id: <20200308223809.23549-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308223809.23549-1-digetx@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Runtime PM and RGB output need to be released when host1x client
registration fails. The releasing is missed in the code, let's correct it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 257163dda301..56d933e81797 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2586,10 +2586,16 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto disable_pm;
 	}
 
 	return 0;
+
+disable_pm:
+	pm_runtime_disable(&pdev->dev);
+	tegra_dc_rgb_remove(dc);
+
+	return err;
 }
 
 static int tegra_dc_remove(struct platform_device *pdev)
-- 
2.25.1

