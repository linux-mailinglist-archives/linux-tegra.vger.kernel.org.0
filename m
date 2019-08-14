Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD008D834
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Aug 2019 18:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfHNQhE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Aug 2019 12:37:04 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:41598 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHNQhC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Aug 2019 12:37:02 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 495CE803C6;
        Wed, 14 Aug 2019 18:36:59 +0200 (CEST)
Date:   Wed, 14 Aug 2019 18:36:57 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Message-ID: <20190814163657.GA26556@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190812203805.GA10640@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812203805.GA10640@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=0SJT8KT_22iOycAb6FwA:9 a=CjuIK1q_8ugA:10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> > This set of patches is one of the final steps before
> > we have succeeded to stop using drmP.h in all of drm/.
> > 
> > There is a few patches in flight through other trees
> > and the plan is that all users shall be gone in the
> > upstream kernel after next merge window.
> > 
> > The patches has seen build test with various configs
> > with various architectures.
> > 
> > The patches has been sent before, but to my best knowledge
> > they have not been applied anywhere.
> > All four patches are based on drm-misc-next,
> > but I checked that the tda998x patch can be applied to
> > the tda998x tree.
> > 
> > There are no dependencies between the patches.
> > 
> > v2:
> > - rebase on top of drm-misc-next
> > 
> > To maintainers: (Assuming the patch are OK)
> > Please let me know if you take the patch, or request
> > me to apply it to drm-misc-next.
> > Or let me me know if the patch should be based on another tree.
> 
> ping...
> 
> This patchset is one of the last steps to get rid of drmP.h.
> Other patches are applied to various sub-system trees.
> 
> The idea is that after next merge window can drop drmP.h.
> As long as we keep drmP.h around new users will sneak in.

Thierry reviewed all patches - thanks!

Applied to drm-misc-next and pushed out.

	Sam
