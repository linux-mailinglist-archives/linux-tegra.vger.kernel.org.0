Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B7FADCD5
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2019 18:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbfIIQNh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Sep 2019 12:13:37 -0400
Received: from verein.lst.de ([213.95.11.211]:52287 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbfIIQNg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 9 Sep 2019 12:13:36 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 19DA968B02; Mon,  9 Sep 2019 18:13:32 +0200 (CEST)
Date:   Mon, 9 Sep 2019 18:13:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christoph Hellwig <hch@lst.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jon Hunter <jonathanh@nvidia.com>, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] block: Respect the device's maximum segment size
Message-ID: <20190909161331.GA19650@lst.de>
References: <20190909125658.30559-1-thierry.reding@gmail.com> <20190909125658.30559-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909125658.30559-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 09, 2019 at 02:56:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When enabling the DMA map merging capability for a queue, ensure that
> the maximum segment size does not exceed the device's limit.

We can't do that unfortunately.  If we use the virt_boundary setting
we do aggressive merges that there is no accounting for.  So we can't
limit the segment size.

And at least for the case how devices usually do the addressing
(page based on not sgl based) that needs the virt_boundary there isn't
really any concept like a segment anyway.
