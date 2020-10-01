Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86C4280A6E
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Oct 2020 00:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733243AbgJAWra (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Oct 2020 18:47:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgJAWra (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Oct 2020 18:47:30 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D7A020739;
        Thu,  1 Oct 2020 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601592449;
        bh=5wbAsBc6F+A6i8ZNRWp9o2yFaL1jRl0UihqKMbzcWy4=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Sy0mxeYXKJQmlmjVKauRjRW0Frq9VJL077lN1dq6t6kA3PeDiA4+mqxcuKFAP2QUx
         bIqBtV6MJfSHWI/fjBsgp/LuQVx7uP4FARetcUH89a0ch1r7X/g6onxZQJbDebUWKp
         P9gVLiyVpYd+n4VlRg6OI7rVeY1eSm9mO/xlQv9E=
Date:   Thu, 01 Oct 2020 23:46:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20200929112936.47441-1-miaoqinglang@huawei.com>
References: <20200929112936.47441-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: tegra: tegra_rt5640: use
 devm_snd_soc_register_card()
Message-Id: <160159237544.44588.2378133228066985986.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 29 Sep 2020 19:29:36 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: tegra_rt5640: use devm_snd_soc_register_card()
      commit: c859926abc8ebc0562a16a12b4993eab690c2281

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
