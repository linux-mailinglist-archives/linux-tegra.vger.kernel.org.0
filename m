Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621B3F4FD5
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Nov 2019 16:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfKHPfm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Nov 2019 10:35:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34742 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHPfm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Nov 2019 10:35:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id e6so7595389wrw.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 Nov 2019 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35YhNlP7XHyfbfIvRXQyE3MF+iWQvCIj1yQe5xoyT64=;
        b=F6TToJM/kOejkuw3rllrU21lqF1yojycHYl+JLhzgHXgfMB8sPTFT6ja1UHJMnvnp8
         AdG3o97B4wEb0vtISvueL9NcdcuSW1IjUKGHN/BDXiQSwp29UjeAHyUynmtfLLpxUbAI
         WD13PzcXWEWY9ljbI4P6ttgK0Z5Y8EkGlKCXL0rfJT/dtaCfplzht6Zfvr0ACaJoTL7W
         vsgMGB/L2H2O563LEnbavmUmWaTIPrBVKSlgJgUZyUgXsdB8Eunwn6IO9K5n+NwGrClW
         I0A/cWir/OXXSxyey0c6YOiRqa6aKYZUuVhWfC3KJOyk1RaRSdHPMhESHFfRF+Hee0kv
         RZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35YhNlP7XHyfbfIvRXQyE3MF+iWQvCIj1yQe5xoyT64=;
        b=jkfj8VqwUFz7uWZfX86n+CvFQZXIKdT5OFONYbC6SgoYl1mpb/UL7h4YzE0wXT8xzx
         RvPO55b0fegPfMOYThMMDeby18c6dWu1/rrofbQoALlj2XTlzjXPxFDsaEozfx87q7FA
         PCYct1/aCIljcuGehVo2xil5IZCVRvDFZRJockmnQuVzaz2/2ughMjiBId6Kvhp73Nm5
         rKX71xgc8zUmpXwTUCW+uRiQIw7QrporgsdfYdqFBfI58Vg+ijLJO7G/LSGqMIR3NkBU
         q9AAqkQF2FIiN1zuNvv/TB30KUrmjDrnSx7CQAxbzwazCtFo3jyL+lteWt+qhtZ0UwL/
         uf0g==
X-Gm-Message-State: APjAAAXZ4VIlgEmcpBPRNL6HYhzjLhmLPSO2qfFNhu1/X31jlauaHjiw
        0xkucQ/7J5tJ+Fl4D+UL1XY=
X-Google-Smtp-Source: APXvYqyDTRl0s458nQKi90FAH/59AVa0FVuXdqZ6ZFQW5YpWi7SVk+Ax3Tll4Eowt4spOBRwG4n1OQ==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr8703052wru.159.1573227338729;
        Fri, 08 Nov 2019 07:35:38 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id p10sm7552174wmi.44.2019.11.08.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:35:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] soc/tegra: pmc: Use lower-case for hexadecimal literals
Date:   Fri,  8 Nov 2019 16:35:34 +0100
Message-Id: <20191108153536.3157608-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The remainder of the file uses lower-case for hexadecimal literals, so
change the only odd-one-out occurrence for consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4e51248634f8..927eeecd34e5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2805,7 +2805,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 	.dpd2_status = 0x80,
 	.rst_status = 0x70,
 	.rst_source_shift = 0x2,
-	.rst_source_mask = 0x3C,
+	.rst_source_mask = 0x3c,
 	.rst_level_shift = 0x0,
 	.rst_level_mask = 0x3,
 };
-- 
2.23.0

