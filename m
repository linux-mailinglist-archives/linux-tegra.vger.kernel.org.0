Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDCE116CA7
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfLIMAM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42373 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfLIMAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:11 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so15850503wrf.9
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUlSTHSiZH4UmQzCStEFr2SlLYYI3f+fEsxXqTQKGEo=;
        b=VkvNEI69NbptprnfrSLJJuVIxMR1DAqnBpe6bT2fimzlIzLsJmIDHSZSn6Ut2RxDif
         p6y2SKw8x10ZfAA7p0w6NUvDmNVvmwfFUMuJj0VT/jFIc0NBuz2QzOY1JniQujB6PbxP
         EPwJ8YSLvzz7hFgSi1MsbjHY8zjxG3VfjdGQSe2QnRuu4ASIFzYAmKbMyit53ROwSSKy
         ypFXgzrJGKjTHvAwaSESZFEq//nejEu3cGX9nBjz96N/pD0Ma/IAzFJFRXtzoAT2pkLj
         k8Iw7t2kElSUBArEBVZFVMMPDoP43FoKvtTM0gO8QkNwBFy6ywEVGeBER/nJDhdIcVVf
         qOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUlSTHSiZH4UmQzCStEFr2SlLYYI3f+fEsxXqTQKGEo=;
        b=ME9oy2Cj9RAVe/vSd17Yg1OxQJPKcLrglIQMVWdUrkgFHDjvRyFntZwrrdGSJQSbA2
         X1RLR3pFG1qeQLg5V9YXJi4Ka0EYrgzF9PYXlFaNnRf79WNWDTk5Tfj7QjmtpzkVcZRc
         SuisNoP+MbgG9CaRS0A6ChvsrqepFCmBIKCWzQ2X4d8cBJbL4/8470J4evMsLi1P1oRR
         FQhx52qDPvn9fLG5fHqGzTBvXBEt7VPqGhNbSxitmijZR2Hj8R+vlVgS8dsyleRaCtTP
         aMMKOy3mafpKKJ4SxYBK9L8EQW/YDfCu/YU9I3Skxga1FyPI/GQCH9Xo9ScoUwpslveI
         3MXQ==
X-Gm-Message-State: APjAAAXpJFqX79xt8EcQWvNMsmBpTcwxex8bJN7oL9Zlxf58WSGo0abC
        u71dKQSIMjgWScvT5pAkEHo=
X-Google-Smtp-Source: APXvYqy8gUZ62b/oFszldo4GGat8TaeZcBUdGBZVJVA603pZpl99V8gAU2LSa9aXDlLD/OJA4FB2Hg==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr1814750wrn.61.1575892809527;
        Mon, 09 Dec 2019 04:00:09 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id p9sm13785522wmg.45.2019.12.09.04.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v3 1/9] iommu: Document iommu_fwspec::flags field
Date:   Mon,  9 Dec 2019 12:59:57 +0100
Message-Id: <20191209120005.2254786-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When this field was added in commit 5702ee24182f ("ACPI/IORT: Check ATS
capability in root complex nodes"), the kerneldoc comment wasn't updated
at the same time.

Acked-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f2223cbb5fd5..216e919875ea 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -570,6 +570,7 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
  * @ops: ops for this device's IOMMU
  * @iommu_fwnode: firmware handle for this device's IOMMU
  * @iommu_priv: IOMMU driver private data for this device
+ * @flags: IOMMU flags associated with this device
  * @num_ids: number of associated device IDs
  * @ids: IDs which this device may present to the IOMMU
  */
-- 
2.23.0

