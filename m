Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B827DE38B8
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406134AbfJXQqo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:44 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50928 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405516AbfJXQqo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id 11so128755wmk.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EliCwXDq96B71gmhKQIK2pDZL6FbkUlF5g2UJEA6lCE=;
        b=EXVxiQWenKVljq3++zs0suyTVv1WnZwcrxL5rHKCjfrrgrf5CqxDirTPmTTi+ULB1e
         u6+vZmJTzqtn2bHsHMufIYmo8CrifZYgx3Xc4kPjhHIhDuCoYP9xaiwKULZK6J5XZSIT
         4TljH/sABEl9N63xWXUhv1v4SyCwOZahkWRKabR9HLn+MKveU2JKCagUFycYfNgTtJDr
         fIwuNY/jPUf3n+bsAETT3/YJWa6IHPqCSRyWvxkrIEuB8db3wm4a6bd7q1n+0pm3i617
         pH7NKBw/HKcZpT/9i0oNnpCbxxEd5uyMPicCsmbiC0IX5FuU8xmhCwF0jbXJIV1I/mCV
         mPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EliCwXDq96B71gmhKQIK2pDZL6FbkUlF5g2UJEA6lCE=;
        b=S8h0agwQQOKy/gWQ8GpJV+bgnOG8Ms81D4k3mTOI1clEGCfLIhb8kBUUySYMV2/YQk
         /XXHedj4MbpTPe0zXgSoXjwDSDC8BFUUHE/CqipsRWU6MBOKCJPUms1G6UprChcFzvU5
         6A6CsrHXwihS6NLwnzVKwrmm+cu+bISDpWH7z2BEeXBeVoLI2m7adhSqu+hrceQT3N1s
         LMvv3K5tzl1Z68FPnpCE2/L0LX3ocYNQreSLH696RxltRTStu1QJSqVC2q1V2kcSVmHY
         lgL1dwA6p1AnGbbo/MnpeBMCdTadv3gRarweEh4We9oPZ0TCPAJPo5xkFg28Fb1CKW/q
         /SuQ==
X-Gm-Message-State: APjAAAV1rGv+NiVqMM7pKx9rBstZjdFa4lmXY2VXoAfedQWbY3MVJwjn
        vf9nMHoVmreBqG33z9gFZTCzQgww
X-Google-Smtp-Source: APXvYqwvFzod6odWZC+ZmX9rjALdXrLhxe4c2LgwHcJSi6yumP8jY8dCeixhDvAyg/9tgA+Bhh6qzg==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr5862809wmg.146.1571935600543;
        Thu, 24 Oct 2019 09:46:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 143sm5358801wmb.33.2019.10.24.09.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 28/32] drm/tegra: sor: Use correct I/O pad for DP
Date:   Thu, 24 Oct 2019 18:45:30 +0200
Message-Id: <20191024164534.132764-29-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The correct I/O pad needs to be powered up before DP can be used. Make
sure the correct default is set for Tegra generations where the I/O pad
cannot be derived from the SOR instance.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index a245bbbd638a..bf2e31199166 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3934,6 +3934,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 			sor->pad = TEGRA_IO_PAD_LVDS;
 		} else if (sor->soc->supports_dp) {
 			sor->ops = &tegra_sor_dp_ops;
+			sor->pad = TEGRA_IO_PAD_LVDS;
 		} else {
 			dev_err(&pdev->dev, "unknown (DP) support\n");
 			return -ENODEV;
-- 
2.23.0

