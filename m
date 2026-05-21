Return-Path: <linux-tegra+bounces-14613-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PTtBnvmDmopDAYAu9opvQ
	(envelope-from <linux-tegra+bounces-14613-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 13:03:23 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB55A3B94
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 13:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B64C3016918
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 10:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41283A5E85;
	Thu, 21 May 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9pIlSjl"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0D3A1A50;
	Thu, 21 May 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360103; cv=none; b=nKgW/W24XVXP84zkX8ZptwG6PcGPzj0qLWA+92X46akSrhzVCDI7v85j6gIKJEGsq8nhXiL1k0uEZIWc4cwBLDhFj6JV1AlHgY3ywK0DDk4nZ8F0E6vfsX9R52aAcLZo6rhifIiqLjFblYrKJ3TziolW7WjqHq6iiPiTH43mWoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360103; c=relaxed/simple;
	bh=coJ4MFPpGMURkxVeaedS8MSyC+akUv2rcEfwMPplBWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXPrNaO/HcgyxyUN2VSiCwRAvZ6GKsBet/lfdFSPo68bjNAAdJ785FXwdUzuXNzsOW9Kyf4DI22pXy7FzZMSAaHPfZPg1I0xzM5FHgqGG/GvcQSCROk60HKsn99KI/9ScEzziA/Kx9LMZRPCjHDduQHQkV2/yX1aOb5tsh/ChyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9pIlSjl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C31F000E9;
	Thu, 21 May 2026 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360102;
	bh=OalQW79wuJKQugYTsEuY13ekGnznNoc2Hb27TehySZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9pIlSjlapmfSCxVoNCfcbH/W1Fi6EmAo1gUOmdZhHuOc9o8r573AoghDvlzOtRLM
	 72xoeBHodOpU3T+g+FO8P1n7Bd2ySku7n9Iumc2WmPBFVo7QeWdtE9oO9ax2t+TSMz
	 u99z4I71tAdP8csaG7sjeeIoR86I9X0jDuyOjlIyAkOW2cksQk7VtuCLb6jk+9ReKt
	 H5JhWbMg0I93+loBWoBH5j2Fihua59smLK7e/54gsHz9zl5Rw8mXLlTE22XYUd0Bar
	 Rk4siV5T33Dp/vySWXOtFuIG3EjEgN/xtxtTRNnP6HtmSeqgR8hFuio//8mDpXsAsQ
	 nCkmmjljcY47g==
Date: Thu, 21 May 2026 11:41:36 +0100
From: Lee Jones <lee@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-ID: <20260521104136.GA2921053@google.com>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14613-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B3FB55A3B94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026, Diogo Ivo wrote:

> Hi Lee,
> 
> On 5/20/26 18:25, Lee Jones wrote:
> > On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> > > This series migrates PSCI and MAX77620 poweroff handling to the
> > > sys-off framework and fixes shutdown on the Pixel C (Smaug).
> > > 
> > > The first two patches replace legacy pm_power_off usage in the PSCI
> > > and MAX77620 drivers with sys-off handlers. Besides aligning both
> > > drivers with the modern poweroff infrastructure, this removes the
> > > global callback dependency and allows multiple handlers to coexist
> > > with explicit priorities.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> 
> Thanks for applying the patches! Just a question and an observation:
> 
>  - I'm assuming you were ok with merging [2/4] despite the possible
>    deadlock since this risk is already present in mainline in the same
>    form so we're not actually making things worse, is that so?

Did you see the text below?

Both patches 2 and 3 are applied.

>  - The observation is that the comment about overriding PSCI is only
>    true after (and if) a reworked [1/4] is actually merged.
>    If it isn't then patch [3/4] is actually working around another handler
>    in soc/tegra/pmc.c where a handler that only does work for the Nexus
>    7 is actually registered at FIRMWARE level for all platforms that
>    probe that driver (I will send out a patch shortly to only register
>    the handler on the Nexus 7).

I assume the other patches will be applied soon.

If this causes some kind of issue - let me know later on in the cycle
and I'll remove whatever patches you ask me to.

-- 
Lee Jones

