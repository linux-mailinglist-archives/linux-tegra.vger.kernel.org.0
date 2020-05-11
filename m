Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A411CE01B
	for <lists+linux-tegra@lfdr.de>; Mon, 11 May 2020 18:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgEKQKD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 May 2020 12:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730036AbgEKQKD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 May 2020 12:10:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE1AC061A0C
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2020 09:10:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u16so19965167wmc.5
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2020 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=expFAEx3KcJlR686GWGP3WK4IdAwv8p4OHxTjCVQ3oQ=;
        b=KGI0C7SJM4O0+0oVW8hu4IwbSVtYT2OzEYssV7mCv+SwiH0pavsRYVcUAb4fXPb9Kb
         XfaqxkWadoBR/eqojjvwKUFTpAhyIMxlskVKIIh0okUJkWlPk3TqUPfCgHPy/YwE/Xpi
         GqBuZXGSYNBzrxawLSNvKkyTD475/D0v+AvE0ZTBo9KTg1rpDKCVbCeHwk4JT52EElup
         +mR3HaId0xJvtBDKn91AAtqXmZuBNriBjGopCKzgTvDoq+qk6/vRARnnUPFE16xfgpNZ
         h4nD6MMRwY2jZj5IWkOUe3MuDfxjm7qMhxXnwiKPZHhXD+9OhVzsovSAewnOre8ow2oj
         5QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=expFAEx3KcJlR686GWGP3WK4IdAwv8p4OHxTjCVQ3oQ=;
        b=bl9VYk7ygJjuOUNBQy1tcIZfRUT3LMSj/LiIIQSwC9fIioZ/gqeFlvYlnUWW+jYF6O
         m7d9jkjj3mx+0sf+/PD7UztSiVuF7oQlredtbDxmAjRGbmXQiw+iHwjjLDKhqoJXNiIV
         mP19SGRgJPIpYO02xLsqO45UT3ODWg3IKzVwc1r8BX2XfkWnJV8bi8llBpXUfrX+EGTh
         8SVb3SdsuutjL2t/O/Xc58/GuKe9JXGTiOp77AJWf/ehi9lWB7MC5AoyG6fHWksVVTop
         kljkEM2B+XqJPOjACztr64htXdUVtykqSzGM3Eu7PkGPmp7QAupAZoD73H4+3NAmqDbI
         2ayg==
X-Gm-Message-State: AGi0PuZ1w+SS8szcrQLHlfAxmkP/MguYd4edv/ob55DkC/LIJ2j6T6wo
        4W3VtXndsoUq8bmtOoH1Ubk=
X-Google-Smtp-Source: APiQypIuOa0PjdW52RSoC9IMLqxX7YmIsli3gjxPPf9Eb9KTtVcfb55uQODjKXTqQ0qGdQWYSGrE5g==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr35184292wmk.68.1589213401878;
        Mon, 11 May 2020 09:10:01 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id b14sm15300418wmb.18.2020.05.11.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 09:10:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH] iommu: Do not probe devices on IOMMU-less busses
Date:   Mon, 11 May 2020 18:10:00 +0200
Message-Id: <20200511161000.3853342-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The host1x bus implemented on Tegra SoCs is primarily an abstraction to
create logical device from multiple platform devices. Since the devices
in such a setup are typically hierarchical, DMA setup still needs to be
done so that DMA masks can be properly inherited, but we don't actually
want to attach the host1x logical devices to any IOMMU. The platform
devices that make up the logical device are responsible for memory bus
transactions, so it is them that will need to be attached to the IOMMU.

Add a check to __iommu_probe_device() that aborts IOMMU setup early for
busses that don't have the IOMMU operations pointer set since they will
cause a crash otherwise.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that this is probably also required for the BCMA bus implemented in
drivers/bcma/main.c since no IOMMU operations are ever assigned to that
either.

 drivers/iommu/iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9888a3c82b15..4050569188be 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -196,6 +196,9 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	struct iommu_group *group;
 	int ret;
 
+	if (!ops)
+		return -ENODEV;
+
 	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
-- 
2.24.1

