Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E12F8233
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Nov 2019 22:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfKKV1q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 16:27:46 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44578 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKKV1q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 16:27:46 -0500
Received: by mail-lf1-f66.google.com with SMTP id z188so3814781lfa.11
        for <linux-tegra@vger.kernel.org>; Mon, 11 Nov 2019 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=njUyABQHH6S7YwtAv6D/wPUh/8BEDdfrn8/DirhOyEoIHjNkLf+BjOELL7XgNnt2zt
         7XciDoszdpybGmlP7kENbewWRN4kD3cu22hWZf/yotOE8GG6pd4UZNKPLplzV8tlVpnr
         KdCFdqBd+SYPkClO8MAJsxz/ZPvNQDsxI8n6PPt4/EOs0x3nez9KMQBn9DM6eSDwRbzg
         BJ19wKBXiXpZ8jFAJQclP+DLPgT79TqfRCIzGTkUXWFTTIFmvdVsxBhuKBUzpHnEytTr
         O4dwn66rqr6Y+6+V1DEP6w5/mqOY9H2Hs/MSI5pYxy0YbXPnWFp9F5VIzFSwRGP1EIxB
         fV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1Nw0vEzgAGqkBGVXXYW2HyLesWf5OqF6+ALQmKG8ew=;
        b=h4+scuxo7Uny441o6NBmHkiy/jU+Z1gB+S2z/VeMNc1XSa29kxeteQGXw4um2k0q6a
         1X2Y2ic5ChPG1B4fuA011uSfSIMTkrxs9erlF3ZSJR2ygV70i8R1ysByGhpqSkYTVeN/
         9dMr2yCSvE674+Kl9C2B9eHIvq03Ip3YvNfqMjQcjcB2cWSHjnSnuIb9RRgOBy9L04gL
         yNMu7Bf2fl83h/Qj8M+Uc558uKqEj+I6TSB2xE8hE3Qc/VuReQAB1SnH0Gs78N0YiiBG
         erqzW08lsjjWmN9QAjgSJyoFcFN9q2bQ2A9+y/vWIlLsy80tvy4EI6/7SVg8WoDXWH57
         gtKQ==
X-Gm-Message-State: APjAAAUL0UF+bpqwrt8TuM1dYvxlF6kN/qKQyzcA/pVQCeGoL39SBdiK
        HdI5hY0otOZ1noP4Iw9oaqcWgdCQ
X-Google-Smtp-Source: APXvYqx/r5V3PTW/B8NpxjzA31jisHuT+/GL7rcbeCSCtD8iWjt87BVs/gxdKN0EJyXzheF7SUY1hg==
X-Received: by 2002:a19:c7d3:: with SMTP id x202mr16890062lff.127.1573507663973;
        Mon, 11 Nov 2019 13:27:43 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id k25sm7344008ljg.22.2019.11.11.13.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 13:27:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/3] soc/tegra: fuse: Warn if straps are not ready
Date:   Tue, 12 Nov 2019 00:26:36 +0300
Message-Id: <20191111212637.22648-3-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111212637.22648-1-digetx@gmail.com>
References: <20191111212637.22648-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now both Chip ID and HW straps are becoming available at the same time,
thus we could simply check the availability of the ID in order to check
the availability of the straps. We couldn't check straps for 0x0 because
it could be a correct value.

This change didn't uncover any problems, but anyways it is nicer to have
straps verified for consistency with the Chip ID verification.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 54aeea1b4500..f580b3116bea 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -27,7 +27,7 @@ static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	WARN(!chipid, "Tegra Chip ID not yet available\n");
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
 
 	return chipid;
 }
@@ -39,6 +39,8 @@ u8 tegra_get_chip_id(void)
 
 u32 tegra_read_straps(void)
 {
+	WARN(!chipid, "Tegra ABP MISC not yet available\n");
+
 	return strapping;
 }
 
-- 
2.23.0

