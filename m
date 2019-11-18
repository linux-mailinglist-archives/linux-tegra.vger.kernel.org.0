Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C95100274
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 11:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfKRKfr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 05:35:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42315 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKfr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 05:35:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so18786314wrf.9
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 02:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Arjdx6BTpMTXW8TBPIMgVl/if98l4HWaSeTJB2xI84=;
        b=f75GY31PtMmJgvDguzoF4VK6ST8pAAK0xk3f9DA3aDZdXaJo5Xrfz6H3LsBxTe7BB0
         +LoY31LmGLiju3cNkrgcvtILIQKpHKJprdwTFnEgX27ZpBk4NLFZ9QF/QiEsNayDInbw
         8Hh1QJCDt8Vm16vqG96MiNYaY2pwyibvPXejk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Arjdx6BTpMTXW8TBPIMgVl/if98l4HWaSeTJB2xI84=;
        b=plRZIow/STfb30UsrSaXCmf+L27v5o23jAt2JAIQwXPHrr3QOARt46zhOm/M0ULr+D
         kQGoeDJTP/7hI4AbSYRJh5NNL0AuryQEIVbM2U6aPMQlKomZpNKiFCEOG5tRSq5rCVM9
         vI6nCvHoCPcPC3MgKhvWpVehf8OguLFgLI9/B30umt1OuE/H7V6BZc5pBw6tiKOlIq/N
         kNeGalG7QvUkxqccz1zYoWUG/Q4WjP++mEXN5jGUi9pKqbvSgcwA8yGecqlh0LYBQT3k
         CycTem3t4jfWRtkX/HF05Jz477TvXA3G0+quAdeH6l1ssp0bFSUElurnuWoLKcO41RUh
         ac9g==
X-Gm-Message-State: APjAAAVAmMBcXcsfRkGxKXT72MB+aDbKrf+Mfo8fFKzsmFheUUDjF/Pa
        O48rj1Dqda3/OBmWy5cuq67++A==
X-Google-Smtp-Source: APXvYqxAhg5UoK72Hz48l8L66JhO/0fHPUY5LU+H0eGRu5iwK50dJnV4oyV3aD5Rj/uoUemtS9YXcA==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr8573693wru.54.1574073345093;
        Mon, 18 Nov 2019 02:35:45 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:35:44 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc processing
Date:   Mon, 18 Nov 2019 11:35:22 +0100
Message-Id: <20191118103536.17675-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A few reasons to drop kmap:

- For native objects all we do is look at obj->vaddr anyway, so might
  as well not call functions for every page.

- Reloc-processing on dma-buf is ... questionable.

- Plus most dma-buf that bother kernel cpu mmaps give you at least
  vmap, much less kmaps. And all the ones relevant for arm-soc are
  again doing a obj->vaddr game anyway, there's no real kmap going on
  on arm it seems.

Plus this seems to be the only real in-tree user of dma_buf_kmap, and
I'd like to get rid of that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/host1x/job.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 25ca54de8fc5..60b2fedd0061 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
 {
-	u32 last_page = ~0;
-	void *cmdbuf_page_addr = NULL;
+	void *cmdbuf_addr = NULL;
 	struct host1x_bo *cmdbuf = g->bo;
 	unsigned int i;
 
@@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
 			goto patch_reloc;
 		}
 
-		if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
-			if (cmdbuf_page_addr)
-				host1x_bo_kunmap(cmdbuf, last_page,
-						 cmdbuf_page_addr);
+		if (!cmdbuf_addr) {
+			cmdbuf_addr = host1x_bo_mmap(cmdbuf);
 
-			cmdbuf_page_addr = host1x_bo_kmap(cmdbuf,
-					reloc->cmdbuf.offset >> PAGE_SHIFT);
-			last_page = reloc->cmdbuf.offset >> PAGE_SHIFT;
-
-			if (unlikely(!cmdbuf_page_addr)) {
+			if (unlikely(!cmdbuf_addr)) {
 				pr_err("Could not map cmdbuf for relocation\n");
 				return -ENOMEM;
 			}
 		}
 
-		target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
+		target = cmdbuf_addr + reloc->cmdbuf.offset;
 patch_reloc:
 		*target = reloc_addr;
 	}
 
-	if (cmdbuf_page_addr)
-		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
+	if (cmdbuf_addr)
+		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
 
 	return 0;
 }
-- 
2.24.0

