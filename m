Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB25DC19D
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Oct 2019 11:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390579AbfJRJqe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Oct 2019 05:46:34 -0400
Received: from 8bytes.org ([81.169.241.247]:47992 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389411AbfJRJqe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Oct 2019 05:46:34 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 70A44300; Fri, 18 Oct 2019 11:46:32 +0200 (CEST)
Date:   Fri, 18 Oct 2019 11:46:31 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] iommu/tegra-smmu: Use non-secure register for
 flushing
Message-ID: <20191018094630.GA4670@8bytes.org>
References: <20191016115026.1768745-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016115026.1768745-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2019 at 01:50:24PM +0200, Thierry Reding wrote:
> From: Navneet Kumar <navneetk@nvidia.com>
> 
> Use PTB_ASID instead of SMMU_CONFIG to flush smmu.
> PTB_ASID can be accessed from non-secure mode, SMMU_CONFIG cannot be.
> Using SMMU_CONFIG could pose a problem when kernel doesn't have secure
> mode access enabled from boot.
> 
> Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied all, thanks.
