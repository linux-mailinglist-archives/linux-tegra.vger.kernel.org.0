Return-Path: <linux-tegra+bounces-14346-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GgsI6x9AGoUJgEAu9opvQ
	(envelope-from <linux-tegra+bounces-14346-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 14:44:28 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165D50412A
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 14:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A966300E6B2
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53922381B1C;
	Sun, 10 May 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFUgWkye"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DBD381B17;
	Sun, 10 May 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416309; cv=none; b=MFrDCmpCBav8iaxUM4pugY1aD4TuvzFCC0bXHvS9pobk28M6NR231N14PpuyNphRMsulEfnZaew3uNiDXhaqQycioziYz+jh1cM4ZMbUioderaImqTFY6vURpNe7xpSY4eLQPrHjl3ZgMugCHVDcjTPINi8Lel1DhGfaL+y//yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416309; c=relaxed/simple;
	bh=rYTVoUJlOhx6RpXKgdLOgKe0eiYOtQiy1WmXvoW1AEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K/ewO+Mi7rFZCLPgrwIaDiBExwbMRInXqykPx2Bdgc9btunjj+sn9Y7kcOKH7SbW+xpbaR+GugIu1TtODITbJbEPyf2Tr9nCxutQYNMCSYRSxA2UWI9cVzOAv+rUCY1zRjdjDO5bXiVToqgUBsIwmV5WwSmKbvTb3u6yYB1zsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFUgWkye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50945C2BCFB;
	Sun, 10 May 2026 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416308;
	bh=rYTVoUJlOhx6RpXKgdLOgKe0eiYOtQiy1WmXvoW1AEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jFUgWkyevAQAqAmOH0fekKaGkiwlHpWNb68zIEUx0hFLD0rRXm7tb5o3XkoXWcRj5
	 2Esw4whwBb8jiAYNA9F/ZHQRa7xDsRV8T/UQp98xMg3+tSHrS7PhBMtY01QeCElLJI
	 1X6FNCJ0GfBbD5rvdI/r1aLVZ8ZrvdLXCaYyPhc8FQp7d5/mhNDHa5MwOLude1xnkX
	 LLpSP69vN0lCi/fQ5gfvwu+wrepNZRsAsPKFUWYdrk7ZXQJirzEr5dtWgfXTrFlrt/
	 Opc311r4zPiJCWShvwZjBiIMZgDb9wHPgMdcMaYqeuKoC2b1VysqxyxJdaHmjsRJ6d
	 xgCWNf+BXi9rw==
From: Vinod Koul <vkoul@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Niklas Cassel <cassel@kernel.org>, 
 Vidya Sagar <vidyas@nvidia.com>, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260426000309.54959-1-sashal@kernel.org>
References: <20260426000309.54959-1-sashal@kernel.org>
Subject: Re: [PATCH] phy: tegra: xusb: Make USB_CONN_GPIO select
 conditional on GPIOLIB
Message-Id: <177841630492.434434.10037791395679049058.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:44 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 6165D50412A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14346-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 25 Apr 2026 20:03:09 -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   K006: config PHY_TEGRA_XUSB selects USB_CONN_GPIO which depends on
>         GPIOLIB, but PHY_TEGRA_XUSB does not depend on GPIOLIB
>   K002: config PHY_TEGRA_XUSB selects visible symbol USB_CONN_GPIO
>         which has dependencies
> 
> [...]

Applied, thanks!

[1/1] phy: tegra: xusb: Make USB_CONN_GPIO select conditional on GPIOLIB
      commit: 18af47764d75bf2cd6297289255fd7f83967e7cf

Best regards,
-- 
~Vinod



