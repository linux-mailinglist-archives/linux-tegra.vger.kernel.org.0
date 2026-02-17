Return-Path: <linux-tegra+bounces-11999-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id A6w+ELxClGkgBwIAu9opvQ
	(envelope-from <linux-tegra+bounces-11999-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 11:28:12 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E370714AD8B
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 11:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B65DD301C125
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 10:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587B320CCF;
	Tue, 17 Feb 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTsBRcNu"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921292FF148;
	Tue, 17 Feb 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324089; cv=none; b=CYnKibfUZt+q7gLiG1BjNnfoplDM2NXOT4DdVY1Lbmc+weeL/g+vQaBnMGZyPy70ZY0Xdc4Uz1pZfNEfmGQWYHDLv3WvWOoH4s7i70v8Ed9+SMJB2JDrWZv5gJTegWzsHM7B0C4KZ8BXyudyzyEy0yEb58zjxSYL/ngYrM/IoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324089; c=relaxed/simple;
	bh=pbYjiOtMX9688Dp1pZW0dqcumt75C2rjIPKHzOWyeV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4Qzj8Z/+4qI7VLkNVPg0+dc/ehKeUeMrMQwqo2W1QK7n0I2mb3mh5jOi5k/c4YETeO1I/5A1G+iYGb6//GeUBSBoK791SVm6hpGQ53PgDMamqg1GAWO/eyyXkhKR96w2S4/Mn8quDQGHYN7Qjr2CbEfB8b8kfPjSsYn3Ln+Vbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTsBRcNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C777DC4CEF7;
	Tue, 17 Feb 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771324089;
	bh=pbYjiOtMX9688Dp1pZW0dqcumt75C2rjIPKHzOWyeV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTsBRcNu6LOSqtCjpO0lht8k7K5rMIjhlEELOyVUAapB4a7QFSAILDm7KOfipzdnh
	 +RZuXTMuUBjhNd4AEEOcLVt+uuiqOhoAPmwHaeYkkWT7IPwoJir0cqVTIvVj2Xmp0o
	 Xj8WtYzX2QULdgbXZg9IgjXCwr7HxwwozfjFW3TVDeErn10spDcrcuLvosKSATi5Z8
	 yqb2+hOEaxkcChkxssajTMPdYMD73OshnLTtCT4HcoDaJmxLF2ufsR6kwvw/wuWZ8Y
	 vHuIKkS8sSN/9NtEEOcgrl+xchsKcdJH6At7/fCQs/Inmi+bOXCXKEV7oQHlg37bch
	 hXLCYjv5PTXGw==
Date: Tue, 17 Feb 2026 11:28:06 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Message-ID: <aZRCamxP5JfS8OsO@orome>
References: <20251204060627.4727-1-clamor95@gmail.com>
 <20251204060627.4727-4-clamor95@gmail.com>
 <10344542.CDJkKcVGEf@senjougahara>
 <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d45z6imglue7rq6i"
Content-Disposition: inline
In-Reply-To: <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11999-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,linux.intel.com,nvidia.com,kernel.org,suse.de,ffwll.ch,chromium.org,ravnborg.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: E370714AD8B
X-Rspamd-Action: no action


--d45z6imglue7rq6i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
MIME-Version: 1.0

On Sun, Feb 15, 2026 at 09:20:27AM +0200, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:15 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Adjust panel node in Tegra Note 7 according to the updated schema.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
> > >  1 file changed, 7 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boo=
t/dts/nvidia/tegra114-tn7.dts
> > > index bfbdb345575a..75fbafb4a872 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > > +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > > @@ -43,7 +43,9 @@ panel@0 {
> > >                               compatible =3D "lg,ld070wx3-sl01";
> > >                               reg =3D <0>;
> > >
> > > -                             power-supply =3D <&vdd_lcd>;
> > > +                             vdd-supply =3D <&avdd_lcd>;
> > > +                             vcc-supply =3D <&dvdd_lcd>;
> > > +
> > >                               backlight =3D <&backlight>;
> > >                       };
> > >               };
> > > @@ -101,11 +103,10 @@ smps45 {
> > >                                               regulator-boot-on;
> > >                                       };
> > >
> > > -                                     smps6 {
> > > +                                     avdd_lcd: smps6 {
> > >                                               regulator-name =3D "va-=
lcd-hv";
> > > -                                             regulator-min-microvolt=
 =3D <3000000>;
> > > -                                             regulator-max-microvolt=
 =3D <3000000>;
> > > -                                             regulator-always-on;
> > > +                                             regulator-min-microvolt=
 =3D <3160000>;
> > > +                                             regulator-max-microvolt=
 =3D <3160000>;
> > >                                               regulator-boot-on;
> > >                                       };
> > >
> > > @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
> > >               regulator-boot-on;
> > >       };
> > >
> > > -     vdd_lcd: regulator-lcd {
> > > +     dvdd_lcd: regulator-lcd {
> > >               compatible =3D "regulator-fixed";
> > >               regulator-name =3D "VD_LCD_1V8";
> > >               regulator-min-microvolt =3D <1800000>;
> > >
> >
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> >
>=20
> Hi Thierry!
>=20
> This is the only remaining patch from the original series. May you
> please pick it or should I resend it?

No need to resend. I can pick it up, but it won't show up in linux-next
until after the merge window closes.

Thierry

--d45z6imglue7rq6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUQrMACgkQ3SOs138+
s6FkCg//basYg9JRZ2mAhvsgQVy1h12KGHaVU3i+8sYZnMkCC+mXKCTQdVOnn1Q9
4HF9a1U3QMXKWJ/AZuh+fOI4zwzZmWdC4LL5NKE6LI5mN0IlMOsn+MYuxvFiUcUD
vdUQHxbbMci8G2sgfOWdxbWaKQc7GR2mEdwAOtmKC66+xYXpVLGULNazOxevJ3Yo
xqsiq/nfX/jbTzD7Ie9EdtL75g2kxuEPu7EQHEwevlype7yU55D3fwDK9VoW5A6n
HMnwX8hI6ExtDbVyBXNSAMnpnVB1nbdUAPLDeDl1Qmymrd3R6egi7BxrdFoDQ1GP
AMzLrmRruSnrqGsAZ5RUP6nTjgmQxRMX9FbZJyKUeIDB0yLbrkblsGo7Mme9X5ue
6sjsz635IYzD1/TJb/KY008TX+I8yjO5oV03PEQn3C0aFOAke6mbyR+JDylpORDx
OMhO+LzCOnzZiLBtm4hAa69gJiOMHAYMhGu4Ks3Xzynv0gew6bDSJ+03oq95reWt
pSrHjFNIPOKFa7QumHorUlU0BCyBMQ+cCmRN++CZC9DQWCw2Ri4WXhhTKXklkqBg
XVZvMsDQ6kzfjdw4qa/w9MXKt9ZEeoazr6GYFlmJCkjTB7kZw4ALu557kvdYh+vH
+9l30YAv0ZN05R8dhTYpSIyQV8YmkJa8mNRzt/xtCmSm+AzVUQY=
=FWUM
-----END PGP SIGNATURE-----

--d45z6imglue7rq6i--

