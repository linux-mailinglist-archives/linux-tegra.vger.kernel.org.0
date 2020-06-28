Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF80920C728
	for <lists+linux-tegra@lfdr.de>; Sun, 28 Jun 2020 10:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgF1Ixe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 04:53:34 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:48532 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgF1Ixe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 04:53:34 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 38AD8200EC;
        Sun, 28 Jun 2020 10:53:32 +0200 (CEST)
Date:   Sun, 28 Jun 2020 10:53:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Message-ID: <20200628085330.GA132428@ravnborg.org>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
 <20200628070745.GC6954@pendragon.ideasonboard.com>
 <20200628075245.GA128039@ravnborg.org>
 <20200628080253.GD6954@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628080253.GD6954@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=XPbHadcwz-P33w-j3eAA:9
        a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jun 28, 2020 at 11:02:53AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> > We should also clean up all the DRM_BUS_FLAG_* one day.
> > No need for the deprecated values, so a few files needs an update.
> > And we could document what flags makes sense for LVDS etc.
> 
> Where would you add that documentation ? The hardest part is to find a
> place that will be noticed by developers :-)
I will try to extend drm_bus_flags documentation in drm_connector.h
And then add a few comments in panel-simple as well.

	Sam
> 
> I've just submitted a patch that adds a WARN_ON to catch similar issues
> in the panel-simple driver. It's not ideal as we really shouldn't have
> such code in the kernel, this is something that should be caught as part
> of the integration process.

> 
> > On the TODO list...
> >
> > >>> The rest looks good, except the Samsung panel for which I haven't been
> > >>> able to locate a datasheet.
> > >>> 
> > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> -- 
> Regards,
> 
> Laurent Pinchart
