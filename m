Return-Path: <linux-tegra+bounces-1323-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14B88C03E
	for <lists+linux-tegra@lfdr.de>; Tue, 26 Mar 2024 12:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61A5A1C385FC
	for <lists+linux-tegra@lfdr.de>; Tue, 26 Mar 2024 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C22F495FD;
	Tue, 26 Mar 2024 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZPDLU58"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF383EA90
	for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711451431; cv=none; b=K2OcZd/Ys43Fi3fky9KVJ7uF/DnF9MOkm01/CyIQyQLY6c6EUgFfMwxp9sgZki70WpUQ/dDs1dpEdUWMY1CDgFhvVVFRzyqunqwR5ekZnqb9EpFXA0z0u1Dyr9jcRKiOVP//8bZxJp3Rq7po0ezrIy8/mxPwum80W8wuRY1zwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711451431; c=relaxed/simple;
	bh=lNqffwHbF4+DgPye64vC4bdBKO4etn+DRoKyxkJB4dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpnOwxBfPwHIAkpj3LXZSifKmx72ictaFpErWQBtpc9k0sbiNpWHpRa6P9Y7XlqmneiEtTJBEMU/+/WRZUe6zzdx3ivfh8cm0GAgJmCgUNXJNGzE1ujW5jm1zCj8lVp3Ee6N3Rw6FB8ahaKZY1ZK1MyFlLIVjhkVG9ESnnaL8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZPDLU58; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5dc949f998fso3128878a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711451429; x=1712056229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGBD00Nb+rvDCVS5Fn3z09PsE5MBX3NmOYcBRrgB0Ak=;
        b=zZPDLU580HPKiXYVVXk2P7n4QQ0HTnufmR9KkrA8VrQWaSSsWQYeHXj+31bQyiOVbq
         nkEC7knCDBUc3aQEZRCQX6uipN9Ffmk45NXw7wXts8xAshONBqxJhZE8T30fXsxqKsyw
         GByGYcf9dDbDh8BwYOO0P1MCAwcdldg7kdINXoY7mBOzBbRDp2JLrunGIvpJtyQdznVs
         HWXCptyBcoCyEduhch5qY7OocUee6+ZQeaxMiPPZPlCsbpKxyqqzYSljO0GNqD0B+KV9
         G5gMlyT7gyNBvBdB9l3NiAsxgEYHsyw4OJGBfmqr0D3p1wCIUNAZH8n4B2gozkbH7Yan
         acYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711451429; x=1712056229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGBD00Nb+rvDCVS5Fn3z09PsE5MBX3NmOYcBRrgB0Ak=;
        b=S7AEeHE/yC34uRhmXpXHiG+wm1OKLRM2b4ZXJZN40nh1t4a7X8r/FoJjhTi1d611ui
         7NtotO86d71T8ZFGzbtBZL7ftAGyJfw5EwsTEmXBU8BuY7OiVBOj0AidtnAb9FnCLNgy
         HZ1yKJIevqDL71qPHlWDRP0oKUQ1iKh/Ysv9ii4rnvspjw/uF68NTMeVz9oTVTWfsldR
         Hwl4dr5k3MER+890fxNYtQtU2wTCzBwV3WCof4XqjNOvsEK2l9PU7PYtf1HH9DgJWkFn
         yyW/PEip7KiZvMOwDvQ4U+Nne0ULbTbotrohh7fqRv8wcsBpJWFkOAImfyki/y4zRTf0
         AVjA==
X-Forwarded-Encrypted: i=1; AJvYcCVtJSJwvjMK5LlCgP418UIUv+39dOBGwDqvhDvbjmyrqliSgvVb15R3QS9846GVsmNp+zdHWeJaU8n+otC/Ai5IiBttonBWo0i4aIg=
X-Gm-Message-State: AOJu0Yx2kGXuUQj6u+NfkOvLLChpXaGPDrCd8Ps5qNn3yPq7//EUlQX/
	/FjJ9l+Pn1E15DUCG4Sp/qDNGvXVetnakDOqbaDOyhbKhKwy6MpY/UCEsjNC+A==
X-Google-Smtp-Source: AGHT+IGbSEcld3RliKzvUERGTeqYSFE/Rs+8oSpqppqSDIVaVGzMOSy8p0g1ooCyZlGfvgyHtpzkLQ==
X-Received: by 2002:a05:6a20:d81b:b0:1a3:bb75:17ab with SMTP id iv27-20020a056a20d81b00b001a3bb7517abmr8219769pzb.59.1711451429355;
        Tue, 26 Mar 2024 04:10:29 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r18-20020aa78b92000000b006e647716b6esm5943393pfd.149.2024.03.26.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 04:10:29 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:40:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326111021.GA13849@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
 <20240326074429.GC9565@thinkpad>
 <ZgKiUogkgrMwV1uD@x1-carbon>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgKiUogkgrMwV1uD@x1-carbon>

On Tue, Mar 26, 2024 at 11:24:18AM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 01:14:29PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 22, 2024 at 05:08:22PM +0100, Niklas Cassel wrote:
> > > On Thu, Mar 14, 2024 at 08:53:40PM +0530, Manivannan Sadhasivam wrote:
> > > > All EP specific resources are enabled during PERST# deassert. As a counter
> > > > operation, all resources should be disabled during PERST# assert. There is
> > > > no point in skipping that if the link was not enabled.
> > > > 
> > > > This will also result in enablement of the resources twice if PERST# got
> > > > deasserted again. So remove the check from qcom_pcie_perst_assert() and
> > > > disable all the resources unconditionally.
> > > > 
> > > > Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
> > > >  1 file changed, 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > index 2fb8c15e7a91..50b1635e3cbb 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > @@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> > > >  static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> > > >  {
> > > >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > > > -	struct device *dev = pci->dev;
> > > > -
> > > > -	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
> > > > -		dev_dbg(dev, "Link is already disabled\n");
> > > > -		return;
> > > > -	}
> > > >  
> > > >  	dw_pcie_ep_cleanup(&pci->ep);
> > > >  	qcom_pcie_disable_resources(pcie_ep);
> > > 
> > > Are you really sure that this is safe?
> > > 
> > > I think I remember seeing some splat in dmesg if some clks, or maybe it
> > > was regulators, got disabled while already being disabled.
> > > 
> > > Perhaps you could test it by simply calling:
> > > qcom_pcie_disable_resources();
> > > twice here, and see if you see and splat in dmesg.
> > > 
> > 
> > Calling the disable_resources() function twice will definitely result in the
> > splat. But here PERST# is level triggered, so I don't see how the EP can see
> > assert twice.
> > 
> > Am I missing something?
> 
> I think I remember now, I was developing a driver using a .core_init_notifier,
> but I followed the pcie-tegra model, which does not enable any resources in
> probe() (it only gets them), so I got the splat because when PERST got
> asserted, resources would get disabled even though they were already disabled.
> 
> pcie-qcom:
> -gets resources in .probe()
> -enables resources in .probe()
> -sets no default state in .probe()
> 
> pcie-tegra:
> -gets resources in .probe()
> -enables resources in perst_deassert()
> -sets default state to EP_STATE_DISABLED in probe()
> 
> So pcie-qcom does not seem to be following the same pattern like pcie-tegra,
> because pcie-qcom actually does enable resources for the first time in
> probe(), while tegra will enable resources for the first time in
> perst_deassert().
> 
> Sorry for the noise.
> 

I was planning to drop enable_resources() from Qcom driver once the DBI rework
series gets merged. Because, the resource enablement during probe is currently
done to avoid the crash that is bound to happen if registers are accessed during
probe.

But what your observation reveals is that it is possible to get PERST# assert
during the EP boot up itself which I was not accounting for. I always assumed
that the EP will receive PERST# deassert first. If that is not the case, then
this patch needs to be dropped.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

