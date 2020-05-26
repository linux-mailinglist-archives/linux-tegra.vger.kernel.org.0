Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E5E1D0092
	for <lists+linux-tegra@lfdr.de>; Tue, 12 May 2020 23:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731445AbgELVP5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 May 2020 17:15:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:58722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731328AbgELVP4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 May 2020 17:15:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A8CE205C9;
        Tue, 12 May 2020 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589318156;
        bh=XvZxm2hSXPiNKLKl7CGs7GarLHnfumwwmYvUniaBcoY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WJSxCSCVAFBsMybFbf4JhjZeO2TdLfSeryIJ4twq+grn3AGotJk5W9yigORoZwQJh
         LlKoKNPIb3TtWIGlZhXU07Hfx+BYtNo+IPpBM1/R6hu/dSZFDs5N+8TtO19uoDvXky
         sljOq1NfUUyaoFdSGyJTziv/uJm3oEVmVZopkFyk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200506123236.7463-3-geert+renesas@glider.be>
References: <20200506123236.7463-1-geert+renesas@glider.be> <20200506123236.7463-3-geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] memory: tegra: Drop <linux/clk-provider.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 12 May 2020 14:15:55 -0700
Message-ID: <158931815547.215346.2885341861306432686@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-06 05:32:36)
> The Tegra EMC scaling support code is not a clock provider, but merely a
> clock consumer, and thus does not need to include
> <linux/clk-provider.h>.
>=20
> Fixes: ec37a9a17afbfad5 ("memory: tegra: Add EMC scaling support code for=
 Tegra210")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
