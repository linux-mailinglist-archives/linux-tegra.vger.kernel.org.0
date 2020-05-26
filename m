Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9181D008C
	for <lists+linux-tegra@lfdr.de>; Tue, 12 May 2020 23:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731164AbgELVPw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 May 2020 17:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:58610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730200AbgELVPv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 May 2020 17:15:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E999205C9;
        Tue, 12 May 2020 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589318151;
        bh=UZ5NeKMCz+5HbweHT8/WJDTWgSKlAK45WYlgMgV8o1M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z7AwIOewlYecxAguRX3pTIF5hQYXnd9LieVNM7L1vWKyKRIlgm7O8eCAgpihpdQ6m
         u9z1LVH+rBLCMw3Z0V8m4sWajZji7J1xTcc/KeKLXvvc47nvq4CvjDbsn0ukl+/USU
         EnXJimWXTh6+f6asA23uxewQIQIOMr/PYZV+UJ9M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200506123236.7463-2-geert+renesas@glider.be>
References: <20200506123236.7463-1-geert+renesas@glider.be> <20200506123236.7463-2-geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] of: Make <linux/of_reserved_mem.h> self-contained
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
Date:   Tue, 12 May 2020 14:15:50 -0700
Message-ID: <158931815065.215346.3560274157495009646@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-06 05:32:35)
> <linux/of_reserved_mem.h> is not self-contained, as it uses
> _OF_DECLARE() to define RESERVEDMEM_OF_DECLARE(), but does not include
> <linux/of.h>.
>=20
> Fix this by adding the missing include.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
