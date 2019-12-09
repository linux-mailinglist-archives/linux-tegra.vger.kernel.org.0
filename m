Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C79116FE1
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 16:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfLIPH7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 10:07:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33291 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPH6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 10:07:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so16619039wrq.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9S04JDPyYWqmVYsR9CCUAiqutorZgMZt/OWk8Z0jLs=;
        b=DjKqp/mLV5RlPNLnYcqvmWnPEEETVXv4EyspYbunjaTfFLHBv7o5xFaaqx4LXgM5Mf
         b16Ly0UR1viJI8Hh0TmcG2lUNMBuWy2Rm7a/MzhTtdcI4bj0rl+kffI7NRl2TpDPI1vG
         8xRDod5/4Y0wiog27SE3AJnel1tAA+Gd2tXo3WXl3DOh5vuVHdYqkPCEg5aYZHgoPrIM
         QUMuEJLYU4v+sRUVzQbtNN0ZtzhYN3L83ljzD6p3N1EuM+m5pKgw0AKTkradaohdB9Ei
         ePJZTQV5Z+I8vShHTn4VqFdZiyPh6DFyHqy+viEgKg2VNqPKtHZlSdJGqXXNgDvLSs9O
         x4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9S04JDPyYWqmVYsR9CCUAiqutorZgMZt/OWk8Z0jLs=;
        b=ExPig2erroXsy6YTl1nxljjpYJi9AhDdlo9QTJSnv0Jlh4W1G4UjMscsxp1dX2jsip
         XlhmKeLLsLktAa4iJTzQYtWzYrBsY/cTyPoflcdJ3c2jMJJEA99ZCxMsEKPITFxc/0sF
         CH699yzMuAWzsRbBge/MmdQVKKgSJyLkWD93nh08oKDQOMVhjPO7PjftUKZcXD6d212I
         eVX8Mq6bCVdHbeLy4vEqBVMyiKlXAQqMf8UamXbMIUeZC5TDQW6TYvVpA7xE+BHULe5F
         TJyb479/DhA+BhE/FyM7Q+3LlqEswjxJTVADuptIwhUGj4mZEEsuV1UF9cRDramfl/gd
         N5ww==
X-Gm-Message-State: APjAAAWhb2GYkZ/V5nqbVWpfAQ8+9geQLY77Tm8OHbb7YNyF+gvvoerf
        jcdIWwuXmb/M1/grdQy5HMM=
X-Google-Smtp-Source: APXvYqzGieSGCM1eahc8eoNyjBUi4olOJR8GjSmssbMHpICHRsLwq00wg/cxhK5N8DYZAEF0nDUkIw==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr2728041wrm.345.1575904076660;
        Mon, 09 Dec 2019 07:07:56 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l7sm27588659wrq.61.2019.12.09.07.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 07:07:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date:   Mon,  9 Dec 2019 16:07:46 +0100
Message-Id: <20191209150748.2471814-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On some platforms, the firmware will setup hardware to read from a given
region of memory. One such example is a display controller that is
scanning out a splash screen from physical memory.

During Linux' boot process, the ARM SMMU will configure all contexts to
fault by default. This means that memory accesses that happen by an SMMU
master before its driver has had a chance to properly set up the IOMMU
will cause a fault. This is especially annoying for something like the
display controller scanning out a splash screen because the faults will
result in the display controller getting bogus data (all-ones on Tegra)
and since it repeatedly scans that framebuffer, it will keep triggering
such faults and spam the boot log with them.

In order to work around such problems, scan the device tree for IOMMU
masters and set up a special identity domain that will map 1:1 all of
the reserved regions associated with them. This happens before the SMMU
is enabled, so that the mappings are already set up before translations
begin.

One thing that was pointed out earlier, and which I don't have a good
idea on how to solve it, is that the early identity domain is not
discarded. The assumption is that the standard direct mappings code of
the IOMMU framework will replace the early identity domain once devices
are properly attached to domains, but we don't have a good point in time
when it would be safe to remove the early identity domain.

One option that I can think of would be to create an early identity
domain for each master and inherit it when that master is attached to
the domain later on, but that seems rather complicated from an book-
keeping point of view and tricky because we need to be careful not to
map regions twice, etc.

Any good ideas on how to solve this? It'd also be interesting to see if
there's a more generic way of doing this. I know that something like
this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
because translations are only enabled when the devices are attached to a
domain. I'm not sure about other IOMMUs, but in the absence of a struct
device, I suspect that we can't really do anything really generic that
would work across drivers.

Thierry

Thierry Reding (2):
  iommu: arm-smmu: Extract arm_smmu_of_parse()
  iommu: arm-smmu: Add support for early direct mappings

 drivers/iommu/arm-smmu.c | 195 +++++++++++++++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h |   2 +
 2 files changed, 189 insertions(+), 8 deletions(-)

-- 
2.23.0

