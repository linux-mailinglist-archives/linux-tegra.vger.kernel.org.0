Return-Path: <linux-tegra+bounces-12806-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCZAKXOGt2mOSAEAu9opvQ
	(envelope-from <linux-tegra+bounces-12806-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 05:26:27 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 509AD2948AE
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 05:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D5D3010519
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 04:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5834732A3E5;
	Mon, 16 Mar 2026 04:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVvpFCxD"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3627080E;
	Mon, 16 Mar 2026 04:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773635183; cv=none; b=KmFzo36Yb7lceIUFWDcNlgqYOZ7Opt+9GMpXM4/rhD9RpiPLwF/6tJ29QpahzkH3bMocQKO+7rqcu/hwbTPlU4Rk6kn6BttrxK4hpG8e6OeEi9G0qHKtfOUg/rmmb0NGgZZOSJXEguMLlde9DouG4RPENvvYlLlNmEez8kH5K/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773635183; c=relaxed/simple;
	bh=iuVhqG6RCjRwVAIJGdZr4PmCzqkW2cCynqfKuUWPaOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv6Oo0Y4fFfC3XuChdn010wYVzYVSbL8axDCcHY54SND/BbF8SlI55vZzEJSOPFT+dTUnRlyqo8bY8wnBpZtZeTOX2wX8/7XKevpsHTmWmLfseaC9idiR5VTDc9RbDG3yJovGLyQMQIU0epF660xu4DQFWRulz9rDndQIWGN7xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVvpFCxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACCEC19425;
	Mon, 16 Mar 2026 04:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773635182;
	bh=iuVhqG6RCjRwVAIJGdZr4PmCzqkW2cCynqfKuUWPaOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVvpFCxDPz9K541nFbIAFB2T00JF20SCbQNWhBlUERF1MBfhUk7wQhGdvieadeOhc
	 x43hlHHfqP8ENbckY7bwu9D2e4kC3roS/Zd/xa6aSVwlkhFW3bHv4QP6d9jgQdF4tv
	 7z3pMxjWoVoLnn8XNY5wY3DcCbWhaLfzAgMDEHYrWvsriJFCKh/jD8aNt4xDrLBM0Y
	 4BuYpCpRNcqgC50+gCxHZIHd+CaDk7zIFB3+z35v52b5Fesb8FTDotLJY6BZgzNLTW
	 kqxdHuL2+tSIBHW/qrQqWiogV10qBP9x4+OtMThvctXvlPoSl3VbJf8/VQPRLHh/ae
	 SJFNhIh9++tyQ==
Date: Mon, 16 Mar 2026 09:56:12 +0530
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
Message-ID: <o5sxxdikdjwd76zsedvkpsl54nw6wrhopwsflt43y5st67mrub@uuw3yfjfqthd>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-9-mmaddireddy@nvidia.com>
 <gui4y7vjc4f5brtjgsfvqdn2ig6kw3tsiinrijweltgeukiwdy@2zqe2orx6pas>
 <0471cc77-3173-4987-8d9b-fe089a038bdb@nvidia.com>
 <gnescgbeasa6x5orwtji76qia4e7pwmjsjiehq6ox2a2apzpxq@cfwwzkyjmdlo>
 <b60bd5ae-eeb7-4e17-801c-5791f6bbf0b3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b60bd5ae-eeb7-4e17-801c-5791f6bbf0b3@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12806-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 509AD2948AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 09:11:53AM +0530, Manikanta Maddireddy wrote:
> 
> 
> On 16/03/26 7:01 am, Manivannan Sadhasivam wrote:
> > On Sun, Mar 15, 2026 at 07:24:48PM +0530, Manikanta Maddireddy wrote:
> > > 
> > > 
> > > On 05/03/26 3:49 pm, Manivannan Sadhasivam wrote:
> > > > On Tue, Mar 03, 2026 at 12:24:43PM +0530, Manikanta Maddireddy wrote:
> > > > > From: Vidya Sagar <vidyas@nvidia.com>
> > > > > 
> > > > > PERST# and CLKREQ# pinctrl settings should be applied for both Root Port
> > > > > and Endpoint mode. Move pinctrl_pm_select_default_state() function call
> > > > > from Root Port specific configuration function to probe().
> > > > > 
> > > > 
> > > > Why should this driver care about setting default pinctrl state? Why can't it
> > > > rely on the pinctrl framework as like other drivers?
> > > > 
> > > > - Mani
> > > 
> > > pinctrl framework doesn't know if PCIe controller is going to be configured
> > > in Endpoint or Root port mode. In Root port mode PERST# signal should be
> > > configured as special function IO pin(SFIO) and in Endpoint mode it should
> > > be configured as general purpose IO pin(GPIO). So, PCIe driver should
> > > request appropriate pinctl values.
> > > 
> > 
> > So you are saying that irrespective of board design, you can configure the
> > controller in host/endpoint mode? Is it possible? Dual mode controllers are
> > quite common in other SoCs, but they rely on devicetree to either configure the
> > controller in host or endpoint mode.
> > 
> > If the devicetree enables the endpoint node, why can't it also define the
> > pinctrl config?
> > 
> > - Mani
> > 
> 
> Root Port and Endpoint role switch is through device tree only.
> pinctrl settings are defined in Root Port/Endpoint device tree node, but to
> apply the pinctrl settings respective driver need to call
> pinctrl_pm_select_default_state().
> 

First of all calling pinctrl_pm_select_default_state() from probe() is not
correct. pinctrl_pm_* APIs are supposed to be called from PM callbacks.

Also, the pinctrl default state *should* be selected by the pinctrl core. So
what this driver is doing here looks redundant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

