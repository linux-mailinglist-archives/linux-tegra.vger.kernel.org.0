Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201D91D625D
	for <lists+linux-tegra@lfdr.de>; Sat, 16 May 2020 17:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgEPPle (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 May 2020 11:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgEPPle (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 May 2020 11:41:34 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2908C061A0C
        for <linux-tegra@vger.kernel.org>; Sat, 16 May 2020 08:41:33 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c21so4335970lfb.3
        for <linux-tegra@vger.kernel.org>; Sat, 16 May 2020 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
        b=F2J3duNvPYYOgCm4O0PbPkVry2+QQoXEzOR+FYYnm39uZZAozYuOZcVwnp6oMahY3d
         pEhYQbajpFxGK/wG/BzIIH5xq44AfjjK1K4xjQ9uld59spiHYUrIuatwrqA5PecqxSfu
         R3lSDsMCiWKs19acEdVZraOSWEnpWl9MRuuM+sS9I4DVr4T6hH1ul6Sfj+D8mK4FshPy
         RYXHxYqgeDYGjvAa0hNurdzKpt5kPqURkXW0Z2lRXWpbFI8zSRfSxHIT8DcApRhlXR1g
         GdlepnKv56q0lCzf6+i0Et2fKiF9BZLFMb2/wzi4dOk7D8eNhd4v6Q6V1r9yVxjWGUdK
         qPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
        b=lZ3I1Akilcmp6MXNBZvdQ2cWqamYAeSro9YIrJlaxjqxfU9CBef0KhaDy83lRk/6ZM
         sdH6g/2gGR6jds3miACp7/WCBVL4ziZXBJpG4Xd6P/1AJuViwhMU8uG5XIVdbb9Empbq
         CYP31a3OOLttfxOvLlHyxeDTvcXloPfcdfB607jZqYmsh9EGFT2WhCgc3JmhwXBDmKAp
         +zVTeXxhN0ilWmRHiwlZm7nsI5dLmf+RflXXrfqGqsXof+3P0nTxgNFQxt0T5Ic5eR3x
         Tj49cDXiwQ5u61JF9djjAGX4G7OtixDuUQXPJoNTeQw9BZRe3OYo9IDuyZiPJa8zMHNb
         lwSA==
X-Gm-Message-State: AOAM533jTqpozQh/qckI+TzcfHXfaxIu8wJDmRhbxxAfvDyrJZ3x8CKm
        digL0irt+0JG/jRaoeYofWc=
X-Google-Smtp-Source: ABdhPJwYeCTep/xT1011C4iJO6nPJ5k1EtNf5/UG4xLqxGDRn7q7vck322J/zyOj/hEf2jBUqtpg3w==
X-Received: by 2002:a19:ee19:: with SMTP id g25mr6041107lfb.124.1589643691295;
        Sat, 16 May 2020 08:41:31 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id v2sm2894525ljj.96.2020.05.16.08.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:41:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: gr3d: Assert reset before power-gating
Date:   Sat, 16 May 2020 18:41:15 +0300
Message-Id: <20200516154115.14510-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra TRM documentation states that hardware should be in a default state
when power partition is turned off, i.e. reset should be asserted. This
patch adds the missing reset assertions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c0a528be0369..b0b8154e8104 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -381,10 +381,12 @@ static int gr3d_remove(struct platform_device *pdev)
 	}
 
 	if (gr3d->clk_secondary) {
+		reset_control_assert(gr3d->rst_secondary);
 		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
 		clk_disable_unprepare(gr3d->clk_secondary);
 	}
 
+	reset_control_assert(gr3d->rst);
 	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
 	clk_disable_unprepare(gr3d->clk);
 
-- 
2.26.0

