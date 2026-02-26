Return-Path: <linux-tegra+bounces-12218-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SONEMMGFoGk6kgQAu9opvQ
	(envelope-from <linux-tegra+bounces-12218-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 18:41:21 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E51ACAAF
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 18:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5583C32F36C7
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6575444B661;
	Thu, 26 Feb 2026 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hhsNECI8"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4FC449EA5
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124774; cv=none; b=kt+cnV4KGnU8P4APRd6UJUhh6tzICP7vhI1wvyY7ARBXdwkbkqCaFFpulU+5UtbUYqKhJqVRwtMj22nmo6LhTtSA5NWx5pRWvxeVYc6To4caDH7yJ9qu9hp4FoJFCLm+JURaQgu7NmVififjJXUpuoqzAHhItUHIr8NMJOpQOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124774; c=relaxed/simple;
	bh=nZF7ylA5UaTPef9mnXYB9cdxgPpbqxpIRu3/EUGImwM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=DK7tppMVeFUvX5BtstM/tbLo6TC6T+ThMszLoJ99/dLi1uo+JCTL7v5Au2tcSSohk/QyzyL8pSHVZITdzXaqBWJf7p8wi/pq7IxITL3b22c7oODW6ajDooHjc0z5lo5jJ+8ZBGOjHYcumxI/uiodO6eyFDyCPYZTYfR7CUDf9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hhsNECI8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9EDBA4E411FA;
	Thu, 26 Feb 2026 16:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E4145FDE9;
	Thu, 26 Feb 2026 16:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B66D7103693EF;
	Thu, 26 Feb 2026 17:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772124768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nZF7ylA5UaTPef9mnXYB9cdxgPpbqxpIRu3/EUGImwM=;
	b=hhsNECI8T/RxJNqhj0wdk5dUuMD3GWwsIdkJ0RilKxSPFaEEOoU2/HCJibi2sIUlzWF84A
	anfMW9oBfI7tubF10CO6835CErKOfAH2akOdiGKq93OznBGYT/aIHHFkmYHTgZhDx8UdRl
	YKaOr9fs4T5vMp8gLcW4VWBkDcyrSEdr+/+LyBnk1A4/PF7cPIsbaM2Z7nI7vMMTviQKWw
	8klQeDkmi/GIGFEdHZUJ6H5kufiHE+ISnn5HpnWfWTp+AVssGh3Kf9nJyybx4nsGwwKRMP
	bvFjQY1aNhF/QnVj5VPKsPz1jmW36iuE6eeOkYSn73iJrG66HOqj/KuS8IrSSw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 17:52:44 +0100
Message-Id: <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
X-Mailer: aerc 0.20.1
References: <20260130124932.351328-1-clamor95@gmail.com>
 <20260130124932.351328-6-clamor95@gmail.com>
In-Reply-To: <20260130124932.351328-6-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12218-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,cisco];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:url,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 423E51ACAAF
X-Rspamd-Action: no action

Hello Svyatoslav,

On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> Convert existing MIPI code to use operation function pointers, a necessar=
y
> step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> that is SoC-independent remains in mipi.c, while all SoC-specific code is
> moved to tegra114-mipi.c (The naming matches the first SoC generation wit=
h
> a dedicated calibration block). Shared structures and function calls are
> placed into tegra-mipi-cal.h.
>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel =
camera
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

I wanted to test this series on top of v7.0-rc1, but applying this patch
fails (with b4 shazam). Can you rebase and send a new iteration?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

