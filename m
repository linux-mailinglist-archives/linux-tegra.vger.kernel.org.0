Return-Path: <linux-tegra+bounces-14671-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNRoDZOTFWpSWgcAu9opvQ
	(envelope-from <linux-tegra+bounces-14671-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 14:35:31 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C65D59E9
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 14:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77D223027949
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 12:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29E3F9F32;
	Tue, 26 May 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwVpsN6P"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D081282F1D
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798904; cv=none; b=Gf1Cln9InB2VHQQmddV4cEpTrHWwKiFOX9XKPYgEPc+AGccLEMS/QLQIAFgGaYlfCANW/3gbUAyCVzvEjcUMozpxtzhG3sm8TOMrOfjHkLzrQ6N/NqbmUokl2pDqvUv2e0+nYMcfTxDiSEPUspz+i0VdBsoLnVWsNKUHnB+uoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798904; c=relaxed/simple;
	bh=jawOlGnnD26Ppp+JufdrTQn9Lmw7mrNyUF89gdMdb9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9TRVsAU/+7fMLbqnwCmzb8q2CgaqaehseKTw29NWOVJdrNXyZcWy0ngmgTkwprcTJEedt85mmM3TutIEXBr1PNV0buZlfxxQx3NBaZUOQXIS1MvrBZkDWo24ZDdIdC0uJMktJzWoXW/OYJ7Ijn/56dB4WLN8OGqPUugEztJgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwVpsN6P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9FA1F00A3D
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779798903;
	bh=jx8+h1I+icjwj5kn/NeTmz1laMq204QO0s7URIhHUtI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LwVpsN6P5UEzTeVt5QAJXNyIaW3bUzRSi9pyWqIQCau+pSgBlVl2c0A/uY1byxZ4U
	 lGfpwYaaxGMaOskeSHnMrKJuwuKbJ0vyczbks7yYqegBu8BfpI/m16r2Sqv2fEufFp
	 6Pyn+y+DhToXxl4O+wHYlypWvHpBShkloWAsNK9Kbl+p2qWq4iP6RfEeUcqgAxMv3O
	 eW3dkE0gK80ccpkU4UBYmeUSyg8SDCDToEhBULBI14cX63G/t7Hu1feBHfrZMfmYHM
	 LsXAB8WKzh4tZkeEPy1K2lcCPvc60NXeOTG5QbuVnNt7fm+3f8tXZfKHTMsm7zWTU7
	 LMM0+cUoNvDfA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so84194131fa.3
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 05:35:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nzrok1S2xJSdubkVga8TaABu+Ka5wBkY3T2t0nOEDuC8pJ6Ab1LIXegeBtsI8o0qldnj0mBDhEY98/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhs5sz9603vfQk8Kp9kKXmXLTl2C23c+orb7ptIXCV+IZdH6rr
	pLrBjKTxOK+D6WZJgLuaNKufB/DFWOyrclxw5DTebuKwKK38cEOD8QXG1SJxLOmnU00TSqNqBmO
	KaFzMamg9kM6oYXzZ6Lzy1aWe/MtpdUwmFvPD6RcXig==
X-Received: by 2002:a05:651c:541:b0:391:1570:b6c6 with SMTP id
 38308e7fff4ca-395d8c64fd3mr62255981fa.2.1779798901544; Tue, 26 May 2026
 05:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
 <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com> <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
In-Reply-To: <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 14:34:48 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
X-Gm-Features: AVHnY4KHpaK2guCMzD84efob-Fn_1e4ff05aeaWlnbgoKMEGNNeAbfQ9YXcn-6s
Message-ID: <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14671-lists,linux-tegra=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-tegra@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B43C65D59E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 2:29=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14=
:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, 26 May 2026 12:03:59 +0200, Svyatoslav Ryhel <clamor95@gmail.co=
m> said:
> > > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 12:51 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >>
> > >> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@=
gmail.com> wrote:
> > >> >
> > >> > Document the Tegra modem pwseq used by various devices based on th=
e Nvidia
> > >> > Tegra SoC, describing its usage. The power sequence provides inter=
action
> > >> > between the modem and SoC-specific interface configurations.
> > >> >
> > >> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >> > ---
> > >>
> > >> ...
> > >>
> > >> > +
> > >> > +examples:
> > >> > +  - |
> > >> > +    #include <dt-bindings/gpio/gpio.h>
> > >> > +
> > >> > +    pwrseq-modem {
> > >> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> > >> > +
> > >> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> > >> > +        power-supply =3D <&vdd_3v3_vbat>;
> > >> > +
> > >> > +        nvidia,usb-bus =3D <&usb2>;
> > >> > +    };
> > >> > --
> > >> > 2.51.0
> > >> >
> > >>
> > >> I assume there's no such component as the tegra modem *pwrseq*?
> > >
> > > Hardware component, I assume no.
> > >
> > >> What is the relationship between this node and the "infineon,xmm6260=
"
> > >> compatible node?
> > >>
> > >
> > > The xmm6260 has a phandle reference to it. Since there is consumer
> > > matching logic in the pwrseq driver I am leaning towards removing thi=
s
> > > node entirely. This patches is still in non-final stage and I would
> > > like to hear any opinions on the way to improving it.
> > >
> >
> > The node attached to the pwrseq provider device should represent a real
> > hardware component. Are the enable-gpios and power-supply lines connect=
ed
> > to the modem package?
>
> Yes, enable-gpio is connected to the modem and signals that USB is set
> and ready to work with the modem, while power-supply is an optional
> supply connected to the modem's vbus input.
>

The modem is a hard-wired USB device? Do you implement it as a
platform driver or a USB driver?

Is there a connector of any kind that could be used as the HW
component represented by the pwrseq device?

Bart

