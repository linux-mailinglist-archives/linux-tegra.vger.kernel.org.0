Return-Path: <linux-tegra+bounces-12553-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFuYAU1kqWmB6gAAu9opvQ
	(envelope-from <linux-tegra+bounces-12553-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 12:09:01 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74899210545
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 12:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4414B300DA79
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 11:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C3838422C;
	Thu,  5 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1BdcZCE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D22366057;
	Thu,  5 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708813; cv=none; b=fo+kvEohpZes3LF6t1pSzb+GRgaoy4cWDsoSOtkkIh97c+DlcZCIsXoyR0CH6Z81vUEuiSjy3xAsN8SwRIeSPjgDu6FRpM6t9EHztqj5pRCUa/+kqfsFZ55zs8Dt1YMBXV+NzxjSuTEDEUUm3JmJyDk2dhY9VpFTjf6+evPeUV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708813; c=relaxed/simple;
	bh=19lZm3WdFIyWrev6eaaJeK1embk09pIvpJETV7qPeVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBMB/cM79POFpk+Pq+iGJ79IrRDnUo/yAG/jb0q46gwZlKf3Zgx4c18t9+ED2bgDl7FuTVabABCitT2R0tivwbnipWkPM0M4jK6iIxOkrEih7K6Hui2HGGq7hHR1c+ubPKUNJlJfYWBwSatG1XgwTYQURn80XrSr2g6zMEKAyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1BdcZCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8DEC2BC87;
	Thu,  5 Mar 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708813;
	bh=19lZm3WdFIyWrev6eaaJeK1embk09pIvpJETV7qPeVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1BdcZCE1O4SuLd6Gs66N812x1z/EBPdxPR7YNLBr4zZkn9K2wIlHyxd3vUL1MXp/
	 T1nNKDc64w0OF1XJ8L/dZo76IGOCT/wJIyRmPfBSwYsmo19aNDLy6Ugv9X+ICEpJCQ
	 Tn+1UH2vZtzpPFz5YQzY3mQQjJPDThwkekCPgmpn5PieY8fSOeerTRA2fvYRdCQvyi
	 LECwYetX905l33KZYGNPF/O65JENb5c+EuvwSto1FvJ+t1tin/79fDWUDw6eQbIXiR
	 6RP7loqg6NsKnUq8H4GA9NKr8ADOCcQf+dVJyfHzW9A7h4yT9web8eNbHlH1f4O+zA
	 n/0SRJ/yoILWw==
Date: Thu, 5 Mar 2026 16:36:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com, 
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/9] PCI: tegra194: Enable DMA interrupt
Message-ID: <i2ttjc7zn77cdozbvfbqelhrdgngyd7rcmnb372qty35ehrybi@krwdkndrcx3c>
References: <20260303065758.2364340-1-mmaddireddy@nvidia.com>
 <20260303065758.2364340-5-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303065758.2364340-5-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 74899210545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12553-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:27:53PM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> Enable DMA interrupt to support Tegra PCIe DMA in both Root Port and
> Endpoint modes.
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V1 -> V7: None
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 352412680b4d..918e864b74a7 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -91,6 +91,7 @@
>  #define APPL_INTR_EN_L1_8_0			0x44
>  #define APPL_INTR_EN_L1_8_BW_MGT_INT_EN		BIT(2)
>  #define APPL_INTR_EN_L1_8_AUTO_BW_INT_EN	BIT(3)
> +#define APPL_INTR_EN_L1_8_EDMA_INT_EN		BIT(6)
>  #define APPL_INTR_EN_L1_8_INTX_EN		BIT(11)
>  #define APPL_INTR_EN_L1_8_AER_INT_EN		BIT(15)
>  
> @@ -543,6 +544,13 @@ static irqreturn_t tegra_pcie_ep_hard_irq(int irq, void *arg)
>  		spurious = 0;
>  	}
>  
> +	if (status_l0 & APPL_INTR_STATUS_L0_INT_INT) {
> +		status_l1 = appl_readl(pcie, APPL_INTR_STATUS_L1_8_0);
> +		/* Interrupt is handled by dma driver, don't treat it as spurious */

Ok, so the eDMA driver also requests the IRQ as shared (threaded)...

- Mani

> +		if (status_l1 & APPL_INTR_STATUS_L1_8_0_EDMA_INT_MASK)
> +			spurious = 0;
> +	}
> +
>  	if (spurious) {
>  		dev_warn(pcie->dev, "Random interrupt (STATUS = 0x%08X)\n",
>  			 status_l0);
> @@ -762,6 +770,7 @@ static void tegra_pcie_enable_intx_interrupts(struct dw_pcie_rp *pp)
>  	val |= APPL_INTR_EN_L1_8_INTX_EN;
>  	val |= APPL_INTR_EN_L1_8_AUTO_BW_INT_EN;
>  	val |= APPL_INTR_EN_L1_8_BW_MGT_INT_EN;
> +	val |= APPL_INTR_EN_L1_8_EDMA_INT_EN;
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		val |= APPL_INTR_EN_L1_8_AER_INT_EN;
>  	appl_writel(pcie, val, APPL_INTR_EN_L1_8_0);
> @@ -1786,6 +1795,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
>  	val |= APPL_INTR_EN_L0_0_SYS_INTR_EN;
>  	val |= APPL_INTR_EN_L0_0_LINK_STATE_INT_EN;
>  	val |= APPL_INTR_EN_L0_0_PCI_CMD_EN_INT_EN;
> +	val |= APPL_INTR_EN_L0_0_INT_INT_EN;
>  	appl_writel(pcie, val, APPL_INTR_EN_L0_0);
>  
>  	val = appl_readl(pcie, APPL_INTR_EN_L1_0_0);
> @@ -1793,6 +1803,10 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
>  	val |= APPL_INTR_EN_L1_0_0_RDLH_LINK_UP_INT_EN;
>  	appl_writel(pcie, val, APPL_INTR_EN_L1_0_0);
>  
> +	val = appl_readl(pcie, APPL_INTR_EN_L1_8_0);
> +	val |= APPL_INTR_EN_L1_8_EDMA_INT_EN;
> +	appl_writel(pcie, val, APPL_INTR_EN_L1_8_0);
> +
>  	/* 110us for both snoop and no-snoop */
>  	val = FIELD_PREP(PCI_LTR_VALUE_MASK, 110) |
>  	      FIELD_PREP(PCI_LTR_SCALE_MASK, 2) |
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

