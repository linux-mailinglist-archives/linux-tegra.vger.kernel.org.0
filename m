Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2249EBC449
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Sep 2019 10:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfIXIuY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Sep 2019 04:50:24 -0400
Received: from 8bytes.org ([81.169.241.247]:55584 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfIXIuY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Sep 2019 04:50:24 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D57553A7; Tue, 24 Sep 2019 10:50:22 +0200 (CEST)
Date:   Tue, 24 Sep 2019 10:50:22 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
Message-ID: <20190924085022.GB18171@8bytes.org>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
 <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
 <20190916154946.GD7488@ulmo>
 <20190916155443.GF7488@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916155443.GF7488@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On Mon, Sep 16, 2019 at 05:54:43PM +0200, Thierry Reding wrote:
> > Joerg, to summarize: the proposal here is to move the declaration of the
> > iommu_fwspec outside of the IOMMU_API guard and provide a dummy
> > implementation of dev_iommu_fwspec_get() to allow this code to be built
> > without the #ifdef guards. We had discussed something similar about 5
> > years back and at the time you had been opposed:
> > 
> > 	https://lore.kernel.org/linux-iommu/1406897113-20099-1-git-send-email-thierry.reding@gmail.com/
> > 
> > The case here is slightly different and a lot of time has passed since,
> > so just wanted to ask if your opinion here is the same, or whether you
> > would accept a patch to make this buildable without resorting to
> > #ifdef'ery.

This is about DRM, so if it is fine to build drm/nouveau without
IOMMU-API I am also fine with dummys for dev_iommu_fwspec_get() and a
dummy 'struct iommu_fwspec'.

Regards,

	Joerg
