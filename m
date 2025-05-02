Return-Path: <linux-tegra+bounces-6388-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C0AA7616
	for <lists+linux-tegra@lfdr.de>; Fri,  2 May 2025 17:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED6B188A4F9
	for <lists+linux-tegra@lfdr.de>; Fri,  2 May 2025 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7676255F47;
	Fri,  2 May 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXuLcfX3"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53A746E
	for <linux-tegra@vger.kernel.org>; Fri,  2 May 2025 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199897; cv=none; b=sK3t7C816MpquBuuX9U5cS18AfmDswf0OrsMASmP5cUyNwmq3QcPY2eOGesHk/UcIdU5403Sb+NqvlwkF8i5p00ZNh2si3eU4Qz6hYG2wDB2nXPVnHAPx8H7cYsPhpGClWD2QFI+jv4GX+RkhzWCPE+UGaatPJV3ATxYwx60feE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199897; c=relaxed/simple;
	bh=RgsUVPW9FmjBBY4GM2k1ebX3w5AMTDdulNA13o2n7dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knymFPftcdOilWHXa4lQUF74w7tFZ/LfeJvwxyazBqNKduw7BQdG3Aju0fV9LIc0jSfPxH2IyTo4nm5mw8lwV8O1gAx9A3QMx0B48q2f33S1b/9yLfPa/Usr33g+AhxoRrs3oiiHcaps+w3VX9QLh+/eAugvdlg7xiRCg7HRin4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXuLcfX3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b98acaadso2242932b3a.1
        for <linux-tegra@vger.kernel.org>; Fri, 02 May 2025 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746199895; x=1746804695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQe+MROJ/ag6KDFyVS/w9IQL57geisNKdBHBf0gkBb4=;
        b=KXuLcfX38uY+Pvxv4kIoYPGRlHxegAnL83ODbJcghGU2zZ+4BdpH5ptoY5St8DcQzT
         Q6cG+IaAmB0wbaICxOYafQ0h2DmqysBU+Opf7Mw58wAaHWgNBSyVXu667w0snuRwHWgR
         jeLgfTGhtts6JTyGeMTjhKc31hibPo7QcsG9BjC8myt+6flnOk1VxAQzw7cSJD4XqX+d
         9DcT85kKvQBv3Ge9XLqyLLrGxJOfKXYja4g9E/S9sHmIlzAosY7zI7S5MQbi2bBLAQoj
         kVB+ts10xJNC0I5lnpIkZ7AGHHtBMTIVHa5XqkkjGg82Z0MbP3zurzCso8yAR/L/vJIH
         7eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199895; x=1746804695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQe+MROJ/ag6KDFyVS/w9IQL57geisNKdBHBf0gkBb4=;
        b=Xteu1O7kweTXs/lZFnX+H8ZmW5Wg4dXVNV4iqmb/YbIvharU3qIvfyTcjzSyrzljV5
         920mDumfHkQhd8A3x5O8JzbTDd/W0mdBvFSePPgaD8S4AnwAoRcpEkTVLChEPzJjiLtZ
         D69w8iryXlJRgSPbsYnNdPfBnX1/IAEKfoIDhTZOI0mGRWTNNcJyiDjtZpWkt/76VJhv
         d/iZjBZua9x1KW3deZCmOJWkw06H7IUk95oPE9vboIoYeWW4WYXvhQgQoLsGMNPW7nS/
         ewVVdyXsfClOqgy8NwS8YeJpm7DHOkexX85aFSlrX+0YmmhVtd/sUTC5gN2a6Vj59RUE
         As6w==
X-Forwarded-Encrypted: i=1; AJvYcCViZ541cpC7fdWCFWJShZMouCBW92Fkw1SQaH/fAOzdv1Nx4KnAujN5ROEYQAR36j0sowIncLeDcLHy1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxENjqHAz6k4tudFISi2AuHInEmkVqV/8pq64EPUOumPGHr8eKO
	PFz0IBp+mg0UxFh7xg+7U9JXwriudXLwwBd7vO8NCcZIH7M0/PEph7yfOQSLrA==
X-Gm-Gg: ASbGncvTyUnVfVGG5+hni+ccSB16y4kdJj41QN1FO03UxaoUFUKTxkKt5Kd9X0IjAdM
	mVdGIaEIhcBZb2SiE34xMy1UWg3ea/7j0BnqkZaXcltgHouVMQGsTmRn3YBt4zXKlk3d3wLNtFS
	4H2cpXZc9LrGOrwYoJ/43O7CQb4FzFqYXuv1Ta7bxYz3GOuo6RN5gijLoeeEAf1EtBTrsuCChES
	qh9nXAH4F6a15WUwevYCRYSOuwQDFn6UltAKVs6NeudZLtVZq3H1fCohjAQp9rz9ZsKYv2B+Dx1
	+jKx1upUi2xv/KqaJW0/yYaXwVgpPVPSfL1Besowcnf1kltG2u4leJ5NZTi/UOuB
X-Google-Smtp-Source: AGHT+IFdGWX9Sw1XBBVo+bVrO9YSbA26fhevpmOJ0/HG3/Dt/hywD45Ieea7g6tn4SCocxQu/IFEJw==
X-Received: by 2002:a05:6a21:9103:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-20cdfcfc84cmr4720910637.33.1746199895470;
        Fri, 02 May 2025 08:31:35 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbb15sm1767568b3a.58.2025.05.02.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:31:34 -0700 (PDT)
Date: Fri, 2 May 2025 21:01:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: tegra: Allow building as a module
Message-ID: <4u4h27w77sdjvy43b3yonidhfjuvljylms3qxqfaqwyw3v32qo@kzgrrenxr6yz>
References: <20250420-pci-tegra-module-v1-0-c0a1f831354a@gmail.com>
 <20250420-pci-tegra-module-v1-2-c0a1f831354a@gmail.com>
 <pgp3cdksefn2z4n2hlyhftbdlfwyx7gbol7q6wdj5j4brux3cw@thts2qcahdw3>
 <CALHNRZ9R4SWtzAYocY9X7D9hm4mXeWKhdo_rk5UmRPVGD-vbBQ@mail.gmail.com>
 <lk37wtb25pr2rj3zhct5udaykr7joqw2mpgtupjq33of2xhesi@rmdgucbzxmgz>
 <CALHNRZ8gSzOVpN_au_ntSan7or=uRBrPSRFdbDqAHxitcEfs7g@mail.gmail.com>
 <ym5fy2svuukmoy7uvg4i4amsosjdzygxauytxoctjbjzxwqdng@o5tsy5irkgfl>
 <CALHNRZ-vVzNzfJRMM+i044qwvuv-bm0hB8fTZu0XQJA_qT9Mow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ-vVzNzfJRMM+i044qwvuv-bm0hB8fTZu0XQJA_qT9Mow@mail.gmail.com>

On Mon, Apr 28, 2025 at 05:39:23PM -0500, Aaron Kling wrote:
> On Sun, Apr 27, 2025 at 10:57 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, Apr 21, 2025 at 11:33:01AM -0500, Aaron Kling wrote:
> > > On Mon, Apr 21, 2025 at 3:54 AM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > On Mon, Apr 21, 2025 at 03:09:42AM -0500, Aaron Kling wrote:
> > > > > On Mon, Apr 21, 2025 at 2:52 AM Manivannan Sadhasivam
> > > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > > >
> > > > > > On Sun, Apr 20, 2025 at 09:59:06PM -0500, Aaron Kling via B4 Relay wrote:
> > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > >
> > > > > > > The driver works fine as a module, so allow building as such.
> > > > > > >
> > > > > >
> > > > > > In the past, the former irqchip maintainer raised concerns for allowing the
> > > > > > irqchip drivers to be removed from the kernel. The concern was mostly (afaik)
> > > > > > due to not disposing all IRQs before removing the irq_domain.
> > > > > >
> > > > > > So Marek submitted a series [1] that added a new API for that. But that series
> > > > > > didn't progress further. So if you want to make this driver a module, you need
> > > > > > to do 2 things:
> > > > > >
> > > > > > 1. Make sure the cited series gets merged and this driver uses the new API.
> > > > > > 2. Get an Ack from Thomas (who is the only irqchip maintainer now).
> > > > >
> > > > > Should this be a hard blocker for building this one driver as a
> > > > > module? I did a quick grep of drivers/pci/controller for irq_domain,
> > > > > then compared several of the hits to the Kconfig. And every single one
> > > > > is tristate. Tegra is by far not a unique offender here.
> > > > >
> > > >
> > > > Not 'unique', yes. But the situation is a bit worse atm. Some of the patches
> > > > (making the driver as a module) were merged in the past without addressing the
> > > > mapping issue.
> > > >
> > > > Please take a look at the reply from Marc:
> > > > https://lkml.iu.edu/hypermail/linux/kernel/2207.2/08367.html
> > > >
> > > > Even though Marc said that disposing IRQs is not enough to make sure there are
> > > > no dangling pointers of the IRQs in the client drivers, I'm inclined to atleast
> > > > allow modular drivers if they could dispose all the mappings with the new API.
> > > > This doesn't mean that I'm not cared about the potential issue, but the removing
> > > > of modules is always an 'experimental' feature in the kernel. So users should be
> > > > aware of what they are doing. Also, we have not seen any reported issues after
> > > > disposing the IRQs from the controller drivers. That also adds to my view on
> > > > this issue.
> > > >
> > > > That being said, the safest option would be to get rid of the remove callback
> > > > and make the module modular. This will allow the driver to be built as a module
> > > > but never getting removed (make sure .suppress_bind_attrs is also set).
> > > .suppress_bind_attrs is already set in this driver. But what happens
> > > cleanup on shutdown if the remove is dropped? Would it be better to
> > > move remove to shutdown for this case?
> > >
> >
> > remove() won't be called on shutdown path, you need to populate the shutdown()
> > callback for that. But do note that both remove() and shutdown() serves
> > different purpose, so do not just rename the function.
> 
> I did some more looking into this today and came across 662b94c3195654
> [0]. That commit stated to add support to the driver to be built as a
> module, but didn't touch the Kconfig, so I'm unsure how that ever
> worked. But Manivannan, can you please take a look at that commit and
> its message? I'm not familiar with pcie and what is required for
> proper de-initialization. That commit added the remove method for the
> stated purpose of making the driver a module. Implying that none of
> that was needed on shutdown when built-in. So if the intent is to make
> a permanent module which cannot be unloaded, as you're asking for,
> does that mean it's safe to just fully revert that commit?
> 

Yeah, that commit was simply wrong and pointless. But the revert won't be
straightforward. So I'd recommend to simply drop the .remove() callback and the
associated code and finally make the driver tristate.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

