Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56C07F1F21
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Nov 2023 22:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjKTVXj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Nov 2023 16:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjKTVXj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Nov 2023 16:23:39 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E60D2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Nov 2023 13:23:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5Bjr-0004El-AH; Mon, 20 Nov 2023 22:23:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5Bjq-00AR9R-B5; Mon, 20 Nov 2023 22:23:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5Bjq-004dnV-1t; Mon, 20 Nov 2023 22:23:26 +0100
Date:   Mon, 20 Nov 2023 22:23:25 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-tegra@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: Convert to platform remove
 callback returning void
Message-ID: <20231120212325.4wbjoys6ez73gtfq@pengutronix.de>
References: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mz5q3snxap7iktcd"
Content-Disposition: inline
In-Reply-To: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mz5q3snxap7iktcd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 26, 2023 at 11:47:40PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert the three tegra-video drivers from always returning
> zero in the remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

who feels responsible to pick up this patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mz5q3snxap7iktcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVbzk0ACgkQj4D7WH0S
/k7r5wf8CX9mMyqwzyJ6tpB5hPAG+N8GGNa/IoiYHFr08gcvADUL3t1smIjE85W1
u3t4a2ZC1tv6u6xDjLAuiz8XPZONpPYaXuNBBHHJpM9jjt4yGB02vI+GhKDyRQ2n
YoZdAc88NK6YgYT6AMynNTXI09N0GL5V0H1bZj4hNxQZIgbawhqi1dyOW4U7vWXz
y/TXPuCjDBa9hnPDYHTx37S8ShwXyZ4MK3wiBMVIa4WftBxOJBWP47RPAaOQ8LNq
aCdH8AcSRoY6/3jmemxjBGfjdtzUl0xYOb6XLD4LoPGLk24L/VKbQz1h5DPa1JAv
Hc9dKbIEvkS4a0mvzjbw4sTkq1viCw==
=21Dw
-----END PGP SIGNATURE-----

--mz5q3snxap7iktcd--
