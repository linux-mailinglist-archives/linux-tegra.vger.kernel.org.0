Return-Path: <linux-tegra+bounces-14074-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAUBHOgN82nZwwEAu9opvQ
	(envelope-from <linux-tegra+bounces-14074-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 10:08:08 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C210149F0FD
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 10:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0379A3003808
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2026 08:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995CD39DBDF;
	Thu, 30 Apr 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcoGHE0f"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771EB1E1DE5;
	Thu, 30 Apr 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536482; cv=none; b=ZbIJpE3o7ZBZHpjA4SZYMM8RLFGOsvzEVNh8l9OR673xCjMXuMbsJSvMWCleA/gM1LaHV+/ogyP/8MJ4l6Gzw0Vc97j4UBWsNiY+oMkq8ESGr7rFGp8Fy1MfSlqthyTbBwZWRdiMr6KkjA/39KgOv0YYC6gkEEg0Qs9651ZpUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536482; c=relaxed/simple;
	bh=FgbC5QOm3/4kJbsD7CJ94ymQmwx3jyGbD80Nia62UQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kS3XnuHeaWmVvHDqfp/JEVW4u/J6GI5/APKgG+usoBbqdQ9/vSRXnt4E4ppjGKUbnICFuTHtVcQdtSBTTxvWFTKDILny89gMD0QllmNMPe6mSlgA1TQRBobIqWg/ZhjpdvuyptibaQLnKtC09ORW/EH4zlgDPNYIRGn7FKjENCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcoGHE0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7931C2BCB3;
	Thu, 30 Apr 2026 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536482;
	bh=FgbC5QOm3/4kJbsD7CJ94ymQmwx3jyGbD80Nia62UQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bcoGHE0fxDgHj6uVJLHwAP30yOMVc5lMGwyunIwODscwP/PYonFsd8/3dtyEIgeE2
	 EIwHux0OQKKZrCtU9ixd2mR+mHCR3MDMHnHYNfLQZ4hqRp4iIrWBFjIvcpM6xx9/o7
	 sb9Zr0iFc1XdqNOiWVCserLToEZGf50HvjwixcZeND++a7m+CN0iGpfSufZPF25Mb5
	 SUAdwy69XL3yxOgB8XJUafrkCTeUzIxP+RRvJahhk9R+ySr2pj1IFMekxyMQ/P/Uv0
	 acMAUei8u/1lgg+W05qU6dSbgwyRQ1n18GyBx8yg4G3uPDUNeF/X9iy61qbXmjn4jg
	 1vjZ5NF3zMsTg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Sheetal <sheetal@nvidia.com>
Cc: Mohan Kumar <mkumard@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: tegra-aconnect: Use dev_err_probe for probe error paths
Date: Thu, 30 Apr 2026 10:07:54 +0200
Message-ID: <177753646553.4064065.6000698741466892956.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318071129.1758058-1-sheetal@nvidia.com>
References: <20260318071129.1758058-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C210149F0FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14074-lists,linux-tegra=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>


On Wed, 18 Mar 2026 07:11:29 +0000, Sheetal wrote:
> Convert probe error handling to use dev_err_probe() which provides
> proper handling of -EPROBE_DEFER.

Applied, thanks!

[1/1] bus: tegra-aconnect: Use dev_err_probe for probe error paths
      commit: 36df0ef3b4187c69c271af7a1d56f7abb788655e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

