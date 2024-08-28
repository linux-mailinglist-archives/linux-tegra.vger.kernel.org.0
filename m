Return-Path: <linux-tegra+bounces-3519-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03AD962C4F
	for <lists+linux-tegra@lfdr.de>; Wed, 28 Aug 2024 17:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A1151F25398
	for <lists+linux-tegra@lfdr.de>; Wed, 28 Aug 2024 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78411A3BB3;
	Wed, 28 Aug 2024 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0nhP0E2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842C19AD7E
	for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858840; cv=none; b=a43MYO3/2ZKuqNOOXjZotGSSivl9fuO9ijQK0BbyTUElEMRTDRJkovAKa81A/W0zwPJhAk21tGK644pkiO8CfSsI4EirOHtocDtOfSlgM4xqyqmLlAhAW5FDvOFKnXu/GEhE4gIjjHxGzfxtWzNu6MPHui0qiRM7A65hcIx+Km0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858840; c=relaxed/simple;
	bh=9HzJPcyEnxnH+Ag1W1YfqcDxRxVZwQq5Cf1O/A3FzM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xqgr1iBVwZKipMrB+7AFH+LHiZVy771wQQiWWZF1WTRea5w4XMwn1a9srcB4LDaZ5TEtDnnSNLLmnhKlWSPanfoK9vYpl9uXHFaYJiN3h/ZdHKVb8HxfmEXa/zxEQ1w3Qqt+4xW1s+LXL143+DVHdCUXKufmyl0WMoILES97PDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0nhP0E2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a869332c2c2so132662366b.0
        for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724858837; x=1725463637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MOBY3lvV3tV18oDrPAdQ4WWc7mqga2KPzBBZTBJ42n4=;
        b=H0nhP0E2FpU0nf2paOWcaEJHRBZ/LKmi9cZ9iLzJj7wlN7wetRnM4ZCnCDSe+yHL/3
         5nrIeLW4XVoas2kGw8GjUmf7OxcxgCYmCfXiCgU4ffEEbQ9bEf5b6Cz1d8Znb6In/c1g
         WfV92Xm+odaDWJRU53KXMtJ6tojJFS/1eYj7Yl4o0FWC3D+cNuZfQ0w3eWU0L9YIbmrd
         8y3ZDTs7fPDqqZRvZjsSVbHiLYsgdpyjk2vbHteeCpZOB8r1kiXbsPzLN2q0eOfvkpIr
         6XNaFl4th4h9qfJwiEqjhB5X2ULh6ENDFdVUzsUYuRnRcmqPv2OiJJZ6ZY6Dko0w6J7q
         HQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858837; x=1725463637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOBY3lvV3tV18oDrPAdQ4WWc7mqga2KPzBBZTBJ42n4=;
        b=ZOy3+xJ7vyZDBIeFg3XWEI1CRLRetl4U8z53URzSOPCcvgfUt0iaBMRy2EM1p66Cy2
         E64lZWKOUNFbRlb/i8iPA+WQiFDlmQcFsWIN3X8RgXmHY6SaDv+GcAlCIQqOSntpvZdx
         zOGK6i2Ky0HDa4gmKIvHKdpG3e/kwMYGhed+CFDu/S/YjmIzU5qFjBucB6O2kVtCWv1i
         r7UOEivHL722SsYEpxVKGH7c2M2teh7vj0oyAXmnYr5YdRhXz2pHvICNszod5FrqofDd
         7Bo9rLnmLgCksgIjU1aQOIv6/uZ08xdR0nHLi6IH2Z7E8E+emLxh3o/CcU8C3EJDS8yU
         al/w==
X-Forwarded-Encrypted: i=1; AJvYcCXimLALdXRdMkZdVMmds1gTPQ6//9Sp7kzYEqjcInckg6WSKL65vU8VxbwwKxZHc0fTKlDyStXULtZjpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0FeZwqkvt4cXCTALGi0sG4oCrUwoY5uzJjV9OOhpkOKYxulr
	vZXV72YeyEuYuGmFVTa4FDNkMBYA2i0BYo2t24xWgL4q3c2tbhKcwnlFrbIzZ8PumoodPPFCLcv
	Ec9AALvR0pOkNwZoYmKvmA+L9Pb+Jm0waSASt5Q==
X-Google-Smtp-Source: AGHT+IFixyOXCmBZEvpwN9wCdDNwQQHCRpTc9E75dou5XrmHQlyvUPK8JdSl5J69mGi3TqnnQJpuzic3MShgOP6KZGo=
X-Received: by 2002:a17:907:7f21:b0:a86:9f1b:f5c3 with SMTP id
 a640c23a62f3a-a870ab077b3mr311389666b.28.1724858837278; Wed, 28 Aug 2024
 08:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723144610.564273-1-ulf.hansson@linaro.org>
 <20240723144610.564273-2-ulf.hansson@linaro.org> <4455ntyh3v5kk6p2hlprcdc3twy5lgwcihl6fg7akxxlxixr6f@vrpesypllh3o>
In-Reply-To: <4455ntyh3v5kk6p2hlprcdc3twy5lgwcihl6fg7akxxlxixr6f@vrpesypllh3o>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Aug 2024 17:26:40 +0200
Message-ID: <CAPDyKFosYtG=6KtDFeNq-XJ9DO0fbFK-bcpR7G8cVH2Zn2az3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_list()
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 17:06, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Jul 23, 2024 at 04:46:07PM GMT, Ulf Hansson wrote:
> > Rather than hooking up the PM domains through devm_pm_opp_attach_genpd()
> > and manage the device-link, let's avoid the boilerplate-code by converting
> > into dev_pm_domain_attach|detach_list.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/gpu/drm/tegra/gr3d.c | 46 ++++++++++--------------------------
> >  1 file changed, 13 insertions(+), 33 deletions(-)
>
> Applied to drm-misc-next, thanks.

Please drop this from your tree. I already have a patch [1] that you
have acked, which is a newer version of $subject patch.

Sorry if this was unclear.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/CAPDyKFqZ9XXi5_-essaGbdWBDLX8uR5nO9vDJCExBGV+10KqZA@mail.gmail.com/

