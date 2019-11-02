Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23428ED00D
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfKBR4o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35733 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfKBR4o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id l10so12742933wrb.2
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7MoedW7dYIqdxbz/1+3cfjIQ5/QgAvq64b2nX4h9Is=;
        b=PBk/3eobuNc6BJ0Ju4MArus3AqqUABkAqnOepK32TX0MsTxcMzsoHqlIVHBVEzvLCI
         8SZ8ROh6sJtXTKpxO0B4M/eaLig2OEzfYpX0R9Z4OWKWTYhIHN4asp/qVhGzIl27Aq9h
         0XOd0JTV4VwYJf1k8lhb52FNfPoZj1g7oMLRJ6BzK9o3j7z+DvTCDJinEk2P8moOchQq
         Jedsv5tlbwJynGGYR+ItUTyJEeWgyeoOBlGmQRWD2IkmHqtmiFnZc3xXcEeZgA3ZYqcz
         b4s9wUskjXOkMSg/XXpG+MY8Xa5auIMl+MSpOg8E8aRhmLEXTMb0wsA/hLx4QKPc2d8z
         184Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7MoedW7dYIqdxbz/1+3cfjIQ5/QgAvq64b2nX4h9Is=;
        b=TW8ohDLQwqqNPzVu4u65qOTWQ/ECWOpHbUvCpVQq+d1s43dbaiYGpK5cIpAKs/ZSkc
         +OWjkOHlJqeKgKHiMFJcxyyEL9sm8hCxwlDVzFKHAK1Aed3i34FnjMdW2PmXOneUHXTj
         im+L2YIfR4hr0AGOJ6thb8LP6GV1+p7kT8PYeBF/Z0Wt5+5sara8FpS7+CIVOS5TUR3Q
         j1X1zwU3hXJuKSpEPa+HqEFFSWMUZftaBuH2EI19tXmk9ydneYjq7BZmOu9zzC701tbE
         JYIvAKeSkYhtrSjHhbQ/wnjxwjCLW2ZkClcU4pcHrUU5J3pZqQOgGmwTW7ftEp5WkMh6
         nVMA==
X-Gm-Message-State: APjAAAV2WGRevHzjWRHwNHRTRj2+aIqcTUsEl//Z2oJb9meJ26RfoL0x
        ycUqlu2UlAG9V2JPaK092Do=
X-Google-Smtp-Source: APXvYqzJtlGVHlwL0v5kEn5rmK2IZ758Txlqib/YVhvasyLC3bmKjUtvK7n7igjNDNR9GVej52q1oA==
X-Received: by 2002:adf:f452:: with SMTP id f18mr16970783wrp.264.1572717402606;
        Sat, 02 Nov 2019 10:56:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d11sm13660495wrf.80.2019.11.02.10.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/9] iommu: Document iommu_fwspec::flags field
Date:   Sat,  2 Nov 2019 18:56:29 +0100
Message-Id: <20191102175637.3065-2-thierry.reding@gmail.com>
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

When this field was added in commit 5702ee24182f ("ACPI/IORT: Check ATS
capability in root complex nodes"), the kerneldoc comment wasn't updated
at the same time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e28e80dea141..7bf038b371b8 100644
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

