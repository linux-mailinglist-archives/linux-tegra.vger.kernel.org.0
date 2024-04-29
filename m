Return-Path: <linux-tegra+bounces-2007-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6458B5EB5
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 18:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B334A1F224D3
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 16:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A9F85634;
	Mon, 29 Apr 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opFG75l1"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823AB84E15;
	Mon, 29 Apr 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407272; cv=none; b=ezZALn8cFa+Z3XFCRyEtl2lWNEwFZvX+oZov7qxrovSB0eDLnQmnNVcn4mA86b0wXuceZvYXGyDStkHAQtePBCyEQ8q73L0dT/e3NxAnscqcUN0BfYKXVKnSBSQivlXZYWGB7CPLZH0t+iY+MfCCQ1fjp9Ej4R4dKBWpQXQlha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407272; c=relaxed/simple;
	bh=8TgknXW2nRuCRYEDQcohbK1tjflgHkvvO4mslMioqVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYTkImdrMjq39SbiHW9dQfOVRoE/774n6RZyXYF0EcW74rXvDJXpOHR/gZc5faUk2eSuOiO5Rp4+/MIbluyTVtJ0s/zwDV9KdQ1V5qd3SpcMFiDSscLoDhQ3Jpk9dqZmlV2knFDhGpV59RXtMH9pE2DIlFYVji3vkhoTYWXW40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opFG75l1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9061C4AF19;
	Mon, 29 Apr 2024 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714407272;
	bh=8TgknXW2nRuCRYEDQcohbK1tjflgHkvvO4mslMioqVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opFG75l15B4u2m1seEWAdfME4XBzWmXYYhz4UqZlVy+JM4dQNi5Ao05N6EFMEAbMD
	 lbWnpOpH+OOSF+6Q8836kuXsmOeWBme5lHERzLUYGYsQ6mnG8YJVmcDgo3SsAjtAfr
	 Q/INyLbjWlKR2UiXLRFWdHyLUW+oUjTe5KChDKa6yuI4Dsoq1s8RU5n8yZScND56Di
	 O/inyLh6dLPBm2LjuRCv4akJDqqZr7mLMB+axLNw6D8TjbTQeTTSsdRYESYhSg9Ruh
	 49xj0v0RR2/YEfRw4sKsi55mDzCzXH4rJPAFymXBxv7IqlfUZ/Y9GLfWsUr/eU8zZU
	 /OhekKRkJMZKg==
Date: Mon, 29 Apr 2024 11:14:28 -0500
From: Rob Herring <robh@kernel.org>
To: Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ASoC: dt-bindings: tegra30-i2s: convert to dt schema
Message-ID: <171440724894.1987444.14829061739938565881.robh@kernel.org>
References: <20240426170322.36273-1-sheharyaar48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426170322.36273-1-sheharyaar48@gmail.com>


On Fri, 26 Apr 2024 22:33:18 +0530, Mohammad Shehar Yaar Tausif wrote:
> Convert NVIDIA Tegra30 I2S binding to DT schema and
> add "clock-names" property used by multiple tegra i2s blocks
> in arch/arm64/boot/dts/nvidia/tegra132.dtsi. This is not a
> required property by the binding.
> 
> Signed-off-by: Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
> ---
> Changes v4->v5:
> - removed redundant example
> - removed redundant compatible
> 
> v4 : https://lore.kernel.org/all/20240425153045.49939-1-sheharyaar48@gmail.com/
> ---
>  .../bindings/sound/nvidia,tegra30-i2s.txt     | 27 --------
>  .../bindings/sound/nvidia,tegra30-i2s.yaml    | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


