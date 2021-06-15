Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5593D3A89C4
	for <lists+linux-tegra@lfdr.de>; Tue, 15 Jun 2021 21:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhFOTwk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Jun 2021 15:52:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhFOTwk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 15:52:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14BCA6128B;
        Tue, 15 Jun 2021 19:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623786635;
        bh=mArWVnYnQ6vLGF4/jXFA3EDckajI1UgQo8mIcx1O5ZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gp3kyyAH1Qs4tAACkkmh3LljxheC2CwXfAuW0NZ/NBAuKRtYK/syOIDj8HmnK5p6C
         X2hfYs6dZfSdrf5i7wlq802Ifw0a4uzQHZLseBvuieQYZFobKapi7DLmWwvcWDTGKK
         nfQ3WfSPwSrMDWSbu0D2x1DwII7R3AcopYWv/YsiCAbBUywpobjFBPEOO2FhbugX3f
         ucX/+IvX6ihNhNVlc1gt+4LoRhtSiWaRoQul2MAaoHM2pzOVTefqgwbCYkkhoxzAg+
         dnB2VFqFHMKzu8LuG0jcEjWGXOvsxLRUiik2/2RSuZEtJWN5vVElmAH9cp/0gnDF5i
         p9tONIgr6dJ8g==
Date:   Tue, 15 Jun 2021 20:50:30 +0100
From:   Will Deacon <will@kernel.org>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
Message-ID: <20210615195030.GA21783@willie-the-truck>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-4-thierry.reding@gmail.com>
 <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
 <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
 <BY5PR12MB376468558EB3330D64758210B3309@BY5PR12MB3764.namprd12.prod.outlook.com>
 <20210615182135.GA21481@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615182135.GA21481@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 15, 2021 at 07:21:35PM +0100, Will Deacon wrote:
> On Tue, Jun 15, 2021 at 06:12:13PM +0000, Krishna Reddy wrote:
> > > if (smmu->impl->probe_finalize)
> > 
> > The above is the issue. It should be updated as below similar to other instances impl callbacks.
> > if (smmu->impl && smmu->impl->probe_finalize)
> 
> I'll push a patch on top shortly...

Done:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-thierry/arm-smmu

I'll send this lot to Joerg tomorrow.

Thierry -- feel free to pull in the updated branch if you want the fix
sooner, as it may be a few days before this hits -next.

Cheers,

Will
