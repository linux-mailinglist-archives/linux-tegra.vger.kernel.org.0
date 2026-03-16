Return-Path: <linux-tegra+bounces-12796-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJpQGndct2lnQQEAu9opvQ
	(envelope-from <linux-tegra+bounces-12796-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:27:19 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F9293614
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A5AA30054DB
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 01:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E276B21A457;
	Mon, 16 Mar 2026 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jsq8VuCV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0C7263B;
	Mon, 16 Mar 2026 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773624436; cv=none; b=KKuFIpaYJcsvSC1Qf4lse+duhmbl39I4i0iEzzKHpmBhW01u63NBYChS8gfS8TrDaFk91jwKuLSbRaxqMCH/4y982TMQ/yICvytssupeHoGStPSyCvVMkzYY1UR7b0ebhr/xEkeTtiRtxyEAUgBoOJrPnR+vxfAuYCJ8K9FKCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773624436; c=relaxed/simple;
	bh=t/AIBpxMiawDFvHssxaWNPhQlGV2JTkgV0WTvdQ9Uc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNRo9RuPEVkTn6odAhn8+D5lKUlgTNX04nBfTwbS3RpeiaUh/6byAGtVthUxOiZUXgU661wH11E1+SuDbUkKr6tXjl0un9lpJjB2ihFaKt3Yz/e+x9EXrLgC17Xw39hutXKyDErV01jZ+g5wf/2a/BcF76sb/3bFm1/aKcbJgF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jsq8VuCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2ACC4CEF7;
	Mon, 16 Mar 2026 01:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773624436;
	bh=t/AIBpxMiawDFvHssxaWNPhQlGV2JTkgV0WTvdQ9Uc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jsq8VuCVJbSP/qXnWz/q4L/BKEGsrWyot8bvkyKSKONl14zt5VHh3Af323UklaonC
	 u4LpnCRJ17o0ZbaSDf0PgzUgxS+VDLLVIrbZ4s80hmIPj/E7a/o1yQz8qdKVajpCO3
	 Z3CX4saMJrF0rwz7XoQftXCMaC7GAzigglkbS/EJvgeHO1WoukK+doQLzOOf7mCTtd
	 6zUo8LmkZ90UKVwrN22TGBKjMM1tq+sGL5JEyidh/YXAd4+WiKf8Lyh3OcaqkNQ1vN
	 rrFC2daYjS7Jgp40qR4iBMHCCzmT9kCS5r0V5zTLjDWz0TpkJh2kPLgPzLEFyqAwIq
	 H6jbrfdaeo5EQ==
Date: Mon, 16 Mar 2026 06:57:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "kishon@kernel.org" <kishon@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "den@valinux.co.jp" <den@valinux.co.jp>, 
	"hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	Vidya Sagar <vidyas@nvidia.com>, "cassel@kernel.org" <cassel@kernel.org>, 
	"18255117159@163.com" <18255117159@163.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 06/13] PCI: tegra194: Disable direct speed change for
 EP
Message-ID: <j3oj7jf26nhpj7jzrt7w7wjcyasmljuxoz2dleeslw54bf2kbn@krtyxnvymqtz>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-7-mmaddireddy@nvidia.com>
 <4zxcmzsm6l3zbz4pblp7c67xpn6q6okpqcilupv6l22ce4gcno@b4htj36ngr33>
 <4db20e18-c34b-431b-b65d-c94312d73335@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4db20e18-c34b-431b-b65d-c94312d73335@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12796-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 084F9293614
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 07:14:14PM +0530, Manikanta Maddireddy wrote:
> 
> 
> On 05/03/26 3:13 pm, Manivannan Sadhasivam wrote:
> > On Tue, Mar 03, 2026 at 12:24:41PM +0530, Manikanta Maddireddy wrote:
> > > From: Vidya Sagar <vidyas@nvidia.com>
> > > 
> > > Disable direct speed change for the Endpoint to prevent it from initiating
> > > the speed change post physical layer link up at gen1. This leaves the speed
> > > change ownership with the host.
> > > 
> > 
> > Why?
> > 
> > - Mani
> In pre silicon sim tests our HW team identified that Endpoint is trying to
> initiate speed change after secondary bus reset. So, our HW team recommended
> to disable direct speed change feature in Endpoint to keep the speed change
> control with host.
> 

Please add the above into to the commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

