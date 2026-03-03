Return-Path: <linux-tegra+bounces-12412-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEPNIG7npmlWZgAAu9opvQ
	(envelope-from <linux-tegra+bounces-12412-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:51:42 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10321F0C31
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C07D304FC1A
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ADB31AA90;
	Tue,  3 Mar 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9QEoSvR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4BC2F5A06;
	Tue,  3 Mar 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545612; cv=none; b=SDqxklaLC06amTAdWMcUHr8UpUieizM1SAkH2cPLM/ewHpcblLzw85qowbIO78v+nWNS+9yVs7rHsq/tgeIrsjX5lhl53+qeQzFs5No5Vc5ZSUTe2uYaM2JlNtdt9Vy0OAgyYkrP85P4YtEyDVZf695y15LeoHA4ErAw6LZ6Y6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545612; c=relaxed/simple;
	bh=eeJCjoio3Z7PYW8zPTxB90lfcjKBpsIHjf2YdQUK390=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBq+UQUSWoXl9FtvdGQ4ZyP5YH58xvggcgAeSsSZspHazz8MBZmeKx/wSaie4+gZzVq2kBzHXU8jB8Rtm4MUTtPB4qcUC+IZmUEDBEU/kODLiKj//uDsObJUlG4to2R7Ytx6FjVKQXbASkpKsMVR0923EnuKiEepgyjChBMPZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9QEoSvR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6DBC116C6;
	Tue,  3 Mar 2026 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772545612;
	bh=eeJCjoio3Z7PYW8zPTxB90lfcjKBpsIHjf2YdQUK390=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9QEoSvRxxrmrAjzjmwQB9kzPinIm+/SQoZx3uz+g+xbAvkfDWR//JfGgC9gMbHpX
	 WIWDj5K12XZxBrGCnLef1JZqUhws7HXYYpoxa4TqjoeVhS3lhrahc6shy7AE7imGBN
	 6BjhM+gLx1IrSvcFKEpjqMdZbu46jAunKP9sp/wze5rcpGGLVr3B8SEdk5Jeh5XOkc
	 pqGisx35C5mQjOG5WrmfnbfNIYVOSrqq1QSCkdlNeZhu4FLnX99i4EppPVyunvGelR
	 yQVbUQR/WZMFz/9qbMW9g3zlmdf+kgJTH6X3q97zKfDu8fBOTqdqclUkBTOpsJmhxC
	 NGJr5Xf4nAbxQ==
Date: Tue, 3 Mar 2026 14:46:45 +0100
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
Subject: Re: [PATCH v2 2/5] PCI: endpoint: Allow only_64bit on BAR_RESERVED
Message-ID: <aabmRaW5oKuNt7_X@ryzen>
References: <20260303072004.2384079-1-mmaddireddy@nvidia.com>
 <20260303072004.2384079-3-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303072004.2384079-3-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: B10321F0C31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12412-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:50:01PM +0530, Manikanta Maddireddy wrote:
> Remove the documentation that forbids setting only_64bit on a BAR of
> type BAR_RESERVED.
> 
> When a reserved BAR is 64-bit by default, setting only_64bit is the
> most accurate description. If we later add support to disable a
> reserved BAR (e.g. disable_bar() for BARs that were never set via
> set_bar()), the implementation will need to clear the adjacent BAR
> (upper 32 bits) as well; having only_64bit set documents that
> requirement.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>


