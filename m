Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFFF487C0
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 17:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbfFQPqg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 11:46:36 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60368 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbfFQPqg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 11:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9Emq1pboyPe/UZLHCXOnK/ar1hwcXo4FTF0JW91caew=; b=Y3+H7PZARZ9/sYRXYFuCKBaf5
        NEt30hHVrxwBvX0I3oIPRZcceTaSTRoVntTTajxc3V+LSezrhmNt1Ka7ENceU8QW+VJObuvw2oIjK
        Vj+JBN+Q4OhT3N3NTQxRF21A0vn13bhtoQ6q1OcDmnfTSXbvZqA5bPPsQtGkqf3Njx3g4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hctq4-00024B-Pd; Mon, 17 Jun 2019 15:46:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 596F6440046; Mon, 17 Jun 2019 16:46:32 +0100 (BST)
Date:   Mon, 17 Jun 2019 16:46:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] soc/tegra: regulators: Add regulators coupler for
 Tegra20
Message-ID: <20190617154632.GB5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="039oG8jMepJcyEBX"
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-8-digetx@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--039oG8jMepJcyEBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 02:59:03AM +0300, Dmitry Osipenko wrote:

> +config SOC_TEGRA20_VOLTAGE_COUPLER
> +	bool "Voltage scaling support for Tegra20 SoC's"

SoCs

> +	depends on ARCH_TEGRA_2x_SOC

Can we have an || COMPILE_TEST here please?

> +++ b/drivers/soc/tegra/regulators-tegra20.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Voltage regulators coupling resolver for NVIDIA Tegra20
> + *
> + * Copyright (C) 2019 GRATE-DRIVER project

Please make the entire comment a C++ one so things look more
intentional.

--039oG8jMepJcyEBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HtdcACgkQJNaLcl1U
h9B0cgf+PFAOtZrfNkd5ty3QOvOIs+A0kjwXoqrJYQMgIIObO7EI9+RipxKuoDae
UUlOrx4BRvIRGTDJWwvHFNF2ADWvfMPCtdqX67ZA3drCWiPgEGUIJHbIiEXPIt19
IYBhcnbKGPfpeRTtOWXGfwwOpA+tWgluz5bvmKPLDYkZ8m8MuSkxy4YIWuXEk5+x
Cgy9CvTfWlk2kZm+a0MocWRlKbTLy7Y499xLXDwBTvSC94Ci0Jp8BGmKR7oJwu45
cbgEnnXUvOURfP+vhjuh5id+SNXUqFz1tKI9aoXKef/t6EIkvlDiBcDZ+40MSbyD
SG+VI65FbmXV73iCH+VAQG0Jv+6wjA==
=eKZo
-----END PGP SIGNATURE-----

--039oG8jMepJcyEBX--
