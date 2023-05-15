Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F10702D11
	for <lists+linux-tegra@lfdr.de>; Mon, 15 May 2023 14:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241694AbjEOMtn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 15 May 2023 08:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241977AbjEOMtm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 08:49:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD0A8A6
        for <linux-tegra@vger.kernel.org>; Mon, 15 May 2023 05:49:37 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387E42F4;
        Mon, 15 May 2023 05:50:22 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3669E3F67D;
        Mon, 15 May 2023 05:49:36 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux.dev, will@kernel.org, jgg@nvidia.com,
        digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] iommu: tegra-gart cleanups
Date:   Mon, 15 May 2023 13:49:28 +0100
Message-Id: <cover.1684154219.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all,

For the sake of discussion, here's my irrational pet project to bring
the tegra-gart driver right up to date as an example of a
properly-implemented IOMMU driver for a non-isolated address space. Part
of that irrationality is that I don't even own any hardware which uses
this driver, so it's only build-tested :)

Thanks,
Robin.


Robin Murphy (4):
  iommu/tegra-gart: Add default identity domain support
  iommu/tegra-gart: Improve domain support
  iommu/tegra-gart: Generalise domain support
  iommu: Clean up force_aperture confusion

 drivers/iommu/dma-iommu.c    |  19 ++--
 drivers/iommu/mtk_iommu_v1.c |   4 +
 drivers/iommu/sprd-iommu.c   |   1 +
 drivers/iommu/tegra-gart.c   | 162 +++++++++++++++++++----------------
 4 files changed, 99 insertions(+), 87 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty

