Return-Path: <linux-tegra+bounces-13306-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH9AKvNOxWlH9QQAu9opvQ
	(envelope-from <linux-tegra+bounces-13306-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 16:21:23 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF13377B9
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 16:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F7F03047012
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 15:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780C23E556A;
	Thu, 26 Mar 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8gm2iFF"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530CD325485;
	Thu, 26 Mar 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538331; cv=none; b=e2pUdRc99+e65nQUFUJ3wthKm0GCaj2j/Z2M1/ADBzX/BKMwGG9STL4svqYVt2A99PbNWTUicY2jT8m+qZ3TcBB39Ti7CUgKTKel286efI+TJ+0MU6PWeJYjRglrXcexVktKaxKo2qM4kOJL/7YL2WlbAZlwYl2xr6gVqf4wulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538331; c=relaxed/simple;
	bh=1pNCUWUk5UquqTKdcr0V7Dl6T/ZHqBWgDbFw6S0sOmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUOKOZgu0rm+OTGkX41JTzwTIYDx77axd3o/h18tSbesml+zsewjsNvpbRP4cMPsrDwjZD7f9SdQH5Qs5WfHJhP1Kvh4QIyI6ainQ1PTtSVWYa4/bhxns2/TbwrYW1a1v/08WPQNWUz24Kv1vw72B85czrONzPNDt5dVICODA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8gm2iFF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD977C116C6;
	Thu, 26 Mar 2026 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538331;
	bh=1pNCUWUk5UquqTKdcr0V7Dl6T/ZHqBWgDbFw6S0sOmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8gm2iFFLyWBTHDO07gv6lEf+axSsmP9yKd9zsutsaHh3ZaoQfTr5K3tXupV8uQL9
	 S27q4umBJFlv8LACpOJOM2/mgQwEMGSwLeLLCeK9S0CBGoF0J/52lN+6R13aLQh3kG
	 Ra77CoJS7jTux+cp4L4a3Lgn9756Si/HnKEx2YWFUmTagKgAnXMPpYVQRWf0TM+Emx
	 QIbtBIUGN9yat3H+VxNADRRRgvhqNHLeWQ3ENM+FJBB45eyUeChQFqtCUoUlNQ474g
	 otVGJFQkoyGM4MC9AQ5ojcg4DdNiB8vZjm0esxhkJraxpT3iZkQLdfGFiGPCiJwna1
	 YASFQKzLyA4QQ==
Date: Thu, 26 Mar 2026 10:18:47 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 03/12] i3c: master: Use unified device property interface
Message-ID: <20260326151847.GB2360967-robh@kernel.org>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-4-akhilrajeev@nvidia.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13306-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91BF13377B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:57:16PM +0530, Akhil R wrote:
> Replace all OF-specific functions with unified device property functions
> as a prerequisite to support both ACPI and device tree.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c       | 91 ++++++++++++++++++++++----------------
>  include/linux/i3c/master.h |  5 ++-
>  2 files changed, 55 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c32847bc4d0d..2c479fecbfdf 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[...]

> @@ -3300,11 +3310,14 @@ static int __init i3c_init(void)
>  {
>  	int res;
>  
> -	res = of_alias_get_highest_id("i3c");
> -	if (res >= 0) {
> -		mutex_lock(&i3c_core_lock);
> -		__i3c_first_dynamic_bus_num = res + 1;
> -		mutex_unlock(&i3c_core_lock);
> +	/* of_alias_get_highest_id is DT-specific, only call for DT systems */
> +	if (IS_ENABLED(CONFIG_OF)) {

BTW, CONFIG_OF is *always* enabled on arm64.

> +		res = of_alias_get_highest_id("i3c");

This will just return an error if not booting with DT or if CONFIG_OF is 
disabled.

> +		if (res >= 0) {
> +			mutex_lock(&i3c_core_lock);
> +			__i3c_first_dynamic_bus_num = res + 1;
> +			mutex_unlock(&i3c_core_lock);
> +		}
>  	}
>  
>  	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);

