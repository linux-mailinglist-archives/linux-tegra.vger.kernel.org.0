Return-Path: <linux-tegra+bounces-2189-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEA8BDD27
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2024 10:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC6B91F255C8
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2024 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163C813C9A9;
	Tue,  7 May 2024 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvMWLB7E"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0413C90C
	for <linux-tegra@vger.kernel.org>; Tue,  7 May 2024 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070520; cv=none; b=bancJo/qWf1ds8hwMY4fdDcwTu2CWJ6AYBFMoXcyyC4Qd0aie1/QTr8LnNBjT3YYpDrrD2sYHmte0cxzCOPKWSNT6mSQUUZl6cjgT6jLRnuLCUQEMXn6hQfHmO8jyNhVFRwx2907rpv3260Ro0P37p/inKXeURYYvEXbFSgVNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070520; c=relaxed/simple;
	bh=WAA10rA6qRqoYCr9XeTblOpVslB6CTUD6a/rB8ts6T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1Aa+4ObkG+3j4gk7Fsl+Sx/56dnMhVqMScdFnYjKGDhxr7ohhB3yhdC3O1O3iCZCIHOtr+ZN6WIKWx4vPOixKUn0MpQoZUPeKUR7kyHjQfvmY7qDjWXsnvwqodnJpFjPmjuQ3/K26xZDxHzBKhododcduotp0khkTfI5gM+33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvMWLB7E; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso13294105ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 07 May 2024 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715070518; x=1715675318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=WvMWLB7E7Vioc78gLbcP+uIOdjLgNFyZB9fYMLjyHdQ0K/0s8XVqxUsxSNp0SwnhBV
         Po0ygzSSPvuKNYBuIEZ2qLhJWTMtXEQbsEe73BhDSODBIRXflIFkEtO0SBpCi0mv0Uzx
         6BvDm5B7Ahhp0Py7XxqJ0UTrhB7dH4Z6H5nK9unsRMCxZoM/zOBWuQQUJBApbXYghm3l
         0sKXt9B/QNEQJ7espVI/0Kyw2HJLvOPCDBb7R0Ldawusan1I9QmafSd2GQKsXYKrt+Yt
         p27GqajK0LK4LsoicOAz1oiQrze7N8KJ37oTXJpIMXS3iXAi7+I5fme9w4cEPYqsL/FU
         rqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715070518; x=1715675318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=B6t5mWbvX3lteCM5Z4uk936PcMGOtsJrDOEhsXQfn9E1W8Nmd8uIzRfUqVEyRN29JI
         /fcWfeQ9ONGLiXTtNlKg1tQ5TGna65bZXYzEGt41x9Ev6VZMua3C1tUL/jadjrxayaCh
         8Yex38yVaFAPgh6sp1o/nqXXDtaxorRtxVRRcaqrjiN2z4dnTvwKcAG8O6d1xpUm3Vf1
         5/MSLpauTo2tGNRATBgqlnG2F3ZWXI/h5LpAbZBXG33xhQt3eHrG7MrEYtbh5o9UDL/Y
         U12kIsjHdUHi3hB6Xc2NMru/gPfCO1wdU9oRqXYIdR2LoHIthNIeW7N7I2XWn3mmfvew
         TOkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4SUu1BwEg/gc/uVi1wOWffrPnNjZptT1fC0iez2Sr4Q0CAeSCUau3Xa27cTWWiD7PKyP1D1o/s0L3p61V27cMKAtoMNmFKvv4QW4=
X-Gm-Message-State: AOJu0Yw6H9MLNCCDKTF6eHZc3mVtuQFXnxxp6zMM6va55G5H8emN4Snu
	KUXtKffRcrxIfwFxjeFxAGWztfveVk18eYpU5EC2O89miFCxHEoi/vSxxOR2tA==
X-Google-Smtp-Source: AGHT+IFkZxsg9zZ8uGCj6F9b96ztkp16VI7pxyk7k4qDQRuZ3fJBvMiqX1TfN7jL1VUt3SzWbyr1LA==
X-Received: by 2002:a17:902:ce8a:b0:1e4:9ad5:a666 with SMTP id f10-20020a170902ce8a00b001e49ad5a666mr15845336plg.25.1715070517573;
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Received: from thinkpad ([117.213.100.197])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm9603688plb.86.2024.05.07.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Date: Tue, 7 May 2024 13:58:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240507082822.GA6659@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
 <20240507081441.GA6025@thinkpad>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507081441.GA6025@thinkpad>

On Tue, May 07, 2024 at 01:44:56PM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 06, 2024 at 02:10:24PM +0200, Linus Walleij wrote:
> > On Mon, Apr 29, 2024 at 12:25 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > The of_gpio.h is going to be removed. In preparation of that convert
> > > the driver to the agnostic API.
> > >
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > I think there is a bug here, the code is respecting the OF property
> > "reset-gpio-active-high"
> > but the code in drivers/gpio/gpiolib-of.h actually has a quirk for
> > this so you can just
> > delete all the active high handling and rely on 1 = asserted and 0 =
> > deasserted when
> > using GPIO descriptors.
> > 
> 
> Wow...
> 
> So this bug is present even before this series, right?
> 
> > Just delete this thing:
> > imx6_pcie->gpio_active_high = of_property_read_bool(node,
> >                                            "reset-gpio-active-high");
> 
> But this is just a bandaid IMO. The flag for the PERST# GPIO should be properly
> set in the board dts as per the board design.
> 

Hmm, no. I was confused by the property. But this quirk in gpiolib-of.c is going
to be applied while changing the GPIO state also or just during request time?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

