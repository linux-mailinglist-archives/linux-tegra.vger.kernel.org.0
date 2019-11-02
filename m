Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A62ED018
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfKBR44 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44722 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR44 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id f2so3835309wrs.11
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=Ez9eNqz/Ef4W+g9pbhwhmvBdXpT7gFPFmbgzwdZhMJ7WrkBziKZDOmzPtdKCI9Rewx
         j9zCBqE17D73D3xYZtyK9viD4VvW06H6nyqCEvDOM02OdtjuADd8Hr8Vn2mdamZwUkVK
         XmMej0sSChRRHMjAlTIjGXhHyuK3WiCvOyIbjrJB8j93m6r0ikiISpd1MrWAgytgaBMQ
         BmRt0oDiRbXYhi08tyPE+glhQRK+TyoRSCqyCpm8WC5utejvQYk+OTtla69byetV3Vkb
         KSkQ7jZRGNWPTFdH6cyCs/CAQV38NLV0E0lYd7CIAyAF0q9ZPUVNlkFRjSsGJz6apEfl
         lCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
        b=qzpzz+UMGNO6UWvDNH+gMcDVKfnfmLR6cF2hCgkvpfNkOACsMpa3ABlpfWemfyQLqU
         JvLLEq03h67QlE+UxqaiSRRpxMioQEcj3EZWhPd8LPCvL/S4yrQSk5eSSPqrq6/ZRZu5
         Jf+YT4ldaZERvhdw8KpolU5PBm4ATcRPU/SfFs9rkDt5SVbPS5RWO2uSMO2xK5quPjRU
         WVtwjYrEDKVUUB0d2pguicvhJ6mXqZ/diuIt/bpnEsEZnkBAnxZDXQbalvCumn2yy04t
         rcFoUz+YCrNZaikcS1e8Bgh8zcQsdEEbB+aa0B3IqMj9pb9XrCGoIpJJQQEwezDqFA9S
         nJCA==
X-Gm-Message-State: APjAAAUnzk0K1kEEBKUDTqD5bHWzjVm0Q6fmShjqp67IRP8qdQSm//WA
        RW5vSZznR27VJKe08xW6Jgc=
X-Google-Smtp-Source: APXvYqwbnnYZXrTkrBOfrjQ8/OumIiqq2aGuleKDeqHVq/H+Li2Ivc5XBEpeNlbKG3RfHNpeD83iPA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr15317254wrq.255.1572717414013;
        Sat, 02 Nov 2019 10:56:54 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f13sm10800339wrq.96.2019.11.02.10.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/9] drm/nouveau: tegra: Set clock rate if not set
Date:   Sat,  2 Nov 2019 18:56:34 +0100
Message-Id: <20191102175637.3065-7-thierry.reding@gmail.com>
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

If the GPU clock has not had a rate set, initialize it to the maximum
clock rate to make sure it does run.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 747a775121cf..d0d52c1d4aee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -279,6 +279,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		      struct nvkm_device **pdevice)
 {
 	struct nvkm_device_tegra *tdev;
+	unsigned long rate;
 	int ret;
 
 	if (!(tdev = kzalloc(sizeof(*tdev), GFP_KERNEL)))
@@ -307,6 +308,17 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
+	rate = clk_get_rate(tdev->clk);
+	if (rate == 0) {
+		ret = clk_set_rate(tdev->clk, ULONG_MAX);
+		if (ret < 0)
+			goto free;
+
+		rate = clk_get_rate(tdev->clk);
+
+		dev_dbg(&pdev->dev, "GPU clock set to %lu\n", rate);
+	}
+
 	if (func->require_ref_clk)
 		tdev->clk_ref = devm_clk_get(&pdev->dev, "ref");
 	if (IS_ERR(tdev->clk_ref)) {
-- 
2.23.0

