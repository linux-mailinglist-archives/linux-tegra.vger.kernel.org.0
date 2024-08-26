Return-Path: <linux-tegra+bounces-3459-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA9495EA07
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Aug 2024 09:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCA5281053
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Aug 2024 07:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F8B128369;
	Mon, 26 Aug 2024 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="SJ+2y0sZ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F158636AF2;
	Mon, 26 Aug 2024 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656312; cv=none; b=UNsL+ouK5OZNeNyCz4LNMBjhHMcR2zqwY/nZuIqcbiFnJIv1WBhbZairkb7AQ7P671tGWZP7zSGKdUFscZ6F6iE5evmOBfAIu1L0fBibJru/E7Aq+Q8LFVZH8GjQJ3YNxM0iYEMu97aOLvsYbhI1omA2/00WMmrX6tVORgDMlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656312; c=relaxed/simple;
	bh=bi7Z8//7vu9sLbagUtW/4VVTMRthL7QxYfDlkeCIdCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhkVYob2oJs05eGZI7tvfUm01ZGSHMTeHoGnHB8iI62aDKPVS8PwAO0+u4Yv1yIfp1u4DE5Y+t0othn7IOjxnDbYDYS3rpnIIf01B5SLU4rCXlbWt0kWGprPvYghwSvCymVmK+kGtgQ/BGkloMjmXc/UxDDE/o5Tg0PQ+SDRIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=SJ+2y0sZ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 232DE2827D9;
	Mon, 26 Aug 2024 09:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1724656303;
	bh=bi7Z8//7vu9sLbagUtW/4VVTMRthL7QxYfDlkeCIdCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJ+2y0sZPntw2N3IiFehjKpVBH/FTfVch0NIXqaQi2j1t/3nqntnHnKjzUn4RbY6J
	 ceuAdqVKlm1tc9XZj0XTmFqufob4LAQUTclgsOkEq909RVlByZ9K2BHxVyPJO7WVvr
	 LbFFcsXcx4TLeSOPF7BZrf7e48W/wyBoB1uZSlDeer30t5Tk7vnT7YBL9BaYFRJu2Z
	 GV5vnsY40smPJQ+mEeXBw9e96pQVueyOO670pQDL/9ZbeKLqy7vo85MtlNnZC+5g6w
	 GSC7mJ9t2BirLmFLPo3jbbsD+rfVRul5FaeT2YpUYlGwMSlhTl3OMGcNwYAjqQdLID
	 EbnP1GEXHysfg==
Date: Mon, 26 Aug 2024 09:11:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V4] iommu/io-pgtable-arm: Optimise non-coherent unmap
Message-ID: <Zswqrmj9PcCz3XHa@8bytes.org>
References: <20240806105135.218089-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806105135.218089-1-amhetre@nvidia.com>

On Tue, Aug 06, 2024 at 10:51:35AM +0000, Ashish Mhetre wrote:
>  drivers/iommu/io-pgtable-arm.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)

Applied, thanks.

