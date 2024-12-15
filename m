Return-Path: <linux-tegra+bounces-4322-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D59F09E4
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Dec 2024 11:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2C7316A2ED
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Dec 2024 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153FF1BD01D;
	Fri, 13 Dec 2024 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKq2nN//"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B051B392A;
	Fri, 13 Dec 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086650; cv=none; b=btBLOilhF6PUORT8dD4X19FDY+1xLdLkW/zyP5rMzYkBkDZpW1gsIEKBlf9+PJNe8S/meWtmGf5K54VxremG4lZPTsBBPQL07hOwYt4iN/2S8UrfDOHSV9xbHMHktc3n0ZzMMhASt3Dh9U3HUHr0L3ZaGV0Fp/ESJIBX4WSf5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086650; c=relaxed/simple;
	bh=CziF+LswqMPGIPOPc6TJWRs75mYixmRsJvDU27/90rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goTH4I3dZbNHtk3oq7AIvuvUlL/mRjygjUsr6E/i1BCmGMSDg4S/m4fT9mwOvj9AHsOC8X1PMhuAUMjxts5XmKtdddmyWGjFl5SJcnI+08gRgpOrccV2QDqlqwHmUn5RcYkvlTDeMx+lNyg8qk8iBwB/wcKHrhffk0QL+kw2gSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKq2nN//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C659C4CED0;
	Fri, 13 Dec 2024 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734086649;
	bh=CziF+LswqMPGIPOPc6TJWRs75mYixmRsJvDU27/90rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKq2nN//uul4VV3ZE8XRwfemG7sz28GiW2aVoHH5nv2gUfSP6E1mmywqMETewzV8/
	 0lAxgajCRBOuY/dj3UUbplY7Hmj9V1yt3cHTKPSjeo2dfIZrCtqB8KRPdEjOpgCw/G
	 dap4h9gXuvh3N2FNNOz7iD5v0X0kwUIzJ5/+2DfauiooFO3bcawNlX0X9aZQOJPQYo
	 TlBIvrMVDF1X2UzfImeMHGCq1gIRIEISnwVMhlAOFXTMTYdufneyjyybzIDNE3pclt
	 D02XBoAblNaqnOoCU4onMls+wIfqus4iSY17ota2W+TdGLc7J1Fs9QWglxQ8ILx/h2
	 ibAi+C/1FcKRQ==
Date: Fri, 13 Dec 2024 11:44:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mperttunen@nvidia.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon
 information
Message-ID: <34kg2aoaeem3bjqh6vli43hc63tvfx7uumkmkre3wkvek2neyu@jhj5n3om7vzd>
References: <20241210174554.18869-1-johnliu@nvidia.com>
 <20241210174554.18869-2-johnliu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210174554.18869-2-johnliu@nvidia.com>

On Tue, Dec 10, 2024 at 09:45:50AM -0800, Johnny Liu wrote:
> An activity monitor (actmon) is used to measure the device runtime
> utilization to help drive software power management policies.
> 
> Extend the reg space to include actmon aperture for actmon configuration
> through host1x.

We kind of see that from the diff. Say what we do not see, e.g. ABI
impact or why this is flexible/optional for existing devices.

Best regards,
Krzysztof


