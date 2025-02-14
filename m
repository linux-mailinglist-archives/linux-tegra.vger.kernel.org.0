Return-Path: <linux-tegra+bounces-5085-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AE5A35D67
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Feb 2025 13:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA2F16A650
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Feb 2025 12:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B05263F2E;
	Fri, 14 Feb 2025 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUjk/HNS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA4263F25;
	Fri, 14 Feb 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535681; cv=none; b=sVngt0D/sYe0I+l+KoTnDB75SuB/lHmJm6zVTwx08zKBmwwodxrHBx7eaRdmlSqucvQ7CIZMLgFtUUq9NB4bj7+hFXQudnqAGK1eX/YzJXfQZoygIe5xYNXWP5aHS2yDEE8DAWbpDpQcq5RxCm1pDOvuIO49ws2MDUG86G0OD8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535681; c=relaxed/simple;
	bh=QVeyAHjLchA7WqNCbOqpcUiyNoAjfJYd0+puryVp7pk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=DabkQMa+PO8RHs672Th4oE4CZT45zSpRPWXXhUsp9Rpgiva89OyfaYvBc4+JrFsnCERYyY/tO632IAaiKhX+6Qe+r68h21GvWSH+vZviSifDTu5Z2Qxq8jZf5/v3/qv9BEDfCNhXi4yD0+imz7ST1KEWxDqdsA02ii7syXlN96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUjk/HNS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDCC4CEDF;
	Fri, 14 Feb 2025 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739535680;
	bh=QVeyAHjLchA7WqNCbOqpcUiyNoAjfJYd0+puryVp7pk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AUjk/HNSoYoQ/6J7hjZcAlA15HEnPLWX8YfTGndmLW2hjnNec5mewKqHd3o4W7hn1
	 BRejwhFBtkt0Ou/hhrCr7MBj8foKiGnTV43qoiKEdocEbiKnBmgLreJK/YOTEVKPN3
	 +A143cv0JRt5IesiDDjXgNTavFgIBYxDBRUaN00DB7p+FrFY2uJyHYz5UplrnP2F5q
	 g7zwJDQKL+1a6+P0N8QeTIIB/O1r8Ld7StCoKkmZ3d4Ixq2ekTm3LtkRLs1vDw8dNS
	 GehvDSkL6cE4lZUY9EYrRGBPRnZC6rukHydjIItJvaaudbv3dquLg/8mujJzlMYbNH
	 RxXBM5LjvADdw==
Message-ID: <c045b5b46c8daf79b124e6da9f951fe8@kernel.org>
Date: Fri, 14 Feb 2025 12:21:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
In-Reply-To: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Chunyan
 Zhang" <zhang.lyra@gmail.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Joel
 Stanley" <joel@jms.id.au>, "John Stultz" <jstultz@google.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marex@denx.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tian
 Tao" <tiantao6@hisilicon.com>, "Xinliang Liu" <xinliang.liu@linaro.org>, "Xinwei
 Kong" <kong.kongxinwei@hisilicon.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>, "Yongqin
 Liu" <yongqin.liu@linaro.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Thu, 13 Feb 2025 19:19:24 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

