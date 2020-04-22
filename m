Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A611B46C4
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 16:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgDVOC5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Apr 2020 10:02:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgDVOC5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Apr 2020 10:02:57 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCAB92077D;
        Wed, 22 Apr 2020 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587564177;
        bh=Eee8d+5Hu8BFJeOdJCHWoIR/ex6fFhcbdTN/Vls1UIw=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=bBLH5hR/kD0OiuCE1N1gPai0IMmih6B7hDHD+Yn0zpltoPQQfYly+5bCufdy3BcyH
         HDMQrmnQi1cgfI6jHI2UXOtapZRWnJpmXK/RcnKdzkPFlWg2uflJJcWp5NykWVBBC6
         WzFqWZJ+JeMBmHJxcyB1OerHCNRy73x0QrulURco=
Date:   Wed, 22 Apr 2020 15:02:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org,
        Sowjanya Komatineni <skomatineni@nvidia.com>
In-Reply-To: <20200421212121.3286517-1-thierry.reding@gmail.com>
References: <20200421212121.3286517-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
Message-Id: <158756395814.23495.171205742201395813.b4-ty@kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 21 Apr 2020 23:21:21 +0200, Thierry Reding wrote:
> Hi Liam, Mark,
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into

   undefined asoc-5.7

Thanks!

merge commit: 41d91ec3de8a90167159275bde7ed65768723556

Thanks,
Mark
