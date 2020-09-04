Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5686025D423
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Sep 2020 11:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgIDJAn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Sep 2020 05:00:43 -0400
Received: from 8bytes.org ([81.169.241.247]:40818 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgIDJAn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 4 Sep 2020 05:00:43 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A2C3E3D5; Fri,  4 Sep 2020 11:00:40 +0200 (CEST)
Date:   Fri, 4 Sep 2020 11:00:39 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] iommu/tegra-smmu: Reference count fixes
Message-ID: <20200904090039.GD6714@8bytes.org>
References: <20200806155404.3936074-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806155404.3936074-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Aug 06, 2020 at 05:54:01PM +0200, Thierry Reding wrote:
> Thierry Reding (3):
>   iommu/tegra-smmu: Set IOMMU group name
>   iommu/tegra-smmu: Balance IOMMU group reference count
>   iommu/tegra-smmu: Prune IOMMU group when it is released

Applied, thanks.
