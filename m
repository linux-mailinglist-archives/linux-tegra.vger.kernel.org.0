Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2A718340E
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Mar 2020 16:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbgCLPF3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Mar 2020 11:05:29 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43619 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbgCLPF3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Mar 2020 11:05:29 -0400
Received: by mail-lj1-f193.google.com with SMTP id r7so6813287ljp.10
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2020 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9t7hcDPw5hcSVIoyJhq2EKW/iy01JerI1gf2khe8HM=;
        b=M4vg7cXkAY37IPDxcGPrfjw0qoKxVGmLTS9ch9eZW4IYuSeZCR4s9JqsvNM0yuoh36
         2GNl5bJq7lwQATdBbtol1XmWMoJbGHywRDEnluw4rFhjuwHp9c/1/Ncl8g76KNb5hpPF
         mgvqY0bb+wAnctOHEgKcQQONNVbmVVuRctRhxvfxJn5TbXpfu2A+37IF2UtcUDQ/NIBU
         gWXDnm/GoBeuzrZQf163HnWccjgaz0oiw7YADJk4342rmtOeMrL17JBsA86VsHZ+8X3o
         xlGXuccsnKmRC7kiPm4nCuAEfk6lFSrpOyGdBqW3dWlJzXHVYFfciVfrS3XLGjs0PBlx
         yKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9t7hcDPw5hcSVIoyJhq2EKW/iy01JerI1gf2khe8HM=;
        b=Z4WU+REfD8iJuU//he33Khhvul/gOqEl1EmKYsv9dKJ+l963QK8rt6R/xSf/RKwQii
         wy+jp8v0MBX6T6bwW4sEUmbbproOtEPx9WzKAiBoazPZLicB4Q5/IObTpL6tQPBatztv
         Bi6QRhmdTUXpN4bGm4yjLVPPwi35gLym5pX4ZaZ8cyM3zKrC7GTI0a77dfYs0REfcq/t
         xvNXAaNXHQVNmHh98Z02Yv2ABkXRVFj0EY09zk6n/UZ6x54NxJogoDE+p+U9q+lGB9ph
         69Uuqw8opr0cybiWjjhE8vZwJehetuvzl3ZgOjhvNuCsj3+lZ50ZESRlKwYSJGn+q+Nm
         PPSw==
X-Gm-Message-State: ANhLgQ06Ebr/JYGj9Kh348VLlnRtNKt4Kt315iQpuK+t4AV7pty/ErFl
        GS0L15T37nLSIG6ZV4JMDlw=
X-Google-Smtp-Source: ADFU+vskKUWYeST7SOaPbykK9vVxlbZAXBzB74j1CaREbC5+3kkfuakH8JsysgexSrGwbLMUm99ipg==
X-Received: by 2002:a05:651c:2006:: with SMTP id s6mr5405124ljo.251.1584025527545;
        Thu, 12 Mar 2020 08:05:27 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id r12sm9538041ljd.6.2020.03.12.08.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:05:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: hdmi: Silence deferred-probe error
Date:   Thu, 12 Mar 2020 18:04:32 +0300
Message-Id: <20200312150432.2745-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Driver fails to probe with -EPROBE_DEFER, which produces a bit noisy error
message in KMSG during kernel's boot up. This happens because voltage
regulators tend to be probed later than the DRM driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..e8ee8058c587 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1648,6 +1648,7 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
+	const char *err_level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1686,21 +1687,36 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
-	if (IS_ERR(hdmi->hdmi)) {
-		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
-		return PTR_ERR(hdmi->hdmi);
+	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get HDMI regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
-	if (IS_ERR(hdmi->pll)) {
-		dev_err(&pdev->dev, "failed to get PLL regulator\n");
-		return PTR_ERR(hdmi->pll);
+	err = PTR_ERR_OR_ZERO(hdmi->pll);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get PLL regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
-	if (IS_ERR(hdmi->vdd)) {
-		dev_err(&pdev->dev, "failed to get VDD regulator\n");
-		return PTR_ERR(hdmi->vdd);
+	err = PTR_ERR_OR_ZERO(hdmi->vdd);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get VDD regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->output.dev = &pdev->dev;
-- 
2.25.1

