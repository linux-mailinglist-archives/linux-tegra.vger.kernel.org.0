Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E093D6313
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731618AbfJNMvY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36245 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfJNMvY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so16649483wmc.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0xL/iDkEL+mRgHC/hRILKSEGgtjkYP7/04WXy0TU5c=;
        b=oQ2Y1lnIBaHHF4NPbEeUhTFXJAFOjbYO1SZBlITCO+R2+00RLcbPQU3SF9W5KAKV1d
         JuEtjQFDwm0IhwXV8fZ3d0Pc3sSMUnUrhyziBQKy97RFxdEGMOxENwpW8SqOuGKuDgvE
         wAUkkwB2HFFyiWo9wc5zLjuJ3ThbdZyaaEKX+JMVtf4tPpElZkZ1zr85Ymmiiz9x9tx0
         dTERRZ3SR9eL/8wzZn0yW9npRXzj5FHKao8F3ffjJEbbLs0glkFZHjmYLYE3xNa7L/pd
         ByUbsXvO6xnUXoBHvna2lv3zdugigTJ1RlC7HM7WXviadepy4eiDCETOEYzZLqId1UVG
         DujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0xL/iDkEL+mRgHC/hRILKSEGgtjkYP7/04WXy0TU5c=;
        b=TjotOBUR0cdVtJzOZN7Ne9HPCKOeUaCBj7X3BcA1KjDwWV/gpMXFdpPSiwiHYiTlBW
         o37spvWolbw3ERM0Zmdgy/OuhZo0+OV+2FGNOglScwoRRhbV0EKA8mv//NJnt8EI7+a1
         eaCpfKWOFdCG7roHnkziufjHhgikWgGjkIiovmMrzTaI0ikygYZDmdCxmoXm0t/eJHxi
         iJuZ8NnKbRxMzoujTEbDu9PagioAZYUobRcmGRLXNa1ujiduHpz1Kk/YOfDWXieJwIeY
         w6ZYjea3yyz+nsFugOtbi27C4aDxgbcVqYaZ5osT8Tphc9W0/TXLN4uovWmqifTbUqMo
         NQKg==
X-Gm-Message-State: APjAAAVRCSOMRSX9h43lByU7v6UfrJkgd5ny/r5uGZtF5NmMyb+45nt2
        fNDNrays5kqbwx5KfgeWhu4=
X-Google-Smtp-Source: APXvYqy4hQZbCr4bXF44azC0xINbKmfHk3TGROlTqQmbYp9gts0pMzgY0rJb683HGAO9RY464ZaW0Q==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr15847792wmc.150.1571057481904;
        Mon, 14 Oct 2019 05:51:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a192sm16440939wma.1.2019.10.14.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 14/14] drm/tegra: gem: Use sg_alloc_table_from_pages()
Date:   Mon, 14 Oct 2019 14:50:49 +0200
Message-Id: <20191014125049.425101-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of manually creating the SG table for a discontiguous buffer,
use the existing sg_alloc_table_from_pages(). Note that this is not safe
to be used with the ARM DMA/IOMMU integration code because that will not
ensure that the whole buffer is mapped contiguously. Depending on the
size of the individual entries the mapping may end up containing holes
to ensure alignment.

However, we only ever use these buffers with explicit IOMMU API usage
and know how to avoid these holes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 00701cadaceb..d2f88cc3134f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -508,14 +508,9 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 		return NULL;
 
 	if (bo->pages) {
-		struct scatterlist *sg;
-		unsigned int i;
-
-		if (sg_alloc_table(sgt, bo->num_pages, GFP_KERNEL))
+		if (sg_alloc_table_from_pages(sgt, bo->pages, bo->num_pages,
+					      0, gem->size, GFP_KERNEL) < 0)
 			goto free;
-
-		for_each_sg(sgt->sgl, sg, bo->num_pages, i)
-			sg_set_page(sg, bo->pages[i], PAGE_SIZE, 0);
 	} else {
 		if (dma_get_sgtable(attach->dev, sgt, bo->vaddr, bo->iova,
 				    gem->size) < 0)
-- 
2.23.0

