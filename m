Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F661F7FC
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Nov 2022 16:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiKGPxV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Nov 2022 10:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbiKGPxU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Nov 2022 10:53:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF86EB39;
        Mon,  7 Nov 2022 07:53:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8663E60F4F;
        Mon,  7 Nov 2022 15:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB80C433C1;
        Mon,  7 Nov 2022 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667836398;
        bh=zSri8bOYt/cciQZNAvfd+4Ix4mWsGf9Zn9QOVwBCLWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=stK7yGqs2kBjcMyP0Xmt0GoeWtyDcWPCmTx/qzfCsr9tkTF4+rj9lby8wywxOV/IV
         9wrizNHEAMcc7Ddv0H23dKQu9+8ZffHbhv/V6KAWhOSiaLYPdiY8aK5YC9otG9CtXT
         7h+52DDvsRaLp9juGTiZYnDaJ5uQsINuyRbreqg9qOY000W0mjgRvf+KEf4VPdZRuN
         vx9JbHoZ6QwDBK0ACJWn9b8TA86tRrvsb3y6gNAEd59sdInstT3Rw2pWG3PJwGcOjd
         VAs9go51dEB/tTQ8gq20DSi74ntY6b2ptlPDcjGi9Y639uwuI/O74jzuTfpJCIjipx
         NxeXvH5+oD6gw==
Date:   Mon, 7 Nov 2022 15:53:12 +0000
From:   Will Deacon <will@kernel.org>
To:     Besar Wicaksono <bwicaksono@nvidia.com>
Cc:     suzuki.poulose@arm.com, robin.murphy@arm.com,
        catalin.marinas@arm.com, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sudeep.holla@arm.com,
        thanu.rangarajan@arm.com, Michael.Williams@arm.com,
        treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
        mathieu.poirier@linaro.org, mike.leach@linaro.org,
        leo.yan@linaro.org
Subject: Re: [PATCH v6 0/2] perf: ARM CoreSight PMU support
Message-ID: <20221107155311.GD21157@willie-the-truck>
References: <20220930023443.9463-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930023443.9463-1-bwicaksono@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2022 at 09:34:41PM -0500, Besar Wicaksono wrote:
> Add driver support for ARM CoreSight PMU device and event attributes for NVIDIA
> implementation. The code is based on ARM Coresight PMU architecture and ACPI ARM
> Performance Monitoring Unit table (APMT) specification below:
>  * ARM Coresight PMU:
>         https://developer.arm.com/documentation/ihi0091/latest
>  * APMT: https://developer.arm.com/documentation/den0117/latest
> 
> The patchset applies on top of
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   master next-20220524
> 
> For APMT support, please see patchset: https://lkml.org/lkml/2022/4/19/1395 
> 
> Changes from v5:
>  * Default get_event/format_attrs callback now returns copy of default array.
> Thanks to suzuki.poulose@arm.com for the review comments.
> v5: https://lore.kernel.org/linux-arm-kernel/20220928201830.45637-1-bwicaksono@nvidia.com/

These patches no longer apply. Please can you rebase onto -rc4 and drop the
defconfig change from the first patch?

Thanks,

Will
