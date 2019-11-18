Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB87BFFE89
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 07:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfKRGdz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 01:33:55 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51382 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfKRGdy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 01:33:54 -0500
Received: by mail-wm1-f66.google.com with SMTP id q70so16041089wme.1
        for <linux-tegra@vger.kernel.org>; Sun, 17 Nov 2019 22:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35YhNlP7XHyfbfIvRXQyE3MF+iWQvCIj1yQe5xoyT64=;
        b=c2yTCxlbyF9DKXPnbPuU6cgd0OJ8C78edMT/pWyZZl4QZgMUPyKeWr1nSGiXLRGK6c
         j3ufxqINSzDaFiFJEceuV+cpj7obJfm127FT1A8ZlgTXPEPOtmX0ioREvwFFxc9+CFsF
         juIvhvwMlLa0H7W6z2vUcCdBHEXQFv3sOdj/7+S/ZX3X8jCzMBIcmoD+/EDdw/i9MV7a
         oWAHrz8yFiT1zVC14JQJ3aOtXJntmX/AqjgnnvkcHWfC+ZWoZYym+rjPY4K4oPLAiAIN
         XY3Q9sSKhiiyo+/G2H6U+Vx3EO/izO9HnpPyCATLGfefJrzeQri2y3lzdQXr1jRhNQvx
         U43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35YhNlP7XHyfbfIvRXQyE3MF+iWQvCIj1yQe5xoyT64=;
        b=HqigKZrWcbKPcsD7kF4grQzRadgB343qHkNZfAisQQaQ+zFfoXGOUCvlqyr8Kax2JP
         O+FL5kotfPrIsDI7DpTX2kJjwqETYtBPZX21U0WGfdiInusodKInFDhoGlsdhPG8nP+E
         n+ES+2u8Rq4sFDMHhIiRiIur1zzgxmWsRFwDwZWQPEDaNSn11GY7/oEKKlVlby8i/2Cy
         HEMR1rE4n+YYCyYQiIjNpVdDGa+TG+LoH6QUlJZcXXlf+xZlXclBztDykBsXq0iuL7V8
         OxP04ybz6592efnxRFxZfmFl2Qv8lwXC0zsw+WvxwaHL4X2+TUGKKWHCWlJjB55/sBYl
         SQhQ==
X-Gm-Message-State: APjAAAXeHFicEB9CJxr/qPBlAeceihzx/G6Jk0lKnqo581dV1kEmbOtl
        7lvhYLP6BJ7e8+43M8DKMJk=
X-Google-Smtp-Source: APXvYqwQCJiG/puUxtO0L3NAyS183k5IgtY2GxGRDkNl1D0ypWzfjRbCF2l6U06y9KFst7XBvfONsg==
X-Received: by 2002:a1c:984b:: with SMTP id a72mr28162457wme.78.1574058831216;
        Sun, 17 Nov 2019 22:33:51 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 5sm18143862wmk.48.2019.11.17.22.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 22:33:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] soc/tegra: pmc: Use lower-case for hexadecimal literals
Date:   Mon, 18 Nov 2019 07:33:46 +0100
Message-Id: <20191118063348.1816857-1-thierry.reding@gmail.com>
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

