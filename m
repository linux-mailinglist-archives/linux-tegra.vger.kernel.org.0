Return-Path: <linux-tegra+bounces-12798-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MmqfFYFdt2myQQEAu9opvQ
	(envelope-from <linux-tegra+bounces-12798-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:31:45 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA25E29364A
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4126C30054F9
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 01:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4557514F112;
	Mon, 16 Mar 2026 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCBjGgXY"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F84946C;
	Mon, 16 Mar 2026 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773624702; cv=none; b=kjh+UzNu07jLevJ75LBfO5BW0hnwhUMjrQdjm97QH2zU5H84BUQasqDCk5uXBQUklyRJp55MQWAGW1VYZvCCOIWqUv+HQNnKVUwCbFrGIZSRP3Bp5rvfFYdg7L2i3vxifPpU+dOF2kwne9lisEqyUHjzMMkOxZoOrkzS+15tl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773624702; c=relaxed/simple;
	bh=X8cCdZbBy/uTCoH54FdUwoeMK4n226fZFOcKPEkcYfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXvzyCycHB8plgtcKK+Xh8wOaQlnekjgAradcG4rFwfUV4M2lfHfbPNm8onNKJztsZ2Y8CHxXscBo5hrrM79wiwVxdIjRCuAQvzpaKJh7VsghTsA0LdMPmn+bL/IBvoamQijXdVfDCnHtmmY749RCmf3UDPEhlO5/EhHoXDikcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCBjGgXY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30761C4CEF7;
	Mon, 16 Mar 2026 01:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773624701;
	bh=X8cCdZbBy/uTCoH54FdUwoeMK4n226fZFOcKPEkcYfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCBjGgXYoJC9jgNbzYssieOKxDW5dinqe6YS1XM5zE90l2d/en8l7SO35m8PEI/Q5
	 FZLLfA0MexhghHA4nxrKFwKebeHZCGxALBRXWShq0aUI4de+y59IJFt3msUoE2z9cu
	 +mwgTSMj8ZszwVhqemhDasCAtght+5JqRVY/KouStdlLbyh6137Zea+eCVbqK4uxpc
	 i+g+a6wKG1Atji/5UMFXpjyEiZeZrGGZ/xwo0YbDtM4iz3/yMBDYvatMrUEyOnnOOR
	 uygtUZEZrBYJKtgbtUWGIB+Zlp/gg/0Wv/5lhQ+nknQivIaaNk1oi0nMHFbkc8+wZv
	 yiX8dx1745/0Q==
Date: Mon, 16 Mar 2026 07:01:25 +0530
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
Subject: Re: [PATCH v7 08/13] PCI: tegra194: Apply pinctrl settings for both
 PCIe RP and EP
Message-ID: <gnescgbeasa6x5orwtji76qia4e7pwmjsjiehq6ox2a2apzpxq@cfwwzkyjmdlo>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-9-mmaddireddy@nvidia.com>
 <gui4y7vjc4f5brtjgsfvqdn2ig6kw3tsiinrijweltgeukiwdy@2zqe2orx6pas>
 <0471cc77-3173-4987-8d9b-fe089a038bdb@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0471cc77-3173-4987-8d9b-fe089a038bdb@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12798-lists,linux-tegra=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA25E29364A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 07:24:48PM +0530, Manikanta Maddireddy wrote:
> 
> 
> On 05/03/26 3:49 pm, Manivannan Sadhasivam wrote:
> > On Tue, Mar 03, 2026 at 12:24:43PM +0530, Manikanta Maddireddy wrote:
> > > From: Vidya Sagar <vidyas@nvidia.com>
> > > 
> > > PERST# and CLKREQ# pinctrl settings should be applied for both Root Port
> > > and Endpoint mode. Move pinctrl_pm_select_default_state() function call
> > > from Root Port specific configuration function to probe().
> > > 
> > 
> > Why should this driver care about setting default pinctrl state? Why can't it
> > rely on the pinctrl framework as like other drivers?
> > 
> > - Mani
> 
> pinctrl framework doesn't know if PCIe controller is going to be configured
> in Endpoint or Root port mode. In Root port mode PERST# signal should be
> configured as special function IO pin(SFIO) and in Endpoint mode it should
> be configured as general purpose IO pin(GPIO). So, PCIe driver should
> request appropriate pinctl values.
> 

So you are saying that irrespective of board design, you can configure the
controller in host/endpoint mode? Is it possible? Dual mode controllers are
quite common in other SoCs, but they rely on devicetree to either configure the
controller in host or endpoint mode.

If the devicetree enables the endpoint node, why can't it also define the
pinctrl config?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

