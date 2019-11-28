Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402BD10CBD9
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfK1Phx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:53 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44635 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfK1Phw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:52 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so31585041wrn.11
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1T7/AcKP+hhj8SOL+bY3lDT9n71bxZ0GZTUy8vWuG2g=;
        b=Tpd2Ng5wKj1h9mYegR6CcgORwfu+unKC6Z52kdP+Lh8xc10PYhNiJMKy1fXhyhMNe4
         EVEm0JMyoShZpbXGeWhr8DR0AgVeWVyQXNjxoA6vP0FJeWexKJeo5Ctl4u3sYLoNiaV5
         c5w1G38jZojKpu3AwC3MieqnPKVXIkaaF0Fw1kO1o/e19vzRs9dW1W7zrIqsksMksmis
         c2v8QLm6zuLIvc5WreVea9H2sEdgfwQ1Mz7QZJApfymVkwHJNLCViktOX9GXw+o7Dtja
         11UbqMN2ADA9pIh4RJizyvCeZWzcVkoDmrF9idnwTQ4Wxpj3/yqAtjBFT0IbIMGW5NHP
         w/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1T7/AcKP+hhj8SOL+bY3lDT9n71bxZ0GZTUy8vWuG2g=;
        b=GO5y+w3Hr79wf3NMyI7fVN8NPitW0Ojd22nEON4rkBUGX6AAWzgiA+8fRKV0VWpesK
         ERXSSXIFIXMjF2PAx5RMuqXgBhKwY8TPGXuFUupexE60QIPHfsFhQAhdEm8Xp/yABBpa
         0rTVzckiwok1karyM1lEgO8o7oVweYXfdYyPcz61OEZs5VvjBv56fdI8K5YEcaw3c4n3
         7E1539Jil8e3VFqpMG6WYdhSLfNhJGibGYfURKG5Vx2efoxHc3+6ZohKmWXDNc82f5W8
         HwAhuKc9u4CdLSglak4dJfwDVShtq5AFX40YqtrVu2rzr2AGtMJFG5pxaEyk5TsZYWcJ
         e7MQ==
X-Gm-Message-State: APjAAAWP2GmgjwLqUZ8kvrJ/vr4B6sfEnxHEdElw71kj7mQ90DwTv1GY
        VPzgpACqP6J/GwbQz+LuVsYTL4Z4FDw=
X-Google-Smtp-Source: APXvYqxKLainoNtcc0HDYljhnL3r7ynNz0rfcrAvv/OaB23srWIx2DeO4OnP3I8objnbbNwISXF4/A==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr1044845wrn.19.1574955468937;
        Thu, 28 Nov 2019 07:37:48 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l26sm10811590wmj.48.2019.11.28.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Date:   Thu, 28 Nov 2019 16:37:35 +0100
Message-Id: <20191128153741.2380419-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It's not known at import time whether or not all users of a DMA-BUF will
be able to deal with non-contiguous memory. Each user needs to verify at
map-time whether it can access the buffer.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6dfad56eee2b..bc15b430156d 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -440,13 +440,6 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 		err = tegra_bo_iommu_map(tegra, bo);
 		if (err < 0)
 			goto detach;
-	} else {
-		if (bo->sgt->nents > 1) {
-			err = -EINVAL;
-			goto detach;
-		}
-
-		bo->iova = sg_dma_address(bo->sgt->sgl);
 	}
 
 	bo->gem.import_attach = attach;
-- 
2.23.0

