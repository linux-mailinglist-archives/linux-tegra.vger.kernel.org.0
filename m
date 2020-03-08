Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE1B17D6D0
	for <lists+linux-tegra@lfdr.de>; Sun,  8 Mar 2020 23:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgCHWic (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 8 Mar 2020 18:38:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40045 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgCHWic (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 8 Mar 2020 18:38:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id 19so5138909ljj.7
        for <linux-tegra@vger.kernel.org>; Sun, 08 Mar 2020 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r1mtbKzEDo/meMb75uMw1BZ7jNTEHtwbZ1HaLq50rio=;
        b=iRtF062MxEz8DoVakOftgorukRssYJq/gobsPeyUU3Q/FNvCZ63CfjjVOG44Uvit/N
         J6bYfEOump5YU8FSHDNxEe32ALGrc3tARKQU3hHEFuFA35ib0cXITfCM+9IUe8UZ6Rrk
         MfZKTHhPXn4/P/+/1RhvhNiFSJrjDJVDfix3QRVYckUQczGM+tamEezFPDBS8lUIIw9V
         GQKI63qXHtnmESy1OaBFDk0NYSSlhsJL8ebJZqbdAKXSD6TINGoOs3Um60vOH//jvPxA
         UzSttK4sWbw58eX//v4QdC1w/tzGEO9hLoMD20eFZQVa6c2/YDo0dGs+rC0b7dhJTgZ3
         1psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r1mtbKzEDo/meMb75uMw1BZ7jNTEHtwbZ1HaLq50rio=;
        b=TmMmmkv95ww1YyC1ki52lhM5TSKIvf4C1Qkkxe/32iPz/owiW9idreviHKoULW9UU4
         YvIQxCnZwhZfm8rHKky5RE6HMuck6dgWrYsDOHE7/rhGb4dS48NHRSHG7Op9iE5y1WIB
         xRrLcVwIbBimYEEhDKIjzKKVv51+vAhbGxkABArDOi5v4kaFdOihoKVjLXDgp/pgZbYD
         Am8YWX2XLJO2CA/P/o++Lu4X1BqTniv506wypk5mSNrC6WO7iFWaX4qWquiDmHDc7mG1
         iFZP02WwFKaSeh9IbZwoOYtKy1QZI4j5gJE5nk9Uh4dS0cX6MqOVPfyiN7+KOj1DEAB2
         gMdA==
X-Gm-Message-State: ANhLgQ1p1kNUOpQUsRMqfda91mi6PFhcPznISgCOGnWZ9KUecZM2EpxF
        KGDscVkP89nW9ljVbVo6/m8=
X-Google-Smtp-Source: ADFU+vsXzHXv5VdhlnXXX8hLbc6jlFJWsroBn0LOAY7V4Cd+5e9xwnsK+JDax5AlLnXD9QiifV6dhQ==
X-Received: by 2002:a2e:5747:: with SMTP id r7mr6076448ljd.177.1583707110744;
        Sun, 08 Mar 2020 15:38:30 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 15:38:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] drm/tegra: dc: Use devm_platform_ioremap_resource
Date:   Mon,  9 Mar 2020 01:38:07 +0300
Message-Id: <20200308223809.23549-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The devm_platform_ioremap_resource() helper replaces few lines of a
boilerplate code with a single line, making code to look cleaner a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a4c2..257163dda301 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2503,7 +2503,6 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
-	struct resource *regs;
 	struct tegra_dc *dc;
 	int err;
 
@@ -2560,8 +2559,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
 
-- 
2.25.1

