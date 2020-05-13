Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2BD1D0B05
	for <lists+linux-tegra@lfdr.de>; Wed, 13 May 2020 10:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbgEMImx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 13 May 2020 04:42:53 -0400
Received: from 8bytes.org ([81.169.241.247]:42226 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732360AbgEMImx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 May 2020 04:42:53 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 092FF379; Wed, 13 May 2020 10:42:51 +0200 (CEST)
Date:   Wed, 13 May 2020 10:42:50 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] iommu: Do not probe devices on IOMMU-less busses
Message-ID: <20200513084250.GC9820@8bytes.org>
References: <20200511161000.3853342-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511161000.3853342-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, May 11, 2020 at 06:10:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The host1x bus implemented on Tegra SoCs is primarily an abstraction to
> create logical device from multiple platform devices. Since the devices
> in such a setup are typically hierarchical, DMA setup still needs to be
> done so that DMA masks can be properly inherited, but we don't actually
> want to attach the host1x logical devices to any IOMMU. The platform
> devices that make up the logical device are responsible for memory bus
> transactions, so it is them that will need to be attached to the IOMMU.
> 
> Add a check to __iommu_probe_device() that aborts IOMMU setup early for
> busses that don't have the IOMMU operations pointer set since they will
> cause a crash otherwise.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Note that this is probably also required for the BCMA bus implemented in
> drivers/bcma/main.c since no IOMMU operations are ever assigned to that
> either.
> 
>  drivers/iommu/iommu.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

