Return-Path: <linux-tegra+bounces-12070-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULHGHmtMl2m2wQIAu9opvQ
	(envelope-from <linux-tegra+bounces-12070-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Feb 2026 18:46:19 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DE161619
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Feb 2026 18:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DD1B3013A42
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Feb 2026 17:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B310734E754;
	Thu, 19 Feb 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZZQdBcT"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FAF34107C
	for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523176; cv=none; b=iUxNMCiRw1ir3LAmm4fiXs/yajelFSslCAt97RFX/jtKX5ftkP1lrgG4JsYZXarT6lTEwQdTpDN5SPbmLIh7Vn4eSPxBwLWYeH1bvVxGr3GppeMoH6UuciHFj8w1qJW5B1/dlONyVEVQ4aPux3IqVfNS2Sbz0xtQvR1+96EeO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523176; c=relaxed/simple;
	bh=f5bKib08Aelu/tvyN2OpMLabpE2DF2AGEf938W3+7fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uud/a8y2tMXnP3rC++BkEYPciptzPlZ9iy0sEyQ7LUFLhJwtN2cyL67rzjV8yGLTlGZXSGzH+bb0YnYyndpLXjkOa4EfIcce6CKg+TfdMehcgtV7BzuEBeGYdAORWgjG2H1r0kK6bYbK6DJRQyxw6vGQp6JbyS2k4f59VmNpJfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZZQdBcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753A7C2BC86
	for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523176;
	bh=f5bKib08Aelu/tvyN2OpMLabpE2DF2AGEf938W3+7fc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rZZQdBcT7j9eBprbwxI+aVm0pq/sg2rDYJvPAHs2E80yHi+RTrBpyditYlCsfR7pR
	 4KJ+02HPrMy2T4LWm84ErcbcMksGoOIBZqT/izuueznhVLcPO4htBR++dG/nhCW/XP
	 4Dgu3T8UImUuXAETFnlobMaAOJTsBseBmKzXQKFHvc0iaRBAvvSUzC42Qo96yFtVTU
	 TLTPW2F415Boq7iDAVr+UIScrmMYFchEwdl0/yv+l1AgekHvBM4+Go/aXPmWpgWnch
	 0/ai0RIudDqSPSVSaSWJ+/82eRjzW4E6vd0Rv9LZr/cZozYxymJsijPB8SsHEZSpp+
	 zXwog2BJfsxgQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-797de0727a4so12251767b3.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 09:46:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVz4wShEOvZMMhCsMUT5YLJVsnwkaMXckneSAPfD9lBKvhN2ZD9uM6ge6D7/PW668b+5xW9VmmvKblXAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwouTNOjvGIMQ1dYL1wAP8vN9TESPv9Oy5adSAwv9inCq5ofyLk
	430nTHl8NpFUvf8/D7JSti+LpeA0fcYM43+ZiRJk5x/vjKq7P1gZo+qOU+ROZMZ9BbdED/iXuvW
	CWgDBqPxSy3h43l/z8epcOQSjANQU2DE=
X-Received: by 2002:a05:690c:4c01:b0:795:28b6:e3e3 with SMTP id
 00721157ae682-797f71e8683mr50035087b3.22.1771523175664; Thu, 19 Feb 2026
 09:46:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:46:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLm=kRiQGCgvkv7T4saL_mMYA7ZiiY3sRWEQ-O1hVAHWKA@mail.gmail.com>
X-Gm-Features: AaiRm50WBg8Zv1RrDI4CCOgl08KjzL5jVITvp_mw_PPt4tuCUVJOIqQjfRmbLvw
Message-ID: <CAD++jLm=kRiQGCgvkv7T4saL_mMYA7ZiiY3sRWEQ-O1hVAHWKA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12070-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DD7DE161619
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Krzysztof Kozlowski (3):
>       soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for Nvidia Tegra
>       ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
>       arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

