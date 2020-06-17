Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904591FCE67
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jun 2020 15:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQNak (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 09:30:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgFQNak (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 09:30:40 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE54F207E8;
        Wed, 17 Jun 2020 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592400640;
        bh=JpusVXzwVNGmBFr4ew9Yb9okQQqrnxdrslbe27VRNV0=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Zj9N3fUTYBYkYRl19BQ+1gEd15ArOiw8gMfH/K/XW1VQF+c32VYm79ivumvKvpLdy
         ekuNPJ6Uj9cvS3bsHtfr0yJ+oOuYXMVC5QmqXekcoZIVzxVdx9oLt72A6J/i1fR1ZW
         2Mgn9nAJDmLBuortDDVxfQTNkUUSP3YwBwSTyDZM=
Date:   Wed, 17 Jun 2020 14:30:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "wu000273@umn.edu" <wu000273@umn.edu>, kjlu@umn.edu
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        YueHaibing <yuehaibing@huawei.com>, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200613204422.24484-1-wu000273@umn.edu>
References: <20200613204422.24484-1-wu000273@umn.edu>
Subject: Re: [PATCH] ASoC: tegra: Fix reference count leaks.
Message-Id: <159240063808.19287.13977649617002497843.b4-ty@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 13 Jun 2020 15:44:19 -0500, wu000273@umn.edu wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix reference count leaks.
      commit: deca195383a6085be62cb453079e03e04d618d6e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
