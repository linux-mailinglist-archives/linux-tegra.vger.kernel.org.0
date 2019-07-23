Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DEE70F31
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jul 2019 04:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731554AbfGWCh2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jul 2019 22:37:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36427 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbfGWCh1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jul 2019 22:37:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so39532300ljj.3;
        Mon, 22 Jul 2019 19:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WNsHUchMl+2BsfVjcPCvfcQNivIm1GFa9STt6iz/zjU=;
        b=gcT0KcZd7VTcULU38+WDlqb1sIdavdXbHQpYMiz/R7nNxphwaOweDvNlM2eivWw3xj
         f0Vfc6rJp3XOctDr1OxDM0wtexOOgc/AUK++QDUIbPHNxG8qceblNwemcBPmKd0tSEye
         dNMXPwULUk4i6OjLMe7xpYSPEa+xdMxFLNbHZ7QxN/eXmBApD5jEYzts0eXbErM4Y2QK
         kWBnqgzjru5wx7Brz577LftJzvDBxvN5qUN+fCpXZXA15PBxTTabGhwy0Q5plsg/Mxa/
         Y9gmdYWTeA1ObGTLgz8f35/Mc2AsOEaN4t0sn5LiDth8bbtHlKBf+VRgK0BoX+IIaHuD
         2c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WNsHUchMl+2BsfVjcPCvfcQNivIm1GFa9STt6iz/zjU=;
        b=mIsC9WsJeJwICIwHDXGIpR/iQNv9QoMvMKx2LgGmtiiuyJGcEbl8jKms4V7xNWA9jz
         7OOMqNWFeX61Gdo/LWu0ZpqCMmD1jVGEnnwJg87a9FmadUGuNSkW/iKGPlDiq6dXjg0J
         3eY3upEEu2bKzil+rLeixxQmG7Ta9qxHl81lQI+chWuv/mqt4xC1KsFNGt8mP2zrvEl8
         3lRXHIMs4ijcQgH8Xx345vz5WfP90oRHOJIVG4rj2r1uprCulVeDeJ+AeczLrWQo3D1h
         tmKJq7AD+66Jjm5WR7AGVQV2Vc7278abORulDLTvB1K5j+lXhhknbw0+ykilV57Z+kJ/
         hMAw==
X-Gm-Message-State: APjAAAV1ea4Klcs5ETz5JaGGB+Vzl86GobVBvO3vhndV4npR/6g8gnRs
        P2Xg73lHFTT03yZ8KliBllY=
X-Google-Smtp-Source: APXvYqzn/Z6XRU9LqgLYqgj3qrdyzjbDU16lDweTp+eHms7p2jsK3dE4bSGD0Er9I/Rq/8SCdSHhHQ==
X-Received: by 2002:a2e:8681:: with SMTP id l1mr11688290lji.166.1563849445457;
        Mon, 22 Jul 2019 19:37:25 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.gmail.com with ESMTPSA id r17sm7832425ljc.85.2019.07.22.19.37.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 19:37:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc/tegra: pmc: Remove unnecessary memory barrier
Date:   Tue, 23 Jul 2019 05:35:11 +0300
Message-Id: <20190723023511.24542-2-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723023511.24542-1-digetx@gmail.com>
References: <20190723023511.24542-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The removed barrier isn't needed because the writes/reads are strictly
ordered and even if PMC had separate ports for the writes, it wouldn't
matter since the hardware logic takes into effect after triggering CPU's
power-gating and at that point all CPU accesses are guaranteed to be
completed. Hence remove the barrier to eliminate the confusion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: New patch that was added after Jon's Hunter pointing that it's better
    not to change the barrier's placement in the code. In fact the barrier
    is not needed at all.

 drivers/soc/tegra/pmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index aba3396b2e73..3044809f1c10 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1457,8 +1457,6 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	do_div(ticks, USEC_PER_SEC);
 	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
 
-	wmb();
-
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
 	value |= PMC_CNTRL_CPU_PWRREQ_OE;
-- 
2.22.0

