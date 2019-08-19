Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E309231A
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Aug 2019 14:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfHSMJX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 19 Aug 2019 08:09:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:47542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbfHSMJX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Aug 2019 08:09:23 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FE4220851;
        Mon, 19 Aug 2019 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566216562;
        bh=NFJ3y2FRyz/Sijca+X82/cihiNZBB6vZUHePSvZesEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jdzAoDkBBiO4MM+szC1VLu2M/TLylR63JiaMC69yS4bzIlTPQ2wBZ6ysvGzRJmm3z
         c1qu1xGEm+CQ462UgIQ6S/+Ef57RC5xyGMMyUrFIWCideHRBO3VrhagOua/GP1xDWs
         24g61s6REcFUpyFg/6LB2g9vpqCjEgiMOrWKhTTc=
Date:   Mon, 19 Aug 2019 13:09:18 +0100
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Message-ID: <20190819120917.hysyc6l3ckkwcx25@willie-the-truck>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
 <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
 <20190819112856.GA28102@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819112856.GA28102@ulmo>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Aug 19, 2019 at 01:28:56PM +0200, Thierry Reding wrote:
> Perhaps an alternative would be to add a property to the SMMU node that
> lists a set of stream IDs for which to enable bypass by default. We
> could let the firmware set that when the display hardware has been set
> up. That way when the kernel boots we can keep scanning from the
> reserved memory and the ARM SMMU driver would not disable bypass for the
> display hardware. Only when the display hardware is actually attached to
> the IOMMU domain, and the 1:1 mappings have been created would bypass be
> disabled, and at that point there should be no SMMU faults anymore, so
> we have cleanly transitioned to the kernel.
> 
> Any thoughts?

There is currently an extension to IORT under discussion which should
address this problem, so it would make a lot of sense for the DT solution
to follow the same approach. I think it will end up being along the lines
that you suggest, although we won't just enable bypass because that leaves
memory wide open if the device driver doesn't probe and it also creates
an issue because device attach typically happens before the endpoint
driver has probed.

So the flow would look something like:

	- Firmware describes a physical region of memory which must be
	  reserved by the OS.

	- Additionally, firmware describes a master -> reserved memory
	  linkage as part of the IOMMU description.

	- When the IOMMU probes, these reserved memory regions will be
	  mapped 1:1 for the relevant master.

This is similar to RMRR on x86, except that the mappings are intended to
be less rigid and can be torn down if the endpoint driver decides to do
that or for things like device passthrough.

If we get that working, we should update our booting.txt so that DMA is
allowed during boot in the limited cases which this covers.

Will
