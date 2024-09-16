Return-Path: <linux-tegra+bounces-3745-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D494197A4A5
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2024 16:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D97128DEBF
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2024 14:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC2F15B54F;
	Mon, 16 Sep 2024 14:58:42 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74E15B10F
	for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2024 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498722; cv=none; b=qYU4WHLT0Uy7m8mqFbQ4ABAfi5yOoO4qP8rmPX8lJV2aWvH24OKQn7rx6Ja01vXMxxV0uQ1g7tLvWTSdY7WJNvMRkY5hEQzDIdiOHWmceWcGM7R9LAKSVdJ3kSSZ33f51/M53HPOi8CrxcaVMFHw61PueIerdr5R8wbmoGAK8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498722; c=relaxed/simple;
	bh=5po5W4PGFzCNHwBOlgsTg9s2Caj3YphOGSUNxZQO6Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPDWUCTJ//S6RPHVy6CkWpvJVi/9YsCzmcDYpOjTuQuhs3wkAXX30G64V0rBfFHbbFR+cMtySzQu9JYL5QOUrAa1myCaLAdpDNKuG1y+VZ4HeJL0cPFd9Re86UqYt2lHxSEsedrrH3So63oBsLgO4WJnpfI/oO4l+pHp7DN/uYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 75582227AC0; Mon, 16 Sep 2024 16:58:35 +0200 (CEST)
Date: Mon, 16 Sep 2024 16:58:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Set up device DMA parameters
Message-ID: <20240916145835.GA17719@lst.de>
References: <20240916133320.368620-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916133320.368620-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Sep 16, 2024 at 03:33:20PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to store device DMA parameters, the DMA framework depends on
> the device's dma_parms field to point at a valid memory location. Add
> backing storage for this in struct host1x_memory_context and point to
> it.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

I guess this another thing caught by the WARN_ON in the dma_set*
functions?


