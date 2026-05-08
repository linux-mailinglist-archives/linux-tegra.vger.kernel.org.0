Return-Path: <linux-tegra+bounces-14315-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLiJBhvY/Wl2jgAAu9opvQ
	(envelope-from <linux-tegra+bounces-14315-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 14:33:31 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A24F6685
	for <lists+linux-tegra@lfdr.de>; Fri, 08 May 2026 14:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94F09301AEFA
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2026 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9473DCDB5;
	Fri,  8 May 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zd+7S/5F"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826F36682A;
	Fri,  8 May 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243605; cv=none; b=D7A/N/n6IS4BNpBCVwugVDfcSlNfIc130woXqQQtEs3dSbv++oArA8PnZrV6pNoFi6jZQqBBbpmFMoEhTfEmzi6dolXt/ORcGrICyW6V+IFyVuw9PLffzbiTKIPvNInh+162RHaZzv5agpg9PvJ4rk5qiaAamV7bK7mEKoS02+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243605; c=relaxed/simple;
	bh=qwcCFUPcqdwl0w6IKq7DT07Q/xkF8iFwc3CiJuMgZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iep7GsrMY5hwOVtpPnTGmv8hQz9IOm84HkoIOZcFYfvCz9KaLwSIsplNKMfYcWOMQtL+q/JN26AnNEqm9LVmw6opRsmytexxawUgMA7fCJ5OKCXdSq+J8gC0zJDmGuUX/2YNRb2GiTeDr5VU9AOrbYzZ5KfZfwT4eOb1nntpyJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zd+7S/5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CFEC2BCB0;
	Fri,  8 May 2026 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778243605;
	bh=qwcCFUPcqdwl0w6IKq7DT07Q/xkF8iFwc3CiJuMgZSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zd+7S/5FGefATTpuMBem1SuSG/1Cvoh8sxfeOWEG1YaDVma8cc7X/7SK316or2+O1
	 uOhy9+Jzmg4Ie/R/oLX+keGb4RnArPSGCaCpzK0tYPeNnDuf4+B9YHAIydClSlC+HE
	 IAjXV85aEAXyHBb/14LPAUUuN3TgBKZ9Bb2tWcvhH9IUnzN/tXSbGrwhHDH9AOXSUF
	 XFbbQ9A8Jx1Lftuai07gImKz7G0JrSPskJXv7GAAVZnF6aIcZFc6HN8ee0catDOIFy
	 oLUK9AgbUKquzl4vfQoBDVw6w/ZHhnkz8zyJSliLvt0raqXxFsFfi9tVSw7OBXr++5
	 xVCXkSdDEFoaQ==
Date: Fri, 8 May 2026 20:33:20 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
Message-ID: <20260508123320.GD208829@ax162>
References: <20260507232131.438589-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507232131.438589-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: AA9A24F6685
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14315-lists,linux-tegra=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,perex.cz,suse.com,nvidia.com,google.com,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-tegra,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 04:21:31PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig build with LLVM fails during modpost:
> 
>   ERROR: modpost: "__udivdi3"
>   [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
> 
> tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
> fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
> plain C division, but that compiler helper is not exported to modules.
> 
> Use div_u64() for the inverse duration calculation so the driver uses the
> kernel's 64-bit division helper instead of emitting a compiler runtime
> call.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

This is neither a Clang nor MIPS specific issue, it will happen with any
32-bit target, as Arnd's patch shows:

  https://lore.kernel.org/20260508080031.4064272-1-arnd@kernel.org/

Regardless, this is obviously the correct fix.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  sound/soc/tegra/tegra210_mixer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
> index f05617b5f433..bfdd457f740c 100644
> --- a/sound/soc/tegra/tegra210_mixer.c
> +++ b/sound/soc/tegra/tegra210_mixer.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/math64.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -157,8 +158,8 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
>  			if (i == DURATION_N3_ID)
>  				val = mixer->duration[id];
>  			else if (i == DURATION_INV_N3_ID)
> -				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
> -					    mixer->duration[id]);
> +				val = div_u64(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR),
> +					      mixer->duration[id]);
>  			else
>  				val = gain_params.duration[i];
>  		}
> -- 
> 2.54.0
> 

-- 
Cheers,
Nathan

