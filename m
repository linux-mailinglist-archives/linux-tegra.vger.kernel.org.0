Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11931129EBA
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Dec 2019 09:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfLXIBM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Dec 2019 03:01:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:50206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbfLXIBM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Dec 2019 03:01:12 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DBA9206CB;
        Tue, 24 Dec 2019 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577174471;
        bh=cuU8VKQE/3GVn78/4tq+dy3/V6uyV+wDpfpi8bZNkN4=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=PRrjIS7bvDONnoBb1pThfk4Weg5ZjMpYzVpGCsw/JbAryqNg1ki1RymGV2bl/MuDO
         QXfIXPdknyp6DPOcmuHDkG9YPfrFC9Jr5PQeH9krr8WWI0pLepQKyI0hwaFXoa0Bxc
         DG9KxwTw7gAQgckr76dPP5+6DXc/8FT4kKlwc9Dw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210020512.6088-1-digetx@gmail.com>
References: <20191210020512.6088-1-digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Fix double-free in tegra_clk_init()
User-Agent: alot/0.8.1
Date:   Tue, 24 Dec 2019 00:01:10 -0800
Message-Id: <20191224080111.4DBA9206CB@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-12-09 18:05:12)
> It's unlikely to happen in practice ever, but makes static checkers happy.
>=20
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra=
210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-fixes

