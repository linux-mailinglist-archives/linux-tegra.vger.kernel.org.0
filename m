Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C69F224DA8
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Jul 2020 21:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGRTfL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Jul 2020 15:35:11 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16157 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgGRTfL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Jul 2020 15:35:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f134e790000>; Sat, 18 Jul 2020 12:33:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 12:35:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 12:35:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 19:35:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 18 Jul 2020 19:35:06 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f134ee90000>; Sat, 18 Jul 2020 12:35:06 -0700
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <yhsu@nvidia.com>,
        <snikam@nvidia.com>, <praithatha@nvidia.com>, <talho@nvidia.com>,
        <bbiswas@nvidia.com>, <mperttunen@nvidia.com>,
        <nicolinc@nvidia.com>, <bhuntsman@nvidia.com>,
        <nicoleotsuka@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v11 0/5] NVIDIA ARM SMMU Implementation
Date:   Sat, 18 Jul 2020 12:34:52 -0700
Message-ID: <20200718193457.30046-1-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595100793; bh=TN+H04oNQO9bZvotrlKTP2TmCq3SKVkosF9GEOPNIJU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=rO91Ze9GtaOlLYV08m4UPtp1X0ec4qU9039Jn2xYvNAuFgXvKxFibz9eOlaPcXCzn
         Hie156uusl/owMiO3kHcX+9wuY6QCUWHtAEux9BmuY5tj3WcM7N4GFbFkwMxC6RkcK
         6sJC1H4wFf7tA1Glo3jsFbzM5I9ovsxHqK7zqMWUzqEkPi6PlAGh4HkeZRvb78NFe5
         b76j4ROvTUb4cwt7/1NYzIvxkoJAvVsHAQfAhmDS2j5jKYNjBY2VfV+rOKQpjf/J9K
         C9VJABmlmPgwYTXK0oLhvurERH7nfGzpdj00i+XsjCzV72PrAOqhar4i6PngjWo+Im
         +aJ3xCgRYJtLw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Changes in v11:
Addressed Rob comment on DT binding patch to set min/maxItems of reg proper=
ty in else part.
Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/will/linu=
x.git/log/?h=3Dfor-joerg/arm-smmu/updates.

Changes in v10:
Perform SMMU base ioremap before calling implementation init.
Check for Global faults across both ARM MMU-500s during global interrupt.
Check for context faults across all contexts of both ARM MMU-500s during co=
ntext fault interrupt.
Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
https://lkml.org/lkml/2020/7/8/57

v9 - https://lkml.org/lkml/2020/6/30/1282
v8 - https://lkml.org/lkml/2020/6/29/2385
v7 - https://lkml.org/lkml/2020/6/28/347
v6 - https://lkml.org/lkml/2020/6/4/1018
v5 - https://lkml.org/lkml/2020/5/21/1114
v4 - https://lkml.org/lkml/2019/10/30/1054
v3 - https://lkml.org/lkml/2019/10/18/1601
v2 - https://lkml.org/lkml/2019/9/2/980
v1 - https://lkml.org/lkml/2019/8/29/1588


Krishna Reddy (5):
  iommu/arm-smmu: move TLB timeout and spin count macros
  iommu/arm-smmu: ioremap smmu mmio region before implementation init
  iommu/arm-smmu: add NVIDIA implementation for ARM MMU-500 usage
  dt-bindings: arm-smmu: add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  25 +-
 MAINTAINERS                                   |   2 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm-smmu-impl.c                 |   3 +
 drivers/iommu/arm-smmu-nvidia.c               | 278 ++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  29 +-
 drivers/iommu/arm-smmu.h                      |   6 +
 7 files changed, 334 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c


base-commit: 49fbb25030265c660de732513f18275d88ff99d3
--=20
2.26.2

