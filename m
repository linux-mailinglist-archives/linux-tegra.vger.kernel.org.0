Return-Path: <linux-tegra+bounces-11487-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG3sGeXPcmnKpgAAu9opvQ
	(envelope-from <linux-tegra+bounces-11487-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 02:33:25 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F116F1E9
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 02:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A819300F146
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 01:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2718935770B;
	Fri, 23 Jan 2026 01:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/24BiO0"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D08318B8F;
	Fri, 23 Jan 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132000; cv=none; b=szYdPighVrvD3BUFKMQdbkpgYpHh4kPGWb8U3+cDftXPlQPey/BIkH7EnhJaup9cp6bqBTymfOfdn/3qbFwCA6m7ZbbHxAU+0f6ewcNl/yGZAtl0ojjED0wiPkpOIcFqRe9UUGy6LwDrklBGp4LnK8Nh5meulMkzS3xvzxgxZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132000; c=relaxed/simple;
	bh=ZjA0MF6AbgPN2AWjXjk+9YXMDSWyj/5/jG9CHgJr2vw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hBu0JR88oGFbIxpAGk0k5MkA2WP6xRrRUgytnze+p82l7gXAFRH9Chf6s66Wm1oW2qjLXi0sKKvdWja6MjBOh6rMZJXhrwKIyP40YpaauqbSs2YJX27ODdRM9OX0hYGpJZcPkC3RxoO6Iw4JPIzt7D+25dxTXIWSdtTRhdV9LP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/24BiO0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E5C116C6;
	Fri, 23 Jan 2026 01:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769131999;
	bh=ZjA0MF6AbgPN2AWjXjk+9YXMDSWyj/5/jG9CHgJr2vw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m/24BiO03F3mSYBVckdNr77X7tCKrf/MnXUS2//Yr3ZNoTHywoe6YHfKttNJ386BN
	 ef2ZO1ULprp26gj5g3AFWvLcBvNd+oEFO+kD8FlKwVFwJ/PswnhVWBLeRg5aobpMhf
	 NunjTvw8aQkTuRE22zR9lhVncI7L4+NzV9eip5dA9NfCpcYeKdQtziungmvIyqJi3z
	 K7Ht8VVOHh3PovSqYXCG947ECGLoYUcabN5Ek3DOqqTpo6kbdhKmvO1KYinWbrbxDz
	 +p1hWEEc6JZVTE783B8zzk+epH6XdJCvT+CJiAMCT0LejBopkdrR63hX+YX//ou3nV
	 BpaFCAXGFnjZw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260118080142.2632077-1-thierry.reding@gmail.com>
References: <20260118080142.2632077-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v6.20-rc1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 21 Jan 2026 12:17:43 -0700
Message-ID: <176902306391.4027.13378027345427671781@localhost.localdomain>
User-Agent: alot/0.11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[30];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11487-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,localhost.localdomain:mid]
X-Rspamd-Queue-Id: 15F116F1E9
X-Rspamd-Action: no action

Quoting Thierry Reding (2026-01-18 01:01:40)
> Hi Mike, Stephen,
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
6.20-clk
>=20
> for you to fetch changes up to e897e86711b28f815fbbe542fe87a66b39123d1e:
>=20
>   clk: tegra30: Add CSI pad clock gates (2026-01-17 01:33:18 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

