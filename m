Return-Path: <linux-tegra+bounces-14758-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO8SKpivGGrLmAgAu9opvQ
	(envelope-from <linux-tegra+bounces-14758-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:11:52 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 379D95FA4E8
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A930301E200
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 21:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC63352014;
	Thu, 28 May 2026 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhL0F+Gx"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97223202C46;
	Thu, 28 May 2026 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002340; cv=none; b=lwzKFFmjCnWDFItOy104+MRDRkzEJRux8hEXevejE8mmPEoxSxv/aF41lJNsjtyby6B47CZsWRn11FvhvTG3SvMwhv0txCVWrjiUvrk2NjhTkL1Thjakojd/PqaHDTBq0JPPBzl6PPnejAkra/oTAZ9f5srxxuMZThM5PuXVgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002340; c=relaxed/simple;
	bh=wTHxkgFKMEv/wWyxbV4ZaO+zQdoFgFJQnKh0zax35bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUhNPSF3W+h1Cgkd99mMRb4/SvKUXpPsBq2sTgNKS43a8oAwrkEF5G34HV0ox6/PGgLiKVwuOv20yVgm6IY8gQe18QoBmYZhhf6FutFS4GpC7dVIyykej7bjvS+a+31hB+v3IkNkrvbXqhOPup5Uie1hoBBbYpvSqB2gNPxkFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhL0F+Gx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66451F000E9;
	Thu, 28 May 2026 21:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002339;
	bh=LAZ6n6J+25Qo61Orkou6YhWD1AuXe7pV/vNQ2NlzLPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhL0F+GxE2mWiam25IvZhWYREuqIQkjnZPHfnAxLDWFfVjKNIbll80ijvNBF4+CL9
	 /umMBMvxM2PcwurFa757ohl5HKirhHZr745LcaGzUHOhhKfHPLNW1YJXOfLfW6eIhX
	 HtOpnyMHtPMwUOYoFJm6R73BdoU+pptHkWtnRyYAudVXqyUY9/Lg4Tw0Mmlm8FzWOF
	 U5nML+x5rfa9MhTd+wb7CRJsdKBB7twSKiXyq+6q6IaKMX2y5aUofUoMQpElHuRlu9
	 jPQyFPtbpU3jfPnl8NYKJ0UUp3zLtXdXR8nCc7koAHsq0JRhXqkP/P/lLIQr2PpiVz
	 WkR1QdyO9ueuA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Restrict power-off handler to Nexus 7
Date: Thu, 28 May 2026 23:05:36 +0200
Message-ID: <178000232908.188878.7021298366210829113.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260521-smaug-poweroff-v1-1-a0b3a778fbe0@tecnico.ulisboa.pt>
References: <20260521-smaug-poweroff-v1-1-a0b3a778fbe0@tecnico.ulisboa.pt>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14758-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 379D95FA4E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Thu, 21 May 2026 15:48:48 +0200, Diogo Ivo wrote:
> The Tegra PMC power-off handler exists solely to reboot the Nexus 7 into
> a special bootloader mode when a USB cable is connected, so that the
> bootloader can display battery status instead of powering off. There is
> no reason to register it on any other Tegra board.
> 
> Guard the registration behind of_machine_is_compatible("asus,grouper")
> and rename the handler to tegra_pmc_grouper_power_off_handler to make
> its scope explicit. The of_machine_is_compatible() check inside the
> handler itself is now redundant and is removed.
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: Restrict power-off handler to Nexus 7
      commit: 47f0beb3b19f5f46ac7d329bf0b7c173263f675e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

