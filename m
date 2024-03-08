Return-Path: <linux-tegra+bounces-1183-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82C875DB6
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Mar 2024 06:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C801F21886
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Mar 2024 05:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8B13610A;
	Fri,  8 Mar 2024 05:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juriCvY2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD8339A1
	for <linux-tegra@vger.kernel.org>; Fri,  8 Mar 2024 05:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709876326; cv=none; b=UDiOIzRTLMn6x4yUbO3eRT9aNFDAcG9uF7U4mlTzDHG8ivI87YU+f++6VnPsep0L6goZTedqYY+zUHLpXKZyjf7Fty08tNhqw+Pfqq8ZgCcuCVWnXEre8L8oVHvU1V7Q8FuQ2thSy0AUvv+xEtq8P+YBuokBEtq8Pa+DvA+WZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709876326; c=relaxed/simple;
	bh=s6AAzj9sTa4DqwiYGNiVH8lleweJM08Qd7fO/aNO1Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5fpswzCqBy4PFK9enAkOGpnmfAH9mvOkATivmkIZHoctrQzQlth38S08Zp0BgiE90iUXBLT2OV1iEXoajv7j0FihG09yy8lE5TugHnPzEwwV0lId44Pn701ACMt/J2gsdUfrYD1rUfOVJi19lKwXMWLDBM2MUOGr9+IqEZ7bJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juriCvY2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dd10ae77d8so14728025ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Mar 2024 21:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876324; x=1710481124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUybYaiPJClMOkVE2KcQ/JxyjAJYL0HAMjXF/A+2etI=;
        b=juriCvY2LUW8K+fvMfcJ9XAOijDfTMn7RSlwIkicLQAGQPG3M/Oc2CCut7sYRc2qOs
         PoGUbmS4wFeEnYdxo8x9PXpgdbEW56M9Q3XUQAeTRUdSHuGrDjp/jjTjz3wcg0aSTEhl
         jicKsD5Rb0kjZKKOYFHYXMI5gwXyP971Z9uQgI9x4nAXHqTXBqZPgCJrHfI+lwMuo2oO
         UUzeaRg2TgNs0+DFBIrMWMKfz6BfNF8eHMo8QOfNNawb4R2KYDvrowoo+lcQzbJMcLl9
         lGaB+FAzwyHHzvZ3KEqs6NB3ShFsDerx5dd35FUkqTbmhmtx8Kh2W5ag6hdXqRiTFlHU
         oDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876324; x=1710481124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUybYaiPJClMOkVE2KcQ/JxyjAJYL0HAMjXF/A+2etI=;
        b=b2oyzNA3mynzVt5NhQj61VQKtcsVM8fnePmhgHTpihQ0ntf8HToDu1anLjPmgikQ37
         WO307wm2lEotlfrizKGWfGPO16CMaXlv+E+EyW/5nGuzVvhtA9FWZZrbeY9iFlWEq0p7
         QC8Ogd0bWEOM+2Lk2LPHAF37O+WgrJ9BynyjIiQmkyw/+lSbsKh+D45npNKDswHSUzet
         ZaJYuWdmo+F5JHe5nR0txGdj4O+DDVXm5ddllQdVNLBdhi3Xz/4fKJ74Wb8xX/CJqrOu
         3KdS3cPjS8B7QWzRqIVO5XlTk5ZDiPtnPMFRCPaGPQ1zth5B9tYfMpYkWDkh25uQpPav
         42oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrZpAJCjd3zWV6NGn8B2qYVsmsUtYvWuC7uvHNL+xq0Pt6tDKJSl5ISMhn/CD1TIQrLgXPCESX4Ndl4s0DzS43R4RUmYKTwvokcbk=
X-Gm-Message-State: AOJu0Yw1d3gAOBXCCAYW1qs8O7lao/CBGacbhlm2SQaLGfNaEE3sfiYX
	C5M8hdjEkiCcRlOB0R19J5q5IQh7KNJ5wUVief/Quw1y2REUXUtuz/Gkk4l1tg==
X-Google-Smtp-Source: AGHT+IFnxmsrp/JdPtnzlcbTNURcPyjpmM+tg6dX1wncoxt7+3e7o8Cy2Ru1ZT2zUpWAw+nYHfuG6A==
X-Received: by 2002:a17:903:1249:b0:1db:4419:e925 with SMTP id u9-20020a170903124900b001db4419e925mr11913418plh.1.1709876324294;
        Thu, 07 Mar 2024 21:38:44 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id f11-20020a170903104b00b001db717ed294sm923036plc.120.2024.03.07.21.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:38:43 -0800 (PST)
Date: Fri, 8 Mar 2024 11:08:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240308053829.GC3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <Zeos8kVxgchH9veF@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeos8kVxgchH9veF@ryzen>

On Thu, Mar 07, 2024 at 10:09:06PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
> > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > the host to complete the DWC core initialization. Also, those drivers will
> > send a notification to the EPF drivers once the initialization is fully
> > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > will start functioning.
> > 
> > For the rest of the drivers generating refclk locally, EPF drivers will
> > start functioning post binding with them. EPF drivers rely on the
> > 'core_init_notifier' flag to differentiate between the drivers.
> > Unfortunately, this creates two different flows for the EPF drivers.
> > 
> > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > a single initialization flow for the EPF drivers. This is done by calling
> > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > send the notification to the EPF drivers once the initialization is fully
> > completed.
> > 
> > Only difference here is that, the drivers requiring refclk from host will
> > send the notification once refclk is received, while others will send it
> > during probe time itself.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> You have removed the .core_init_notifier from EPC drivers,
> but the callback in EPF drivers is still called .core_init.
> 
> Yes, this was a confusing name even before this patch, but
> after this patch, it is probably even worse :)
> 
> The callback should be named from the perspective of EPF drivers IMO.
> .core_init sounds like a EPF driver should initialize the core.
> (But that is of course done by the EPC driver.)
> 
> The .link_up() callback name is better, the EPF driver is informed
> that the link is up.
> 
> Perhaps we could rename .core_init to .core_up ?
> 
> It tells the EPF drivers that the core is now up.
> (And the EPF driver can configure the BARs.)
> 

I don't disagree :) I thought about it but then decided to not extend the scope
of this series further. So saved that for next series.

But yeah, it is good to clean it up here itself.

> 
> Considering that you are not changing the name of the callback,
> and that it was already confusing before this patch:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

