Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 308C3D62F6
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbfJNMuz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:50:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32851 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731035AbfJNMuz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:50:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so19627415wrs.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U877RE9c/tuFkeDa8v12pt9kVRahnNgSg6kH2NT2zSs=;
        b=K97DT+yhhip/zZqEwHem79zj/NHw61NIZ+WziLtr+XxhQm1OkuQ8Ibea0bKc9JWxKI
         tq/Buap1GcrVaM/kLNKwmAJY45Bp9flBI7Ydq5cYH+ai6FkYDCK9/MoEIPGNly5eOlZ4
         wOMuYsyAjDh4uIJXfkYISBt/0yo09cxQNs2lYrLq9g2CJEjnT6wGNFoBe2ZUygzbylmP
         xfCwk6jALMbNAtlDwwWLQIQIfbtRQ1jm+0cja+O7RX+jZFkly2F1A2Ju1kh0HZ4s/t5i
         rZBImKJLH919yYKcMHxRQpWm8dby0J509aWZLuk47zwZcFVfxwgHZ3BTfB3Zdgtc29sa
         mrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U877RE9c/tuFkeDa8v12pt9kVRahnNgSg6kH2NT2zSs=;
        b=NKApu7BjiJS+i1L5KuiqBA6++JNz0HTOoa7SjWgbGSt+IvQc8j1IU2Z7T2d7ZYs03z
         yZdqtnsUpOb7XOeMid0591f/I7+t2y3eik+YWX1KGEuVKY4zukbj4TpLucncfXDEqv+d
         igoeo8GSokB6bJl/ihKICVwOZKSnzxkQwk0k3JP6JEcKspLqyoKVvHvIvt0fHNjRwQQQ
         5IZOgRVFmAqSpXcTj53CpvzBioX63IJDcH333Wnn1aZ4ZTPuJ21PbnN7/vHvVkzh5S2e
         qzBqedl/XGJORUrUKBPr9ZBpJMcwbqQX6T9VUBKEZt74Z+zvQP+Lx3jXdwaGfGFmojws
         UvNg==
X-Gm-Message-State: APjAAAUSyElbKo4S2txLmWVzT6GgX6ReeBaMy1srwZiEu/GvgEROduRj
        /NFCQU/3Gv2ZgdKD+UcpS2k=
X-Google-Smtp-Source: APXvYqwfjKsVR1no+BarpMeGzjtK/HnAt0suBKZXNFZWdLRdCg0+nhRxmDXpRahIEnbM95s89flPsQ==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr24739914wrv.52.1571057453478;
        Mon, 14 Oct 2019 05:50:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f9sm21850054wre.74.2019.10.14.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:50:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/14] gpu: host1x: Do not limit DMA segment size
Date:   Mon, 14 Oct 2019 14:50:36 +0200
Message-Id: <20191014125049.425101-2-thierry.reding@gmail.com>
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

None of the host1x clients have any limitations on the DMA segment size,
so don't pretend that they do.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 742aa9ff21b8..2c8559ff3481 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -445,7 +445,7 @@ static int host1x_device_add(struct host1x *host1x,
 	of_dma_configure(&device->dev, host1x->dev->of_node, true);
 
 	device->dev.dma_parms = &device->dma_parms;
-	dma_set_max_seg_size(&device->dev, SZ_4M);
+	dma_set_max_seg_size(&device->dev, UINT_MAX);
 
 	err = host1x_device_parse_dt(device, driver);
 	if (err < 0) {
-- 
2.23.0

