Return-Path: <linux-tegra+bounces-14665-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP6WHpxvFWpbVAcAu9opvQ
	(envelope-from <linux-tegra+bounces-14665-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 12:02:04 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D05D3DDD
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 12:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6537B306032C
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 09:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D773DA7EE;
	Tue, 26 May 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDJR4+ga"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3EE3D7D89
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789084; cv=none; b=XfM5vlood1oKOFXoAo7W1uN2g/kMYueAm5MBmnAFS/k0xzzPjD6r5kALjYUGYaZUkqk/3ynx9H3X88vQhL9VqcsPR91wE6t3xFNHngnMH14MrcXjtq7ECnsdrTjNbeV2tEOjwNjhiEnFoSVAen0GI1HqS/8SYSvQNXKJIg9VqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789084; c=relaxed/simple;
	bh=iySBZO3gZGsmPPE7G/Lxu66GNzdQ4kIBkhoEeoFyAn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPnbtQ/Mz8YOmUE7pjyvz17+kvg561Doeyf51rsBpL4BdmsolCofbhnakA/ypo90KLOClw029nW7j1Z3ryE57jlbNMDMwyT/7z7Nsoa0wSZuNvfW3Zxz4qAEb45tci8qhoHCbyTHWpuraRM+68b/5WFd1baU9RSJ1WtgKtKRoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDJR4+ga; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C251F00A3D
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789082;
	bh=ItILktCjSqBdLFQDvgGDSe/Q3g3jKUXXzbWuBU60bu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TDJR4+gazt1aWtvKoEMFu+ZBsbDiNZJqClY7+BBQ0pPCaMomUOFVRh3S57m/G5s+N
	 Ggt0jDzT91L+U3exqNd/+X8rxB+tYRfszYpjstL16DZ/bl4+mRYWmsX3Ci7H6XgfMS
	 LlbbcjmfnPM8EbIGqNOEtBSrF8K0j6uOfbtYKA9voTJ4U+MvItgWLOxkxh/feDHyB4
	 1DOQOv9+4M9v37pNfIFv4n2NIDNR2aul8aHSgXo8B2VFy5A75eHNSPnweYTZXr6sqb
	 aNOrAzSsVZ9makkYcvv2Pj0z1dWmzMOi6yAwmeiaHuVjU9LMMVpINNDsyZ1Vwuki1d
	 /q3sLsY45buJg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a40502e63bso10332033e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 02:51:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SN0SvhgRbYil4yMxxWiItfoP9VdZTmxrVLydhke6CznXOs5qa1NjDm93da/vIsUMGEs8kueVxoSBZjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLI35yxIYIeU6QmG09j2Oc7oVpjvb010EvBARuzAoIStv6YouQ
	Y5Zn1ha6FRNIVJ/xH9U4HLYYllg6cIo3fRTBsZbITFS/ZIf6Dz0wou4r8Wi+emsCi14luRQWGOw
	rAQ8tpXm+eVYx53nN1o3yRJdsMB7wU+r7pPSLyRiJUQ==
X-Received: by 2002:a05:6512:114c:b0:5a8:ee4b:7011 with SMTP id
 2adb3069b0e04-5aa323707efmr6009063e87.17.1779789081566; Tue, 26 May 2026
 02:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
In-Reply-To: <20260523085102.51000-2-clamor95@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:51:09 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kg_SzPxJUQZgrJt30L-V21Z1ehA4lpewoLD8xyp6l37gbtbsdMvoBpOQ4
Message-ID: <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14665-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-tegra@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F33D05D3DDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> Document the Tegra modem pwseq used by various devices based on the Nvidi=
a
> Tegra SoC, describing its usage. The power sequence provides interaction
> between the modem and SoC-specific interface configurations.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

...

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    pwrseq-modem {
> +        compatible =3D "nvidia,tegra-modem-pwrseq";
> +
> +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> +        power-supply =3D <&vdd_3v3_vbat>;
> +
> +        nvidia,usb-bus =3D <&usb2>;
> +    };
> --
> 2.51.0
>

I assume there's no such component as the tegra modem *pwrseq*? What
is the relationship between this node and the "infineon,xmm6260"
compatible node?

Bart

