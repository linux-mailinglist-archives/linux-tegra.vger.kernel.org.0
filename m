Return-Path: <linux-tegra+bounces-12548-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO1gO4deqWlc6QAAu9opvQ
	(envelope-from <linux-tegra+bounces-12548-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 11:44:23 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EBC20FE7E
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 11:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 585BC3013FD5
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 10:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D91382298;
	Thu,  5 Mar 2026 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uw+R5yA3"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD937F018;
	Thu,  5 Mar 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707440; cv=none; b=fplaV/hL9/iuWB2ueRjZ7UFnYORDqOop36EGqs2v/GWEHXzTHoMg55C21i29mlf1aFc/goL1x3DcLN5lsu8JGZh6bnV0+wY1yG7pn5un13m+v65BBnHrJrJ0Fm3hXf4UZJbgR7dKgExEnmjKzWSHqn0bAwh5ApyzTGrIiFZilY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707440; c=relaxed/simple;
	bh=0Kiqz9Rzs1YlqHCpoNj87895SVqICgvPa419bedvoWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGFDa7RY7JhxM9X9aBfY1U8cTRBhRrIgCsSTKaIglZ4IV93jdM9CUr3s8v0PxHp9oc1JfAcunxVBNLK7P/6pmOIwIm8nHlpOsxEJNtyGKoeeNcKYkdrnrJNS7D9AK9CoBqHAr7yg7eLabNxr2N6uBl8EBr0rMALuhCSy3K+5mno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uw+R5yA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71D3C116C6;
	Thu,  5 Mar 2026 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707439;
	bh=0Kiqz9Rzs1YlqHCpoNj87895SVqICgvPa419bedvoWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uw+R5yA3MUv4PNkkuKKCNLptSRP0jYEQjj+PCLPVGP8v6yQhjs/4uPELYXeX73Vwe
	 /S15IFd70DrxT4Q/TbZm739mMD0na4KMVQFhAGiDtTZC2kq3N/NyVOHjOTFkQtVpPS
	 RW/cI7YPDJmp2w7peOB5JV49w4u6DE62dtzWH0Qo7hvV7YGvao5m3ZXqg09ktdYWJt
	 X/MW2t/QGcGbCmrZ+nH5oOaKOgeoYcHgSLk5LDMLu24DQQNxz7eBKhtMi/6i1yjnMz
	 R+PJ/CcADurifvdLe2BIOs/7hUD5e+wAbCl/om4rZMPnoprUF84e63tkik3XPhK09p
	 Hx2OJMvGKiGDw==
Date: Thu, 5 Mar 2026 16:13:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com, 
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 13/13] PCI: tegra194: Free resources during controller
 deinitialization
Message-ID: <bbv5jceuy7vj6t6h6ncxfaxgmrb4acuhzkazinwhyf2zru7pvi@f7maptqx6jqr>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-14-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303065448.2361488-14-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: F0EBC20FE7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12548-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:24:48PM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> Call pci_epc_deinit_notify() during controller deinitialization to free the
> resources allocated by Endpoint function driver. This is safe to call
> during PCIe assert sequence because we don't expect Endpoint function
> driver to touch hardware in deinit function.
> 

Are you sure? The epf-test driver itself touches DBI space during deinit.

- Mani

> Fixes: 40e2125381dc ("PCI: tegra194: Move controller cleanups to pex_ep_event_pex_rst_deassert()")
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V5 -> V7: None
> Changes V4 -> V5: Remove pci_epc_deinit_notify() call from pex_ep_event_pex_rst_deassert()
> Changes V1 -> V4: None
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index a311c31109e3..b1ae46761915 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1624,12 +1624,16 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  
>  static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
>  {
> +	struct dw_pcie *pci = &pcie->pci;
> +	struct dw_pcie_ep *ep = &pci->ep;
>  	u32 val;
>  	int ret;
>  
>  	if (pcie->ep_state == EP_STATE_DISABLED)
>  		return;
>  
> +	pci_epc_deinit_notify(ep->epc);
> +
>  	ret = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, val,
>  		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_QUIET) ||
>  		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_ACT) ||
> @@ -1796,7 +1800,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
>  	reset_control_deassert(pcie->core_rst);
>  
>  	/* Perform cleanup that requires refclk and core reset deasserted */
> -	pci_epc_deinit_notify(pcie->pci.ep.epc);
>  	dw_pcie_ep_cleanup(&pcie->pci.ep);
>  
>  	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

