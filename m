Return-Path: <linux-tegra+bounces-12413-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKrmM5PopmlWZgAAu9opvQ
	(envelope-from <linux-tegra+bounces-12413-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:56:35 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 522C21F0D75
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA539316D47B
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 13:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FC234F462;
	Tue,  3 Mar 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuqkxPjs"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FA334028B;
	Tue,  3 Mar 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545706; cv=none; b=MiQgBphtT8M5yZwtfufsi6FDE63hrGhJzwFwHuElVYGIKhLT3TgoPqLBeGNusLynSOFy7H/FPiIsqu0ObO5cifloAcTpWe92em62zy/nD9eUMheRg20Uket3mnJHz4gqYf2dTjfFhTxsA9tXAzQtSH1oGM922yjwL+5vKOAIRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545706; c=relaxed/simple;
	bh=Nv9QGCuxzJxNLrbHAf2jEmd+KvBLC7b1ZhulIs4yRng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep+NPs0jSDPZc1rSYoXE8xCmYfltqad7Qv3zL/7MqrVMol3Lkfg3BLeDYaXaN9FJnJUgh2poyTQjKBhIOWzkv+E+ypyStX1K5/uIkM94BcKtABQOR0mR/kC3OBBJaKYvVjHLuzLBopozjp52Oo+nDjMm5jPAsIPKTWV/7tcH0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuqkxPjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7EBC116C6;
	Tue,  3 Mar 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772545705;
	bh=Nv9QGCuxzJxNLrbHAf2jEmd+KvBLC7b1ZhulIs4yRng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuqkxPjsqWMSsJd9vnHJsI2wm4QzIOjBxzUCtUzx+8W98zohVBIY/Yo/BiXf7IMJs
	 gV1zm2f5se1J0qI0gKcmCm/9EnwBZsf99mRAkhYH25socv3xkAupbOfVGo3eN5yk8G
	 rauEeKSgxBhiX1VSqI6UbbN8Vot3opXwBEnZiqNXriDByWw6d7vr1R8KHnH9jzgCN5
	 9LDFKoRi+pitmEU5AHKdPjm4GWw47KRA52B1DCKBGEcyxu9/526mdkH4+f/X92tYLH
	 eQ854sImakoSy0pnY3BxQ59i8PTQZcgcZPFroIBTAysFiIF4+TEk0PDwjt11TdiRVM
	 Edh8V+rNewoFw==
Date: Tue, 3 Mar 2026 14:48:18 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	kishon@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com,
	jingoohan1@gmail.com, vidyas@nvidia.com, 18255117159@163.com,
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] PCI: tegra194: Make BAR0 programmable and remove
 1MB size limit
Message-ID: <aabmor86XBhWf88Y@ryzen>
References: <20260303072004.2384079-1-mmaddireddy@nvidia.com>
 <20260303072004.2384079-4-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303072004.2384079-4-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 522C21F0D75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12413-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:50:02PM +0530, Manikanta Maddireddy wrote:
> The Tegra194/234 Endpoint does not support the Resizable BAR capability,
> but BAR0 can be programmed to different sizes via the DBI2 BAR registers
> in dw_pcie_ep_set_bar_programmable(). The BAR0 size is set once during
> initialization.
> 
> Remove the fixed 1MB limit from pci_epc_features so Endpoint function
> drivers can configure the BAR0 size they need.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

