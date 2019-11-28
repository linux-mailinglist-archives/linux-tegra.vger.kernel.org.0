Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9B910CBE3
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK1PiD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:38:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38188 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfK1PiD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:38:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so31744625wro.5
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZWNjGPJrA9TiLgOiM42Wa6pCMxexw+xtFbZOuu9Dj0=;
        b=fBM1fnaSHGPaWj2oDBplza3m7QMiLpkQd4blnANTy09QOm9ZAmdZs+MxmnNEnUhauM
         Nrqgw71rQIAn9ttijEmzZoCTxxtAuxFfcDRthNbgBOOr71OkD6KrO+auVhP//1d4TAYS
         TCSvmrKJ8qQXRWv7U1XOEuEGjEaArFMentcrB2fpRZM1tANAmPDI8u64a+h8UsWnOSz3
         Xeg41ALMwyGoZcL743L9UOzL5F/WaOmV6+2MNY7oa8Nfxm/w4ctoyXrZSQTZ96icQQyB
         u+wq/C90LEzesgf6O5fZLysT6CmHNf9im0svPqvmJHVZDjyE+5JkV0At652rkmy06Mfr
         N0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZWNjGPJrA9TiLgOiM42Wa6pCMxexw+xtFbZOuu9Dj0=;
        b=JTMl75bb0KfGEtddUUWXcMnXaZ/FyEh6CEP+opLlP4caT7F/HFOcEbYL5Ls5eefUi+
         7iojw97fu+cpvyXbcZ7y4qnUef1PmStUbfpagVT4Z6U+CW4Vci0OxwI56Wg0M2n+xpSS
         c4rTP8I73+R61wy9CMZUedwTgaGh9bAI4QhdbWzSKgNU+Ywwo/8fP8ZXHqMJ5AUYp6Ax
         TEvSc4IS3ew0fOqvQcyeKrKt9uxnXrn5h0s698PskudAmUgQ76ARz4w6P1NOgHuo3XEe
         xFpTI+/t93zpf7AC68hl5Kc5PO9HqWl+uMHPuiOnhZ9+LBwZjYCN46FJJ83iapVaovUH
         KrZg==
X-Gm-Message-State: APjAAAWDKbUEAVGp25bAAK0XW/0IWkUiLl+dh+HcY7YkUkuVk9e0oXt1
        z3/vP9ZdZUmrsCLMjjKt/yw=
X-Google-Smtp-Source: APXvYqxY00AlQiRyW3tG6/BnHI8I8iDyWl6zJrMYZ8i9WUIigDI2zW81I6BGYQR6FwxL4UuWXDfaJg==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr13891032wrs.11.1574955480883;
        Thu, 28 Nov 2019 07:38:00 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 72sm24285631wrl.73.2019.11.28.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:38:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 9/9] drm/tegra: sor: Make the +5V HDMI supply optional
Date:   Thu, 28 Nov 2019 16:37:41 +0100
Message-Id: <20191128153741.2380419-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SOR supports multiple display modes, but only when driving an HDMI
monitor does it make sense to control the +5V power supply. eDP and DP
don't need this, so make it optional.

This fixes a crash observed during system suspend/resume.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2200f4cd397a..a68d3b36b972 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3970,15 +3970,29 @@ static int tegra_sor_runtime_resume(struct device *dev)
 static int tegra_sor_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
+	int err;
+
+	if (sor->hdmi_supply) {
+		err = regulator_disable(sor->hdmi_supply);
+		if (err < 0)
+			return err;
+	}
 
-	return regulator_disable(sor->hdmi_supply);
+	return 0;
 }
 
 static int tegra_sor_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
+	int err;
+
+	if (sor->hdmi_supply) {
+		err = regulator_enable(sor->hdmi_supply);
+		if (err < 0)
+			return err;
+	}
 
-	return regulator_enable(sor->hdmi_supply);
+	return 0;
 }
 
 static const struct dev_pm_ops tegra_sor_pm_ops = {
-- 
2.23.0

