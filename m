Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EAC444A9
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392557AbfFMQin (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:38:43 -0400
Received: from foss.arm.com ([217.140.110.172]:46272 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730904AbfFMQil (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:38:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE4B367;
        Thu, 13 Jun 2019 09:38:41 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1933F694;
        Thu, 13 Jun 2019 09:38:38 -0700 (PDT)
Date:   Thu, 13 Jun 2019 17:38:36 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
        krzk@kernel.org, robin.murphy@arm.com, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, heiko@sntech.de,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/10] iommu/io-pgtable-arm: convert to SPDX license tags
Message-ID: <20190613163836.GF18966@fuggles.cambridge.arm.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
 <20190613162703.986-7-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613162703.986-7-tiny.windzz@gmail.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 13, 2019 at 12:27:00PM -0400, Yangtao Li wrote:
> Updates license to use SPDX-License-Identifier.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Acked-by: Will Deacon <will.deacon@arm.com>

Will
