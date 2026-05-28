Return-Path: <linux-tegra+bounces-14751-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJnjHASrGGpolwgAu9opvQ
	(envelope-from <linux-tegra+bounces-14751-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 22:52:20 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86135F9BE9
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 22:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4898C306292A
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 20:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28DD313550;
	Thu, 28 May 2026 20:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coYrtrWW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3425F7B9
	for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000697; cv=none; b=hQXgToCjBsLtpbNWjEvfyO86nx533+i23QkVOCigw5W1wVEfWjlkbizWyDjkeIgUFbRTWAyuAdSpXRxavPylgiCrBUjIHu/CObHtaEm7J7935HhWBgNjwiLNG2NlOHsfxOk4j2lGLE+iySh8orad5RDqG5fY+ATJyUgtrvCn5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000697; c=relaxed/simple;
	bh=uZkBkcRSO01viivGj5Bs069NFs+5GD0LgM3Ve2OBh/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZsQOG9BvgopnCIbZS58sEGAT4dd27vTFoW2m6odru0+TiPLDJB659czOuwWR4ChLWoQLXIZIPjcThvzWMBePEP+zIsilCvS1csrHJoMu0mhuJ1tpqoR4PRg3LloPrbu9Ick4dHnswiWXaHlM8gJ1vYo7GVnnmjmS94v8jbBhsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coYrtrWW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DA31F000E9;
	Thu, 28 May 2026 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000696;
	bh=e8kxBxwjVFFZ1oyPy8BGbBsvcqLCPECQ61925KiShzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=coYrtrWWImSFBujTYLl14e7Pwi8Hbu/A/I17/lbk/3SShIgcZIdcaPGO8y+ms7d4/
	 DpntBPT7Rsov2bn5VgthwaTYRldxDsaMp6Ze7+g/3W4kK3wNd3WvavKr0i4gRMG2eo
	 kU0Uk+kP34jHEgGXXPPJs2dus1NxGsJz/Z6Ft+Xxtw9Kwm/m9QGNbOCqgGPhprfENU
	 Z+3p7ytE77Sv/lz9TmD4CLR9diX5p82TQOv/RFoz8DhUyvhXbd1oPCjqyn/96//Pxo
	 KxSDpvAEL5CqyhMI3UEOyj8DY6eAV0OqiGrMsnWVt8LEndEKty5VUwqCLMkWMyhpW7
	 9wIeAEWcqLkzA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Populate powergate debugfs only when needed
Date: Thu, 28 May 2026 22:38:12 +0200
Message-ID: <178000068287.183798.14108264637400163133.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522155824.76002-1-jonathanh@nvidia.com>
References: <20260522155824.76002-1-jonathanh@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14751-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C86135F9BE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Fri, 22 May 2026 16:58:24 +0100, Jon Hunter wrote:
> The 'powergate' debugfs node is used to show the state of the powergates
> but for some devices the 'num_powergates' is 0 and so it displays
> nothing. Therefore, only populate this debugfs entry for devices where
> num_powergates is greater than 0.

Applied, thanks!

[1/1] soc/tegra: pmc: Populate powergate debugfs only when needed
      commit: e106029fc8749ff20bbe8c1c9bf6c4570ab8681d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

