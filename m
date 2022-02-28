Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91514C6C69
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Feb 2022 13:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiB1M0r (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Feb 2022 07:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236487AbiB1M0l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Feb 2022 07:26:41 -0500
X-Greylist: delayed 519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 04:25:26 PST
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFA275605
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 04:25:26 -0800 (PST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B927A4B0; Mon, 28 Feb 2022 13:16:45 +0100 (CET)
Date:   Mon, 28 Feb 2022 13:16:43 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix missing put_device() call in
 tegra_smmu_find
Message-ID: <Yhy9K07YCIyeIeJ/@8bytes.org>
References: <20220107080915.12686-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107080915.12686-1-linmq006@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 07, 2022 at 08:09:11AM +0000, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling path.
> 
> Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied for v5.17, thanks.

