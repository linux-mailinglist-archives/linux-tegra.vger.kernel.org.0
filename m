Return-Path: <linux-tegra+bounces-3673-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53E971D92
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 17:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE997284610
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 15:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA34A1BDDB;
	Mon,  9 Sep 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G4wz0bIa"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DF1A716
	for <linux-tegra@vger.kernel.org>; Mon,  9 Sep 2024 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894575; cv=none; b=MmODU7YIq0z8B/KdPbcjuVnPqIXd1L24fAyYCW3KiTabNKMXugLFB4xIkyhGQEkxgz9GOGQc0iapry2H8Ckjm2SQMs6OIrYNBHDvuY/EUZ2aILUPChvSSG7IzS4iKpHcz0kKpL6uZLD4dOJBuknpWvnIQ+1ok9Wu11ejZiLvOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894575; c=relaxed/simple;
	bh=07N6SiRmOYuNHHxX4ivbyLFP9ApQoHSaE85MMSxTG8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsWoGpF7yTHrIvp9O2POC0WJg2GIGSLrytTGlW24qbpRIIei19ncQjGNVdH0nw/mrC7Fa14HQRWD35z8ZscY3RFtocz4TFpUgSm5vZ4m6VjSvbyENj8nxT+XB44Q/vZDkfPgU8HaJOGaGV/yFdI/cZNsZgiWzlwxlcC+8pIOmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G4wz0bIa; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6c51d1df755so24317266d6.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Sep 2024 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1725894573; x=1726499373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=waUjsUKAdPr4sGhzkMI+SGKybRx5CZeB0ueTsXysiJo=;
        b=G4wz0bIazcP1U9zzSyoWgNRWLsPCqKCnlIotTslZx8OS6+WdtDAyIRuGh5RGLKOml4
         cqJh+5Q6tTkvmS5s6F/Xk0256rnenSZyHdZbHlyFkn1+ADTm1QRya8V2LCK14EHyXgxc
         ahLP/61d52je+MUsc6pWxzGJCjh7OMSK47FE9r6jaCz+CKlHi4sSwjppAIiM/i6ULioW
         e1nUstLDvEqwIOiuhVvn1ASRgPaq6AFxy+rOVxKQEXSdFElKlENURDyy8hTnMk76qPE7
         1i3iw8jvkjgadcF8qANF6RUUS2UV7zXOLGudflEQxXx1vgrwkCF4LFjfSuZOVRs8Zg2n
         9KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894573; x=1726499373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waUjsUKAdPr4sGhzkMI+SGKybRx5CZeB0ueTsXysiJo=;
        b=D7gw8EX75S0B6g/AsonNB7TG02ssw2iHbPhGvu++NbArDgAcVwl4UjcJC72uwAkSfh
         7d7tID5IxRDTaeoqxq3efgdd+PqtqHh4dynVD+kR3soxyqYQq1OYrN1B562rO/AGu9U+
         M01M4YnpLwPZE0eW//zCUjNJSATdgbFyBzEMrN/+aAQP/fBhz1vG+NJLK9AfYelSlIB/
         EmXn6AIlqgTNQ8MlOCnaqyGMjRrFrFADN4xTUCw8LBwyZXONW8EAEW2ix6lyQ86nnOL1
         Dc/vEPEtJryYVdLFPF093RHtwDxJqA62DKfqUmxXp44oQ4Bn0SSHV1GoEGfG+0txZ2KB
         02fA==
X-Forwarded-Encrypted: i=1; AJvYcCVLZUWhJ8aMm7pS/E8D2V4SrqDK4cF8Jk+nqdP69Sr/CB2Mp5UaLO6qziZqV6bF7uDLQyvzpAFzX2tSgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPmkq9Cxv6CeH25OC4q1GO1MJ2I1sggC31gmvYJQev7giAKuP
	ralFbDjQp6NTfJ2QxDhXhmIoKfG0SVBtfabGGIahPdkuyhArJagXNYJ9lN+b6yY=
X-Google-Smtp-Source: AGHT+IFXbI4pkfj2zzQDpe+nrQAE2U6JhDRKNqVKMw5E88ab40PSJcYxYvTv45q9kssBAzmhPO6O6A==
X-Received: by 2002:a05:6214:5681:b0:6c3:5f00:8cbe with SMTP id 6a1803df08f44-6c52850dceamr153764456d6.38.1725894573060;
        Mon, 09 Sep 2024 08:09:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5347747b3sm21599526d6.122.2024.09.09.08.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:09:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sng1E-000ieN-3t;
	Mon, 09 Sep 2024 12:09:32 -0300
Date: Mon, 9 Sep 2024 12:09:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: amhetre@nvidia.com, "open list:IOMMU DRIVERS" <iommu@lists.linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:TEGRA IOMMU DRIVERS" <linux-tegra@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V4] iommu/io-pgtable-arm: Optimise non-coherent unmap
Message-ID: <20240909150932.GB105117@ziepe.ca>
References: <CAF6AEGvAEgFeoaxpkNw52fkt73RFg4g8+nhdR++m0ZhVsis=mA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvAEgFeoaxpkNw52fkt73RFg4g8+nhdR++m0ZhVsis=mA@mail.gmail.com>

On Wed, Sep 04, 2024 at 09:24:34AM -0700, Rob Clark wrote:
> Btw, this seems to be causing iommu faults for me for what (according
> to a sw pgtable walk) should be a valid mapping, indicating
> missing/incomplete tlb invalidation.  This is with drm/msm (which
> probably matters, since it implements it's own iommu_flush_ops) on
> x1e80100 (which probably doesn't matter.. but it is an mmu-500 in case
> it does).
> 
> I _think_ what is causing this is the change in ordering of
> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> this patch is supposed to work correctly in the face of other
> concurrent translations (to buffers unrelated to the one being
> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> stale data read back into the tlb.

You mean this?

 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
+				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
+
 				/* Also flush any partial walks */
 				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));

I would say it should work because
 1) The pte is cleared and cache flushed before the iotlb is cleared
    by the added __arm_lpae_clear_pte()
 2) This is not a 'shared table' since it is fully covered by the
    size being unmapped. The caller must ensure there are no
    inersecting concurrent map/unmaps.
 3) The double zeroing doesn't matter because of #2, no races are
    permitted.

Jason

