Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7248A876
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Aug 2019 22:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfHLUiK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Aug 2019 16:38:10 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:45166 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfHLUiK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Aug 2019 16:38:10 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E5A8A80395;
        Mon, 12 Aug 2019 22:38:06 +0200 (CEST)
Date:   Mon, 12 Aug 2019 22:38:05 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Message-ID: <20190812203805.GA10640@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804094132.29463-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=pbzZ0L8A07dBp6lJBdcA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all.

On Sun, Aug 04, 2019 at 11:41:28AM +0200, Sam Ravnborg wrote:
> This set of patches is one of the final steps before
> we have succeeded to stop using drmP.h in all of drm/.
> 
> There is a few patches in flight through other trees
> and the plan is that all users shall be gone in the
> upstream kernel after next merge window.
> 
> The patches has seen build test with various configs
> with various architectures.
> 
> The patches has been sent before, but to my best knowledge
> they have not been applied anywhere.
> All four patches are based on drm-misc-next,
> but I checked that the tda998x patch can be applied to
> the tda998x tree.
> 
> There are no dependencies between the patches.
> 
> v2:
> - rebase on top of drm-misc-next
> 
> To maintainers: (Assuming the patch are OK)
> Please let me know if you take the patch, or request
> me to apply it to drm-misc-next.
> Or let me me know if the patch should be based on another tree.

ping...

This patchset is one of the last steps to get rid of drmP.h.
Other patches are applied to various sub-system trees.

The idea is that after next merge window can drop drmP.h.
As long as we keep drmP.h around new users will sneak in.

	Sam

> 
> Sam Ravnborg (4):
>       drm/i2c/tda998x: drop use of drmP.h
>       drm/tegra: drop use of drmP.h
>       drm/armada: drop use of drmP.h
>       drm/arm: drop use of drmP.h
> 
>  drivers/gpu/drm/arm/hdlcd_crtc.c        | 12 +++++++-----
>  drivers/gpu/drm/arm/hdlcd_drv.c         |  7 ++++++-
>  drivers/gpu/drm/arm/malidp_crtc.c       | 11 +++++++----
>  drivers/gpu/drm/arm/malidp_drv.c        |  8 +++++---
>  drivers/gpu/drm/arm/malidp_drv.h        |  7 ++++---
>  drivers/gpu/drm/arm/malidp_hw.c         |  7 ++++++-
>  drivers/gpu/drm/arm/malidp_mw.c         |  5 +++--
>  drivers/gpu/drm/arm/malidp_planes.c     |  4 +++-
>  drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
>  drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
>  drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
>  drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
>  drivers/gpu/drm/armada/armada_fb.c      |  3 +++
>  drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
>  drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
>  drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
>  drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
>  drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
>  drivers/gpu/drm/i2c/tda998x_drv.c       |  2 +-
>  drivers/gpu/drm/tegra/dc.c              | 13 +++++++++----
>  drivers/gpu/drm/tegra/dpaux.c           |  5 +++--
>  drivers/gpu/drm/tegra/drm.c             |  8 ++++++++
>  drivers/gpu/drm/tegra/drm.h             |  3 +--
>  drivers/gpu/drm/tegra/dsi.c             |  8 +++++---
>  drivers/gpu/drm/tegra/fb.c              |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c             |  3 +++
>  drivers/gpu/drm/tegra/gem.h             |  1 -
>  drivers/gpu/drm/tegra/gr2d.c            |  1 +
>  drivers/gpu/drm/tegra/hdmi.c            |  5 +++++
>  drivers/gpu/drm/tegra/hub.c             |  3 ++-
>  drivers/gpu/drm/tegra/hub.h             |  1 -
>  drivers/gpu/drm/tegra/plane.c           |  1 +
>  drivers/gpu/drm/tegra/sor.c             |  3 +++
>  drivers/gpu/drm/tegra/vic.c             |  1 +
>  34 files changed, 137 insertions(+), 49 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
