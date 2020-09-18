Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7260826F8F0
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Sep 2020 11:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIRJHe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Sep 2020 05:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRJHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 05:07:34 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657A7C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 02:07:33 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 99E44396; Fri, 18 Sep 2020 11:07:30 +0200 (CEST)
Date:   Fri, 18 Sep 2020 11:07:29 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com
Subject: Re: [RESEND][PATCH 0/2] iommu/tegra-smmu: Fix TLB line for Tegra210
Message-ID: <20200918090728.GL31590@8bytes.org>
References: <20200917113155.13438-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917113155.13438-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 17, 2020 at 04:31:53AM -0700, Nicolin Chen wrote:
> These two patches fix ACTIVE_TLB_LINES field setting in tegra-smmu
> driver for Tegra210 platforms.
> 
> This resend in series groups two previous seperate changes that're
> corelated, being pointed out by Thierry. Also adding his Acked-by.
> 
> Nicolin Chen (2):
>   iommu/tegra-smmu: Fix tlb_mask
>   memory: tegra: Correct num_tlb_lines for tegra210
> 
>  drivers/iommu/tegra-smmu.c      | 2 +-
>  drivers/memory/tegra/tegra210.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
