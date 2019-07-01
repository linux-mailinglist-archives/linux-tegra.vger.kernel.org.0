Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4071B153E3
	for <lists+linux-tegra@lfdr.de>; Mon,  6 May 2019 20:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfEFSxB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 May 2019 14:53:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:32782 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfEFSw5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 May 2019 14:52:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id n17so16354254edb.0
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2019 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOMG2HdbEZ3SrXQ8q7Gqb0A8n9cqtIr7U5g8ZrmeSwY=;
        b=jhxVShgPi56fhBmH6sXGURNSQPG8rifG26Da8orjFSRRc8gRE6k4Cv6HwdBHg4knfI
         l5tc2Q+doMEgflLHad6284EeKM+Hshw3o9FH3NdEkGrVsvtFV4R2axudVscNb2s97B7y
         TU8ZHMgrm2I96elHH5u5wUkhBml+5CSM0Bdrjpo6Z3hiwSnAQoLfuou4AItwdkOpsxed
         80lBtJ3c6s9ug68FFc8DHgEZ18q+zoY1HdpsnDLUDCZ8hzDP1k/iNQBJQXz0tnLVDZDA
         PjjVf3eEJQcaUVjosMg85BMeUtS+scBv/cwOJtifNVGUGwrOUDP6xQ2JB5R79hYAa3k2
         M/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOMG2HdbEZ3SrXQ8q7Gqb0A8n9cqtIr7U5g8ZrmeSwY=;
        b=ta5q1a8s2HFXRUxkOAeAqvJQjdmzbramwhSXKHs7gPOVAwmMcaaOxzSBarkzS+Qeww
         fGh0TFKMh1EuzE4nNSMhszPUx5hQzY7g2e6k8T4BKApI66B4ZsvPzcHU5zYoAp2sR6P2
         tPgK8w0EN11tEdbz3luhQYEinUG7o9u/OVOkrPxcPcEG60+GLr/LwluJieXsZmWUGkA1
         9mgSYvo4D4jV1b5NbAesnVYt6/fLLyhOKrxnUvfoDTi5JW8oqYNvs2RcH96krTijnVXL
         LQPmDZQbXG+KJfLNnMihDwm0hUwVgpCOJbOTf0ym7Kg66xOXHqhvq7iPL7olbqXxmtfB
         k9sg==
X-Gm-Message-State: APjAAAUSLOow1xoo2omHgibHHXeRGF4PHbfxQB2/vJJZM6WSbJRuPEZs
        WrRCLRNPeYGARejIDRy+PIt7+g==
X-Google-Smtp-Source: APXvYqx/0bwigCkWFM3Wz/6ksylC3p72YzFRn5H6iW89lDNU+bH1gdGYQluV+iLWz8wcDznRZGXmPg==
X-Received: by 2002:a17:906:469a:: with SMTP id a26mr20917778ejr.164.1557168775535;
        Mon, 06 May 2019 11:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:d9d9:922a:828d:a50e])
        by smtp.gmail.com with ESMTPSA id e35sm3361412eda.2.2019.05.06.11.52.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 11:52:54 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/4] iommu/amd: Convert the AMD iommu driver to the dma-iommu api
Date:   Mon,  6 May 2019 19:52:02 +0100
Message-Id: <20190506185207.31069-1-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Change-log:
v3:
-rename dma_limit to dma_mask
-exit handle_deferred_device early if (!is_kdump_kernel())
-remove pointless calls to handle_deferred_device
v2:
-Rebase on top of this series:
 http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
-Add a gfp_t parameter to the iommu_ops::map function.
-Made use of the reserve region code inside the dma-iommu api

Tom Murphy (4):
  iommu: Add gfp parameter to iommu_ops::map
  iommu/dma-iommu: Handle deferred devices
  iommu/dma-iommu: Use the dev->coherent_dma_mask
  iommu/amd: Convert the AMD iommu driver to the dma-iommu api

 drivers/iommu/Kconfig          |   1 +
 drivers/iommu/amd_iommu.c      | 694 ++++-----------------------------
 drivers/iommu/arm-smmu-v3.c    |   2 +-
 drivers/iommu/arm-smmu.c       |   2 +-
 drivers/iommu/dma-iommu.c      |  50 ++-
 drivers/iommu/exynos-iommu.c   |   2 +-
 drivers/iommu/intel-iommu.c    |   2 +-
 drivers/iommu/iommu.c          |  43 +-
 drivers/iommu/ipmmu-vmsa.c     |   2 +-
 drivers/iommu/msm_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu_v1.c   |   2 +-
 drivers/iommu/omap-iommu.c     |   2 +-
 drivers/iommu/qcom_iommu.c     |   2 +-
 drivers/iommu/rockchip-iommu.c |   2 +-
 drivers/iommu/s390-iommu.c     |   2 +-
 drivers/iommu/tegra-gart.c     |   2 +-
 drivers/iommu/tegra-smmu.c     |   2 +-
 include/linux/iommu.h          |  21 +-
 19 files changed, 184 insertions(+), 653 deletions(-)

-- 
2.17.1

