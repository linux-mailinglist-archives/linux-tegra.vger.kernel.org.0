Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B261AE361
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 19:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729405AbgDQRLX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 13:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgDQRLW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 13:11:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6131C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:11:21 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t63so2663100wmt.3
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zdfa1xOmdel4jBPWZeqHqUOsoKXZ4glfFICzCZosfuA=;
        b=ia2Xc2B6HPiwKuijA0cUwEutT5CzATIY4b92exQI+/IV3xQrNRCveD3dFjOVD3tFIk
         zO+JWP2ohdDhICvmi3MFx8mTKMdrUYpZDSusv17g9H4iMzhxq/MoUo5AwdFOc6uHTGg6
         nl9yGNq18XxfGY68vhEZ94AonZzhyoc/6cbzBupLsy5T7KUPkn6fpx3mmrVbdmRBXq6S
         AR6YHflknf5stPWp6AyDkFXfkBmXxYQhdGdW4UOhBgGLm2EvwAtCmlZnOf5drh/h68xe
         o5coBzL388CfiHEQuVO5sXtOK9V/8zDOW/deRDHSTbSU6ssRttxJK2t5KGvl+p8R5w2C
         ndww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zdfa1xOmdel4jBPWZeqHqUOsoKXZ4glfFICzCZosfuA=;
        b=Y3J7WY5YLhp/qSbKsoBJ33JojV/MuboM+qwDo1KW9qwzMtOEEZu3FD9KyDjSBXcj/D
         z/TMbpoYvbrPVXj0QX8rL5eQQpQDO1HcKT9caWgLYFOGN9iKFHzLqpq+ouLbkRPUN7EA
         Nj2kOo5aIEfNDZuohl+5SIHOTU/T2iaZGkmx9Va5ozEe8/eU9MJglMg6D7j/fzj6iZxn
         OJl65JoKfefgxigxCu9jcawmBcifkCkejn4HS3bUMUmy5qC6rvrA75z5rF64UXD0xhgA
         6S3Pa4gdm+jhtNkQfNRwU2Zri1WsdL2PE5Cf65hJ9Agsv8V+Rw+Vv+K04RaTTrNbnrRA
         QwjQ==
X-Gm-Message-State: AGi0PubyiKvkkKRyxnGqWIVyBqb/AWy74wc/ZrABmFfmQppAs1FLTkC9
        5D9taLdLzwAfiQEXsIr8UKc=
X-Google-Smtp-Source: APiQypL8AX2/jEQn8JgErVjQS0ITupKFNQxZfb2am1F+WlTTJfyXr5AhZ7RCXRfTDRFz63emStIyiw==
X-Received: by 2002:a05:600c:4096:: with SMTP id k22mr4041195wmh.99.1587143479718;
        Fri, 17 Apr 2020 10:11:19 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h26sm8361095wmb.19.2020.04.17.10.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:11:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra186
Date:   Fri, 17 Apr 2020 19:11:16 +0200
Message-Id: <20200417171117.2556374-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMIC wake event can be used to bring the system out of suspend based
on certain events happening on the PMIC (such as an RTC alarm).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1c533a969f54..72cfda7305d5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3193,6 +3193,7 @@ static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_wake_event tegra186_wake_events[] = {
+	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA186_AON_GPIO(FF, 0)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
 };
-- 
2.24.1

