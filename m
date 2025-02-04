Return-Path: <linux-tegra+bounces-4821-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA64A27AFF
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2025 20:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 833DA7A06B1
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2025 19:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16249204F8B;
	Tue,  4 Feb 2025 19:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VV13Ud88"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4632040B3
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696566; cv=none; b=qkMxf6jFTkbo7vGZx2y/QX8GYbg4ZWm8TsITkfDtdQ2vc8cG2xTQORiPMUTyobexA4CiahAycAUS9HjIUEtGGtMJVffbZSpgINALsJQanUmxQyIEtrmAWyTciUHbbjE4ZBy5NKiNjL+XG8H+iwr1CNGcd2B0DTeNOOMAhCyTlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696566; c=relaxed/simple;
	bh=DnItlRYKz5NSnazVyRKSxC1u7AkupexFhmFvWYVnt70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iM1SM+YLBeyJksb0jTRe74UX8f9EJYs7LO3tUsxxZ/fizxwg3DfrySdZixKmIvecRM+CY5jWEuGmoGF74m+HhtoWvW7O+IBzuN2Pb41rAbR1Ep3gMwB7OASQrtiq1PmJd9MAsB6hm4qv6QL3qRU903RmfQLsVDW9uNugivpXdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VV13Ud88; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6f0afda3fso746475885a.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738696563; x=1739301363; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
        b=VV13Ud88/a6ujOwmHv3p3i0jA+i42Sq+FdVg2G5tTjVoECcp5LzoJNFHeKqp4VTtBT
         L6NWj5XBke0zfqU+ShCXAfYWe8iCKckF0eT51s1cFPTIqOy8+DEBmUjHLOsd98rgyqDM
         iUi/oaiw4iGlRMbxjt1bXRKDKgtFovBVKiSyWwRdSBxe7fozuwwda1MGLVrpZsafLBbc
         xyKjB8Jq3rli2rqxUZtvrtnCL5b2TtGEpckhFHPc3BhIOrxnoNFQC/DbTPwsMaqUQWQS
         /0ER2z0ikptzv6IXcqft3LB20XjRzy3+aJYXjE1pdBowKTrL+VkV88H3/fcTyXes/POm
         QT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696563; x=1739301363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
        b=nOBt5dBlQd0t1nA0mD9+aMZMTgqi8ZkP3uDCdjbheXVyVFd7EAc9kus6tqlPQeVFIp
         mAyI7R9UiyVu8cuapjAnPrZ/xBZWIhOimCjm4d93PVKhCtH7FN3yWl9X3Uq+Ukb3jNMp
         iilWmP1LgAnHghkgY4tn3krnqgQgu2GZTKS0kICW1lwYPCLgCZ/kHCxUjemSUC1qCs4p
         sbXS8+GLUVGZVp5e4/4BIPq2GeoP6We4wCDU4WbMgD5ikznPNZPA2RCnezOaGklv/Drc
         7qJfqase5dIIbUoiXhFLHZeShZjL7SHuAVfZvelDBfxy0+IklRdhMQcLLAT9KZy5yjG1
         As9w==
X-Forwarded-Encrypted: i=1; AJvYcCUu51p0Oq1V7mh0QlkEIBfrhfz8aGT5Bj4tYfxOMf2Bxs0rr8XVcTKfuMRF0UHrnLDU+l983PLjza4+Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Dief3X5nOJ8/UY3SoFL99I8Gs7aI1C7ps7oDdW5W+vLuE0Nk
	k3R0h8CpWYLGY+kn7bMs+GFKdbyRhPY0or13I5Caoy/E/BGV1F/d22iM3Nl1rcU=
X-Gm-Gg: ASbGncsqqkkCmJyYVGRlnvTzMui42Rplh4MMMacNCtpK/LpKe7Au4650ZdOt6imidoy
	uew88SUL2XWCdHOmCbr6B1MACch4epfWZpl2SNPgWooeAEopoXd6RVVe2ZhtaldbuqOBSRGHHwA
	9vElJUtkJIeM6/KofWz3q8TpLaIcyF49NbbW8l4reQjZahtiQaWappoeYK+8WcgXIxCWZ4wPUoF
	KnZFFSOp91zLT5aNm3m8bc8Ljvp9/xjR7i0Y2SE0qo/c8rRj9kaLNzPKC+9os+zyPqRIHf0MMCs
	TU2QBAQWnd3ErpBpbpkZvwxX1U+wLL2dfx/65B0nQ0HMYwz3+/Bh+nVIsliWCJIN
X-Google-Smtp-Source: AGHT+IFDaDGZr7b/tFbMEfs7niyU8J8dtoT91Z8F6Kt1MP6P2VK98JCkXIPoyuzy/DdpTLj+ZRuWhQ==
X-Received: by 2002:a05:620a:2710:b0:7b6:ebc6:181a with SMTP id af79cd13be357-7bffcd9997amr4139068785a.41.1738696563125;
        Tue, 04 Feb 2025 11:16:03 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d97c2sm670296085a.64.2025.02.04.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:16:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfOOv-0000000CUOy-1LgY;
	Tue, 04 Feb 2025 15:16:01 -0400
Date: Tue, 4 Feb 2025 15:16:01 -0400
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
Message-ID: <20250204191601.GK2296753@ziepe.ca>
References: <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
 <20250204132615.GI2296753@ziepe.ca>
 <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>

On Tue, Feb 04, 2025 at 03:29:48PM +0100, Thomas Hellström wrote:
> On Tue, 2025-02-04 at 09:26 -0400, Jason Gunthorpe wrote:
> > On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > > 
> > 
> > > 1) Existing users would never use the callback. They can still rely
> > > on
> > > the owner check, only if that fails we check for callback
> > > existence.
> > > 2) By simply caching the result from the last checked dev_pagemap,
> > > most
> > > callback calls could typically be eliminated.
> > 
> > But then you are not in the locked region so your cache is racy and
> > invalid.
> 
> I'm not sure I follow? If a device private pfn handed back to the
> caller is dependent on dev_pagemap A having a fast interconnect to the
> client, then subsequent pfns in the same hmm_range_fault() call must be
> able to make the same assumption (pagemap A having a fast
> interconnect), else the whole result is invalid?

But what is the receiver going to do with this device private page?
Relock it again and check again if it is actually OK? Yuk.

> > > 3) As mentioned before, a callback call would typically always be
> > > followed by either migration to ram or a page-table update.
> > > Compared to
> > > these, the callback overhead would IMO be unnoticeable.
> > 
> > Why? Surely the normal case should be a callback saying the memory
> > can
> > be accessed?
> 
> Sure, but at least on the xe driver, that means page-table repopulation
> since the hmm_range_fault() typically originated from a page-fault.

Yes, I expect all hmm_range_fault()'s to be on page fault paths, and
we'd like it to be as fast as we can in the CPU present case..

Jason

