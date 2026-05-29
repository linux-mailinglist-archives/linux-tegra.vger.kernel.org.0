Return-Path: <linux-tegra+bounces-14805-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC5NIC3wGWoX0AgAu9opvQ
	(envelope-from <linux-tegra+bounces-14805-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 21:59:41 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AE608245
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 21:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDCDE301476E
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 19:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7D33ED125;
	Fri, 29 May 2026 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZbv9wX7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEDB3D7A01
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084779; cv=none; b=d/8IY5W6kgKwtRz6+x00QAq7SzGdMGVHdytNwGFU+bnID6lMWv2KV1jTiDse2+8ddPS9iKE6ygVUPBVXGdt8v/D4UpTWY4AWNXXnS9A14JHpg/D3CRY6HJVtxma4Ilmoilr/Xp/0vF/vhTQmx1wC0yE4pTX98xVsx3/XzUPtMw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084779; c=relaxed/simple;
	bh=zV8O+SqmyWm/zpvwcj4ITeBANPTk/EqDLonmyJd7fSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRfyVBdP9tiJ07xpMlQHyrYGweQmkqhjkIo0qzrwOsR+ovGTySoT79xtxeAVnexhmD9UrUafCtPTqOqvU1Efw5Ldr44Hq0y9wptWiUSYUo1PlPA9fPPPSy+Dfefeoos2s79g0XAKyhhEi+8hJ+YDPfaGsdhstqMA5ohkv+iToTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZbv9wX7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E571F0089B
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084777;
	bh=zV8O+SqmyWm/zpvwcj4ITeBANPTk/EqDLonmyJd7fSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gZbv9wX7VYzcK+qSg/lf/x1hyH/Xbzy28GJpryjOJJqkLnu/TIY4K3y+zz8alJMYD
	 4xljKOX1FRwJBU4bGKvQmKkgIIU7VHKVV8beUUDrcTp6WJzQXP0NSiv+co+OIBAFk9
	 f/e1Ye47dVUw5okjX4GkCS5QjGEU4WO9rU22WAEXvhhuvdAPQYzYwXMJTvYaMgQ648
	 cH0527lMA3A9RWXP9F5kY1D5f4MGtzRTEv1t1ptggERpdImAeZL/Bb8oi//orc9Egv
	 mJKuKFCpae3rrKmCE2A0aptQs9dPmd8atFkdkhLBjL2xXZpBR4d8Y6D5zR+hUVxXRC
	 os0Dx3fWiZ7/w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso841768e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 12:59:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JscravOGkPP8e/lcF3zrVbxKHcuL7WyyxP08Nucw7HdmAGOKzqW4jJWa7rAk5Lxz4+e6Do1BHEM5p3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdgNrKXoxLwdhRosJDnFmkmw25IqypUF1SVtORraV+R005e8+e
	NdgS7s+QoF3I2vQ5Du+LUqUQBOtDdqFhdVsQNAlER2/FY/UJFuuj05DXffG0fMX1HrDyQbfxrQF
	fWFZfYaRsc92FltPOQutiDeFaG5CXJKg=
X-Received: by 2002:a05:6512:b89:b0:5a8:7425:5659 with SMTP id
 2adb3069b0e04-5aa6091c807mr379113e87.39.1780084776675; Fri, 29 May 2026
 12:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529094143.1872822-1-arnd@kernel.org>
In-Reply-To: <20260529094143.1872822-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 21:59:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPjmM1uy85NPLU4QSrvtwbr0cw370-2dj+oa-Zpr7tyg@mail.gmail.com>
X-Gm-Features: AVHnY4JyJcpGbqSiBLBFReVQVGgWDsizwmrWX0TBi_EHo1PBbdmQqipNPava35M
Message-ID: <CAD++jLnPjmM1uy85NPLU4QSrvtwbr0cw370-2dj+oa-Zpr7tyg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra238: remove unused entries
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prathamesh Shete <pshete@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14805-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC8AE608245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 11:41=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Wunused-const-variable check points out a number of added
> entries that are currently not referenced:

Patch applied.

I guess these entries actually exist in the hardware though, they have
just not been attached to groups.

But it's easy to just restore this when needed so no big deal.

Yours,
Linus Walleij

