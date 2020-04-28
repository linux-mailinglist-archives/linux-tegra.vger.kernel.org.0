Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11FC1BC3E3
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2020 17:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgD1PlR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Apr 2020 11:41:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728292AbgD1PlQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Apr 2020 11:41:16 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17B62206D9;
        Tue, 28 Apr 2020 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588088476;
        bh=YTmkEeh0V9t31v30Qf9a/Bf0gPGvc6k9LnAqYb5SHLA=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=tEK/xzzSnuP34Iqa/c3Rr4apqerXPegbJea5YBI6IlIMmDk6c8fM6L45PQPv1jMu+
         YwcLPB71FnKXn+nPGxfidsjfgW9t7YBBZgCx5sa//uqjpHPmWqX+wf8rFXbu4LyE5h
         IEYNeHsfDb0kXBleFgWb8pbJEg6TE/Cd1F1kankQ=
Date:   Tue, 28 Apr 2020 16:41:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20200428110742.110335-1-weiyongjun1@huawei.com>
References: <20200428110742.110335-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
Message-Id: <158808847385.38342.17859489811900791487.b4-ty@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 28 Apr 2020 11:07:42 +0000, Wei Yongjun wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/tegra/tegra_wm8903.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
      commit: ac3367442d9e5971e32014c6fea41ca1662c0e2d

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
