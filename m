Return-Path: <linux-tegra+bounces-12414-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMVvM5/opmnjZgAAu9opvQ
	(envelope-from <linux-tegra+bounces-12414-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:56:47 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B51F0D97
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 074A7307AFD4
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 13:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319F436C598;
	Tue,  3 Mar 2026 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMOh98A1"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E523563FA;
	Tue,  3 Mar 2026 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545793; cv=none; b=oi2ADD96HLS2iQmi9dEA9hbtC1rE8VApIfBa+sSF24RmyF+fQa84ucLk7RA3UNrjZhDePNHsHFFBRRUkzfI0IVuS9Dz1B+Fh4cmSswfXBRku+Qz8qTt5AeSkLWrHzQFDCXEIr93ZvoC1Khp/a611Z7lR2KPvgirqdSuciBIPlQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545793; c=relaxed/simple;
	bh=AhrE/HDOXN9VgZOPjHgJJanxr1twD3lgMMaEtzo5yBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0C46++gPZIgD8FoTK3xxlgyeaDUUPl6nXsHKz1K15weFfjdlZmCrwW4lbrG+QUQZZDH7iGP5gw+W1ymgelctKmMjhelFWAoNLObR7zGY+kFi4qNovemhZrT5akdVU7FVcXgrH2rVIi6rGffazn2rfqE2GUpDSnGufyNA2aS3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMOh98A1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E49C116C6;
	Tue,  3 Mar 2026 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772545793;
	bh=AhrE/HDOXN9VgZOPjHgJJanxr1twD3lgMMaEtzo5yBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMOh98A1aAua8PSS4ARVGsWfk170Kcqcw+vxlgjPxiE761QVMmcmV0o1eFBJVUUOZ
	 BOz3pERPH4YhbxLtx+faYeIvZr3r5dESPaKpWUk7H9WWLBFgE74W116YcAc+8RbQL0
	 JsMGYEBSsO315xkFJ10x/2UpY7rPntr7NtYQye4WbWV5KAJR1RhlYn9yKXDBJKPqSw
	 wQwkqqm5UlEBokj7O3qix5mmEJjM9rcG399Jg0elzE6x6ZKXTcaI+mdgwcLjnPy2fe
	 HbbTTL/Oyc+sac7zseisVoEyXLrlhpjEY6zMMdnubQGUHcPRWqGR/E671Z3/RFTnLB
	 bIAcWtNDrVD/g==
Date: Tue, 3 Mar 2026 14:49:46 +0100
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
Subject: Re: [PATCH v2 5/5] misc: pci_endpoint_test: Add Tegra194 and
 Tegra234 device table entries
Message-ID: <aabm-gh3RAtRSHv1@ryzen>
References: <20260303072004.2384079-1-mmaddireddy@nvidia.com>
 <20260303072004.2384079-6-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303072004.2384079-6-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 746B51F0D97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12414-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:50:04PM +0530, Manikanta Maddireddy wrote:
> Add PCI device IDs for Tegra194 (0x1ad4) and Tegra234(0x229b) Endpoint
> controllers, so that pci_endpoint_test can bind and run on these
> controllers.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> v2: Remove pci_endpoint_test_data
> 
>  drivers/misc/pci_endpoint_test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index f166b6fea698..fe370c94b191 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -106,6 +106,9 @@
>  
>  #define PCI_DEVICE_ID_ROCKCHIP_RK3588		0x3588
>  
> +#define PCI_DEVICE_ID_NVIDIA_TEGRA194_EP	0x1ad4
> +#define PCI_DEVICE_ID_NVIDIA_TEGRA234_EP	0x229b
> +
>  static DEFINE_IDA(pci_endpoint_test_ida);
>  
>  #define to_endpoint_test(priv) container_of((priv), struct pci_endpoint_test, \
> @@ -1246,6 +1249,10 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_ROCKCHIP, PCI_DEVICE_ID_ROCKCHIP_RK3588),
>  	  .driver_data = (kernel_ulong_t)&rk3588_data,
>  	},
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TEGRA194_EP),
> +	},
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TEGRA234_EP),
> +	},

I think these two entries can be a single line each, as the existing entries
without .driver_data.

With that:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

