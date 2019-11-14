Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAD2FBC21
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Nov 2019 00:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfKMXDD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 13 Nov 2019 18:03:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:32908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbfKMXDD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Nov 2019 18:03:03 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 726AE206E3;
        Wed, 13 Nov 2019 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573686183;
        bh=DWcG9g07tw3M9huN94BEIUVN9ivCwtJITvLSKkiiuyE=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=SOC6qBd2cEUfb5+s6YU7eZCakm6+GOmE95FNDCaYeTPsvzu/5j1O3FrbsbDGEqoT6
         u0hjg0ZRsWu37cOMfuUxDxItmpds5ZLkPtPSw4FIhTvvzDsYhgfxFhs/vOqZZhHTIE
         VLgmxubTZDNysAtypoBxw2pyB3S/wTwlIIoPDBA8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191030004813.9187-1-digetx@gmail.com>
References: <20191030004813.9187-1-digetx@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 15:03:01 -0800
Message-Id: <20191113230303.726AE206E3@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-10-29 17:48:13)
> UART clock is divided using divisor values from DLM/DLL registers when
> enable-bit is unset in clk register and clk's divider configuration isn't
> taken onto account in this case. This doesn't cause any problems, but
> let's add a check for the divider's enable-bit state, for consistency.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Is this going to be picked up or should I just apply atop the tegra PR?

