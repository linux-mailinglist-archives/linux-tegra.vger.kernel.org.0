Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4BA1E210F
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2020 13:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731979AbgEZLk7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 26 May 2020 07:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731973AbgEZLk6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 May 2020 07:40:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92128C03E97E;
        Tue, 26 May 2020 04:40:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l5so17364818edn.7;
        Tue, 26 May 2020 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wgN5VWTUiDEWDfFSZEwK5UrjaFdTqsQ9EGT1fY+LLDM=;
        b=lPud/H9RYbONByKlYJnPcmoegAq7NXggnQy8LdHwIHOK+7jUB75uLFWq0LgSlKjwj0
         jKA169ht/LZhODzErb9FOivuLm0Zbo48Aph5D5n0cpcd7ULW4vzzHqa8WrcZMPSKHyX9
         lyI56onjsVIRUhzHb09lRfJhBm41t5HJfjgZsKMTq+PRTLKA5dvqFdZGY7vqFJytEN15
         QVz7TsmU7YavnUinDGGAJJlp+hKvljmRtzCAOvfrmqKhHwy8ODJYOdRmcpmIIUOPdEKU
         MTw+uFdUZ/zl3MHRBpmuJbNkkZLxi2cfeB5bejO19xDrxxPVNy7vypcSQcloZDGZ6ads
         fkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wgN5VWTUiDEWDfFSZEwK5UrjaFdTqsQ9EGT1fY+LLDM=;
        b=gzl3KCFuA42yP8vCfq8/fVrEIJOvQygb6x7RRvTHWYAIb+cQy/hXFyGKVPiTfUjDuj
         WC6phiRuRb8Q5Q628/qD474XhpEO/k+tjhVhK//Fnb22zG7TpHdsGYrn3LBTosS969xj
         1HGYlVg5a8gA8b/+rl/H/XZmxnFOhoh9m2mG9B0gmrSgw5cctMnYqCm4CvF7TGDLrqeX
         d0NRerHpdOeiS5HtsN4KtMoGZWEmzazSJKuKchYmESqtyjvOsvyCM6LSvAJveo8b5iuZ
         ZlutR6Xs/ClSrhs33W/Awb+iK9lQ1QEp4q5G1qTHsekABrl7Emomcqw7777duLhZNtVX
         U2WA==
X-Gm-Message-State: AOAM5327ZikLNVfe5e1fhnzKQaerH/rou0Cz34O2Sqho1r7pmM7hILCE
        fpjqiFgjB7+xeTcXYynXt0e1gcE5
X-Google-Smtp-Source: ABdhPJxCs0LUkycI69pIWCwArPu0e0y1R9SQWGBf8Wc9edk+Gkhh3T1KZWsKi5g+nSC9euiUR4dVoA==
X-Received: by 2002:a50:f09a:: with SMTP id v26mr19620985edl.343.1590493257270;
        Tue, 26 May 2020 04:40:57 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id r8sm6100255ejs.68.2020.05.26.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 04:40:56 -0700 (PDT)
Date:   Tue, 26 May 2020 13:40:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Message-ID: <20200526114054.GA2935745@ulmo>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
 <20200515145311.1580134-8-thierry.reding@gmail.com>
 <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 11:52:30PM +0200, Arnd Bergmann wrote:
> On Fri, May 15, 2020 at 4:53 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> >
> > ----------------------------------------------------------------
> > memory: tegra: Changes for v5.8-rc1
> >
> > Contains a few cleanup patches and an implementation to scale the EMC
> > frequency on Tegra210 systems.
>=20
> I don't mind taking the memory driver patches, but it seems odd that this
> pull request has so many drivers/clk changes but does not mention that
> in the pull request, and does not Cc the clk maintainers or include Acks
> from them.
>=20
> I would assume that the reason for this is that you have based
> the memory controller changes on a branch that was already
> accepted by the clk maintainers in to their tree, but when you do that
> please be more explicit so I know what is going on.

So historically there's often a lot of dependencies, either build-time
or runtime, between Tegra clock patches and other work. That's why we
ended up with this model where I collect Tegra clock patches in the
Tegra tree and it's not uncommon to end up with the clock branch being
a dependency of one of the other branches.

I did send this to Mike and Stephen about 1 1/2 weeks ago, but it does
not look like they've pulled it into the clk tree yet.

I typically highlight the dependencies in the pull request, but looks
like I forgot to do that this time around.

> Waiting for clarification before I can pull this.

Given the above, might be best to hold off on this for a bit until the
clock branch was pulled by Mike or Stephen.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7NAEEACgkQ3SOs138+
s6Fv6w/8Cu4dQWtsRKUDrg20jXHqNhVoKWh9ZIqXfZLZ6kbRuNF1Fov+dDUNJujN
QqPjGh5YyFb3pwIDXK+EKBnPMi4BIDm2khwlL1Y6IgiOpgssfMLdB0SLZRZdHDnf
dxvR2/yvNC6kjv7kDmc//1QuU+5k/JjmP6Mvqm5NsccJBNpsnlqzN5oMtZVJOYXo
TOLKcRg0iRwkBJeeL20Q0HgikZCRUpazlhX/6ec4dclFpi6IrVwCBwKMpas77nzf
cfW6IDba/sygJw5Xhcbj0Tk+aBTJ0OPmrwopAYunLO6vykjzlf9bYpbwesbJ3cbN
ra1yLxUPM0y0wdEmPpHxzUQrDnPvgDpn2N7wrQN0TFMWvoeII75kh2cB6nChVhaE
Lx2R/4TupCwMQjUOyULNRN+2y9cNdVoOb34Jl/nXwHD6XlWywZhJKEo5+jTSkG3e
dmaxZS1WfkrCHEAdRkXNNQTSBznXBu6+yiKEN4GQRvOeEHmSWSnT1cVChVh94KES
XRnAabAIne4kTqpS2gNugj1DrRytD1k2i2ZCsj/gVy8Qe/AY0rLmjXMSQOLFxdkO
z9BBuZSLpkOAVvfAFCXpkJFOF8VDd699oyppGOp3fJyqVGPC34qEmvXW6qHzyUFp
DaB2C2HMPOU3/fCn3QlSoSga8yJgBIXLj9l32h3eJ6eGTa3iZ5I=
=8dgG
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
