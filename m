Return-Path: <linux-tegra+bounces-14450-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKXuISb/BWo7eAIAu9opvQ
	(envelope-from <linux-tegra+bounces-14450-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 18:58:14 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477F545039
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 18:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CE943018991
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 16:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F60346E77;
	Thu, 14 May 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k66JB9HQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B56347BDB;
	Thu, 14 May 2026 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777818; cv=none; b=iYsy8tKjvKzDMPy2cjH9LXrqYncVP0+XSFcVODkFe7CxrAQrduXRoZ4IgXNvolTXX0S570LsbcXrO9/Fjcv9eCRn+4OP5Q+TBjNxnsDAbLPtISp0h+/urJzrcnP4z2gAD/152TTk8AgKDNjSlzBaaXrKVdjAHWDMFvidJOHRqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777818; c=relaxed/simple;
	bh=kSm+/S52pipDtjlNDD/MJuRASnio/MaanOiq6H2wyX4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BA6z4jEx06fJm5Sfkw8ZWi9dE8nQRXHtGOxeyGOOhYZSlG9ANPssKdmCTcgLLi7h3Bp9QZ55GJ7TSwsMDg9EJgP2SdZFu/KTBCgaoDV/pBV9ZdyF77DEZhRFCtFC33qmPNehZwKp1Mg+zeCUXgbT3wcbsCyBtEkykh3ECWabLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k66JB9HQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D304C2BCF5;
	Thu, 14 May 2026 16:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777817;
	bh=kSm+/S52pipDtjlNDD/MJuRASnio/MaanOiq6H2wyX4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=k66JB9HQXyrY9thvN/RiBkW0CDclWW6UFoAHjd7N8MYz+oGFdFJX+tGVvbbypRXkj
	 mrRAaIG+Kha/r78oH9kEAfZFko08t0KoFlOABhGjfH1/xODAAgfkkQFyFVXzfbFUNA
	 yuUL+WI8gxjsigcGRiNr+kUMlP3ccklPLYRuMa1Pn6HxH/Zw1Qt27r36PM0PM/AanU
	 XIlulIIJK9yCjFmPm3/HpIPmyeGkCcDSTgL3J6rCoi0KTiFHAKobLnlaaRp5C8issM
	 mPh5Mi4VOn4UYQmHe4I54A4t0S1n4TfGPSr9AC1+mpNW9ccfV8K5ueA9HxM+tMUwHW
	 AdG/ovjeJyBLA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260504190004.747509-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260504190004.747509-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] memory: tegra114-emc: Do not print error on
 icc_node_create() failure
Message-Id: <177877781610.167934.1191420882061352089.b4-ty@b4>
Date: Thu, 14 May 2026 18:56:56 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 7477F545039
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
	TAGGED_FROM(0.00)[bounces-14450-lists,linux-tegra=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 21:00:05 +0200, Krzysztof Kozlowski wrote:
> icc_node_create() is alloc-like function, so no need to print error
> messages on its failure.  Dropping one label makes the code a bit
> simpler.

Applied, thanks!

[1/2] memory: tegra114-emc: Do not print error on icc_node_create() failure
      https://git.kernel.org/krzk/linux-mem-ctrl/c/67de69ef2a780efd71b222652a048ee6aaf45e42
[2/2] memory: tegra114-emc: Simplify tegra114_emc_interconnect_init() error message
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0a783a6686c96847d74874dbea38fa0e6b1f6c12

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


