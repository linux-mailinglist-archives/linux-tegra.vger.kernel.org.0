Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9B2222526
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgGPOTN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A765C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:12 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id f12so6732060eja.9
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RaaMz8ttpDHrLSqtbi8GC1r0b/uf3w868/oEJwarDbs=;
        b=oMraksKtFb0jB45Iecp+NuyHtCDHotY9Gj5o12d5JnbiKcrtRLm26M4a/173wm6LFb
         gwCvm+6jgUJfUCc2mHkb2Dq/LJkki5xjLYOxUOMVEYT9D1GlvxG3FgciCvf6GRcLirRj
         hzfHy8eWejfKuthjXO22CeHm5otyC+SPMo/9ttT3+PdrVOrFJfDwEr9LVEKyhDCYUkhG
         iS4YMSJUwfQIwzExkMg1kKhJjNzY37ZOURyN0S9+Dt90M0SlwZmqLMwOtqeI23szjSBd
         gdU84O6GvRzWuouZeXchpd2Dwm1hOd8/hXdBEiqeIZSyGXhM6+JgSub/tXZMTUGW9XoI
         4KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RaaMz8ttpDHrLSqtbi8GC1r0b/uf3w868/oEJwarDbs=;
        b=V2sm0Z/biKe0PXLZ1AsT95xe0n6HGwt1javpqKBH6SrI5m/Bzrn1010uCNd5VrB3dG
         0J40sMMLyKBs25pXq7baMPm68F9F37HAaSLCYeoIB0KYFZ8Q1gcKLbEi9CWP3h1JF+Vl
         b7W1+BJSiYmUGocuvFuqhh+mTsGFg3/TE0zszFVgFrF7Ci9fy/a+YIowLSd88qm9pfjw
         C9JQtmpRl+z0ASCvDtTk9/Jsh6DfwUPR6qFwoPjbAEoyhRvn0+AAUzbi1CYYv4dO3B9X
         uPWRFrZn4C+Dh8ZDYeA+bPA6S6HxUEtnBkWnt4zQ1xPecfYw+MxpmZPh1ZHHA44m4574
         9S2w==
X-Gm-Message-State: AOAM533cXl+VYtxaS8k6bcqUb0WxcihOt4UQWJV9022+ZWuAJsBINYVI
        PZ2mb20w5fecoVeNJF1wWDhH4+nD
X-Google-Smtp-Source: ABdhPJzyxwGsivdxPy+VaPBcCsBZl92WRySUuMw1BFUntwCEVWHuuetm7sHlCPyLTGW1k57E3OFOAw==
X-Received: by 2002:a17:906:ce51:: with SMTP id se17mr3820587ejb.503.1594909151079;
        Thu, 16 Jul 2020 07:19:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m6sm2141179ejn.99.2020.07.16.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs
Date:   Thu, 16 Jul 2020 16:18:51 +0200
Message-Id: <20200716141856.544718-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sandipan Patra <spatra@nvidia.com>

SoC IDs for these generations had never been defined. Do so now.

Signed-off-by: Sandipan Patra <spatra@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/soc/tegra/fuse.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 252ea20fe4c1..1097feca41ed 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -12,6 +12,8 @@
 #define TEGRA124	0x40
 #define TEGRA132	0x13
 #define TEGRA210	0x21
+#define TEGRA186	0x18
+#define TEGRA194	0x19
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.27.0

