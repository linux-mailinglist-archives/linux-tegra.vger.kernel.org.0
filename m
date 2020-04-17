Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F741AE70D
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 22:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDQU6m (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 16:58:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39236 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgDQU6m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 16:58:42 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6343297D;
        Fri, 17 Apr 2020 22:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587157120;
        bh=6SI4dmlhllztRR9pK3rgtHcrelb+v8IARh7iYR9e0QA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hQ+J9iiofVWi4bLBC97a+y595x/upPgPWZL8HE6e1Rv9RcAHDW4+UMkCCObFNWNrY
         g8ydWqQpSQVbwaRsYozd1PG1t/7+dvHLu5QMf6UdXKcVvxN89GpiBEV/HjAjE81zcN
         fpBXTHnwSqTO1M7a68C7J3vUVI8lCP24SZHN5V38=
Date:   Fri, 17 Apr 2020 23:58:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Message-ID: <20200417205828.GM5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
 <20200417203154.GK5861@pendragon.ideasonboard.com>
 <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Fri, Apr 17, 2020 at 11:52:11PM +0300, Dmitry Osipenko wrote:
> 17.04.2020 23:31, Laurent Pinchart пишет:
> > On Fri, Apr 17, 2020 at 10:41:59PM +0300, Dmitry Osipenko wrote:
> >> 17.04.2020 22:30, Laurent Pinchart пишет:
> >> ...
> >>>>  #include <drm/drm_atomic.h>
> >>>> +#include <drm/drm_bridge.h>
> >>>
> >>> You could add a forward declaration of struct drm_bridge instead, that
> >>> can lower the compilation time a little bit.
> >>
> >> This include is not only for the struct, but also for the
> >> drm_bridge_attach(). It looks to me that it should be nicer to keep the
> >> include here.
> > 
> > drm_bridge_attach() is called from .c files. In the .h file you can use
> > a forward declaration. It's entirely up to you, but as a general rule, I
> > personally try to use forward structure declarations in .h files as much
> > as possible.
> 
> The current Tegra DRM code is a bit inconsistent in regards to having
> forward declarations, it doesn't have them more than have.
> 
> I'll add a forward declaration if there will be need to make a v5, ok?

It's up to you, you don't have to use a forward declaration if you don't
want to, I was just pointing out what I think is a best practice rule
:-)

> >> ...
> >>>> +	port = of_get_child_by_name(output->of_node, "port");
> >>>
> >>> Do you need to check for the presence of a port node first ? Can you
> >>> just check the return value of drm_of_find_panel_or_bridge(), and fall
> >>> back to "nvidia,panel" if it returns -ENODEV ?
> >>
> >> Without the check, the drm_of_find_panel_or_bridge() prints a very noisy
> >> error message about missing port node for every output that doesn't have
> >> a graph specified in a device-tree (HDMI, DSI and etc).
> >>
> >> https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/of/property.c#L621
> > 
> > Ah yes indeed. That's not very nice.
> 
> Please let me know if you'll have a better idea about how this could be
> handled.

It should be good enough as-is I think. You may however want to support
both "port" and "ports", as even when there's a single port node, it
could be put inside a ports node.

-- 
Regards,

Laurent Pinchart
