Return-Path: <linux-tegra+bounces-13014-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMmSD4JEvmlXLQMAu9opvQ
	(envelope-from <linux-tegra+bounces-13014-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 08:10:58 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F092E3EC4
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 08:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAF0930107F5
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 07:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F7B33D6C1;
	Sat, 21 Mar 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJl4CAX7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709A317166
	for <linux-tegra@vger.kernel.org>; Sat, 21 Mar 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774077054; cv=none; b=rx/OrAMZkICdDyKdnQwbhCkxZEqzXXMd9puBJJ8fwW0//3nPX+FVVVojVEv1am5u0bRef/J7EFLgCQJ40uDcoGX1mA/UuPfuudqreKKri76Fy9Neh7EL2oJKmBScQZI7G25kFlYS9Hn19Pz99/EAoEoXbDVWnMlzMIJJmxS4uQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774077054; c=relaxed/simple;
	bh=VLEJtZ8y+Cfj36ZhZc/0uHi8isnrxUstNAtXT4ZWuGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtnXAdw1a+oJ+f4h/infeImeFQsjeq4fbobu+tTwTJfYagtLooGOT5a3VXK4HSUxuXOgr4bre3A56mBeuddJ+7010w+gpfz1vYUFBHH3bHb+TdcjnmjbR/VB78JGv9e84Sdd+fM7t+1Kawap2BcnD1HoHsaWH23gRzRkntZXdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJl4CAX7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D84BC2BCB1
	for <linux-tegra@vger.kernel.org>; Sat, 21 Mar 2026 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774077054;
	bh=VLEJtZ8y+Cfj36ZhZc/0uHi8isnrxUstNAtXT4ZWuGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hJl4CAX7eqHpDEP0GEGO3b1xlV13u0xNsBY8ImEPfwlYdmr5RsQya/njCxYD8v7dZ
	 AFManZ870lQHy320HwxajcumlB2s6bTHTuJxqRWpfZHP8gk7wg1vNcuWat+DI46gXp
	 gPHCZaWKkC4dF70yOEx4oOyQ4zdSPhjk+yFFiLjh1ls8jA/jszHLwjZJ2M6SvQhEq6
	 NjUnWW5D5zyQAf3DOGvryHoOV9fM0c/nHFj5oahHNrbGyIbUt1rLuuFC51Zzh4h4AR
	 NbhR+mAs1/DWT1Jl70b/7cXoKaAFEPus8aKf8KQvROrftIYWpHPRMF9CCJp3m3vVFc
	 axNANYrG03MYA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40427db1300so1375853fac.0
        for <linux-tegra@vger.kernel.org>; Sat, 21 Mar 2026 00:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuPbVJp58bE3qjToWD+TPuaDkXp4tFBgQ0fDySrYFJxp2HZJ0viEo89IHB26+EDgk/+ijTQCxVbN0K6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyleCc+MBN0dObqqOCes7iXS87bSqMljrqQDvFz4yn2M5Y6cbLZ
	Elto/2506hIWSC0Pl8IRT8BZ2/kflF6ovwlO64o/uNvJDM34mUIiUBfIp0DofiLj15VHrBHljOD
	bsnGzjRIF/bOOE+uHv2V5CEgjaSwUreU=
X-Received: by 2002:a05:6870:2490:b0:3eb:7a44:744c with SMTP id
 586e51a60fabf-41c10fdac36mr3665173fac.21.1774077053488; Sat, 21 Mar 2026
 00:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185423.77786-1-clamor95@gmail.com> <20260126185423.77786-2-clamor95@gmail.com>
 <4b98421a-9e64-48cb-9726-ff34a5b9cc76@gmail.com> <CAJ0PZbS6JhPOMNP3fB4biiu3b32jF-A6AMQ6M7usOEG0B88JJw@mail.gmail.com>
In-Reply-To: <CAJ0PZbS6JhPOMNP3fB4biiu3b32jF-A6AMQ6M7usOEG0B88JJw@mail.gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sat, 21 Mar 2026 16:10:16 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3X9ffx1qMDw+POqWDJFG+mL=eNQh5-gfyPAKQscduEUA@mail.gmail.com>
X-Gm-Features: AaiRm52Ol0OKLRbXVbXvPTn5wdvpUVGdkRzWnXIv0kuse-shw1ZE4kHrX4cAt-Q
Message-ID: <CAGTfZH3X9ffx1qMDw+POqWDJFG+mL=eNQh5-gfyPAKQscduEUA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] devfreq: tegra30-devfreq: add support for Tegra114
To: myungjoo.ham@gmail.com
Cc: Dmitry Osipenko <digetx@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13014-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chanwoo@kernel.org,linux-tegra@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 98F092E3EC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I'm sorry for late reply.

Applied it. Thanks.

On Sun, Mar 8, 2026 at 5:02=E2=80=AFPM MyungJoo Ham <myungjoo.ham@samsung.c=
om> wrote:
>
> 2026=EB=85=84 3=EC=9B=94 3=EC=9D=BC (=ED=99=94) AM 8:24, Dmitry Osipenko =
<digetx@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > 26.01.2026 21:54, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > Lets add Tegra114 support to activity monitor device as a preparation=
 to
> > > upcoming EMC controller support.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > >  drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
> > >  1 file changed, 12 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegr=
a30-devfreq.c
> > > index 8ea5b482bfb3..fa83480a923f 100644
> > > --- a/drivers/devfreq/tegra30-devfreq.c
> > > +++ b/drivers/devfreq/tegra30-devfreq.c
> > > @@ -963,16 +963,22 @@ static int tegra_devfreq_probe(struct platform_=
device *pdev)
> > >       return 0;
> > >  }
> > >
> > > +/*
> > > + * The activity counter is incremented every 256 memory transactions=
. However,
> > > + * the number of clock cycles required for each transaction varies a=
cross
> > > + * different SoC generations. For instance, a single transaction tak=
es 2 EMC
> > > + * clocks on Tegra30, 1 EMC clock on Tegra114, and 4 EMC clocks on T=
egra124.
> > > + */
> > >  static const struct tegra_devfreq_soc_data tegra124_soc =3D {
> > >       .configs =3D tegra124_device_configs,
> > > -
> > > -     /*
> > > -      * Activity counter is incremented every 256 memory transaction=
s,
> > > -      * and each transaction takes 4 EMC clocks.
> > > -      */
> > >       .count_weight =3D 4 * 256,
> > >  };
> > >
> > > +static const struct tegra_devfreq_soc_data tegra114_soc =3D {
> > > +     .configs =3D tegra124_device_configs,
> > > +     .count_weight =3D 256,
> > > +};
> > > +
> > >  static const struct tegra_devfreq_soc_data tegra30_soc =3D {
> > >       .configs =3D tegra30_device_configs,
> > >       .count_weight =3D 2 * 256,
> > > @@ -980,6 +986,7 @@ static const struct tegra_devfreq_soc_data tegra3=
0_soc =3D {
> > >
> > >  static const struct of_device_id tegra_devfreq_of_match[] =3D {
> > >       { .compatible =3D "nvidia,tegra30-actmon",  .data =3D &tegra30_=
soc, },
> > > +     { .compatible =3D "nvidia,tegra114-actmon", .data =3D &tegra114=
_soc, },
> > >       { .compatible =3D "nvidia,tegra124-actmon", .data =3D &tegra124=
_soc, },
> > >       { },
> > >  };
> >
> > Acked-by: Dmitry Osipenko <digetx@gmail.com>
>
> Acked-by: MyungJoo Ham <myungjoo.ham@gmail.com>
>
> --
> MyungJoo Ham, Ph.D.
> Samsung Electronics
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

