Return-Path: <linux-tegra+bounces-14159-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hZreA23p+GlZ3AIAu9opvQ
	(envelope-from <linux-tegra+bounces-14159-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 20:46:05 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E74C2BA7
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 20:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 282DA30238DB
	for <lists+linux-tegra@lfdr.de>; Mon,  4 May 2026 18:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D60B3AA507;
	Mon,  4 May 2026 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M11q1lFd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8F18A6CF;
	Mon,  4 May 2026 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920362; cv=none; b=mhCfPAn3QfD5EVsgCKxaKUkrIKpme+hZnX3f10NZkN+E2Foox01ApOLq9LqkQ0RB2gXHqcQ2Na57c7r/ZWdYzmkG6OxtnQWthMUhePnrzYtFmEpXSphpNV+tedrWQ8/wfbNaq5ovuHcJj9EHNjXaxMV70l0eHlylWWM5hWcoD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920362; c=relaxed/simple;
	bh=wbssTLP+1SJnb1MtV0NhVPTpN6DzAGE3RsXrWI6q/YQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uePnapnyFXCMcaoGPMdOZs/JJW4oyRHYyhGV2tUg6XTj2mBbETyBEEpjlRiQ+nJHlp7Csi0FUgHSSzA30isCmUMdlqVVaVQJ0FNDehQBTGESp1o6eN9cuvSUK8gzdXMTlzRfG8nhV1cBtv5BVHOlnKCsNy0MwjAhb7mal/0Xz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M11q1lFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A35C2BCB8;
	Mon,  4 May 2026 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777920361;
	bh=wbssTLP+1SJnb1MtV0NhVPTpN6DzAGE3RsXrWI6q/YQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M11q1lFd18aSodjhFvtC6/h3w73uE5eBFHZROAv4znWcQ+eSrbq3i8VQ+ESYuvEQO
	 JPDI9mG91kOifikJr3DCahHd2lHScpqDzjGRLFfgW0Gew4XCow+9lnT1OaZlu39J+4
	 JUZsbH8mk+QTvolYIF0imDOjuXxfYMtc+BekBKfeqRVan0pW/Ubkfi3U3RTF9/V4N2
	 /dgcAnpnaWvRCTZnfx755Ih1Pg05+bgi1vNzUPfDIWapQ+RqGOw67rCyVqjRCG3iIa
	 aKe7xJePYRTxCZ6o9ar+I5rfepiXE1lygEz9MEKGnIlKrEunU4mJqctPkki3hxoc/0
	 9dqA2ahsT9jJQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Tegra114: implement EMC support
Message-Id: <177792035953.728420.7752606045696224653.b4-ty@b4>
Date: Mon, 04 May 2026 20:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 664E74C2BA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-14159-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Mon, 27 Apr 2026 10:03:05 +0300, Svyatoslav Ryhel wrote:
> Add support for External Memory Controller found in Tegra 4 SoC along
> with adjustments required for it to work properly.
> 
> Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.
> 
> First 4 patches of series are dedicated to memory subsystem, while
> the remaining 3 patches must be picked after first 4 are applied
> and are meant for the Tegra device tree maintainer.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: memory: Document Tegra114 Memory Controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b0822a883408f32d494ce9cdc26f4266774cf3f1
[3/7] dt-bindings: memory: Document Tegra114 External Memory Controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a4f97f9467661602bd6bf614bcee884502794d43

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


