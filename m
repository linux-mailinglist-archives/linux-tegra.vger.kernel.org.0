Return-Path: <linux-tegra+bounces-12910-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPHhGvXIu2leoQIAu9opvQ
	(envelope-from <linux-tegra+bounces-12910-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 10:59:17 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8E2C92B5
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 10:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08605310CDBB
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 09:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF493B961D;
	Thu, 19 Mar 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJitGcoP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E89186E2E;
	Thu, 19 Mar 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913237; cv=none; b=mYb4D/cYnTJvEQn7upglRCejGeGESDvzPfgLcNdRrzHU3agE2LslYYpGeg3b+Mn1XrP3LgA40eU+4s3y3cL2SAQEwk04zrxS2HAXK///79Ic73BX3phZ1MIhEetJuqC2LXRcUCQp2sy1VC2jjELwQDFUXgr6uot9AfZiRqO0664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913237; c=relaxed/simple;
	bh=ZSn8Lu21liBhjll/ha1FTtomPiyxAKdHWnt+7n5pJY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAM1q3LbeUVyo0mT/Cm3ORkFQ7QRlHySY9H78efRSyqls4UKle25e7BXAPuqjCV1OHn70/2y05w+i0GwEPO85138yb5GFWZ0wRokVpdsqNErZB40xi7Kddvw6OUGWeTTPANBBLpYKtI4R76/1BnouBK4s4IIoW1XTNkqV2asNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJitGcoP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CC3C2BC87;
	Thu, 19 Mar 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913236;
	bh=ZSn8Lu21liBhjll/ha1FTtomPiyxAKdHWnt+7n5pJY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJitGcoPZkhcTx1rxy9aCI9KqJFxx5U4jcsg6pZlvnRbd8D3LBHXnGPXE5i3XO9OG
	 Cbgb0SCrXgQWGISpb1c+etzsTOTzAHrvPJKD5OUF8yU384s9kwW8+kbFVhewYZvoUp
	 SNFNra3dnN5GLaO49Yj8pNE2/WxTPZFCpApPPlyDOty4xJum5qJIaf+jhZjUSFrpH8
	 0RgFRC6qrdBoFSUS1bxJMk2ApwDG7HIqZUzouKOWAnhOFtGnZPuDmJCawyDC2mfVHF
	 /9lOnbD7UqBl01IUSbs0JgqjPIardNe2zik7oX8HUdSmOVNm9GdcCi7/2C065jbPr1
	 xf1lhafENDbbg==
Date: Thu, 19 Mar 2026 10:40:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, 
	Fredrik Markstrom <fredrik.markstrom@est.tech>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	Suresh Mangipudi <smangipudi@nvidia.com>, linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-13-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-13-akhilrajeev@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12910-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72D8E2C92B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> Add I3C subsystem support, DesignWare I3C master controller, and
> SPD5118 hwmon sensor as modules to the defconfig.

Why? If there is no user of that, why would we want it? Your commit msg
should explain that.

Best regards,
Krzysztof


