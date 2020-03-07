Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54FDC17D004
	for <lists+linux-tegra@lfdr.de>; Sat,  7 Mar 2020 21:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgCGUev (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 7 Mar 2020 15:34:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45860 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgCGUev (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 7 Mar 2020 15:34:51 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAA655F;
        Sat,  7 Mar 2020 21:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583613288;
        bh=RZ2tUcPxucchrhxSolD6+AqEb18c4qF2ROrad4SqtpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SeYlFq5FyvOZJIZ6p7kXSWHrFrpwGuo2rxPZx3fxqLOs0d6yru3DxJk2wr+14QeXx
         Lyxfhn8s9e+rpDI/CQ31o+8egDx0SVXUEz6rc98Lw1HzeXNi7sPQFccO2Kw1823mZu
         ezRGQaDlYsLivwic3ivFH+73INcaLgC2WtuLS14Y=
Date:   Sat, 7 Mar 2020 22:34:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, hamohammed.sa@gmail.com,
        alexandre.belloni@bootlin.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
        paul@crapouillou.net, matthias.bgg@gmail.com, wens@csie.org,
        thierry.reding@gmail.com, kraxel@redhat.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com,
        abrodkin@synopsys.com, linux@armlinux.org.uk, krzk@kernel.org,
        jonathanh@nvidia.com, xinliang.liu@linaro.org,
        kong.kongxinwei@hisilicon.com, kgene@kernel.org, linux-imx@nxp.com,
        nicolas.ferre@microchip.com, puck.chen@hisilicon.com,
        s.hauer@pengutronix.de, alison.wang@nxp.com, jsarha@ti.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, jernej.skrabec@siol.net,
        rodrigosiqueiramelo@gmail.com, bbrezillon@kernel.org,
        jingoohan1@gmail.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
        kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
        ludovic.desroches@microchip.com, kernel@pengutronix.de,
        zourongrong@gmail.com, shawnguo@kernel.org
Subject: Re: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
Message-ID: <20200307203445.GC5021@pendragon.ideasonboard.com>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200306142212.GF4878@pendragon.ideasonboard.com>
 <bccc380a-8925-81a7-34fe-5a1744a766d0@suse.de>
 <20200307200813.GA15363@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200307200813.GA15363@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sam,

On Sat, Mar 07, 2020 at 09:08:13PM +0100, Sam Ravnborg wrote:
> On Fri, Mar 06, 2020 at 04:18:52PM +0100, Thomas Zimmermann wrote:
> > Am 06.03.20 um 15:22 schrieb Laurent Pinchart:
> > > On Thu, Mar 05, 2020 at 04:59:28PM +0100, Thomas Zimmermann wrote:
> > >> A call to drm_simple_encoder_init() initializes an encoder without
> > >> further functionality. It only provides the destroy callback to
> > >> cleanup the encoder's state. Only few drivers implement more
> > >> sophisticated encoders than that. Most drivers implement such a
> > >> simple encoder and can use drm_simple_encoder_init() instead.
> > >>
> > >> The patchset converts drivers where the encoder's instance is
> > >> embedded in a larger data structure. The driver releases the
> > >> memory during cleanup. Each patch replaces drm_encoder_init() with
> > >> drm_simple_encoder_init() and removes the (now unused) driver's
> > >> encoder functions.
> > >>
> > >> While the patchset is fairly large, the indiviual patches are self-
> > >> contained and can be merged independently from each other. The
> > >> simple-encoder functionality is currently in drm-misc-next, where
> > >> these patches could go as well.
> > > 
> > > I've reviewed the whole series, including verifying that the few
> > > instances of struct drm_encoder_funcs that were not declared const were
> > > not modified somewhere to add more function pointers.
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Thanks for the detailed review.
> > 
> > > for all the patches.
> > > 
> > > However, I'd like to note that drm_simple_encoder_init() is a bit of a
> > > misnommer here. Several of the encoders in those drivers to implement
> > > additional functionality. They just expose them through
> > > drm_encoder_helper_funcs, not drm_encoder_funcs.
> > 
> > True. It's called 'simple encoder' for the lack of a better name. It's
> > part of the simple KMS helpers, so the name's at least consistent. OTOH
> > I always find drm_simple_display_pipe a bad name.
> > 
> > We can still rename the simple-encoder function without much effort. I'm
> > open for suggestions.
> 
> IMO this does not belong in drm_simple_kms - but in drm_encoder.
> This only occurs to me after looking a bit more on the patches,
> you would have loved to get this feedback earlier.
> 
> Most users do not need their owm drm_encoder_funcs definition,
> and would be happy with the default as provided by drm_simple_*
> 
> As the cleanup is handled automatically when the drm device
> is teared down (in mode_config_rest()) I considered if we could here
> use the drmm_ namespace - but that felt wrong.
> 
> My proposal is the following:
> - Move the implementation to drm_encoder.c
> - Name it drm_encoder_init_nofuncs()

Or better, rename the existing drm_encoder_init() to
drm_encoder_init_funcs(), and rename drm_simple_encoder_init() to
drm_encoder_init() ? It's the common case.

> The patches posted in this thread would be a little simpler
> as they would loose the added include file.
> And the three drivers using the current infrastructure would need a
> small update.
> 
> I you decide to keep the current approach where the
> functions are in drm_simple_* then the full series is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> But I think moving it to drm_encoder.c would be the approach that would
> make it simpler to understand/follow. So that get my (biased) vote.

-- 
Regards,

Laurent Pinchart
