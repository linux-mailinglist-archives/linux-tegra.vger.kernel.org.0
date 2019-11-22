Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5AF3107344
	for <lists+linux-tegra@lfdr.de>; Fri, 22 Nov 2019 14:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKVNcV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 Nov 2019 08:32:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40399 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfKVNcV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Nov 2019 08:32:21 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so7601549wmi.5
        for <linux-tegra@vger.kernel.org>; Fri, 22 Nov 2019 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLc+8UZIrOjxIlKtj3ViX/Mxfy7rIiqc1Aolj5mZjSM=;
        b=MDgXNhgFJTUyc5hy6zVkXIsPZ6nPbljYAh6J2wprgL4oNy1rfOcaR8qlzGZ9654Smo
         b7hAB2H0K2DlUIOo0h6QBMSu7wnnvVnzMEmoGF0qtszph4e+vgJAF73hmZuEPeVFy5lq
         ey5OEpZygatO2VsprlQiuI5IcdNfLTsYmrqITxGcM37y1p8JLljUSzr/oczE/AWhXfti
         dK/sD6IZdQuPilb3qtUUepwtF8UfjzjH6vM1AeTiQFSRH0qJ1I/13MaUdIoYWvu/tE0/
         1d8q7xAqJY9ldhdE6mmZ59gT4V8kXo2RNEEZN1arvP3qjKA4GwWlEgT+c3JK3++M0dgi
         FzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLc+8UZIrOjxIlKtj3ViX/Mxfy7rIiqc1Aolj5mZjSM=;
        b=ShzmjoJL8E5+leF2KSlE5SQE3amF8a6rhdEJZy/1V4vFricnylbnZKCEGJCNNHDfvC
         rflQ+DdzEZTybF8imNBRpaaKkHfI8o7pHYIX4cWY53t+BxVqD30/ORaqbv52Ji1PbKhX
         p8uwSFfEmDWwva4tjU9dAjUMXMvDlvAITBjkCXYV4hHw9ojVfqkwvoGAr37yvK1NF3j6
         c0nWsebKlZ4t0JR5cZGej+CV6l+6TIQPL991WrGpsQzj7ccOr9xiS/toFQstOMHo2EKI
         zw2Eg4eej3RRCSRY1OJtnqBSl9uddS5fXDfCAnoujHBSKJp9ZLao3iXgcGj8MBnJbPA6
         uRWw==
X-Gm-Message-State: APjAAAXdqcx0oL/0im1j2HwNeeDocxinomuEZHfz6CUmHjybGMDCwMeQ
        wxwMS/FiTcpj1A1fHLsUL28=
X-Google-Smtp-Source: APXvYqw7EzG1dmzCC/E0peG0Q0bjhlAz872FZKROW4UandWN2wzHU/cN7/FPsdIjj7SmglvkzLgAHw==
X-Received: by 2002:a05:600c:305:: with SMTP id q5mr10801711wmd.167.1574429537788;
        Fri, 22 Nov 2019 05:32:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id t13sm1908018wrp.36.2019.11.22.05.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 05:32:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: vic: Export module device table
Date:   Fri, 22 Nov 2019 14:32:15 +0100
Message-Id: <20191122133215.1317039-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Export the module device table to ensure the VIC compatible strings are
listed in the module's aliases table. This in turn causes the driver to
be automatically loaded on boot if VIC is the only enabled subdevice of
the logical host1x DRM device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 9444ba183990..c4d82b8b3065 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -386,13 +386,14 @@ static const struct vic_config vic_t194_config = {
 	.supports_sid = true,
 };
 
-static const struct of_device_id vic_match[] = {
+static const struct of_device_id tegra_vic_of_match[] = {
 	{ .compatible = "nvidia,tegra124-vic", .data = &vic_t124_config },
 	{ .compatible = "nvidia,tegra210-vic", .data = &vic_t210_config },
 	{ .compatible = "nvidia,tegra186-vic", .data = &vic_t186_config },
 	{ .compatible = "nvidia,tegra194-vic", .data = &vic_t194_config },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, tegra_vic_of_match);
 
 static int vic_probe(struct platform_device *pdev)
 {
@@ -516,7 +517,7 @@ static const struct dev_pm_ops vic_pm_ops = {
 struct platform_driver tegra_vic_driver = {
 	.driver = {
 		.name = "tegra-vic",
-		.of_match_table = vic_match,
+		.of_match_table = tegra_vic_of_match,
 		.pm = &vic_pm_ops
 	},
 	.probe = vic_probe,
-- 
2.23.0

