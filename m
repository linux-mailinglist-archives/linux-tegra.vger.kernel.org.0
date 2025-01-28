Return-Path: <linux-tegra+bounces-4695-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB9A20F85
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2025 18:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640313A1494
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2025 17:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859581DE3C8;
	Tue, 28 Jan 2025 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VSp0Pb07"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7521CDFD5
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2025 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738084887; cv=none; b=g5AR7rDvPaEGkNlAQ7LEKUTvdwORgcz6gD2lc2lc3ATRHysC81m90khxkqMQtZpFKwBxuV6I+ybQmQrz7J3wopH+wcVHOZelYGsLak3ZFR3Senv4AVVjELuTmX4hzIBgm4OP7iR3nUXP9SrNhP3Id+OUupH2DOGBiF2TfMtFkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738084887; c=relaxed/simple;
	bh=LWS+HKZhTEpQAgnrmbl5ecib7RdlRXcgNtTUGmEM03A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPx3+L9WhRLsMZr7Xi/MuXCXnKd00RIkBKojdyTgYWf6qn663Ph80uv/Jo8YIwTurEdxuoDwQIXSRJyVYTq0Sf/ERPhLdFfdjkklxb3viE9E8gkD7Z9YXpRh5N1IChanCTR+Wui5IMbDkH8t/AHIA82y76PCeckaVFG2YVzB8pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VSp0Pb07; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e1b11859a7so31778256d6.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2025 09:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738084884; x=1738689684; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WQb9VqqmKpGrKRk3ww/ULOiy6hcfV9wcFh+Cwya87Xc=;
        b=VSp0Pb07+krCs+4Tq8KrwFa4JAfuXFe2B4cXK9aRHARG3bxXcG4JW6vezh67IZ3K0i
         nUZpedN8qNd3U3qHM2c1ETuLQjqhpst8tcVq0K56xwNc2thXKJFGllIqd5royiDmmNj/
         YWKxgYAVF1Eti+teHCeQNSWQt1c3PcfIfUPsPV4FLn0xIjcwVRTkQaT8VJfmiMjabJCL
         /n+W8EgY8oUHccoUe9g7B/dgaVKp7H/3V3cWcoKjKxTkEIDSsuNWJSEBD724PZP2MNYt
         5C08Yus+u6SRNHrLyJYWwroTz5eocUZw1QqCVe7DZhBpox8X8lFOfhrstpJP50qCoQkO
         2HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738084884; x=1738689684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQb9VqqmKpGrKRk3ww/ULOiy6hcfV9wcFh+Cwya87Xc=;
        b=plVaQdxTiLp6aDqyEj9tyLhcE5vYdXSbp5Fy5b8M7iGDfujsNbsAE7ABCENj6YtJPt
         NTXI2orWYg0uG1DoMeEz94CMbMClvjZcOGQJRtYXUftICEuyY4sFCmgkckcIMnKhh6Jp
         41TuHFr/RdiqcOUfdYsb9qrctm1Rup8tjMClz8Ojov6IH+uVYUi32DYr6vcJu9XgVuRl
         mHSFY0pNKnmmkP8eG18RrdiWpeHHLcRZTSLS0X56u9dcljIMDJokkzPYn3ZhdD/IPThf
         EaMVhr+mefT3dvu/667zYZGzzT21MNKx80PGIhNQZrq/wnBAOLtK9/H0iH51u+nHvXN/
         74gg==
X-Forwarded-Encrypted: i=1; AJvYcCVDrLEwfL6x9IN7f7h8WqXfTCPCYdGAZC9lmYr55s1kDAAyFBuJmb0Lk65aSXrP3mTuILY1eo+zrDKnag==@vger.kernel.org
X-Gm-Message-State: AOJu0YygtiLy8yjvuD44t8tLZHwPlHWenFn1G7IefbBWpFMmS07jrQF0
	/OwgzT01F93d7s11//df/xr0S5nhPnJQUs1hCfKFjiyQVrBdDd2neqgGmSxjdls=
X-Gm-Gg: ASbGncsWzM8JgYJWEoPGhRg2eULJhmkOIHURgzODYnu0XWVvYFGcR1kKRe5o4sxb2tM
	Poy4EEqMwj+/psN84jNybT+D6Z4fviIhlU6ejwPOyEPoV382iRjkpZ/Lbdh14Nj05LGRQM2eKsy
	kWAPMEEU+vdo7t6KWph5j7KZ7a70/1oxQtzVkljYaEX1Ol3XThvpX4QL1ZOCSqUOm0xJmKFtUW+
	Gvl2DsbY/ozBeJcsEt8x8hzZwd1n42r5BHmJD8ln/6Aa6In5Ww6Oaa4ofC1yiWuCz0uHW6xOYCQ
	DdOP9069JX1ZWbNMuqJLmE6nNK/ecKSdcqzEAoAQchzGn0b5nH/VqHx39MXtDUu6
X-Google-Smtp-Source: AGHT+IFAz/5UyS+F0PBK9pFt62lYn0eXOpLs0OowxWjeV7IrxMQsEK70VEddYKwgKGQF4XA2ZTXc8w==
X-Received: by 2002:a05:6214:260a:b0:6d8:8a60:ef2c with SMTP id 6a1803df08f44-6e1b2140cadmr656249486d6.2.1738084884552;
        Tue, 28 Jan 2025 09:21:24 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2057a8ab6sm47105096d6.81.2025.01.28.09.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:21:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tcpH9-00000007f7z-2OLv;
	Tue, 28 Jan 2025 13:21:23 -0400
Date: Tue, 28 Jan 2025 13:21:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
	dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
	leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
	GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-mm@kvack.org,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250128172123.GD1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>

On Tue, Jan 28, 2025 at 05:32:23PM +0100, Thomas Hellström wrote:
> > This series supports three case:
> > 
> >  1) pgmap->owner == range->dev_private_owner
> >     This is "driver private fast interconnect" in this case HMM
> > should
> >     immediately return the page. The calling driver understands the
> >     private parts of the pgmap and computes the private interconnect
> >     address.
> > 
> >     This requires organizing your driver so that all private
> >     interconnect has the same pgmap->owner.
> 
> Yes, although that makes this map static, since pgmap->owner has to be
> set at pgmap creation time. and we were during initial discussions
> looking at something dynamic here. However I think we can probably do
> with a per-driver owner for now and get back if that's not sufficient.

The pgmap->owner doesn't *have* to fixed, certainly during early boot before
you hand out any page references it can be changed. I wouldn't be
surprised if this is useful to some requirements to build up the
private interconnect topology?

> >  2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
> >     The exporting driver has the option to return a P2P struct page
> >     that can be used for PCI P2P without any migration. In a PCI GPU
> >     context this means the GPU has mapped its local memory to a PCI
> >     address. The assumption is that P2P always works and so this
> >     address can be DMA'd from.
> 
> So do I understand it correctly, that the driver then needs to set up
> one device_private struct page and one pcie_p2p struct page for each
> page of device memory participating in this way?

Yes, for now. I hope to remove the p2p page eventually.

> > If you are just talking about your private multi-path, then that is
> > already handled..
> 
> No, the issue I'm having with this is really why would
> hmm_range_fault() need the new pfn when it could easily be obtained
> from the device-private pfn by the hmm_range_fault() caller? 

That isn't the API of HMM, the caller uses hmm to get PFNs it can use.

Deliberately returning PFNs the caller cannot use is nonsensical to
it's purpose :)

> So anyway what we'll do is to try to use an interconnect-common owner
> for now and revisit the problem if that's not sufficient so we can come
> up with an acceptable solution.

That is the intention for sure. The idea was that the drivers under
the private pages would somehow generate unique owners for shared
private interconnect segments.

I wouldn't say this is the end all of the idea, if there are better
ways to handle accepting private pages they can certainly be
explored..

Jason

