Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5891DFFE8A
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 07:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfKRGdz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 01:33:55 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52744 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfKRGdz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 01:33:55 -0500
Received: by mail-wm1-f65.google.com with SMTP id l1so16037549wme.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 Nov 2019 22:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNC2rG8gGXEQf4LCM3KTSpNqUdh+je7EpE8ph64yiAs=;
        b=M8Zk4T+WOvGqLEmQ6/7hg18700RiB8I81KMmKpualEHu3kjd+ah3Qr0mYSvqGkoVGK
         wG/kxfQzjLZfcNED0eE89lzRlY1BCSQApYUEGP+mzqmrCBCeqHsrUyao5C1Ek92MFOBf
         dzGYUBu/3KKIng8wz/PjGHq81GqTkKACEYUXZYBqLcHyaR4N0TkiAMJLIOUdulBrweoi
         chqIKqULMipBAoeF5I1WkikYtQSY9vOHycwpXvsnJXBDeD+L0U+Gfaiv1ZidLTjOFGXT
         mhEgcFzP3UAMkVprAZgbIyTKuzK+cQ2VzWc30dD/IEgTcFm7uJkrbw9n4Vyf3f1MXFbM
         Qxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNC2rG8gGXEQf4LCM3KTSpNqUdh+je7EpE8ph64yiAs=;
        b=qKX9ywbxZLjI9Yo+YLsQR6xk/S/BKBf8TZU3bWLQbuBAiBXyZqYoJkU4zIpEOyyNI3
         j1T9ntgYzDOesRPhBURCW0KEzUQT/Rvd/VLxF2vc/ODNwnwdJDwQuivarXoSxRy678bH
         t1qH1yeWkilBhGeh0CgxGsUoxpe9vF3c2H4+74o4D3ZsP8zI1KY/eGoeulvWwtzuUn1j
         WoUE0A1C/T8ToI2/N6CWr+1GuB4pRAT6KCxxUqV5nCWDls3RuCzaK2eGFzzzSUXqmAF/
         4VWfICR/d7W6AJrNKYnc57+k9+qsPJcEDFEsg7a5/Csi22rQMZQXE+JCtr9465hpwvRD
         MxRg==
X-Gm-Message-State: APjAAAXMH+rXnReU2vnRL0isgXrcUVeKIVYNlcBEKbNtnLTDTstxLla+
        72LudBgL7v3dENW4g5OCtc8=
X-Google-Smtp-Source: APXvYqwdGY+HNOq7NFjKGy5aoM5P3FBocaP00aMYBlygoQxnmvWhJNhcpioHF7oyQmiGbnNyXw4KJw==
X-Received: by 2002:a7b:ce86:: with SMTP id q6mr26488418wmj.20.1574058833107;
        Sun, 17 Nov 2019 22:33:53 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a26sm10976908wmm.14.2019.11.17.22.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 22:33:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
Date:   Mon, 18 Nov 2019 07:33:47 +0100
Message-Id: <20191118063348.1816857-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118063348.1816857-1-thierry.reding@gmail.com>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
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

