Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F82ED01F
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfKBR5D (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:57:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55104 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR5C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:57:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id c12so7993123wml.4
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
        b=kGdAlsC0kEb4EWVcirGKrl+8N8G7z11eyL+N++FGbwwSzSoE6ZcKMLbYcO8O5MdHOg
         /IO8dqfY6v0T5HTtAWyebqsKBaTGXbhc9QsdM8p72pWjQu+b7J+v8R1PZIHMiVh0nFjI
         uM1nErfIpv1RyrpdMMbnwoT1L7pfUI3/Gv0yONmxOc32v6QGgAj+wsOU3sPZggGQdUtv
         0gBO1OXVkMZiZPD4RnAsf8+xvDExix3v/FbSNTLdzkj6GsKNigJ/txIoV4KYIw/N11wB
         GFd5SNI+R06IQtGoyrul/YY6ihqwEkhOwNXA1P/S8jcoculMy2EX307WJrYSmpcc0FW/
         PKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
        b=I3iSol+0fYCo1kBskZZHftCkyM+Akk0KJqM1APdVQrv4DjtIFt1wHCTxLHUrsJHJEE
         H0cqS89PSGHhfXUY8Ms+hqklRU0irjOPCSxgEkELN7QBsflgraKGgytFFzzHjpkJokPZ
         y6g0XxW4aB3KLtOM1iPYzd6hbJ7l96IU2jD7FFPhXhffjeD0kWMhnhOxcwyscsdrmfjE
         k6tatwWYzO9YdlvH25gB2JxSKWJDFeSt6G5y7DTj/1n6TfyVm6jxm4l2tTm9Q29PRYsV
         8f5djWVItFF1UkbVbztA9WhsKHB1uRbQWqZrw9hRHQBe0Bd47s0Z35l+3HEQMBvoiVBw
         CxCg==
X-Gm-Message-State: APjAAAXHPhUtFOUrdfDd2QoYR9P3gf1qGgKYtM9nDO7HWC7oV5ZQUUWh
        e6nj7iyN4Ku59NyGPej+0nE=
X-Google-Smtp-Source: APXvYqylSa5xQza6BCuat0c+VFhWosAfc/mcoFK3Z3DTN66n2gfL4tq3KX7mnuNq/rdbV9NYuPbAcw==
X-Received: by 2002:a1c:7ec2:: with SMTP id z185mr15811883wmc.79.1572717420566;
        Sat, 02 Nov 2019 10:57:00 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id b3sm6918849wmh.17.2019.11.02.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 9/9] drm/nouveau: gp10b: Use correct copy engine
Date:   Sat,  2 Nov 2019 18:56:37 +0100
Message-Id: <20191102175637.3065-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

gp10b uses the new engine enumeration mechanism introduced in the Pascal
architecture. As a result, the copy engine, which used to be at index 2
for prior Tegra GPU instantiations, has now moved to index 0. Fix up the
index and also use the gp100 variant of the copy engine class because on
gp10b the PASCAL_DMA_COPY_B class is not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 231ec0073af3..eba450e689b2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2387,7 +2387,7 @@ nv13b_chipset = {
 	.pmu = gm20b_pmu_new,
 	.timer = gk20a_timer_new,
 	.top = gk104_top_new,
-	.ce[2] = gp102_ce_new,
+	.ce[0] = gp100_ce_new,
 	.dma = gf119_dma_new,
 	.fifo = gp10b_fifo_new,
 	.gr = gp10b_gr_new,
-- 
2.23.0

