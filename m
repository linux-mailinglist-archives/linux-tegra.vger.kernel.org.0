Return-Path: <linux-tegra+bounces-14787-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDLKFs+IGWr4xQgAu9opvQ
	(envelope-from <linux-tegra+bounces-14787-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 14:38:39 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7C6025A2
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 14:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255D3309B1CB
	for <lists+linux-tegra@lfdr.de>; Fri, 29 May 2026 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54643E0C78;
	Fri, 29 May 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkWKjCbW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE73E1204;
	Fri, 29 May 2026 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058241; cv=none; b=gXcj0vFNM2L6hO++XkOX2aIpRcFSIBcPknLWQpqIO2dTm8yr3Ysskq/e4t7/hiYiAGO8Frqhv7crNIcttepjV1TpHM+t9dNECgzKeYLgNqlyZ3jNiYiuqzHnKf/64aNJYy73TMlWGSx/3NF9yWNOmP1TvnrV2X/HW4jp41VKueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058241; c=relaxed/simple;
	bh=eHFScpAOdMrqojmGK/E723D+P23UVdgRtOAMGWS1sG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jna513vzjhE84t2gPts1Wld9NLXnXY7JhgChodl3yVc0Kr0llocxMydWmZ11hRgWz+rs5RedzMELKbv+TfkgdRvO2FJff/gD3Q/dzdNAUYWQVVHyvKMscLT3Tvi3JXl+J2eUAA2c6HPcLN09MITpihi0v4NOekYpcugBPtttOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkWKjCbW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADF71F008A0;
	Fri, 29 May 2026 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780058240;
	bh=Kn5GsKuQ/fvZEMiPmPauH+TfJVQazix684zDCw+pVjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BkWKjCbWPQ91PfRJqZH3Uc/nXSgrDB+BFBgIPJy5pc2xKLfUOYFxTRyuH0/23MMUk
	 zCvp1xTncX/AAwAAsdE7IXdJFawFd8MCS8j6MA7G+mSwDZflbRsx9e/MGkYxKWj84e
	 f54c4hWuaSz/CkIPoWOTe35tZLKgwHZxH1OSYoTmklF30icTgtHxrnOVN+as7ScqVz
	 3sSGmD4anVrg4LPhKYGP7fRB6/K83Va9HS6hKxwGd4+i33Z2IvPTK+W76wRNHvSyUn
	 hHGgDGAs0j/D/6haoXmQBgre9VFzJDsD95HorxyosqwJ0YrBka3yPiXVGI4WlDCB8E
	 fCHCeBy1wnvqA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/9 RESEND] ARM: tegra: complete a few Tegra30 device trees
Date: Fri, 29 May 2026 14:37:14 +0200
Message-ID: <178005821444.3449763.1615664087011062727.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14787-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,agorria.com,yahoo.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: D4B7C6025A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Mon, 11 May 2026 10:48:50 +0300, Svyatoslav Ryhel wrote:
> Configure camera support for ASUS Transformers, Google Nexus 7 and
> LG X3 devices. Fix RTC on LG X3 devices. Lower throttling temperature
> for LG P880. Add panel support for TF600T.
> 
> Ion Agorria (1):
>   ARM: tegra: p880: Lower CPU thermal limit
> 
> [...]

Applied, thanks!

[1/9] ARM: tegra: lg-x3: Complete video device graph
      commit: 8399055d9f98e94c33608fe9d61afc09a43cc4df
[2/9] ARM: tegra: lg-x3: Set PMIC's RTC address
      commit: 61cf0112f79d6c6de2a002874b8618e802b664f2
[3/9] ARM: tegra: p880: Lower CPU thermal limit
      commit: ece4229e457de4ceeec80890c5c760f0c858eeea
[4/9] ARM: tegra: grouper: Add support for front camera
      commit: a5acde8adb4d4d921a004b8df995d50255253afa
[5/9] ARM: tegra: transformer: Add support for front camera
      commit: 34d89435081d07b052dd522a57054132dada5400
[6/9] ARM: tegra: transformers: Add connector node for common trees
      commit: 5333a49e51c2d0d5fe1615f721898036733ed5b0
[7/9] ARM: tegra: tf600t: Configure panel
      commit: 2ecff0cda80b9ba0e513620003d156cfef7394df
[8/9] ARM: tegra: tf600t: Drop backlight regulator
      commit: d9c890d753034adcae0f74de578deed60d58233a
[9/9] ARM: tegra: tf600t: Invert accelerometer calibration matrix
      commit: 774bc2764647cfd6b65727cfa978d809f11df392

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

