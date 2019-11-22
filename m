Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA810761D
	for <lists+linux-tegra@lfdr.de>; Fri, 22 Nov 2019 18:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKVRBm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 Nov 2019 12:01:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:43512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbfKVRBm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Nov 2019 12:01:42 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B9BF2068F;
        Fri, 22 Nov 2019 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574442101;
        bh=2Xu9CfgT3Fllikxl7Qf7vWA+EqZIXhVi1m6mnAhMj0s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Jk05+ouYD42yDlL2Z19wUifKcuwpeg83Gj40j1a8tgVtGjitsUcyOSvvytPYuLr7U
         6M8R7RRsz2H6FVbcT2vvPpYdC64XombArafbRoDfpD8Yi9vjEwVfAoxU5t1lzLHSBQ
         TzJWlrAUQ4Iki9zhesgENTs+QaJ1rvMzRtE8VPms=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <53eda2aa-35d0-8776-e2cb-b6c4e8c1ff7f@collabora.com>
References: <5dd4ce40.1c69fb81.548f8.e723@mx.google.com> <53eda2aa-35d0-8776-e2cb-b6c4e8c1ff7f@collabora.com>
Subject: Re: clk/clk-next bisection: boot on tegra124-nyan-big
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tomeu.vizoso@collabora.com, mgalka@collabora.com,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Thierry Reding <treding@nvidia.com>
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 09:01:40 -0800
Message-Id: <20191122170141.4B9BF2068F@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Guillaume Tucker (2019-11-20 00:17:28)
> On 20/11/2019 05:25, kernelci.org bot wrote:
> > Author: Thierry Reding <treding@nvidia.com>
> > Date:   Thu Jul 25 18:19:00 2019 +0200
> >=20
> >     clk: tegra: Reimplement SOR clock on Tegra124
> >    =20
> >     In order to allow the display driver to deal uniformly with all SOR
> >     generations, implement the SOR clocks in a way that is compatible w=
ith
> >     Tegra186 and later.
> >    =20
> >     Acked-by: Stephen Boyd <sboyd@kernel.org>
> >     Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> There was already a bisection last Thursday which found this
> commit, and Thierry explained that it works in linux-next thanks
> to other patches.  I guess those patches are not going to be
> cherry-picked onto the clk-next branch, so this will keep failing
> until it's rebased.  Is that right?
>=20
> If so, I can turn off bisections on clk-next for now.  We need to
> have a way in KernelCI to tell that a commit has been fixed to
> cope with this kind of situation in general.
>=20

I guess so. It's disappointing that a bisection hole was introduced
though. I can possibly merge something onto clk-next from the Tegra tree
to make this go away but the bisection hole will always exist. Or we can
all wait a week and not care about this problem anymore.

