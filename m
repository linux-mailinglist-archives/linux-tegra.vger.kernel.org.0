Return-Path: <linux-tegra+bounces-14259-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKDMOsMP/GlYKwAAu9opvQ
	(envelope-from <linux-tegra+bounces-14259-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 07 May 2026 06:06:27 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 599854E2C47
	for <lists+linux-tegra@lfdr.de>; Thu, 07 May 2026 06:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2FA3016C9E
	for <lists+linux-tegra@lfdr.de>; Thu,  7 May 2026 04:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696E531B100;
	Thu,  7 May 2026 04:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evlauorW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D22D0610
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126784; cv=pass; b=jvkIS88BMbulw4C8xjOULcanrrfElf4Rr5LdkJK/rDaGOh0L67eFxPq6t0Q+0AeL09rYE3avbrbtijV2fPskMgLH+4al6QU0FmaaNf28IoL2Pg2h+uSjJZ1hJadfJOnU8kd/wJkfaMT7L3ydBLtNQM1pp+Hjxa69Ji5zQsbJi4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126784; c=relaxed/simple;
	bh=b6w9augMLPsLNh/LhQPxos8yZHi0gFrreJXIMasULec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHqwr1KkKWe6U8l7YY+IdiaL7GUibYxhkZu0Fey6zW4ZLInnzZ9WORVr/kwK4MeTzvDRs3FuFD215v+QOrM1gUjUgDUP0IIg03WajZY2DslKG52iCrhlQPQv7FmuxZIbpBSu/xIWdBS9Qn3FUJDz2uWcO0X2xNMO6tA2tW8/Pi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evlauorW; arc=pass smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-39397d63804so3758141fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 21:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778126781; cv=none;
        d=google.com; s=arc-20240605;
        b=Eh/hoivrY7UAPKN3h6X5xxfvv7nXvo2vKk/02Szno2qAHzAauZe70qi/5jppPvOsX7
         ubpkY9wCFCMs3Ohl+xbxYGysa3+zzO3Enmfq8eLdQPdtBWVdWUhGPOTdu15ZmOceVPqd
         QpexOENpCseQQGXDu+8+AQYWRe4vb2UfggN/iy8vVguEE2rs9njjAAdyMUbZ4A/r6ASV
         DWf+k9/sqDNC1BZRRqGDpBNUJxvReni/uY2wi8pTpctwP6kZ3ayhhY0d8WcYwQxqInqA
         tk51Wievu/e0oXnSXkUa4Ecx2vjGNsjLN8TaWUiHLwx47atYhyzvImyuI9kCVkcr7izr
         tnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        fh=DgEDKJs9t8evixFbsJ1XEEia+z8XCThopEYTd3/habE=;
        b=e/q7zoa/7cLhuRWVCoa1q36vgglZYjWxGAQiOR0Bx34SrjbbIMwUa3GfkLN08Y4VvF
         ifSuIiIO/uECF4D9xCzbwHoVkTArZesP3Vk/MAF6WQ6CmgfaKNc3EVypyGT07JkO2x+V
         jGkVFsye641RyW7tV5Z2hxFlodnS9/zAyv71VzmpsTWsb/aAkDMhg3w2l34aa1btYeDK
         74gfLsIuFF5jmtuncoE9eS8bC5SV5CjzVY7obzcDS/PkyA9AzNrLZtHKYdpxCfmxPw5F
         AHw3sGpQaLwKYzDH691WhVfLxKzgN1R7iX9oxl93OzVXuM/Gh5dHsi5GUyNjhQo4OTZm
         JWeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778126781; x=1778731581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=evlauorWoXxSqDAShSUYH/bp6KMMfJEiuHuyedMSei/IJYiFduFZOUSYmS6mHWq8Pt
         5NuL/Cgg7exJZtrUHCw3+l7tlGo67S89MuAbnBFVAN/NzsErRQYyM583kft+IVKnIu2T
         zTS4I2ZlpVRP+BF2fu/3ABGJW1BwqRZHrmAxJ3fzAn2EQPTR7mKbYxJC6zBJQEWraAZF
         nFgaGI6fDOPELOVWZI40HlCnpzlHTSK3i8gqGHBjOWAm9lU4Ppl40hoJn6X+w7AbzV46
         mWod8vj4RLog0K1Rqn0BiIqYz6rQK4EcF9b/UOkC0etDbDdRKy6WpFKBTpCOWOr9AgmP
         LGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126781; x=1778731581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=Lprk7vE/DgotDqs8yILnH9rkxHAL1gZ2PsQ2NOOG+pQmgTIPaxhDmFMzCa3gGT2BtI
         DYXOQrrizJIxJbxzDM3FrHSi/TFz1gLBpN6f0PqaYc7ZN5TIbkiFmMLa1/N/XlMgSR26
         9m4DiWX1Te+EgniFBgFvrq5abICGoTuj4ir7sfDdOeUkLm7yj4Z/FVvaDBNupvUSCjtT
         eHLjR2jKZ5FrrJRjVavjTLJoASWMcmv3NUQ+CSV9yWVeifuoBDa4XPvdjm0/uWRPQu+F
         UrvzB6v4lfZlLtfOy8WHtpyjScLhdoaZa5J4XeGzbz+fBRPeUyWGpEqPzoMM7hcJbT8H
         5iZg==
X-Forwarded-Encrypted: i=1; AFNElJ9rT8sJoeOK15MTqzRmDddEhxPNp/y8p+SV6PUthw0V1/ZPp+TYnOozY+23VLcRb3QjTMzXSsrgF1rJtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5EGc3Z6m2DO0TFYamPj/kis9T/CqYj7OovVjQkv9DWNMQG4J
	1TOFNERhOvMbXzFg3/TZaDKMWhxIWtyTpE4NQ2Sm6kKQmGGV5F677F0LW9BcX/RP5B7dmnPGm0f
	rl3JhFPBqUV8Wiw3alVvpZP9UKyq/p90=
X-Gm-Gg: AeBDietOixHsVLdUsZzQ7e0GxdIXG3HzCNWFZQLBWESTqx8CjZmJ3MuitMuj7H5uh9A
	nOdIxt/Vpy7+R7hYGRuZqQv/NpUCSe97l/2JRVBV/3X3Zr1PA//KuXCOq71PWo051lbSti5MBKC
	cWP2cyoRkdbNrdZWpi1yfu/mRWJQm+JpxS9gR3ZfDSh1hnssRyTb62dS7eedfuKat3XumEPFrFP
	7jPg0tlLwngLwVXCzkEb4DA8GT9LITQgpKLn/kN/D/UuqW969dHDFtVUwUfcQLdbhCsBGoZF9TA
	vriBxlr4drPcwNtId3Nq3U9zQUU+DYcC+fkKj5c4um/N8NSi/uJx9an4CS31BxU=
X-Received: by 2002:a05:6512:158e:b0:5a8:6c1c:6b07 with SMTP id
 2adb3069b0e04-5a887ceb616mr2202272e87.39.1778126780810; Wed, 06 May 2026
 21:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com> <20260507022213.29290-2-dennylin0707@gmail.com>
In-Reply-To: <20260507022213.29290-2-dennylin0707@gmail.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Wed, 6 May 2026 21:06:09 -0700
X-Gm-Features: AVHnY4LXvZPpRwU04mfq25RExhckQg69jZwE6I3BvL2PBM_X4_gLx3vbBpb4Hmk
Message-ID: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 599854E2C47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14259-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,linaro.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

The media CI reports a missing Signed-off-by from Ricardo Ribalda,
but this patch was submitted directly by me and has not been handled
by any committer yet.

I believe this is a false positive.

Could you please confirm?

Thanks,
Hungyu

On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
>
> Returning 0 is not a valid fourcc either. This condition should
> never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> access and return a valid fallback format instead.
>
> Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver=
")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index f14cdc7b5211..456134a9e8cf 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi=
 *vi,
>  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>                                           unsigned int index)
>  {
> -       if (index >=3D vi->soc->nformats)
> -               return -EINVAL;
> +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> +               return vi->soc->video_formats[0].fourcc;
>
>         return vi->soc->video_formats[index].fourcc;
>  }
> --
> 2.34.1
>

