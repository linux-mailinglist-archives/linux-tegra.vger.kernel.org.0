Return-Path: <linux-tegra+bounces-4571-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69DA12938
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2025 17:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74543A37FC
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2025 16:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7D215B14B;
	Wed, 15 Jan 2025 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OJa/lQgL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ds3vssJA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378C70816;
	Wed, 15 Jan 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960082; cv=none; b=VSmtXzFKXN9pweNsdLGlIbSqXI4qku0t3omeUxbrzsmkzNvRvEioFJghp560bssIDCooYi7zSTea+PO769bzk7miF6GYd+sLq+i1BaTVQa19j8rBCdyey00X+ylt4xgRq6GYF8wzYQGovs919fFn04IAHDqCD7RGFdLCbX5x078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960082; c=relaxed/simple;
	bh=SqPE2SIkHgvYfBGy4kR8wuw/snfOBE7aQGpGdnRQpTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JKMQ+ICDU3QYmM72AcFvhtIyr20xLwh9g60lhTbr1lHhbQSDuh2iJydOGjCNF0d7XOQUxCmWhfmnT5eJiAIPQ3lphfGfkrtrCF8XSqoyyIXAFlLw2HN6g37LURDQw62gTjx6nR4LjcO1ZoQpXCE82JIP6lbyWN/qfjb5Ig17lQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OJa/lQgL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ds3vssJA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736960079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz8/N9Ryan02VCYhGlPSyKQ4YdDFIQWBN9bPzvZ777c=;
	b=OJa/lQgLdpJwRaNqCt+uaH0WqDbcec9SD0HbqZ7441qln40IPljxweOt+mvrd0+UG4BVap
	ArXfcMrD8n0kgD1FWlmKXGQOkBRfvpg0PFJiZgtx/FUvuryi6I0RzCIllP0ahmYvCfENSU
	gH4Cwnc81sARDID4Pa8sVV2UmjEOZ7S1kdBGz5ImqtRTOe+1p618aGyO5oCAK3sfMZ9e+Z
	LkHMARi1tBOW1PZSCsmbN2G3ZUZfFthOPHMGAM8Mi9s2+sRAbJJTAb/w2N6+iAKjR0EdeI
	oVwEymfmBUYW/l2BuNvyeJ1u3ebUzA+iFsEPV0B7qK/jfvaTok4CA3zn2D9RUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736960079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz8/N9Ryan02VCYhGlPSyKQ4YdDFIQWBN9bPzvZ777c=;
	b=Ds3vssJAqw0MtMtKwrJ4etqxTQvPxjT7PzLN5fv7QatAU7vm5KbY7q1/0LDngk/B1ubGhN
	FxIjf2MN7apc0vDQ==
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Esben
 Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Tony
 Lindgren <tony@atomide.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Serge Semin <fancer.lancer@gmail.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH tty-next v5 5/6] serial: 8250: Switch to nbcon console
In-Reply-To: <80b020fc-c18a-4da4-b222-16da1cab2f4c@nvidia.com>
References: <20250107212702.169493-1-john.ogness@linutronix.de>
 <20250107212702.169493-6-john.ogness@linutronix.de>
 <80b020fc-c18a-4da4-b222-16da1cab2f4c@nvidia.com>
Date: Wed, 15 Jan 2025 18:00:38 +0106
Message-ID: <84ldvcyq41.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-01-15, Jon Hunter <jonathanh@nvidia.com> wrote:
> I have noticed a suspend regression on -next for some of our 32-bit 
> Tegra (ARM) devices (Tegra20, Tegra30 and Tegra124). Bisect is pointing 
> to this commit and reverting this on top of -next (along with reverting 
> "serial: 8250: Revert "drop lockdep annotation from 
> serial8250_clear_IER()") fixes the issue. So far I have not dug in any 
> further. Unfortunately, I don't have any logs to see if there is some 
> crash or something happening but I will see if there is any more info I 
> can get.

Do you at least know if it is failing to suspend or failing to resume
(based on power consumption)?

John

