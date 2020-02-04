Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54854151BBD
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 14:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgBDN7k (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 08:59:40 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32949 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbgBDN7k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 08:59:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id u6so9898584wrt.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2020 05:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJj/VJzeTYCXSmbhUcjQDbcAuItdLVs6ubNcfzq/Xfw=;
        b=ho73SiSWqAGR5b42HTxbrWkw+KNYROYE5BR+cGPURQdnO5GUWI/Nbz1+CoIz8bRg/X
         3ex9i4ucKSbRcTPXxo4LoMUtHxFNuV2LjFwCsugEB6Wt7WXTLM+QBhBW4RgEXAcROISw
         BARrdYGLFuyRx6ZFqspk6NZQHHeuOl75ND9p036H1mOfLARx13wMdxkikjOp6o0m2w2E
         vxQEdzvvpcRgwAnD+JBxxGdWiZSoIelB/SyV2FIrZNou2g/cgGKxOSMI9AcDNaFHphy0
         OejiWwPaZ6dp8PsZiEraiRUEgkAjUrgAyoXNvz0RNzl2kQ1OMxCQg+x6LZb9VB+PRCbg
         k/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJj/VJzeTYCXSmbhUcjQDbcAuItdLVs6ubNcfzq/Xfw=;
        b=kV4MR5U4womLwOsPnyTyPCtbNJ4qIAEoqu1XcFtCbWSSfF6+NzWj+VeJu9bkmQ861M
         DAaDsEwlBFmCvD+nM3SWEN7idnoGyNryLMGDt4QnJfdM2nnYRkpOWFwZBBRiCcLK3go4
         qNhLGYiJ4U4+FoXzuETuDEjs9RZ6DaI5lDX/cj2JyM2tDP3FteT8bIBn5OfX7guZQ0Qo
         mBRVQrIOkYxb2DA94TDDMY72x4xmz9r8kANiQlT9HdYyJ6R2BT5asOzRCC3sp52hJmWH
         ckEQAZ7wzbwqrMA57GWfLspyAmegUaPB92gdDIx7vFkZ+JNcBm8kSiFPWo/h57lZ56v8
         4JVA==
X-Gm-Message-State: APjAAAWsTZvbSsQ7IlJRxCsr2BVdNlB4PJPMv/xPbsx928YgjpZFU4L1
        mrVAVEq2SEIStUnSSUwjFnc=
X-Google-Smtp-Source: APXvYqzy+rENoYJQihD6yECTOV396s8QgCpxK3W0m++0TwQ89CiWrFv+2JOIg59kNH8io1Rz9PI24Q==
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr22212782wrr.151.1580824778576;
        Tue, 04 Feb 2020 05:59:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id x10sm29607471wrv.60.2020.02.04.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 05:59:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped buffer objects
Date:   Tue,  4 Feb 2020 14:59:26 +0100
Message-Id: <20200204135926.1156340-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DMA direction is only used by the DMA API, so there is no use in
setting it when a buffer object isn't mapped with the DMA API.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 8198a4d42c77..a10643aa89aa 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -248,6 +248,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
+			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 			job->unpins[job->num_unpins].dev = host->dev;
 			phys_addr = sg_dma_address(sgt->sgl);
 		}
@@ -255,7 +256,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		job->addr_phys[job->num_unpins] = phys_addr;
 		job->gather_addr_phys[i] = phys_addr;
 
-		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
-- 
2.24.1

