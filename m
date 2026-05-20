Return-Path: <linux-tegra+bounces-14584-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDeeL87gDWoN4gUAu9opvQ
	(envelope-from <linux-tegra+bounces-14584-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 18:26:54 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F102591F08
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 18:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF53C301AFE8
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D85D36CE19;
	Wed, 20 May 2026 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aanMXZa4"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE126362139;
	Wed, 20 May 2026 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294332; cv=none; b=nqjdgjDFtMv0jlMIZqucdrE7c3l4YZxhStubiCCUdqST94byBIvHvYX4FFlKuaAykSTI7LZZrv+6ESASjM+xjMrpHdGkYYKGDrLAgdC+EegCop3RUsYw2hkJJxYl0DNNszmBs3e0WahCJy13qgLHw/EYIYoAKuYkqfVFcCr6Zpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294332; c=relaxed/simple;
	bh=YEWrvan9cy2HLEkIqwMVXNXQKSp1e6cd4QNpuA+xn6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bnFZ9prbVmkcFQsuI3lKGsukME/3YtNK+julMDR/30to+L8TNeiiypYoQ2B9wFGhQRipmxQVaGHDlBQgpXxUtO76bJ7XyjDULZCVhtBDsyBdQTdAJJg290urufmzkSKVoYAGKvR7h/IIUC60O+erxWd7H+zKvDItPSBjvBjlRYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aanMXZa4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6F01F00897;
	Wed, 20 May 2026 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779294330;
	bh=dJe+n1FEYiHGIKYKtgQ9xuvzcbmY3aEwUNiPZ+AEOkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aanMXZa4UfmwVMlkgxnCkJS1MXRvSj13HrBieCfkEdl+p3nM+arGb+6qJt4Nze0fC
	 f3SlGG76p/FQ1SmAMn4QRmR3ogx5G+fpTWaw4rsvzU5ct7E3d/rtsJ0NdYcXVVVzNP
	 OKDU/9axV5prL06AFOEiRa+rSdkrbrmHC6NVXHHyITa1Xuo9UlrE/k0FimrFRsF71A
	 ZNxrejQ7WFMES/SfFQPBzfCMHNc06KReILVrYjeYD9zoBXJk9Hfw3fkk09BoqkyYW0
	 RhFD+m4Z2gnYjDNTPxj+ZJyQ8p2l/Dz2A2HYBCxskUpCxgqX/8RZu5atJQ4zsazai7
	 S1xWRUVcxZJoQ==
From: Lee Jones <lee@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-Id: <177929432727.2891971.15568098895295536822.b4-ty@b4>
Date: Wed, 20 May 2026 17:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14584-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7F102591F08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> This series migrates PSCI and MAX77620 poweroff handling to the
> sys-off framework and fixes shutdown on the Pixel C (Smaug).
> 
> The first two patches replace legacy pm_power_off usage in the PSCI
> and MAX77620 drivers with sys-off handlers. Besides aligning both
> drivers with the modern poweroff infrastructure, this removes the
> global callback dependency and allows multiple handlers to coexist
> with explicit priorities.
> 
> [...]

Applied, thanks!

[2/4] mfd: max77620: convert poweroff support to sys-off API
      commit: 1ada6d7f88063dd6fd92d74d0b803875b695fe01
[3/4] mfd: max77620: override PSCI poweroff handler on Pixel C
      commit: ea3f90bcc8524c6d514f6b8183cc202b79b082be

--
Lee Jones [李琼斯]


