Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2CF7D630D
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbfJNMvU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53461 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfJNMvU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so17147441wmd.3
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDWizjgHzHaIFYFt83zBnigeKDs+hp0GWtpu1Y4vNf8=;
        b=nYS0pc+oc0WP0DGiaz+7394+j+LUl8X/KfzH9D3W7fs8+8xliID/0kQZ3l3rqzsoMy
         6i0KPVh0S4rOoYWSQK4Ev0Fu1Q7/WnXq7wltsFHNt7Qg0LysUo38fk2KaNQpHTk/wBBz
         J6z71ciFh8KMMIVbt17hD1F7yDenRoIR2X/vFMEO4M1i+XAf7WFTxRVByrowTBw0JYH5
         U6YQM88spXnpMWDsb/6ArnDjbOu3hLQoS2JZM8nxDoHYNdb0ocj4JsYVgH1N5XNNXsT5
         WLtr0EK769PH2oeOETG54LFovq05Pyh5Kn42XWsWAsWwHVu2ZUxenuQ2e3DxbXzkXqEB
         AiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDWizjgHzHaIFYFt83zBnigeKDs+hp0GWtpu1Y4vNf8=;
        b=LxdJPM1R/f8bE9COwE5orl3yabdud2CKZ5enk5cX9RwZ9LT0aMPBTqScMmcP+pkWpi
         iKRgwBBpV4q40hokvRr3C5iGp6RrbwQLUkELp8XLwFjukGCdKAAAbvU4oXrjfcmyjMLB
         bEDd5iTR7O2yR/8C2+NetxjcXb2zg2jKAB3+FSBX/FhwwRF0XcTWOEpb2CpYNDcJtUqQ
         w/Tnc/EOcT++bv0NCI+EDRQnirCTNXmbRgf4rpxAiKgWCiRqr5PvvEi/ZHB6yO+BKAmX
         hnmSP/4sAzB0yE1pjj8bIdCOffuMeHcLUcbpgEu2DE5OkTdGklsVeab8ULOOVudUHUs7
         qpWw==
X-Gm-Message-State: APjAAAVgEQvp6KLRlrx/MYHneAfYe7ypiWq+n1YJYf4DMXbHrqoJrTvn
        wY+R9D3vadNE9tuaCOIiIx0=
X-Google-Smtp-Source: APXvYqz8X5+f6i1aMnNFDYBatBFCV+qGCetZxynDcGxPHgl8rkjrnIO1LlCP6g5G7sRB6rhIdl5V9A==
X-Received: by 2002:a1c:a941:: with SMTP id s62mr14393658wme.128.1571057478049;
        Mon, 14 Oct 2019 05:51:18 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c18sm16730393wrv.10.2019.10.14.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 12/14] drm/tegra: gem: Use dma_get_sgtable()
Date:   Mon, 14 Oct 2019 14:50:47 +0200
Message-Id: <20191014125049.425101-13-thierry.reding@gmail.com>
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

Rather than manually creating an SG table in an incorrect way, let the
standard dma_get_sgtable() function do it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 7412e23500d1..3345cce14662 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -520,11 +520,9 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
 			goto free;
 	} else {
-		if (sg_alloc_table(sgt, 1, GFP_KERNEL))
+		if (dma_get_sgtable(attach->dev, sgt, bo->vaddr, bo->iova,
+				    gem->size) < 0)
 			goto free;
-
-		sg_dma_address(sgt->sgl) = bo->iova;
-		sg_dma_len(sgt->sgl) = gem->size;
 	}
 
 	return sgt;
-- 
2.23.0

