Return-Path: <linux-tegra+bounces-12535-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OZiCNlFOqWmz4QAAu9opvQ
	(envelope-from <linux-tegra+bounces-12535-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 10:35:13 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADD20E8AB
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 10:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DD4A3076485
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374E6377EBC;
	Thu,  5 Mar 2026 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ5gF/Mk"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426123E32D;
	Thu,  5 Mar 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703078; cv=none; b=NAH76CLU2MzH2X+TFaOSOM6gGPtqkq8ogQ5M1O6hMmLu7QP5mw4rURDTOqVvlAhKNm5FbOEnMo5sp/p27pMmEhrbCTPbA2KsgLV6B20yU1RLn6rK3iqah31XgDpVUC9XQySsWLWzpIoaj1J22i6bp6DdLtW0I8gp4+98DVkoULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703078; c=relaxed/simple;
	bh=HEvg29/Hj9lWiQ5IuwMKZXROpFEsc2gJsguQRspFvMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhFfeB2o0/8zMRl3g13WHfRg+8FEfKiIM9qatagHr7OHJRsCFUxpG66T57o1cCocRs+7fqoi1i0YAUVd+9AiYqFEDD/OlTzOTWLXGE4f5r3K3/NsZP+qkix8belNB8impKPjOfVyqSUU1rgfePDodxzbUoMux8BOWYEvZ+8qOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZ5gF/Mk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39134C116C6;
	Thu,  5 Mar 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772703077;
	bh=HEvg29/Hj9lWiQ5IuwMKZXROpFEsc2gJsguQRspFvMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZ5gF/MkvkgoA6lshxtVRZ50Z+62fL76tnX0snPYEzM0zWSQjJMKwNTD7pXKXgNMw
	 wMhkjJK30V0ZnW2Wu2khrbKmMJ+4YeIPulZSYUwRPCc6b1K85kM1vqi9OVMRKXH0Vv
	 kf4+tI5yUMBTYNftGZNsQYepg4Qujub1LRVQx8b/hLu+yOxq60SdRFc+O0sFobqJLf
	 pRD1kd5HXXENzpyB0B+34qS8t2ZP89sSljS1VAC88rExUsS9LoYXd54g93MW4upLW4
	 2xxOvGu3PLm14pd18ypQhYmtNvQZcVXmnfgESSQanLINdulJCkPapK3cqgWnmO3V7v
	 aF/MGgLsrcE5A==
Date: Thu, 5 Mar 2026 15:01:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com, 
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/13] PCI: tegra194: Refactor LTSSM state polling on
 surprise down
Message-ID: <iqnk6hzhh4sv6ilay3eii5wrcg3473l5ekenrvcwumkb2elwnc@rgtxgmeg4tfv>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-3-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303065448.2361488-3-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: 56ADD20E8AB
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
	TAGGED_FROM(0.00)[bounces-12535-lists,linux-tegra=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:24:37PM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> On surprise down, LTSSM state transits from L0 -> Recovery.RcvrLock ->
> Recovery.RcvrSpeed -> Gen1 Recovery.RcvrLock -> Detect. Recovery.RcvrLock
> and Recovery.RcvrSpeed transit times are 24 msec and 48 msec respectively.
> So, the total time taken to transit from L0 to detect state is ~96 msec.
> Hence, increase the poll time to 120 msec.
> 
> Disable the LTSSM state after it transits to detect to avoid LTSSM
> toggling between polling and detect states.
> 

These are two separate changes (increasing poll time and disabling LTSSM).
Please split this into two patches. A patch should only fix one issue, not more.

- Mani

> tegra_pcie_dw_pme_turnoff() function is called in non-atomic context
> only, so use the non-atomic poll function.
> 
> Fixes: 56e15a238d92 ("PCI: tegra: Add Tegra194 PCIe support")
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V6 -> V7: Append _US to LTSSM macros
> Changes V5 -> V6: Retain only one fixes tag
> Changes V1 -> V5: None
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 55 +++++++++++++---------
>  1 file changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index d6c6bd512b51..afbc0bdd8a93 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -137,7 +137,11 @@
>  #define APPL_DEBUG_PM_LINKST_IN_L0		0x11
>  #define APPL_DEBUG_LTSSM_STATE_MASK		GENMASK(8, 3)
>  #define APPL_DEBUG_LTSSM_STATE_SHIFT		3
> -#define LTSSM_STATE_PRE_DETECT			5
> +#define LTSSM_STATE_DETECT_QUIET		0x00
> +#define LTSSM_STATE_DETECT_ACT			0x08
> +#define LTSSM_STATE_PRE_DETECT_QUIET		0x28
> +#define LTSSM_STATE_DETECT_WAIT			0x30
> +#define LTSSM_STATE_L2_IDLE			0xa8
>  
>  #define APPL_RADM_STATUS			0xE4
>  #define APPL_PM_XMT_TURNOFF_STATE		BIT(0)
> @@ -198,7 +202,8 @@
>  #define CAP_SPCIE_CAP_OFF_USP_TX_PRESET0_MASK	GENMASK(11, 8)
>  #define CAP_SPCIE_CAP_OFF_USP_TX_PRESET0_SHIFT	8
>  
> -#define LTSSM_TIMEOUT 50000	/* 50ms */
> +#define LTSSM_DELAY_US		10000	/* 10 ms */
> +#define LTSSM_TIMEOUT_US	120000	/* 120 ms */
>  
>  #define GEN3_GEN4_EQ_PRESET_INIT	5
>  
> @@ -1589,23 +1594,22 @@ static void tegra_pcie_dw_pme_turnoff(struct tegra_pcie_dw *pcie)
>  		data &= ~APPL_PINMUX_PEX_RST;
>  		appl_writel(pcie, data, APPL_PINMUX);
>  
> +		err = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, data,
> +			((data & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_QUIET) ||
> +			((data & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_ACT) ||
> +			((data & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_PRE_DETECT_QUIET) ||
> +			((data & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_WAIT),
> +			LTSSM_DELAY_US, LTSSM_TIMEOUT_US);
> +		if (err)
> +			dev_info(pcie->dev, "Link didn't go to detect state\n");
> +
>  		/*
> -		 * Some cards do not go to detect state even after de-asserting
> -		 * PERST#. So, de-assert LTSSM to bring link to detect state.
> +		 * Deassert LTSSM state to stop the state toggling between
> +		 * polling and detect.
>  		 */
>  		data = readl(pcie->appl_base + APPL_CTRL);
>  		data &= ~APPL_CTRL_LTSSM_EN;
>  		writel(data, pcie->appl_base + APPL_CTRL);
> -
> -		err = readl_poll_timeout_atomic(pcie->appl_base + APPL_DEBUG,
> -						data,
> -						((data &
> -						APPL_DEBUG_LTSSM_STATE_MASK) >>
> -						APPL_DEBUG_LTSSM_STATE_SHIFT) ==
> -						LTSSM_STATE_PRE_DETECT,
> -						1, LTSSM_TIMEOUT);
> -		if (err)
> -			dev_info(pcie->dev, "Link didn't go to detect state\n");
>  	}
>  	/*
>  	 * DBI registers may not be accessible after this as PLL-E would be
> @@ -1679,19 +1683,24 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
>  	if (pcie->ep_state == EP_STATE_DISABLED)
>  		return;
>  
> -	/* Disable LTSSM */
> +	ret = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, val,
> +		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_QUIET) ||
> +		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_ACT) ||
> +		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_PRE_DETECT_QUIET) ||
> +		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_DETECT_WAIT) ||
> +		((val & APPL_DEBUG_LTSSM_STATE_MASK) == LTSSM_STATE_L2_IDLE),
> +		LTSSM_DELAY_US, LTSSM_TIMEOUT_US);
> +	if (ret)
> +		dev_err(pcie->dev, "LTSSM state: 0x%x timeout: %d\n", val, ret);
> +
> +	/*
> +	 * Deassert LTSSM state to stop the state toggling between
> +	 * polling and detect.
> +	 */
>  	val = appl_readl(pcie, APPL_CTRL);
>  	val &= ~APPL_CTRL_LTSSM_EN;
>  	appl_writel(pcie, val, APPL_CTRL);
>  
> -	ret = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, val,
> -				 ((val & APPL_DEBUG_LTSSM_STATE_MASK) >>
> -				 APPL_DEBUG_LTSSM_STATE_SHIFT) ==
> -				 LTSSM_STATE_PRE_DETECT,
> -				 1, LTSSM_TIMEOUT);
> -	if (ret)
> -		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
> -
>  	reset_control_assert(pcie->core_rst);
>  
>  	tegra_pcie_disable_phy(pcie);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

