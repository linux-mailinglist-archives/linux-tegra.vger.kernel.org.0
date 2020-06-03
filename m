Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BA01ED1F7
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 16:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCOUJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 10:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgFCOUJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 10:20:09 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD225C08C5C0
        for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2020 07:20:08 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z5so2378059ejb.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2020 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=brk2U8DSU4E7P9UsEsDcp0iVP2I5n96xwIrVhsO2D0U=;
        b=O3Hc7B/C+hhE0kIURHDPGIQom3B8NcaK2/PBXIHdaKszf4Shr2XwE/CY7e3K3X9un7
         bunwidpWUmEKcYQ1+DyovPB6Ss6ilCeqcQ08x4EQjzR8XyyYqwz/Ka4UKJQ4lUHrSSpM
         UHfXsDtK5Y4CtSSURVBI0x02U4AdOU02Bj41bKnGK2vTB7kQSZrGcKnOXatYMQolqilO
         xCyzgl8avJ0ILIK67XyJppKrJbmKdazxxb4M4E2N8uaImFg6Kt99NQStQGn4TxJzFZ+C
         FfnCUK9sHHPZOOE2xvN8K1wDNSa9YBLZfhshse7L2EPgQe3TPqAv5IxCBdCNgm3h27yd
         7q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=brk2U8DSU4E7P9UsEsDcp0iVP2I5n96xwIrVhsO2D0U=;
        b=rpLhTGkIV8y2pFyCkCqptc7MFT6nTavXx4RVOAkInC09frF9K9qbq/YJjeaksQGCX5
         2XSTN1Bh8UumrxlTWqHbf+7Sm/cZNlBvyEyAPm01fajSX/JqxAarqyc8kWCDB/SzVQN2
         DHNfdyNcGom+P/NhKNZ1LY+eDyL4Ln5Ih3Sx83yUhgsE3X7u1BLSQRcmp5OSL8w3pUKm
         cu5JBEUzCyPpHR0q/8ijw6kBAGD+kAt/ANhk0sLYpAXbjggm2of2gTeunFWItsDLtuMX
         1M7v8xLnIUb9bcHQv7dBU9W+/jQLfPbH+yNWHUDOy9FTTu0r8cP+UQUyfaSk0tX+noSO
         h0TQ==
X-Gm-Message-State: AOAM531YXNei+H17ICJAhquClOjDjjKzzhKQlAEA6v4237DRAdOyQ+6A
        xLqiXfeE/h1N2/MAeKYMPtY=
X-Google-Smtp-Source: ABdhPJybWenTiub6eisJLN+mdRwASGIKTFULXH9VQVTeL1bG9nxCvoga0C3ZtE7cqaD3yXClqEsFtQ==
X-Received: by 2002:a17:906:3289:: with SMTP id 9mr6777119ejw.316.1591194007599;
        Wed, 03 Jun 2020 07:20:07 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id qp16sm1181788ejb.64.2020.06.03.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 07:20:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
Date:   Wed,  3 Jun 2020 16:20:02 +0200
Message-Id: <20200603142002.3776672-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra firmware doesn't actually use any version numbers and passing -1
causes the existing firmware binaries not to be found. Use version 0 to
find the correct files.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
index ec330d791d15..e56880f3e3bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -352,7 +352,7 @@ gk20a_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 
 static const struct gf100_gr_fwif
 gk20a_gr_fwif[] = {
-	{ -1, gk20a_gr_load, &gk20a_gr },
+	{ 0, gk20a_gr_load, &gk20a_gr },
 	{}
 };
 
-- 
2.24.1

