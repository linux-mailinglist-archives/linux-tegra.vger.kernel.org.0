Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7D424584B
	for <lists+linux-tegra@lfdr.de>; Sun, 16 Aug 2020 17:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgHPPR5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 16 Aug 2020 11:17:57 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:60368 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgHPPR4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 Aug 2020 11:17:56 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E3D388050E;
        Sun, 16 Aug 2020 17:17:50 +0200 (CEST)
Date:   Sun, 16 Aug 2020 17:17:49 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Derek Basehore <dbasehore@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v12 0/4] Panel rotation patches
Message-ID: <20200816151749.GA1394979@ravnborg.org>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
        a=8w4ccKQgAAAA:20 a=e5mUnYsNAAAA:8 a=TCdPBaVuNUQlGkixCqMA:9
        a=CjuIK1q_8ugA:10 a=W4TVW4IDbPiebHqcZpNg:22 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry

On Fri, Aug 14, 2020 at 12:56:05AM +0300, Dmitry Osipenko wrote:
> Hello!
> 
> This series adds support for display panel's DT rotation property. It's a
> continuation of the work that was initially started by Derek Basehore for
> the panel driver that is used by some Mediatek device [1]. I picked up the
> Derek's patches and added my t-b and r-b tags to them, I also added
> rotation support to the panel-lvds and panel-simple drivers.
> 
> We need the rotation support for the Nexus 7 tablet device which is now
> supported by the upstream kernel, the device has display panel mounted
> upside-down and it uses panel-lvds [2].
> 
> [1] https://lkml.org/lkml/2020/3/5/1119
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi?#n1036
> 
> Changelog:
> 
> v12: - No code changes. The v11 missed v5.9 release, re-sending patches
>        for the v5.10 kernel. Please review and apply patches to linux-next,
>        thanks in advance!
> 
> v11: - This series is factored out from this patchset [3] because these
>        patches do not have hard dependency on the Tegra DRM patches and
>        it should be nicer to review and apply the properly grouped patches.
> 
>      - Initially [3] only touched the panel-lvds driver and Emil Velikov
>        suggested that it will be better to support more panels in the review
>        comments to [3]. So I included the Derek's patch for the BOE panel
>        and added rotation support to the panel-simple driver. I tested that
>        panel-lvds and panel-simple work properly with the rotated panel using
>        the Opentegra Xorg driver [4] and Wayland Weston [5].
> 
>      - The panel-lvds driver now prints a error message if rotation property
>        fails to be parsed.
> 
> [3] https://lore.kernel.org/lkml/20200614200121.14147-1-digetx@gmail.com/
> [4] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
> [5] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315
> 
> Derek Basehore (2):
>   drm/panel: Add helper for reading DT rotation
>   drm/panel: Read panel orientation for BOE TV101WUM-NL6
> 
> Dmitry Osipenko (2):
>   drm/panel: lvds: Read panel orientation
>   drm/panel-simple: Read panel orientation

Thanks for your persistence with these patches.
While applying I made a few updates:
- fixed two trivial checkpatch warnings
- small update to kernel-doc for the new function, to better match
  surrounding wording
- added error message to panel-boe-tv101wum-nl6.c when failed to get
  orientation
- use same wording in all error messages and use "orientation" and not
  rotation as this matches the called function
 
	Sam

> 
>  drivers/gpu/drm/drm_panel.c                   | 43 +++++++++++++++++++
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  6 +++
>  drivers/gpu/drm/panel/panel-lvds.c            | 10 +++++
>  drivers/gpu/drm/panel/panel-simple.c          | 11 +++++
>  include/drm/drm_panel.h                       |  9 ++++
>  5 files changed, 79 insertions(+)
> 
> -- 
> 2.27.0
