Return-Path: <linux-tegra+bounces-12550-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPtvE3JjqWmB6gAAu9opvQ
	(envelope-from <linux-tegra+bounces-12550-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 12:05:22 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44921047A
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 12:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CF803044642
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7086C384229;
	Thu,  5 Mar 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVJ7aN5d"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0937D12B;
	Thu,  5 Mar 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708368; cv=none; b=TQbzit09OOhglYFO0iWY9YkRkBAEz8iJlDcgtHS8LXSZt8Spq479RyDZEYnDjQrNNrl+H3LE0vTprIPVRR2oI6eGzCouI4Wh7sW1HdziGFxYf2eItR+bc3Fu0mGQYxoMKZh+3kFZ9137oeyURrbjTLFW8UvJdbSD9ZFtg96GYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708368; c=relaxed/simple;
	bh=TvUAD1HxfOueLADVR6URrCt4SHfPFBMoARAlPv/dYjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaUrZqiZHPEoX94vaXZVKCAZnGWel5VL5JGh2FP5ZZCjmzakrOr+OFPG9BxQK4Gocp+rUuWHiflDPHrV8ZmUm9fADPOi2CYJR7FO97RsUM3H65MRc19hOGPoCJIFnEIuhX9WN7njY3JD0EICKAh8dvkIVAVOnFu/TqcUpx7FQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVJ7aN5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E88C19422;
	Thu,  5 Mar 2026 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708367;
	bh=TvUAD1HxfOueLADVR6URrCt4SHfPFBMoARAlPv/dYjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVJ7aN5dnLppRJ5P93eZG7z9c4GbVhbEskr/Zjy/SCdTkWItE0ENbqxqYaNp9oXPv
	 fnNz6XT1PdeqVYGBCIQxNTMUpxiIyCinLRUiNZ3V+Fzs/O3Iua2FKnrx3JFwSHahKz
	 eSsPFjvHFDObSnkwdbQIFPFJ90HqdelgxOTA+Zf4q7E81U2Oh507z6Xpf7qBCjJHbX
	 O35DJLI6pXe/f3VK+uAR639NPR9uQdHoZvP5F08GmU+V8IzpA1O/tndvu8avqWavwL
	 DfmAyPf9pn1DhzN2xiNgsOyTBjdMORhIcMjVdf9Ob+StGv4FNgSLeXDb0vEWurUDIa
	 pko7vwsCYAu2Q==
Date: Thu, 5 Mar 2026 16:29:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com, 
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org, 18255117159@163.com, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] PCI: tegra194: Calibrate P2U for Endpoint mode
Message-ID: <x7w2a766h4m56kocibxz24uwjdlssbccg3z2pfcse4prk6c6fu@xwz7axizktyv>
References: <20260303065758.2364340-1-mmaddireddy@nvidia.com>
 <20260303065758.2364340-3-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303065758.2364340-3-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: BD44921047A
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
	TAGGED_FROM(0.00)[bounces-12550-lists,linux-tegra=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:27:51PM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> Calibrate P2U for Endpoint controller to request UPHY PLL rate change to

What is P2U?

- Mani

> Gen1 during initialization. This helps to reset stale PLL state from the
> previous bad link state.
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V1 -> V7: None
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 2f1f882fc737..980988b7499c 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1054,6 +1054,9 @@ static int tegra_pcie_enable_phy(struct tegra_pcie_dw *pcie)
>  		ret = phy_power_on(pcie->phys[i]);
>  		if (ret < 0)
>  			goto phy_exit;
> +
> +		if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
> +			phy_calibrate(pcie->phys[i]);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

