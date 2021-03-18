Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01FC340D23
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Mar 2021 19:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhCRSgP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Mar 2021 14:36:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:43006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232476AbhCRSgP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 14:36:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D5F464F1F;
        Thu, 18 Mar 2021 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616092574;
        bh=O4+Jms1dbCSgB1akhHdOQ5yf5A0hiTEh3B7Z20RU4GA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EwFbcCby8rFgHBAO1ZtPs9Wnhpm7vsF3MFKf/vfHQIldsIE9BmzqOB2NKrDlpX6Xl
         jC448ZaRf4/ZjmobdFfST2YSWOh4Hl+md5bD9XL1cWlwSr00OoJQwcrFygu+MFqm11
         v1wkQGWCrjTcK0PsdJ8K4jKH6sKnZ3Jf8QS/IfPqo2Zg8lDcILpUoK2an6pMXaHSOL
         PrXjYtb+vwg17dCtVjSQpaZLvlfnlXLRnS/s6Yx4JZMU6wL1DlOVa08C2FhTZOD/Wx
         jO+G+CY8TgZQV2ncBGKJKhQmopF2V91VYCHdhwM/O+6uik7Gr+SS8mj0hGZ4eND2Kc
         RB9wuiHjeIPvg==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC drivers
Date:   Thu, 18 Mar 2021 18:36:02 +0000
Message-Id: <161609213718.41838.12060094271609265312.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 14 Mar 2021 18:44:42 +0300, Dmitry Osipenko wrote:
> This series adds missing hardware reset controls to I2S and AC97 drivers,
> corrects runtime PM usage and drivers probe/remove order. Currently drivers
> happen to work properly because reset is implicitly deasserted by tegra-clk
> driver, but clk driver shouldn't touch the resets and we need to fix it
> because this breaks other Tegra drivers. Previously we fixed the resets of
> the AHUB and HDMI codec drivers, but turned out that we missed the I2C and
> AC97 drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: tegra20: ac97: Add reset control
        commit: a46b78247b852345ae4458711a4aec6744a7838c
[02/17] ASoC: tegra20: i2s: Add reset control
        commit: 9c648ef82d7d4696e80b286d37dae07b67a9a32d
[03/17] ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
        commit: 0bbcecaaab15a74ba69f93df46c753f2a64eadca
[04/17] reset: Add reset_control_bulk API
        commit: 48d71395896d54eec989179dd265e569fcecb15a
[05/17] ASoC: tegra30: ahub: Switch to use reset-bulk API
        commit: 050086eb6dc945207b1db1d15cd81e9366dfd2f1
[06/17] ASoC: tegra20: spdif: Correct driver removal order
        commit: 0911f154a2ae264ee2a7c868c1267a102396d016
[07/17] ASoC: tegra20: spdif: Remove handing of disabled runtime PM
        commit: c53b396f0dd49a626ea2b1fc0a8b9e0a0bf95d4d
[08/17] ASoC: tegra20: i2s: Add system level suspend-resume callbacks
        commit: e33fdd9bee12be35d080bfd4acc9d1e3a0d04001
[09/17] ASoC: tegra20: i2s: Correct driver removal order
        commit: ca6e960ed6b10ba9236da8b3614574bb4524c65e
[10/17] ASoC: tegra20: i2s: Use devm_clk_get()
        commit: d3c6ef98dadd1e500445e4c5a9d684cbf3182c7d
[11/17] ASoC: tegra20: i2s: Remove handing of disabled runtime PM
        commit: 80ec4a4cb36d3f8bb56b5aa89faceb1145ef7aea
[12/17] ASoC: tegra30: i2s: Correct driver removal order
        commit: f852e1e4acf4ebde4c960bab6f89407fa18ca489
[13/17] ASoC: tegra30: i2s: Use devm_clk_get()
        commit: 52674aef9eb678f30d99f77fd53f6c564d5e2d92
[14/17] ASoC: tegra30: i2s: Remove handing of disabled runtime PM
        commit: b5f6f781fcb27b3ae5a2f04312a190115b5cbbd1
[15/17] ASoC: tegra30: ahub: Reset global variable
        commit: 5d956e3cb806870012c443bc265e6ac6188d3c36
[16/17] ASoC: tegra30: ahub: Correct suspend-resume callbacks
        commit: e2965c2ca139e780dc353cef1474103bb037136e
[17/17] ASoC: tegra30: ahub: Remove handing of disabled runtime PM
        commit: b5571449e6186bd37e8da16e7bce53f621c05e72

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
