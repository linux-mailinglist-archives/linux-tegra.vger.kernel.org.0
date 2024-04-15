Return-Path: <linux-tegra+bounces-1649-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A40848A582D
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 18:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50311C20D63
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 16:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC542824AE;
	Mon, 15 Apr 2024 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsa1F7ah"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CBA8248C
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713199927; cv=none; b=hgcrMiZBp8PR8J42vcP67SeCB9qG4r1lyWiFkA4hwog8/iYLKTRH8cm1soqWlXsQn/eOO+5B7HQygfeug67BDWdv7CNqELpchkWBP1w/bVBACevlVW0OcPkhBijNpP24MxjLiRIuTmxc7+uIXWosMloiPWUZQnQHg1DnlLsvz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713199927; c=relaxed/simple;
	bh=AEMyLc+1Z6/zZWJfleih74fSQmwSrodBP5//xLKr0kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwK+lg2lIxPf3ORss2PCvYXIXpGZarwPEJUUZpK4tT9De5zjjEEv4AkohNER2jn2E5hhWayZltavmdV9Ww36RUcqbj7QXcA7rDovw4KFaDR8hb8fjlRTEOHhHRI+jyVFjF4Ezt0QnoUemMFNXyk+/1iUg0KTOsIozph2JmCho3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dsa1F7ah; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso3057932276.0
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713199925; x=1713804725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=dsa1F7ahys6SpIQjSCQWyDHHH01o++e8EJ4D2JdC37KriycNPiXylLD+fXPqxRhRBu
         K483JJC24AvILtTUzcM9Zvy2QQUTXQsuw8zWRivJWRkIMXH3c+C518CVIp+Pvmjtgs1O
         BMToVlax8JRwlaaU/E4Bxx/9DDnSKJ0jnMJUD7HZ/IZbu1hYys5LLV3xvRq59vbyAe43
         cigXtlJ/N0AV64GSjO8/z4epLH3BNtUAKDRwA2Ei1mRrECt+IqecrZUDehymlN73MLP5
         9DPZHyRGnauPV4aKB+UxJq6igdBBTsKPviPKmRw5DK0fdZfR2NfSpAhht+uRItQarCSW
         cyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713199925; x=1713804725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=Nh3aauirlA8l7iEWFP4EIdmQSFAMsD+3htqDgWDMVxDgXJ/fiIvyJvjlu7hSjML7D2
         p8gBS2BDAZQjS/Wsm115JwVAkI1FKQ721azhk0Sgm2cU+68TPH/NrIP+21osFM7WRjdh
         e2fcuVA8nUF9iCS1tNwaXkCiF0RcHefFMF/+eWW1M2+krlGhgs5lx6vXrr34wRTqSX7b
         daAr3efZ689yyurwx6F7D8WI4PaxiAPGyoC09wLJKRs3KdHB2YRZYLmul6EjkBcPE5qz
         buHyr5tWvu2u8k0GZQMLyYQd1aznoCWKZZzHnGG/k9cQuTqONp7a1ViD9vH1lUbqzJNp
         yP4A==
X-Forwarded-Encrypted: i=1; AJvYcCV4zKEnIakS276wuqAlAIeyQL+wY7l2WyyUb7DviRDwxVjjQog58gP/g93B4sjphdn7b6h3Ud/Lq4dLpNu1EnJMqOBIins7KIvFQ1Q=
X-Gm-Message-State: AOJu0YwMsNVE2w6GrGd1rX4GMlIEMXMtexDdmH3oEGK502Fgv9mousNM
	ILL9V7B4jyeNnIi5d2sadPRIamakZCzfi/bJI+//BM+dRvAphFo3zBeQjpksIAqZP29+e4KYjQh
	DMRsckQuOP8c/jNB1DZxGrzTiO0G6tvDQcvPu9Q==
X-Google-Smtp-Source: AGHT+IFUQH4ONlkcS0+01CEMOIrS9D3xuTmTIKe0INOXof2d+fsMqiJVzA1ER/VV0S5Vp3kzkSBLhneirq6dUQh4r9c=
X-Received: by 2002:a25:9e0b:0:b0:de0:df15:b372 with SMTP id
 m11-20020a259e0b000000b00de0df15b372mr9733585ybq.63.1713199925395; Mon, 15
 Apr 2024 09:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 19:51:54 +0300
Message-ID: <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> [..]
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>
> Acked-by: Bjorn Andersson <andersson@kernel.org>

Note, we'd need to override PMU compatibles in sdm636.dtsi and
sdm660.dtsi. Ideally it should come as the same patch.

>
> Regards,
> Bjorn
>


-- 
With best wishes
Dmitry

