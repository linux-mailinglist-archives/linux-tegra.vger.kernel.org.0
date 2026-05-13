Return-Path: <linux-tegra+bounces-14416-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nL5GBQr6BGrCRAIAu9opvQ
	(envelope-from <linux-tegra+bounces-14416-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 00:24:10 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FC53B692
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 00:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B5A33019E7C
	for <lists+linux-tegra@lfdr.de>; Wed, 13 May 2026 22:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5C838BF6A;
	Wed, 13 May 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzfIePoL"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75FE35E93B;
	Wed, 13 May 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711045; cv=none; b=BLy0Y3oHTHbUcK/4z5M/bmSyXIQLg/+anDYUSHnmgOnpdOkp0zwStey3yLqaMq+Fdx6U8DiBolVdhw6jq/4/xQtMXFaflu8Uh5QzHLdKRYlsrYCpJz0Jj0XeChE+N6Q94vsgog17x51M879f81E76z6Bq60x/BuJcNffRCKRvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711045; c=relaxed/simple;
	bh=TrjIEfJqR8ctuyQ5U7JwYUuPzyoGPW461OVJfadSlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4L5r0znk+QH4nchndOOTF79CEo4s+hU+423FxzADhE8NMvD4kZgMDcSKFF/X8BdV+TJ6LUxIxcVoJMVDl0+iYmxrHrAAJg2Vh3OsofGPJ4dekIFqFIHNBBg4aS4wzHmrF9BSDArsLKlVfp1Bv3zgex7nB54rU1uUKKAY8XwyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzfIePoL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E958CC19425;
	Wed, 13 May 2026 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711045;
	bh=TrjIEfJqR8ctuyQ5U7JwYUuPzyoGPW461OVJfadSlWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzfIePoLR7SzJhAOfeFED6hPo4WKkA0akMIyLJBH06QcE56di5L3igcbNymVAaMTw
	 xN4QfeUWJUiw251ukoJxHkyy4I77yI497GlHZ7wkkfg25zLRILE4EvnqN56KqZVyMt
	 fmlg5HkU1tfnmdTpqGCri0XL5mmXCP8JX/ptsYyVRHF8bm2txIHgy2VbAYea7XcpMB
	 nTn3qCcoTYQXg5BexYYqfYAXck0/aaZZazVddGX0O432LZEAIbFC1LDj63wB0w8xGq
	 YqpzK6xvqqEGMOc36Zbw91uDaTEPB2dXm+XdYACjH/NdC5rFWbgOanHOQXaZ6+0TAi
	 9Ae6oc4iOic1Q==
Date: Thu, 14 May 2026 00:24:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Saurav Sachidanand <sauravsc@amazon.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] i2c: tegra: fix error handling in tegra_i2c_xfer()
Message-ID: <agT5mMELzPZRBTQv@zenone.zhora.eu>
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507221145.62183-1-sauravsc@amazon.com>
X-Rspamd-Queue-Id: 665FC53B692
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14416-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-tegra@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zenone.zhora.eu:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Saurav,

> Saurav Sachidanand (2):
>   i2c: tegra: fix pm_runtime leak on mutex_lock failure
>   i2c: tegra: make tegra_i2c_mutex_unlock() return void

merged to i2c/i2c-host-fixes.

Next time, please:

 - don't forget to add me in Cc
 - to not nest in the same thread different versions. It would
   have been clearer if v2 was in its own thread.

Thanks,
Andi

