Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02538D6301
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731425AbfJNMvI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46336 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so19546550wrv.13
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6qXD9rn/OIy+Nv0WvvLjXj4OfQZfi5fmj38Q+4+iVI=;
        b=FmdjeQnyIcA69WMoPZKySboMFynXrM36qbqu913EAvyYOjBAnTnyNyYyCH7nDBCelC
         hftfthY/SOB5KOggPuk+SFkQvcxPuvRnQE13sde1PO0VAZLQQcQiwEFt4PBRw0nVoG53
         tZrFqhe9mvXc3RyFGtktUIdFJ2LqTlvSnxwBeB5f2KOGihpjJQbKiN1q9RzsHzAXV7s+
         KAlzlQSW32DQUZECKvO5NgLR2T2fJ1b3cGSDG5OVb5hResG00vVxjMHWWMvQWWXXjC3T
         NH7PF4LMvO0AwLomX320ZH/0RNnK3fev9VuqpiqBvZxyglrdynAscQp8UEvO0ACehJ9v
         DcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6qXD9rn/OIy+Nv0WvvLjXj4OfQZfi5fmj38Q+4+iVI=;
        b=bBL29cmStT6ZQAM2WxhYhUewJu9+I5EDzaCSiAwnLZsvZrHYNSityx54lFbBs6ajub
         aooLof9fOjGm9QXZtj61f5wInqt8PZj74bQZme+Q/vJEVOEhqYhQ0mnPxOP/ToQYNuPR
         0H8b0XVxWnomSx0rnPnVvqbcnn+cpUv//9FVl/904YpTSkpAAXpD2Z+3cY2NkZeVIC1K
         6YB7aK5oTj0RYcmNNaoJzhiOTC0/6Hi9mydZP2ZrJLmhXWyA3RXo9Jb495jWksZl/FSY
         +ra0bTzHlyO2Tnaooagun+2TsmGh0mOQwDZ1OOMTkbFYciqNyPkuWCxMoq6fvCUuVjQn
         hWiw==
X-Gm-Message-State: APjAAAXE15O7WZaz8+frTy8rBSrMTQ1qHxSiYO1wjCXG+J6rrGeq26B8
        mI54mysSD6VbvOJ+QXtWP+g=
X-Google-Smtp-Source: APXvYqymrU0rKN/GipYYJ9TGISsRaOYzVUz0m6AnXs9Fgc/t+zqFjgMgQcdHtPBjQDSRGhmrzFxnfw==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr26759965wrq.13.1571057466179;
        Mon, 14 Oct 2019 05:51:06 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z125sm20917675wme.37.2019.10.14.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/14] drm/tegra: vic: Skip stream ID programming without IOMMU
Date:   Mon, 14 Oct 2019 14:50:42 +0200
Message-Id: <20191014125049.425101-8-thierry.reding@gmail.com>
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

If VIC is not behind an IOMMU, don't touch any of the registers related
to stream ID programming.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 8d98b0cfc47b..748798f2cdc8 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -97,6 +97,9 @@ static int vic_runtime_suspend(struct device *dev)
 
 static int vic_boot(struct vic *vic)
 {
+#ifdef CONFIG_IOMMU_API
+	struct iommu_fwspec *spec = dev_iommu_fwspec_get(vic->dev);
+#endif
 	u32 fce_ucode_size, fce_bin_data_offset;
 	void *hdr;
 	int err = 0;
@@ -105,15 +108,14 @@ static int vic_boot(struct vic *vic)
 		return 0;
 
 #ifdef CONFIG_IOMMU_API
-	if (vic->config->supports_sid) {
-		struct iommu_fwspec *spec = dev_iommu_fwspec_get(vic->dev);
+	if (vic->config->supports_sid && spec) {
 		u32 value;
 
 		value = TRANSCFG_ATT(1, TRANSCFG_SID_FALCON) |
 			TRANSCFG_ATT(0, TRANSCFG_SID_HW);
 		vic_writel(vic, value, VIC_TFBIF_TRANSCFG);
 
-		if (spec && spec->num_ids > 0) {
+		if (spec->num_ids > 0) {
 			value = spec->ids[0] & 0xffff;
 
 			vic_writel(vic, value, VIC_THI_STREAMID0);
-- 
2.23.0

