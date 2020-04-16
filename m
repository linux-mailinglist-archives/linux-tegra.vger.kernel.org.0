Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45F51AD200
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 23:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDPVje (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 17:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726116AbgDPVjd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 17:39:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763E6C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 14:39:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39C9197D;
        Thu, 16 Apr 2020 23:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587073171;
        bh=h3jkGopyE4UqZMH1imIITHaJ0owcvi6lnBuR61oaZKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BUkbDdKOVuvepyr3qU+yK0+y0FQ4MF83r1+nI5Eb/w0QP/aCswoWf542vq0qeyviQ
         6sKkZQEbw8oTOHWa1BB9H76GUjWcj+pbqas6kqZlS5xvH8uXPOir7NHbNA+J/BuJQg
         texGYLq2/eehw2bd8ABZMEWb0XW+dwp6KAqFfTyA=
Date:   Fri, 17 Apr 2020 00:39:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Message-ID: <20200416213919.GB28162@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
 <20200416205012.GA28162@pendragon.ideasonboard.com>
 <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Fri, Apr 17, 2020 at 12:15:33AM +0300, Dmitry Osipenko wrote:
> 16.04.2020 23:50, Laurent Pinchart пишет:
> > On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
> >> 16.04.2020 21:52, Dmitry Osipenko пишет:
> >> ...
> >>>> May I also recommend switching to the DRM panel bridge helper ? It will
> >>>> simplify the code.
> >>>
> >>> Could you please clarify what is the "DRM panel bridge helper"?
> >>>
> >>> I think we won't need any additional helpers after switching to the
> >>> bridge connector helper, no?
> >>
> >> Actually, I now see that the panel needs to be manually attached to the
> >> connector.
> > 
> > The DRM panel bridge helper creates a bridge from a panel (with
> > devm_drm_panel_bridge_add()). You can then attach that bridge to the
> > chain, like any other bridge, and the enable/disable operations will be
> > called automatically without any need to call the panel enable/disable
> > manually as done currently.
> > 
> >> Still it's not apparent to me how to get panel out of the bridge. It
> >> looks like there is no such "panel helper" for the bridge API or I just
> >> can't find it.
> > 
> > You don't need to get a panel out of the bridge. You should get the
> > bridge as done today,
> 
> You mean "get the panel", correct?

Yes, sorry.

> > and wrap it in a bridge with
> > devm_drm_panel_bridge_add().
> > 
> 
> The lvds-codec already wraps panel into the bridge using
> devm_drm_panel_bridge_add() and chains it for us, please see
> lvds_codec_probe() / lvds_codec_attach().
> 
> Does it mean that lvds-codec is not supporting the new model?

No, that *is* the new model :-) As I think I've commented during review,
when you have an LVDS encoder and a panel, you don't need to handle the
panel at all. When you have an RGB panel connected directly to the RGB
output, you need to wrap it in a bridge, exactly the same way as
lvds-codec does for its panel.

> Everything works nicely using the old model, where bridge creates
> connector and attaches panel to it for us.
> 
> [I'm still not sure what is the point to use the new model in a case of
> a simple chain of bridges]
> 
> Using the new model, the connector isn't created by the bridge, so I
> need to duplicate that creation effort in the driver. Once the bridge
> connector is manually created, I need to attach panel to this connector,
> but panel is reachable only via the remote bridge (which wraps the panel).
> 
> driver connector -> LVDS bridge -> panel bridge -> panel

With the new model,

1. The display driver and the bridge drivers need to get hold of the
   bridge directly connected to their output (for instance with
   of_drm_find_panel()). If the output is connected to a panel, they
   need to wrap that panel in a bridge (with
   devm_drm_panel_bridge_add()). I plan, in the future, to make creation
   of panel bridges automatic, so drivers won't have to care.

2. The display driver needs to create a dummy drm_encoder for each of
   its outputs (for instance with drm_simple_encoder_init()).

3. The display driver needs to create a drm_connector for each of its
   outputs, and implement connector operations by delegating them to the
   bridges in the pipeline. Unless there's a good reason not to do so,
   this should be done with drm_bridge_connector_init().

That's it. Every driver then focusses on its own needs, bridge drivers
handle only the device they're associated with, and the DRM core and DRM
bridge connector helper will handle all the rest.

-- 
Regards,

Laurent Pinchart
