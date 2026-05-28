Return-Path: <linux-tegra+bounces-14766-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HhuBYu8GGoumwgAu9opvQ
	(envelope-from <linux-tegra+bounces-14766-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 00:07:07 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B675FAC55
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 00:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E47EB3056608
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 22:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCF735E549;
	Thu, 28 May 2026 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH0CJNqy"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBF30E851;
	Thu, 28 May 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005635; cv=none; b=W1d3E4DXJpNCIkUDcOIhonPqZnR9GORdQ3bcqHzrqmTO9CQb0eqRndx46LOeBVF0lELdJ195KW5aR0CMEQieQuSUguH1h0ITB5VZdzQrzi8npWHvjSirwcljxSfEf9id1z9paeJykpDP/55iktlBK76HbI85Poq5BKL4oRk3W8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005635; c=relaxed/simple;
	bh=3rzXEu472SRPnSJA9LzqCEetJJXjqpUQ7iGOuNYaO2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn7DfuRWqv4JRdRcCtps7mD5CoAFIVvRsjK56rnD9ibRhTkQZl5j+PITjRFyRmY8hW+BowkgcWq+n8pMwego1een+k3B4iPpVxMfooHZH2mi0MY8EHQNplxvvvDcUYpku8KDiPHgiHsh6xb8tXbK9ZW8RbFvSpsqWsyKOjbex2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH0CJNqy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E9E1F000E9;
	Thu, 28 May 2026 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005634;
	bh=0hNnZcRAjq18rN/s3Mk1xKZhzHX6qsi8DRN6+TVTHWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RH0CJNqyluiw0zyeM7XjOV6VZc+y2cGfnZCYc6bm8iGoukvgh7Vv2Hfgk5s6Ye9qb
	 8f94w+e7AlTFYQodUYldUlcTo+hOTABE+CxgKUOT2vgQgzpZANNQZA5c/O1GoLOxg3
	 6Kzfhrc2OBtzfCGVnJU34eVebAfkXbF8mrSvJBuiaBKPwUSyvbRzmhtvcHxKnjryiq
	 SkIbIZkG+x2MONVl/zCNjQJKx+RCwI8tCH1mq+haTa/E43PZYpGmctSGQKM2GGmN5R
	 rSDpmp5QX8wkxC1d3I72ymILpWCTFhYBj3ZR6OjnyMGzoLwSNDX11L7k+qnyPPMzNo
	 88tdIkaZ+3JLQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol
Date: Fri, 29 May 2026 00:00:30 +0200
Message-ID: <178000562210.195906.9139534565360798145.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260426000314.55529-1-sashal@kernel.org>
References: <20260426000314.55529-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14766-lists,linux-tegra=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 67B675FAC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Sat, 25 Apr 2026 20:03:14 -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   K002: config TEGRA_BPMP selects visible symbol TEGRA_IVC which has
>         dependencies
> 
> TEGRA_IVC was originally introduced in
> commit ca791d7f4256 ("firmware: tegra:
> Add IVC library") as a user-visible
> bool with a prompt ("Tegra IVC protocol"). At that time, TEGRA_BPMP
> depended on TEGRA_IVC, requiring users to manually enable it.
> 
> [...]

Applied, thanks!

[1/1] firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol
      commit: 55ee4d297e3929beac865714b681a4f25759868f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

