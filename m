Return-Path: <linux-tegra+bounces-14591-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGzNAuA2DmpN8QUAu9opvQ
	(envelope-from <linux-tegra+bounces-14591-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 00:34:08 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F259C18B
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 00:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460A1311F230
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2026 19:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B923346FA7;
	Wed, 20 May 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOnh9X5F"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500553438B4;
	Wed, 20 May 2026 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305427; cv=none; b=QRzCqB53RZd4NTRxpTTfy3riFrRnROYYPfyTfZJtJeYeF+a8W9YNDpqw0J7LRHZLvQZFbUfG8bLX4joe0tT18qcpHCXRaeNvV2G/HXt4ZbYekkeBh1Qmw2aupFfD4seajZmMFex9kbTjuoRsumKLpL99qjHyPyFUY1E2Yd76ZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305427; c=relaxed/simple;
	bh=R0jDNJnPTCFomqvQN/hyAB249ZSW+2qIIa4D7e26gm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Z/AKWaLydLAiwQCGb78/02nqMCL3+O9z0Q/PEs51sPsjLuso8wfxHPbcPacEX1zjlh6kciDwidBGkuQz7HLwGnhbzROEOY4Yj2RgsXzz6ZIPwQA86+606l8B0Z+IBvshgPhmNZvHQkWp1CrjUomDqpFCV4riwS0DA6GtP9J58Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOnh9X5F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 05EB81F000E9;
	Wed, 20 May 2026 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779305426;
	bh=sgDZDMcZlNYdObk5buAKlQ1BjPj0zeBE/FlyACZvako=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=YOnh9X5FRrVNy9L1TWfypaTTYiPy232xRoLhtN1BgzFNJHDgXkaRMygY+2vCnJ6hX
	 nMG0rANZmgf7Jw9PPhgSsEDEnUJdsIS5LRTUESiHYzAxyipYnqiVSvTie7RCbaYBpc
	 SFUelok6qKimxWaj24OcGbDUL01NyxlaDBb1Cikkoht7CMwNJ+DqB/vssMKn8lZ2se
	 8Xp6bxd0RRcTbUAQnRBiKfGTPv7T52OGL7wBYaB+2zqypKYQiRUFpb8NaDIZ7NIbVv
	 AEoQokw0ecSwMyx+2p/PCKoq56LKAYPwbsP6B17eR/eZAS9GRnKTng/n8bQ1kyDvFl
	 Umz7d2WTJ6hfw==
Date: Wed, 20 May 2026 14:30:24 -0500
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
Subject: Re: [PATCH v3 1/2] PCI: tegra194: Use aspm-l1-entry-delay-ns DT
 property for L1 entrance latency
Message-ID: <20260520193024.GA84903@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515070753.3852840-2-mmaddireddy@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14591-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9F2F259C18B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 12:37:52PM +0530, Manikanta Maddireddy wrote:
> Program the Synopsys DesignWare PORT_AFR L1 entrance latency field from the
> optional aspm-l1-entry-delay-ns device tree property (nanoseconds).
> 
> Convert delay to whole microseconds with ceiling division (DIV_ROUND_UP),
> then derive the 3-bit hw encoding as the minimum of order_base_2(us) and 7.
> If the property is not present or cannot be read, default to 7.
> 
> Hardware encoding (PORT_AFR L1 entrance latency, bits 27:29):
> 
>   +--------------------------+----------+
>   | Advertised maximum       | Code     |
>   +--------------------------+----------+
>   | Maximum of 1 us          | 000b     |
>   +--------------------------+----------+
>   | Maximum of 2 us          | 001b     |
>   +--------------------------+----------+
>   | Maximum of 4 us          | 010b     |
>   +--------------------------+----------+
>   | Maximum of 8 us          | 011b     |
>   +--------------------------+----------+
>   | Maximum of 16 us         | 100b     |
>   +--------------------------+----------+
>   | Maximum of 32 us         | 101b     |
>   +--------------------------+----------+
>   | Maximum of 64 us         | 110b     |
>   +--------------------------+----------+
>   | Rest                     | 111b     |
>   +--------------------------+----------+
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Fixed commit message as per review comments.
> V3: Fixed encoding to handle all cases per above table.
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 9dcfa194050e..5309a2f1356d 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -272,6 +272,7 @@ struct tegra_pcie_dw {
>  	u32 aspm_cmrt;
>  	u32 aspm_pwr_on_t;
>  	u32 aspm_l0s_enter_lat;
> +	u32 aspm_l1_enter_lat;
>  
>  	struct regulator *pex_ctl_supply;
>  	struct regulator *slot_ctl_3v3;
> @@ -715,6 +716,8 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
>  	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
>  	val &= ~PORT_AFR_L0S_ENTRANCE_LAT_MASK;
>  	val |= (pcie->aspm_l0s_enter_lat << PORT_AFR_L0S_ENTRANCE_LAT_SHIFT);
> +	val &= ~PORT_AFR_L1_ENTRANCE_LAT_MASK;
> +	val |= (pcie->aspm_l1_enter_lat << PORT_AFR_L1_ENTRANCE_LAT_SHIFT);

Thanks for your patch!

I think follow-on patches could use FIELD_MODIFY() for
PORT_AFR_L1_ENTRANCE_LAT_MASK and PORT_AFR_L0S_ENTRANCE_LAT_MASK.

It would be good to remove all these _SHIFT #defines in a future patch,
if possible:

  PORT_AFR_L0S_ENTRANCE_LAT_SHIFT
  PORT_AFR_L1_ENTRANCE_LAT_SHIFT
  GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT
  PCIE_MSIX_DOORBELL_PF_SHIFT
  EVENT_COUNTER_ENABLE_SHIFT
  EVENT_COUNTER_EVENT_SEL_SHIFT
  EVENT_COUNTER_GROUP_SEL_SHIFT

The uses can probably be replaced with FIELD_MODIFY() and
FIELD_PREP(), possibly with the addition of a _MASK #define or two.

>  	val |= PORT_AFR_ENTER_ASPM;
>  	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
>  }
> @@ -1115,6 +1118,7 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
>  {
>  	struct platform_device *pdev = to_platform_device(pcie->dev);
>  	struct device_node *np = pcie->dev->of_node;
> +	u32 val;
>  	int ret;
>  
>  	pcie->dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
> @@ -1141,6 +1145,15 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
>  		dev_info(pcie->dev,
>  			 "Failed to read ASPM L0s Entrance latency: %d\n", ret);
>  
> +	/* Default to max latency of 7. */
> +	pcie->aspm_l1_enter_lat = 7;
> +	ret = of_property_read_u32(np, "aspm-l1-entry-delay-ns", &val);
> +	if (!ret) {
> +		u32 us = DIV_ROUND_UP(val, 1000);
> +
> +		pcie->aspm_l1_enter_lat = min_t(u32, order_base_2(us), 7);
> +	}
> +
>  	ret = of_property_read_u32(np, "num-lanes", &pcie->num_lanes);
>  	if (ret < 0) {
>  		dev_err(pcie->dev, "Failed to read num-lanes: %d\n", ret);
> -- 
> 2.34.1
> 

