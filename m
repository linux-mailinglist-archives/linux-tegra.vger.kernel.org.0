Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C9139224A
	for <lists+linux-tegra@lfdr.de>; Wed, 26 May 2021 23:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhEZVtw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 May 2021 17:49:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232976AbhEZVtw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 May 2021 17:49:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84A3F613C5;
        Wed, 26 May 2021 21:48:18 +0000 (UTC)
Date:   Wed, 26 May 2021 22:48:16 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: Check if GMID_EL1.BS is the same on all CPUs
Message-ID: <20210526214815.GA5083@arm.com>
References: <20210511182322.3830-1-catalin.marinas@arm.com>
 <20210511182322.3830-3-catalin.marinas@arm.com>
 <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 26, 2021 at 08:47:16PM +0100, Jon Hunter wrote:
> On 11/05/2021 19:23, Catalin Marinas wrote:
> > The GMID_EL1.BS field determines the number of tags accessed by the
> > LDGM/STGM instructions (EL1 and up), used by the kernel for copying or
> > zeroing page tags.
> > 
> > Taint the kernel if GMID_EL1.BS differs between CPUs.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
[...]
> I am seeing the following undefined instruction crash on all our 
> ARM64 Tegra devices on today's -next and bisect is pointing to
> this patch. Reverting this patch on top of -next does fix the 
> problem. Let me know if you have any thoughts.

Yeah, sorry about that. Posted a new version here, better tested:

https://lore.kernel.org/r/20210526193621.21559-1-catalin.marinas@arm.com

Will should have dropped the old one from linux-next but it takes a few
hours before Stephen re-creates the tree.

-- 
Catalin
