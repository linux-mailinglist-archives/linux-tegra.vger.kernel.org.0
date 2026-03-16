Return-Path: <linux-tegra+bounces-12803-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ISSLbl4t2nxRQEAu9opvQ
	(envelope-from <linux-tegra+bounces-12803-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 04:27:53 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEB29467D
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 04:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD6B03012E84
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 03:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F7A31E847;
	Mon, 16 Mar 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2dvlI19"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB0182D0;
	Mon, 16 Mar 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631670; cv=none; b=GkSHV3rOI78YLUNsPWNMuPr41KwI/fwRpZwm/ig6d2uKbTdQkKcUZrwYwA4cU7Lo+nZ7Rfi2nbY3/NHPj/rrh/vr7yey8syPTs05x0Ep8Oi8crBrWEjGPx2fyoYTaiUwvCYEQ1lusuVxmuQeuPUvCwjq5EgpvCdxdZf1Pfnix5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631670; c=relaxed/simple;
	bh=AOgND3p+CR+S1EUIfKeLAa9CnzejQMKxAGn7CsaMW5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1L0SQ511GvCBw+7dzyV/89po/mbQ8lrFu1g+D7fj5jlGI/EKeY+tnJFRMqvruCmBT3AfqL0f8LRgfpbGCmj3DdY3rG+D8S6jrF2Q1RcjT8xCK1ReJQwqup3FCX6cXpXT2olmXHAQFhEr5oYBFEPs5UDfJVuOmwr+fBckzK3xNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2dvlI19; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA062C19425;
	Mon, 16 Mar 2026 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773631670;
	bh=AOgND3p+CR+S1EUIfKeLAa9CnzejQMKxAGn7CsaMW5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2dvlI19D73CnrYW+5tfy016wwY8NWFb78PXbWYCv/M44Q1sLCGXcedni32BcBksf
	 3DS+c63m1tjIQljFK49eqxZLv/WSxJAAyQ1+HVo2ViYbYTHfHtRdtnPX61PmCATGI6
	 87rvKqPnoqO4lwRoqGJ3f7lej4HaxMQy/Oa9OTWEenitmS3ek6tx7v0ILmlAZwe0H9
	 eLf7+BGtgJCHvx00toPH96KjaXpzrzv5yih6kD3Atw8EJp/t0mZk7xvaxiTZgeRdKE
	 hv8+/BRJaRLknKKcKLQ9TDJTSwl6N0xS9tlQVQH54xgst83zVP78ckZC9qPgXl3ZCJ
	 9/dxikA1Qjmgw==
Date: Mon, 16 Mar 2026 08:57:39 +0530
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
Subject: Re: [PATCH v7 2/9] PCI: tegra194: Calibrate P2U for Endpoint mode
Message-ID: <kkxlwgdtthaelnbrk5svjxkprhidymyxwd3ryeausabbtjllf4@msanys6p2oav>
References: <20260303065758.2364340-1-mmaddireddy@nvidia.com>
 <20260303065758.2364340-3-mmaddireddy@nvidia.com>
 <x7w2a766h4m56kocibxz24uwjdlssbccg3z2pfcse4prk6c6fu@xwz7axizktyv>
 <761e473a-983f-40f8-b141-8d648be8497b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <761e473a-983f-40f8-b141-8d648be8497b@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12803-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 4FBEB29467D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 10:47:55PM +0530, Manikanta Maddireddy wrote:
> 
> 
> On 05/03/26 4:29 pm, Manivannan Sadhasivam wrote:
> > On Tue, Mar 03, 2026 at 12:27:51PM +0530, Manikanta Maddireddy wrote:
> > > From: Vidya Sagar <vidyas@nvidia.com>
> > > 
> > > Calibrate P2U for Endpoint controller to request UPHY PLL rate change to
> > 
> > What is P2U?
> > 
> > - Mani
> It is pipe to "universal PHY(analog PHY)" wrapper which connects DWC core
> and UPHY.
> 

Okay, please expand it in commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

