Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4364A519
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 17:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfFRPTl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 11:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728572AbfFRPTl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 11:19:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11072213F2;
        Tue, 18 Jun 2019 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560871180;
        bh=PNIyNpRL12Z3acOSdwy0y27hNcJzCSr3npPEQ7CeV88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sDzD0eKdGTAeWjRm/rES0DAk0WQVBWtvpRjJmX9Tc1VmpSS5rIqGvOMjhFH7vBMAR
         rliiK5wkOyAmj9s0DuW+eC6nUR6JuHBZQ25g7GONhMnMR1htsPA+ZA9hnU8cs3Go6F
         J3+PpQb/WXPBLP1eMbOR0bvBDBk0tWvE5r5TZOKw=
Date:   Tue, 18 Jun 2019 17:19:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: drm connectors, tegra,  and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618151938.GA2567@kroah.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-59-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> Greg is busy already, but maybe he won't do everything ...
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 9717540ee28f..026e55c517e1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -375,6 +375,9 @@ There's a bunch of issues with it:
>    this (together with the drm_minor->drm_device move) would allow us to remove
>    debugfs_init.
>  
> +- Drop the return code and error checking from all debugfs functions. Greg KH is
> +  working on this already.


Part of this work was to try to delete drm_debugfs_remove_files().

There are only 4 files that currently still call this function:
	drivers/gpu/drm/tegra/dc.c
	drivers/gpu/drm/tegra/dsi.c
	drivers/gpu/drm/tegra/hdmi.c
	drivers/gpu/drm/tegra/sor.c

For dc.c, the driver wants to add debugfs files to the struct drm_crtc
debugfs directory.  Which is fine, but it has to do some special memory
allocation to get the debugfs callback to point not to the struct
drm_minor pointer, but rather the drm_crtc structure.

So, to remove this call, I need to remove this special memory allocation
and to do that, I need to somehow be able to cast from drm_minor back to
the drm_crtc structure being used in this driver.  And I can't figure
how they are related at all.

Any pointers here (pun intended) would be appreciated.

For the other 3 files, the situation is much the same, but I need to get
from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.

I could just "open code" a bunch of calls to debugfs_create_file() for
these drivers, which would solve this issue, but in a more "non-drm"
way.  Is it worth to just do that instead of overthinking the whole
thing and trying to squish it into the drm "model" of drm debugfs calls?

Either way, who can test these changes?  I can't even build the tegra
driver without digging up an arm64 cross-compiler, and can't test it as
I have no hardware at all.

thanks,

greg k-h
