Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FF6F4FD7
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Nov 2019 16:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHPfo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Nov 2019 10:35:44 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51066 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfKHPfn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Nov 2019 10:35:43 -0500
Received: by mail-wm1-f65.google.com with SMTP id l17so5828091wmh.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 Nov 2019 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNC2rG8gGXEQf4LCM3KTSpNqUdh+je7EpE8ph64yiAs=;
        b=qoDLKq52laIkz2DiPt8QbBvEvkpUbxVQWiTekBYKtJVYTZ+z94pF9SLU4JXRZEtlHH
         FzZ6W4ZuAmyXUm1vZkpZnVDwUKneElCCOQKHYYns9DFwglcsjZICd1OwQr3fn7ADY37s
         qmpp54+ay/sXAuVavy3PfekTf+BDGYf118L2YcR7Yn2NmqrpSquHwoav8FmoWNPwcVGu
         L94QwSVacF/pG1mQJ++HXNipZvq/44DIZr4E4OCebe9Yq7AxPNzyECsB3U6TqGeXP0+U
         XJHXYN+S4FKtkqesOm5TPD+6HebKpZSUJkaiDB3KnuJVJAQvYLbxR6LBMBKTzwlw9KPh
         izNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNC2rG8gGXEQf4LCM3KTSpNqUdh+je7EpE8ph64yiAs=;
        b=JwpgS/43Oq/hF3SS9lnpuy05OtXkFok/TFW7EcU5GpzitNrKiufGnK4bFOJXN1tu3u
         7cVpcrE9PfJ/2rXlKgFliNjT1yuVefaD8l9cylIfHFWxmT5iOn2Wkl9FmNoUFwlZDT/h
         U7ER+EPVxdL+gkgf1EEdVnIwDL3YQJP7QFsLbXiJUH1Fn8cZ2TvG5BJ2Bhb2k//7pG/F
         B3vKNb+ZSx3JgZcFnex1Sq2wrdN/zrhay4J2l+9ZJP18Hf0nZp+ApGMQwnZ586+1iynr
         Bvt1Dxe+s00vA6+9ZdBH2FAM3xnxx7xJOGIRZ2RY9Xw0cbp3Q5bHtSUk/P4JFvLnr2M6
         LbYw==
X-Gm-Message-State: APjAAAW+8d1TFfqDXTAY4THa47fHT9FQmvsf2j+zQ8JLN+YhhOPEwNWn
        t5mfWhLrarmHeqVz2lNjQG0ygrcq/BU=
X-Google-Smtp-Source: APXvYqy7uZFoVfPeI+0T6PSn0dw0vCyYKyQDsdfRJTbWFnQa8W0+SATV8oIRJl1544StAXLLk22ebQ==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr8602804wmd.32.1573227340483;
        Fri, 08 Nov 2019 07:35:40 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id m3sm6006000wrw.20.2019.11.08.07.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:35:39 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
Date:   Fri,  8 Nov 2019 16:35:35 +0100
Message-Id: <20191108153536.3157608-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108153536.3157608-1-thierry.reding@gmail.com>
References: <20191108153536.3157608-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reuse the IRQ callbacks from Tegra186 on Tegra194. This fixes failures
to request interrupts on Tegra194 due to the missing callbacks.

Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Fixes: aba19827fced ("soc/tegra: pmc: Support wake events on more Tegra SoCs")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 927eeecd34e5..32b3e8d9155f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2947,6 +2947,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
 };
-- 
2.23.0

