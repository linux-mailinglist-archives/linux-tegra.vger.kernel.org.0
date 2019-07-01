Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F10455C17
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 01:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfFYXNS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 19:13:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:54980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfFYXNS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 19:13:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C31A2086D;
        Tue, 25 Jun 2019 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561504397;
        bh=blBwB9t95l88PXacUsjo0XQpWD///s/Sycw5SGwpq7I=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=irXr9h++MxSRrponZpxkSzGV7d8XAgqZXsDL3PpQNef4i4hPIMbJttAzcEsFzWCPA
         nJqrqbZxice/Ulps9sWCTTKbTkMit+oUT8m9ee1jGm4nuqT13MJ/ydgSVm+nUFkuH6
         e0LqqIJkV7HdtuvQWtZzo2o9czX0QmJTsjjWugvA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190613161225.2531-2-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com> <20190613161225.2531-2-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: tegra: Warn if an enabled PLL is in IDDQ
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:13:16 -0700
Message-Id: <20190625231317.7C31A2086D@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2019-06-13 09:12:24)
> From: Thierry Reding <treding@nvidia.com>
>=20
> A PLL in IDDQ doesn't work, whether it's enabled or not. This is not a
> configuration that makes sense, so warn about it.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

