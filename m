Return-Path: <linux-tegra+bounces-4770-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA7A2416B
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2025 17:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F701882131
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jan 2025 16:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B10B1E9B38;
	Fri, 31 Jan 2025 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RGOm9qMl"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937A1E5708
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jan 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342772; cv=none; b=dm0+hxvX3fa4H7igaU0QKs+GC+QxKOIeKXQ0D/ZSTvq4jm6LZHFfJTO0QTc/Q6hJ9fbc2fGJ47vTLjm/z7wXOh52LHxLN3wRse7d1oJx81s8jKrudVKcNi/c5vS7pPDuiD3vJjayqOc1Cm9hra8St75LXN7xV1BZccOrH2JuOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342772; c=relaxed/simple;
	bh=w7qsiws9e/OdN5oau4lMl1qWq0AxDi9MiZY/ULvr2q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMo7Aw9hK9LNBk9qJ3960SF8sHEoJGzsxEhxxeJ2zC6LlxYnbSJ1P/vNv+jwM8tlboL7tgVgD8CmD/KikAhFd8Si9AghzN9j8nzszk+m7DKgxV/FjIZk7mYm4+7OZWYN7k9SHU0WVl6mJ7TpgB2KMTofwW0AQaF88Lb6RRcaYw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=RGOm9qMl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso17207155e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jan 2025 08:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738342769; x=1738947569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV6lM3YFA6dZ2gmoOiF/2v5mb84a3EuFvSRPBCXsykU=;
        b=RGOm9qMlwTCaQpCLuKMLvcbtYxbH+kWLvtb85o/pZQl1zQFwOGKrBskiMAsgkPWGpq
         Y+/kXeXIYyqosThld6GsQcsa7Arm/CgegUafOwZzod+lPxKLPWkn6akMuR+qGWTBj5Kt
         1LFxLwirJ0J/DRMNdd1Oro5Khch/t+oZi9U3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342769; x=1738947569;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VV6lM3YFA6dZ2gmoOiF/2v5mb84a3EuFvSRPBCXsykU=;
        b=Rmd2hkkIIRxEPGkgZ7gQH2js97AcJ7rRSICCmO2T3l4sI2hTgSgRidQDqTyWBR2x/F
         plZbnd8BF+4kxhURMUsSokM4cVvHuzV2GkSqh/mnhIfLPb16oMa3pXOLSay0/odFI6Sy
         RuqlNqI1f1w06knhUKAqVemoxb5I0Fs2fN9S/A74mnRCxepmVBzrXehP2QmZouk6C5EN
         HPPdGeOZL+EZcKBJDH7g+mWVmIO4p8DTE/L/Ehr6ZeVKDqGykHoIUgMq9xbfGoT3OKdC
         /2IcaNciti3tNNBWOgIycNzoZToy8zdKZ3F46aw2W73QJYm9FAqKqfyBZWms5utoPuqJ
         R+tg==
X-Forwarded-Encrypted: i=1; AJvYcCW8+b+IQMcPkj/2ntUE85BD+OD2sHgEzIBpBOjVm4sKHzjPuy98D7k+EkkEQNmqZAaqtp2xVDr2yxml/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzejfOMMETQ+LgfSS2NdULdmB94Vlp7MpX6NWcRyr3c9DJxZ4q7
	G+0G14XCoScVtPeDcKysnWCOC/GX/4f6Wjidm6y061+uoVYfcQ0uq0VVhnyrKSw=
X-Gm-Gg: ASbGncsaPXIZAYjpsa9VZQ8JPFMwjdnSPHt7wqEANOqMDYlIRIhXHgLP29+x65qcd1s
	EIEzVd8WGwXX+eyeiHDFdxVjRRGnZmGibP5l+kB2I2589B9pXVpX6Dwww+m91ilfyhv+KgC7YVs
	wPHlGRNElb5wwQAHRzvyi8tob8uVeH+8D0Qg/nloFxCrasBtm83uwHl5a83gQzLCa6iUcgkJOHg
	30qSplEE4PveefyjgEHQqobLPYrVN2S6ie/Zs0v1QSPH3vvhgtkVUN/0ec7TAgHcRMKPNPw4dOG
	htcnbVUtASgV9V2ruAT9uruMsks=
X-Google-Smtp-Source: AGHT+IGol4Q1biN5R/T0S8PgIDvIBvNwryDWNshGEwCGFyy4OqFaWpi7Ea88cFCjbaHh4AUGnh4Gfg==
X-Received: by 2002:a05:600c:5119:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-438dc40bd8dmr99961815e9.21.1738342768800;
        Fri, 31 Jan 2025 08:59:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de2d6sm59965215e9.11.2025.01.31.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:59:28 -0800 (PST)
Date: Fri, 31 Jan 2025 17:59:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130174217.GA2296753@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 01:42:17PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 05:09:44PM +0100, Simona Vetter wrote:
> > > > An optional callback is a lot less scary to me here (or redoing
> > > > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > > > less scary than making pgmap->owner mutable in some fashion.
> > > 
> > > It extra for every single 4k page on every user :\
> > > 
> > > And what are you going to do better inside this callback?
> > 
> > Having more comfy illusions :-P
> 
> Exactly!
> 
> > Slightly more seriously, I can grab some locks and make life easier,
> 
> Yes, but then see my concern about performance again. Now you are
> locking/unlocking every 4k? And then it still races since it can
> change after hmm_range_fault returns. That's not small, and not really
> better.

Hm yeah, I think that's the death argument for the callback. Consider me
convinced on that being a bad idea.

> > whereas sprinkling locking or even barriers over pgmap->owner in core mm
> > is not going to fly. Plus more flexibility, e.g. when the interconnect
> > doesn't work for atomics or some other funny reason it only works for some
> > of the traffic, where you need to more dynamically decide where memory is
> > ok to sit.
> 
> Sure, an asymmetric mess could be problematic, and we might need more
> later, but lets get to that first..
> 
> > Or checking p2pdma connectivity and all that stuff.
> 
> Should be done in the core code, don't want drivers open coding this
> stuff.

Yeah so after amdkfd and noveau I agree that letting drivers mess this up
isn't great. But see below, I'm not sure whether going all the way to core
code is the right approach, at least for gpu internal needs.

> > Also note that fundamentally you can't protect against the hotunplug or
> > driver unload case for hardware access. So some access will go to nowhere
> > when that happens, until we've torn down all the mappings and migrated
> > memory out.
> 
> I think a literal (safe!) hot unplug must always use the page map
> revoke, and that should be safely locked between hmm_range_fault and
> the notifier.
> 
> If the underlying fabric is loosing operations during an unplanned hot
> unplug I expect things will need resets to recover..

So one aspect where I don't like the pgmap->owner approach much is that
it's a big thing to get right, and it feels a bit to me that we don't yet
know the right questions.

A bit related is that we'll have to do some driver-specific migration
after hmm_range_fault anyway for allocation policies. With coherent
interconnect that'd be up to numactl, but for driver private it's all up
to the driver. And once we have that, we can also migrate memory around
that's misplaced for functional and not just performance reasons.

The plan I discussed with Thomas a while back at least for gpus was to
have that as a drm_devpagemap library, which would have a common owner (or
maybe per driver or so as Thomas suggested). Then it would still not be in
drivers, but also a bit easier to mess around with for experiments. And
once we have some clear things that hmm_range_fault should do instead for
everyone, we can lift them up.

Doing this at a pagemap level should also be much more efficient, since I
think we can make the assumption that access limitations are uniform for a
given dev_pagemap (and if they're not if e.g. not the entire vram is bus
visible, drivers can handle that by splitting things up).

But upfront speccing all this out doesn't seem like a good idea to,
because I honestly don't know what we all need.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

