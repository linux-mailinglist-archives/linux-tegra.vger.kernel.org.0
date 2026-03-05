Return-Path: <linux-tegra+bounces-12543-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM6uIItZqWkL6AAAu9opvQ
	(envelope-from <linux-tegra+bounces-12543-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 11:23:07 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AD20FA3B
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 11:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15A84305C6C8
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 10:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4DE3793C5;
	Thu,  5 Mar 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6MMU5z3"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871630E82E;
	Thu,  5 Mar 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705966; cv=none; b=nyXdj1yrjbIGDuTdl357n63h6mcLZPzyBG8r9ZeaU3FEFst53MYZhDQxQi3mhbftqHtQyVDMHJj2MVGM+/QHM/ANUNwGbbz6hU0GpeD9wbsITv3ElvsSgqGup6/tZRPhleALm7KSJoFnFiGNlKowzLH37e+hV8+SNBJeBQzWcW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705966; c=relaxed/simple;
	bh=YRUPoTIN6g9/Tsh4RXysP2NE0Z8y/s75k1jZouDgLD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTknJXN3D1TR2IVW4v7PAgo23tqVA4OgbiDBgDKoos/LZHuXYDjoO36DCTwB4P8Ud2rAd/+cXb8S791B/ub8S5L0TZVLrPOr51/cnK5tOpaskpdrbqCoIs71wnGCP2I61S7fd11EA+QEbaFeKrjCVvbEMwRBLMT1FVsSrQZjNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6MMU5z3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14248C19425;
	Thu,  5 Mar 2026 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772705965;
	bh=YRUPoTIN6g9/Tsh4RXysP2NE0Z8y/s75k1jZouDgLD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6MMU5z3lZoXt+0pWHqhDI3W8zBJS4JDB8cp1TW4WWlBrnvcnK/YG7tEmoozagFJT
	 oCHyo7LR8WXmNmbslDu1t1z3lKtLGQ5G4JnEcT9ewlIjYTGMg/td4YOrrqMdAYnfiI
	 uIWqDYy3NMutiHnNruke0X7H7jXz4x+5uOMCiba9gLFCTmacOnPsX8iBTScYDb1WcF
	 PItXsS+D0l9LdbnbluVV5ngM+0d7Dp9hcvOrX4xypU+yX5GdBkE9d8sguT0/CUzRHB
	 NdNY4k4eMUeITNGHR0JFVChlHd6d5t6Z5McXJVKWCJEPvRtOi9/Ei5hl7RPL1NQxuX
	 S4CF1CqvdC+Ww==
Date: Thu, 5 Mar 2026 15:49:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com, 
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/13] PCI: tegra194: Apply pinctrl settings for both
 PCIe RP and EP
Message-ID: <gui4y7vjc4f5brtjgsfvqdn2ig6kw3tsiinrijweltgeukiwdy@2zqe2orx6pas>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-9-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303065448.2361488-9-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 224AD20FA3B
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
	TAGGED_FROM(0.00)[bounces-12543-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:24:43PM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> PERST# and CLKREQ# pinctrl settings should be applied for both Root Port
> and Endpoint mode. Move pinctrl_pm_select_default_state() function call
> from Root Port specific configuration function to probe().
> 

Why should this driver care about setting default pinctrl state? Why can't it
rely on the pinctrl framework as like other drivers?

- Mani

> Fixes: c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in Tegra194")
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V5 -> V7: None
> Changes V4 -> V5: Use dev_err_probe() function
> Changes V1 -> V4: None
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index b50229df890e..5b79d3c28ba6 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1598,12 +1598,6 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  		goto fail_pm_get_sync;
>  	}
>  
> -	ret = pinctrl_pm_select_default_state(dev);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to configure sideband pins: %d\n", ret);
> -		goto fail_pm_get_sync;
> -	}
> -
>  	ret = tegra_pcie_init_controller(pcie);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize controller: %d\n", ret);
> @@ -2077,6 +2071,10 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
>  	pp = &pci->pp;
>  	pp->num_vectors = MAX_MSI_IRQS;
>  
> +	ret = pinctrl_pm_select_default_state(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to configure sideband pins: %d\n", ret);
> +
>  	ret = tegra_pcie_dw_parse_dt(pcie);
>  	if (ret < 0) {
>  		const char *level = KERN_ERR;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

