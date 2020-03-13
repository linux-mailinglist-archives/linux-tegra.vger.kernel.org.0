Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1CF184322
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 10:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgCMJCU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 05:02:20 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35710 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgCMJCU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 05:02:20 -0400
Received: by mail-lf1-f65.google.com with SMTP id 5so106154lfr.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/V1i4EZlfOpib3pYF1wNtRXeAG+Mti/pQbSyE4GyGI=;
        b=Fdc69EP5eTsus8t1AEhftl0F1Wf61ni0ijpgo+1CXd6ls+FxxlW7gTsZM1vI0mHKf5
         zQnFRvQp1y9ah48BMVJRJQxAFVcT+pOm9+Yvm76IdXyKc4hGn90ayjnWU9zTyXuMlgR1
         AQ3hd9xUb22dRp04SRyqJKTdI1axP4EPUr6l4jz1f2rjtw5eXy+H5ZhtFz9fRL6VH34e
         SOqBeFgiTjPGfeVAcBxQIqkiz1TSIGoZESqIafwvF7AcrfdmD2hdkbUKDmGHEMyPxSMj
         xZlIhB6u2FLY4HoXdVQ06K8Tpzt4LPlsh1yZ/OUbNFTlyx/oaRac5dVC4iMFAnhUF/GU
         BeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/V1i4EZlfOpib3pYF1wNtRXeAG+Mti/pQbSyE4GyGI=;
        b=DFiFInEjX+3pFugj3zWV7MR6Dj7Q1mBra5iomDLgBQajYWWwEDKx7jpmrsIjQzKISh
         gky4iJ1uDHEanFRPFBiBY5bS+4CylcLX8/6UNk2DRWFUHswX9RKdlO4KtNeNKfbURPtF
         FWD3wdrJSQ+Qo3bF7TMBlgpXjJ2GLe5ClEkLYRpYJUkkt3Ynxjjmc3zBUybpMKOnz2bV
         0RBryQru/nvHNVV5FUt1z2IpBMzrIVf4ib4j3yTq70qYXWoW1x07ueQGPmMGFVOGVjJG
         YtcA8SWzVqUrYhuVuLMTjeUdf2j17ZwKpfbgASFeNyprqh+ejtv/RbUqHK9xIS2gnswj
         rRJA==
X-Gm-Message-State: ANhLgQ1AejNQVBFe/yLnP7spfmnZ4LHI1LhZAjIDAW31q6/xb8fYG6FR
        rFrcSzTlclLdhYMA1vk0j2o=
X-Google-Smtp-Source: ADFU+vtvBOin7KFACK1EEFDITxLveKP1XYFQ1v4f43VtNskrTQVQTKO3Nb55KNc2sp+RdhDKAGvPIw==
X-Received: by 2002:ac2:4897:: with SMTP id x23mr5136884lfc.155.1584090135979;
        Fri, 13 Mar 2020 02:02:15 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id k23sm6202305ljk.40.2020.03.13.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 02:02:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1] ARM: tegra: Correct PL310 Auxiliary Control Register initialization
Date:   Fri, 13 Mar 2020 12:01:04 +0300
Message-Id: <20200313090104.20750-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The PL310 Auxiliary Control Register shouldn't have the "Full line of
zero" optimization bit being set before L2 cache is enabled. The L2X0
driver takes care of enabling the optimization by itself.

This patch fixes a noisy error message on Tegra20 and Tegra30 telling
that cache optimization is erroneously enabled without enabling it for
the CPU:

	L2C-310: enabling full line of zeros but not enabled in Cortex-A9

Cc: <stable@vger.kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index f1ce2857a251..b620b0651157 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -107,8 +107,8 @@ static const char * const tegra_dt_board_compat[] = {
 };
 
 DT_MACHINE_START(TEGRA_DT, "NVIDIA Tegra SoC (Flattened Device Tree)")
-	.l2c_aux_val	= 0x3c400001,
-	.l2c_aux_mask	= 0xc20fc3fe,
+	.l2c_aux_val	= 0x3c400000,
+	.l2c_aux_mask	= 0xc20fc3ff,
 	.smp		= smp_ops(tegra_smp_ops),
 	.map_io		= tegra_map_common_io,
 	.init_early	= tegra_init_early,
-- 
2.25.1

