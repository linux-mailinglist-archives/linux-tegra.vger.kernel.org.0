Return-Path: <linux-tegra+bounces-14119-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKqdCgrs82lg8wEAu9opvQ
	(envelope-from <linux-tegra+bounces-14119-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 01 May 2026 01:55:54 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB64A904A
	for <lists+linux-tegra@lfdr.de>; Fri, 01 May 2026 01:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5609130166DC
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 23:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5324C3DB625;
	Thu, 30 Apr 2026 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbBRMoK8"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B163DB627
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593285; cv=none; b=E2+NckMZ41P3fUrAEFpWds4EmKYJWi+IyA31VrAOJkzQkzC9AEXxOM4YJv0/wvwwOIQmmOvs8Psuq4h3cpCFrYqdrnYSrFxCkpeNYcvFMo+4vYhsNcxG+5vQEUFcHQlFDp2rC1r6ArcwbFe4ueDrpn1wIHk5sxISsB+nxuq28r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593285; c=relaxed/simple;
	bh=E5GkC4G7rtGBz2MILCU8/hEbtGwGymi8oc5Ct4p7lLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDa1s/m4moaWjf0pYhbUkJ92PwFcIaARaWmGxnSNqDvfEWcA+IHDSftbWokf/kwtvyG+xPplClFAGvvn+r31Vh31zYpOImgtadpkeI6ZXafo6Dim5iSjbLfP667evfrRTWUoe0cVdqXL+17bT1295PSR2RDg3HUt1I3+TCiafFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JbBRMoK8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba922426c5cso266047666b.3
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593282; x=1778198082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=JbBRMoK82UA6lkh1qIVCEcIyzIL5yv6sqJQvgB8tGR+pm6zNvREotpEuwvh5/8RwN/
         uKk5/okyippAVJEpn5PU4YgQ3vXtLXRFwbfLogm9DTP94A5v/8QUbtsJq74xaRbfYqfA
         7RtfQfESg0r8s0/dyNDe/GvsGQDjfBatJYsrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593282; x=1778198082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=ebYSDhLRyvjf+sLRH0QVRe3/m+fFSh0Fc73BhOAf/ONr4CzHX9hN0Bijj7xqDkphzJ
         iuk+Pc0pr7OvAOSvmtvaiXZzuEUT3QqD8q4x/S0Ed8mAFF3pkfwOSNQ53wFZkcGN5Tkw
         LpVGz4o+BcQ8nbaC2uEfeAUxLiDvgsv7gsqprgvX9fXGqeBOG4CQgFu9ZX7tNLZPfJwj
         R181y2S45WJLn5w9PtQWNWrMcT9OGX7j1DPFw3Chvpp2+BE+8Z272sMyzaMTN/kUjCKK
         L9UmlN7+Ek90R+a+7NDuEoWUueljwsVtA6oFti1tCWAdTfshabIQbckLbae8BXajR1dU
         4BpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9647r+eqNt0sofgrHRBs37OVE+3zR5jz/NqH05P6LGQl39IvmJk/hhdiCjjafdmQz5nTO4CN36fvpzdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAwdU/4qOLI8FrAZ2PpOsro9AbR5BWzyigEsaLsRSSs8Bt8SR
	2g3bYzAruC4U8lRjixry5QuEOSrTbV1QWC0QfwzanAQLLTGmt76xXKdlhh4AaBDsv/niowNVTde
	e2jtINw==
X-Gm-Gg: AeBDiet32hic78bQR6icYVHAHX+5do+hkroxtJcRG0nTaIHSLd5OosgM38iraMQyivz
	dH2bgdHIHwQ3S1LB3SyPuknInYlwu2RCDvCRnC3vGaNi/pSxuX1wjkyKXZ1EafbSyv/LRIz81mr
	UT+jfGPrJNPx7K//DV+8XFXlCiSwybMGNjUKnTElX09gQNEHWil3JEwbsE4Xk4ztzcfxe/GFZgE
	icKKz+xWb1XLXV2NlWjjG+K/BNhYRrIbJDuXlQV5QyFq0gSKX/hfRhEzl9po6+NEC3DZqjcA/8h
	446OyMjYVqRMXcYZ+DyKv7rifRb9SHxCNLQNTtM1Gm8XK6ezGUr5sNF2tOlBzBsfa8cjziZ6sSK
	49AvSbdYDqRa4oTAztMWz+YNKqVzOp5/Czaa4DJ4GLPlB9dP3o0WUO40e9gaZaiV95ucfrY3M6K
	xycPicji19oboAgdKTLib5iFYe8wR2Rpu2lXEcAEDWkUZLer72eswBa1pWjg1t2BRlnDDYMT80N
	tJ18GKTL68=
X-Received: by 2002:a17:906:fe02:b0:ba7:d65f:3b59 with SMTP id a640c23a62f3a-bbac46d674fmr330950366b.6.1777593282035;
        Thu, 30 Apr 2026 16:54:42 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d990sm49053366b.22.2026.04.30.16.54.41
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfce3a195so785590f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/cGB9PWcjh8QUiI8vfJp/41KqYyWxSDe+XuG8kWCnieCDLMJLn8AYLrb/qd2vx9pkX0bLfcPvQjfZK7w==@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 77FB64A904A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14119-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,chromium.org,samsung.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

