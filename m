Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0168122FED5
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jul 2020 03:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgG1BVb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jul 2020 21:21:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:33652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgG1BVa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jul 2020 21:21:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B66220809;
        Tue, 28 Jul 2020 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595899290;
        bh=TP0DIGZeyxZ5cg4Nue/9kKwQH8LAa0PI7lvigJ7p4tw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TDCp6gcHm+cOLcSzNOABMln2PKCYX5v11eDZKS2SNDpUPRghKbQKsOJNU9A03T/u0
         C860WCHScGSbqx7iDQs91/yLFHtsdLJwecfhGSkbpC+H/gL3lXtYFlI28w18i/B5QE
         fsYIgagBQBydU1W5N9yL9nCgWKALcVw4yRGgzRa4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709172057.13951-1-digetx@gmail.com>
References: <20200709172057.13951-1-digetx@gmail.com>
Subject: Re: [PATCH v4] clk: tegra: pll: Improve PLLM enable-state detection
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 27 Jul 2020 18:21:29 -0700
Message-ID: <159589928947.1360974.2291551893182994686@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-07-09 10:20:57)
> Power Management Controller (PMC) can override the PLLM clock settings,
> including the enable-state. Although PMC could only act as a second level
> gate, meaning that PLLM needs to be enabled by the Clock and Reset
> Controller (CaR) anyways if we want it to be enabled. Hence, when PLLM is
> overridden by PMC, it needs to be enabled by CaR and ungated by PMC in
> order to be functional. Please note that this patch doesn't fix any known
> problem, and thus, it's merely a minor improvement.
>=20
> Link: https://lore.kernel.org/linux-arm-kernel/20191210120909.GA2703785@u=
lmo/T/
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
