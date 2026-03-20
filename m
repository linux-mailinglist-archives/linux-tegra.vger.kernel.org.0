Return-Path: <linux-tegra+bounces-13007-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EXsDNLQvWlOCQMAu9opvQ
	(envelope-from <linux-tegra+bounces-13007-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 23:57:22 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659D2E22B7
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 23:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58EA4302A6DC
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 22:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49E137AA84;
	Fri, 20 Mar 2026 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZu723R5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823F42EC0AE;
	Fri, 20 Mar 2026 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047439; cv=none; b=k4ETeaXEBKrWwYSGTq8DQE9f4v9wVOsfOYbg0jYYkrhyalzCGS5aPyYP5UhfaaTkCDP+TIJfd2zPbTXElRPIPagGtweLHsnyoj2XEy2jnOOFU25dWaXhneIw8Fb5YbfYwPSJHFdPa3nYCP5ZfcOPKAxf4epcgnhR/b3pqKoih0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047439; c=relaxed/simple;
	bh=zBrBQe+Y5neYzBLPJtsIXH/pOzUBnoUSrEG82CvNe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyjZMtVRiKIztjsxeEsBaxURWdYHhlOHHucDBTXREN/zEIHCHfjf+F/vRNQhchu0akW0E0QgQ/JuRdY16hed9Xm45eAOMn5XvY2y/Vf6nAPnSuXAqXqI+OnZhMsMKPzXEhcB6WPnMieu9k+YLYR60QMkxbv4znIgSBn7FBRlPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZu723R5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A809FC4CEF7;
	Fri, 20 Mar 2026 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774047439;
	bh=zBrBQe+Y5neYzBLPJtsIXH/pOzUBnoUSrEG82CvNe9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZu723R5Y+8AqTXckomwefQe/erpxnz72am56Iu+D3TEy3xXPefV1jOJu401hedc0
	 AJ+RLXgGkiKBVts7buywAifRSzVw56Sk584c/WkV87Jqkpjb1BpXJVliz9kONKLv0Q
	 i/2Y0KdvKacyFeZN0hsnH/P/tv6ZdWu/1B5/yLzc/0l+fS+Fs+eTJA/PVE1jfpIuxH
	 Dp/EaaLTBQ6Z/YcNvAqK7o1EZfggPxCpQlAO863qxyCQuVVQwIKKM7Gh/pv03gajGo
	 Aq2bc8gsaYuQO14IDH9B5p7KtzOjPl+OUJaKGSFIzb+kYQAanW4lyA3nD4pfKz23m7
	 I2YS9h/OJ2v/w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix RTC aliases
Date: Fri, 20 Mar 2026 23:57:15 +0100
Message-ID: <177404742057.2572906.590263252137366204.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305151659.703273-1-jonathanh@nvidia.com>
References: <20260305151659.703273-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13007-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 9659D2E22B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Thu, 05 Mar 2026 15:16:59 +0000, Jon Hunter wrote:
> The following warning is observed on the Tegra234 Jetson platforms ...
> 
>  rtc-nvidia-vrs10 4-003c: /aliases ID 0 not available
> 
> This happens because the 'rtc@c2a0000' device is registered before the
> vrs10 RTC and so is assigned the 'rtc0' alias. We want the vrs10 RTC to
> be the default RTC because this RTC maintains time across power cycles.
> Fix this by adding a 'rtc1' alias for the 'rtc@c2a0000' device.
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Fix RTC aliases
      commit: 13346b553b49952f0d2b0b5a07f9f1492b811dfa

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

