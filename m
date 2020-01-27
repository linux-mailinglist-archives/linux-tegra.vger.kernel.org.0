Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C280114AA32
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Jan 2020 20:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgA0TD7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jan 2020 14:03:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:45896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgA0TD7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jan 2020 14:03:59 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E84B206D3;
        Mon, 27 Jan 2020 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580151839;
        bh=qJiRbZsfSfSbuz/Ww5M+Tx1kqYzH7GxxcoCuy6VgC6g=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=ZTq2YEP7wiy/zWo7gdwa8AQw04fsUI6sh0etIxfy1Y2V2y6x2F1lYoCuQsVx2JekL
         ulolbTApNfNJTzsdX/j0CpxWIldbgvQJZZVnEGg4HSD9SDN9/AQDh9UOuOqNkVxAo4
         wl2S2UcJgnly10AOoxHdyrkd1g3I/vPpFqdbiv2s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200127130747.2287794-1-thierry.reding@gmail.com>
References: <20200127130747.2287794-1-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.6-rc1
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 27 Jan 2020 11:03:58 -0800
Message-Id: <20200127190359.1E84B206D3@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-01-27 05:07:47)
> Hi Mike, Stephen,
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.6-clk
>=20
> for you to fetch changes up to 41a1f096e94c9559b45ccce43fba94913ebc7313:
>=20
>   clk: tegra20/30: Explicitly set parent clock for Video Decoder (2020-01=
-10 15:50:43 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

