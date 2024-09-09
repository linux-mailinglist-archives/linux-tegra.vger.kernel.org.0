Return-Path: <linux-tegra+bounces-3671-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C94971BC4
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 15:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491C91F2353B
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 13:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2857E1BCA02;
	Mon,  9 Sep 2024 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="d/M3PJtW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC461BC097
	for <linux-tegra@vger.kernel.org>; Mon,  9 Sep 2024 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889917; cv=none; b=ECmgUGpO7hBd8YTAKan8UypPsm50iyFBZ7swx0ScqyXMNHV7lSsRvbfbWa7AE3NMohVvlUmwrqInaeMVILBDGD9dbnRBiXoHclmoCPVRi5DmCI8N1G9B+Az+BlAzjT52T/MumvJVAKLa0QfWB9Lnc8hgx+nPtgQf66OQD0qbRzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889917; c=relaxed/simple;
	bh=yj7+HNUhZ42zQ7e1zqARXsVl9jwOBImumTxZ0tEXKC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6NYeEWE5Nc2FSTjU98OjnqRy3GHkTuGnQhB4EdOQhn4pDYBgKduLubxpYklVoXYgBViEyQKzmHCSQiThgZPGi476coWmMPcKlPVN63CpCeBmoU3/9gSiiEmMJP/wBl6daKISnlV6EWl4ZWrszMEIpKs3lW2ZiBib1a92fiodPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=d/M3PJtW; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a4df9dc885so336276985a.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1725889914; x=1726494714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yj7+HNUhZ42zQ7e1zqARXsVl9jwOBImumTxZ0tEXKC0=;
        b=d/M3PJtWXjuI/rVkMk830An2Z7Rf4QxPRkAPqPUjnmsPt6dHeQvD4BRXMpnBLvkY2c
         3bluKbsB8XS2LmjFXPxhmT1oTst0yHwaZXgVnNtPu2MytYjGNfvqocpi4/YyVyx6oKZZ
         75w0A7vKEj5gDUKXVgG4Ag0br0oh1lUWIkn/8oKD5OkeFqRs/MUNly8MTNlRDJ/drVbc
         9otaZtUzVXUyHyUOi/ezq/9XSEzHRYlTdMGpAQq3jkfCRdtmqLYFrgm7r2hbyo6Lquxk
         rgrqcUeI3yL+x+ujV3XeYc80ynMXq/t7zFEfiYNyuqLnEtifARwHOHiVXnat8OVNuK11
         6U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889914; x=1726494714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj7+HNUhZ42zQ7e1zqARXsVl9jwOBImumTxZ0tEXKC0=;
        b=FR/XIyfC7ombH+nhoQ2UyGe7Rb1Lp1RjsvMCsuFlIF9tU+BGFFqU9CaPTcJW/8ugCH
         JpR9041NOlcbe5ICAMP5uGAhb5OS6yCkpYYbPKAfOgQVIxK4Gfgarg2coTxebjbpyTyv
         RuYqS2HYGqFlcUj71I7hQc0TkRncyh6vONhoXHjWaDH2DQ/v8lRXKzt/taGxuQMWIrKM
         55CThiBLfCAe/KXbVtI39XUkk7cZnZyjUb0n9irRGnviDH3t1KZbAFdTkPDCSd1IpVXP
         zCmBcG9rR4Lr6E59c6MqoERnaVLhPJOO1RcquORCiIz8ZTWjbh6MNyHyFIHT4mSfT5QQ
         h7hA==
X-Forwarded-Encrypted: i=1; AJvYcCVn0Z9q5fBuHWTK3eO8fJNTrLmBCxzIjlHEwMseoXL0aUlm7zMiBUIs5wZH6SgretOUfSDAhsFqfxv/LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQVdIKdEpHPs9qBe9aOdf7pw3L3AR72BKIFuKpiHjWucNgddw
	lKZG5NRT7ShB+8rwcInoRNH96FT2augU2I3B4kGrn3YlheYCcMLrdZ82rvi8JGM=
X-Google-Smtp-Source: AGHT+IE32skbFpKLVZQvvKRGIbOT+Lk4glz9hLQYid2tc58+roSuuIWcYGTezpJn4PsYDlHvh90irg==
X-Received: by 2002:a05:620a:24d3:b0:7a9:b80b:81e with SMTP id af79cd13be357-7a9b80b0f7dmr521832985a.10.1725889914151;
        Mon, 09 Sep 2024 06:51:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5343295f7sm20958506d6.21.2024.09.09.06.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sneo4-000es1-U3;
	Mon, 09 Sep 2024 10:51:52 -0300
Date: Mon, 9 Sep 2024 10:51:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240909135152.GA105117@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
 <20240905132459.GG1909087@ziepe.ca>
 <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>

On Thu, Sep 05, 2024 at 12:26:31PM -0400, Lyude Paul wrote:
> I did take the one patch - but I'm happy to push the others to drm-misc
> (provided they all get reviewed. 2/3 seems to be reviewed already but not 3/3)

The whole series is acked now, can you pick it up please?

Thanks,
Jason

