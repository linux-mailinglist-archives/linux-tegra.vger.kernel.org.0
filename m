Return-Path: <linux-tegra+bounces-12345-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODIVEsYepmmeKQAAu9opvQ
	(envelope-from <linux-tegra+bounces-12345-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 00:35:34 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E591E6B76
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 00:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55D7D30E0539
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Mar 2026 23:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB04548EE;
	Mon,  2 Mar 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qf5B565a"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3D31E834;
	Mon,  2 Mar 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772494257; cv=none; b=BQ36cgCCFUATd1VIQuh+JKbAfbPub3YoV07NmgXcgYPbTCZyzFj1ayi6COXgIuDJ7tLlOe9oepOduoBwSBa9QN3/II3wRuuu8KgirxpB0IMHSdH0t38lYdhAzM9ZPB60vnfrwgznllEkgOErQZZfmMBmgANAmJo5PkoeQ7NnbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772494257; c=relaxed/simple;
	bh=qmsU7Xp/M/ZXUi4TNY5RnwxzTxzQ7BOzjIQoDY+ml9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZexUiTK3/a9aTl6JKFz4EzhDuq4kEUehjW+kGR5+rSZF3Uimrf3sBNcn3FSnNLQGpQU5Nrf71E6/yfGPCgQh/sH31yhvmhqO66LSxmKdBr74Up53Lv0XZDjSie35ncfQSZBcDuxT5HC3oGybRQWzOeQYfqrtfcOFNxmsOpda0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qf5B565a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37221C19423;
	Mon,  2 Mar 2026 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772494257;
	bh=qmsU7Xp/M/ZXUi4TNY5RnwxzTxzQ7BOzjIQoDY+ml9c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qf5B565a5vtp1Gql+Mh+wMusAwK8X34jGlNAY+cJmpqwiKtV5zoMs8bESV3JGvcm4
	 YMCjWFxuGfLs6tyA0526fgs+GTIelylIIZCNl+OQDbarHX7xWQf3ZG4c4iLb8K6zUW
	 nBw+FUuOml3qiI2/n6L7+iXoXtqYZeojz0h/4jqKoeZ3yFGs+NqEwjDMwDccxSJw+i
	 f8Mfft4TzInpfu/MZe4CVVav8kzp9t9Tr8wS6rMU+k2bR4URrmrMErDap2dpnCfIXW
	 wWwgko4/FSEkQF9k4qXcJkRmD9BSnxtW8+bxtiw/MjOVTi/DJh24lB214642zFph/u
	 V3C83lrBYmPkQ==
Date: Mon, 2 Mar 2026 17:30:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	kishon@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com,
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org,
	18255117159@163.com, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/13] PCI: tegra194: Allow system suspend when the
 Endpoint link is not up
Message-ID: <20260302233055.GA4036827@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223184151.3083221-10-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 97E591E6B76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12345-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:11:47AM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> Only a Root port initiates the L2 sequence. PCIe link is kept in L2 state
> during suspend. If Endpoint mode is enabled and the link is up, the
> software cannot proceed with suspend. However, when the PCIe Endpoint
> driver is probed, but the PCIe link is not up, Tegra can go into suspend
> state. So, allow system to suspend in this case.

Would be nice to consistently use "Root Port" throughout the series
instead of the current mix of "root port", "Root port", "Root Port".
Using "Endpoint" is also nice because these are proper nouns defined
by the PCIe spec.

