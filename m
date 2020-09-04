Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957F325D895
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Sep 2020 14:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730137AbgIDM1t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Sep 2020 08:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbgIDM1r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Sep 2020 08:27:47 -0400
X-Greylist: delayed 12425 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Sep 2020 05:27:47 PDT
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5EAC061244;
        Fri,  4 Sep 2020 05:27:46 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 61EC33D5; Fri,  4 Sep 2020 14:27:41 +0200 (CEST)
Date:   Fri, 4 Sep 2020 14:27:40 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add locking around mapping
 operations
Message-ID: <20200904122739.GF16609@8bytes.org>
References: <20200901203730.27865-1-digetx@gmail.com>
 <20200904121949.GA570531@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904121949.GA570531@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 04, 2020 at 02:19:49PM +0200, Thierry Reding wrote:
> Seems to work fine. Tested on Jetson TX1 with display and GPU, which are
> the primary users of the SMMU.
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied, thanks.

