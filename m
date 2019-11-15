Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 947E2FE2B3
	for <lists+linux-tegra@lfdr.de>; Fri, 15 Nov 2019 17:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKOQ1t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 Nov 2019 11:27:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33120 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbfKOQ1t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Nov 2019 11:27:49 -0500
Received: by mail-lj1-f194.google.com with SMTP id t5so11343143ljk.0
        for <linux-tegra@vger.kernel.org>; Fri, 15 Nov 2019 08:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWy5C8R4LY42mpU2jOgPAcUIDFARxOc5CXnNQDPrt8o=;
        b=KfZgja04z0j0mpaZ86xhK+ZPcPHY3TpHl2vfL837X7KisO64NIlIaa5uEVmPk+YXty
         pTpbESpCOHQoTsBUPNERS0uQ/QNxjnpLfy7z2gRWRKgA2IK5x2daOSGiEFc5c3XFnDUH
         buc25L36UI0ql1F56SwKH+MRp7dBr/NNxpeU+TYjUY8542oOlpA+/HbyYrPVRgijGeNK
         6VPPCH2ljtEE2hQykN0B9BudW6kZpKew8oi/GFmI7oatSGHp1hC7xZt0mMwyKA+oyf99
         tunSw7/iyC/My7mPhkGN6v/3l6QcIuobpmKzmYtATbGSOzJu4Is4WsGQXt/L8dvDFL9w
         aM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWy5C8R4LY42mpU2jOgPAcUIDFARxOc5CXnNQDPrt8o=;
        b=XRl5h00jdIUCwKn68qrv1VxQ3FgWmujM7Kqe0KmSVFAvpU98g9Gy8LRqfDE/nba8VT
         VG19G7JmAGdG4VQNzwcjMvCMRPZIWgIUZGy87dx4E3qB4B95c6tdBwKKw87F0a7GTTem
         dG4r0UPOSqJT1HAVPcHcQsRbHECIAoloInRpH0BFQemueebxncO6OAViekdKD9zQvqBr
         pAHiCQqO+uIadRWmUZBB70JmQS1ezPm+BfOWCK/3bTODQHTP0tZFqlGRGLpWVRCBtvdr
         YXntDLwU32MCeiAPccCQHcrehkiWf8x36DQGUtQ2KPNXZqK/nHzdHnn6PAEGMFZggOuO
         TMiA==
X-Gm-Message-State: APjAAAXXEjcnL1rJRnrwt/dYdBTygUCTPjj4qheTH7pOX7ofqigWBfda
        RwC47QTDXtpOtmXRcWozGPc=
X-Google-Smtp-Source: APXvYqyGQq6q9gxQRnMJ0jH2bKNPjlGXly1g0xbSJOZrVKKs3xFgyfQSIFqSxmOUagnQ9S06DFI8uw==
X-Received: by 2002:a2e:9b4b:: with SMTP id o11mr12041877ljj.252.1573835267228;
        Fri, 15 Nov 2019 08:27:47 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id f5sm4056130ljn.24.2019.11.15.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 08:27:46 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra30-emc: Fix panic on suspend
Date:   Fri, 15 Nov 2019 19:26:42 +0300
Message-Id: <20191115162642.11397-1-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Trying to suspend driver results in a crash if timings aren't available in
device-tree.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Fixes: e34212c75a68 ("memory: tegra: Introduce Tegra30 EMC driver")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 6929980bf907..0b6a5e451ea3 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1093,7 +1093,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (of_get_child_count(pdev->dev.of_node) == 0) {
 		dev_info(&pdev->dev,
 			 "device-tree node doesn't have memory timings\n");
-		return 0;
+		return -ENODEV;
 	}
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
-- 
2.23.0

