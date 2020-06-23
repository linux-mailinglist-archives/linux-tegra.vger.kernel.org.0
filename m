Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA19220471E
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jun 2020 04:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730804AbgFWCHy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jun 2020 22:07:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730328AbgFWCHx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jun 2020 22:07:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58C7D20720;
        Tue, 23 Jun 2020 02:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592878073;
        bh=we5WmCVzt48ut9pkLyJImWtFpdDQxOoWy+a1m9PkbpU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mRB5XR7hh7k+R+ykD5n2k9l6ijJs8RkwtQvZJ3He5oeAsR3hCxoRU1g30Geq5luv9
         S8nfnjRcipZst25P1LUsoRTcaxcvrYloG8OFcdmDJ7JyeL0anXlYEX/zPXEmRH46iL
         QRvH9DRa05FIKroqTuF6MLNtIAWY1HKyYMT9mygs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com> <20200603111923.3545261-2-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 22 Jun 2020 19:07:52 -0700
Message-ID: <159287807271.62212.1561231041280024616@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-06-03 04:19:23)
> From: Thierry Reding <treding@nvidia.com>
>=20
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
>=20
> This can cause SATA to fail like this:
>=20
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI cont=
roller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -=
110
>=20
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
>=20
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
