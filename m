Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79DA1AE6D6
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 22:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbgDQUeu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 16:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730903AbgDQUeu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 16:34:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4607C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:34:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C3DD97D;
        Fri, 17 Apr 2020 22:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587155688;
        bh=0N37fRi3Noo3nDa9ghOFWdRREPOQE2piHin6BelNPQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IvkpxlRvZi9ssQ2VZ0XYKj7TBzUEiUL3Zme3nDACyX0oivYBnnzzil0KHmN75z4/z
         smiO4QJuGII0wqCy8s/UUHm4y5FZfMl1BTf3NTtXzM3H1wkVK9sMRuNCRcbfc0I1kL
         yX2YQNPaNP8c+HnApPjvXQVyYvPR+ZA7GZx159KU=
Date:   Fri, 17 Apr 2020 23:34:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Message-ID: <20200417203435.GL5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
 <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 17, 2020 at 11:11:06PM +0300, Dmitry Osipenko wrote:
> 17.04.2020 22:24, Laurent Pinchart пишет:
> ...
> > As I tried to explain before, if you wrap the panel in a bridge with
> > drm_panel_bridge_add() (or the devm_ variant), you will always have a
> > bridge associated with the output, and will be able to remove your
> > custom connector implementation. I thus recommend converting to
> > drm_panel_bridge_add() either as part of this patch series, or just
> > after it, to get full benefits.
> > 
> > With the assumption that this will be handled,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks you very much!
> 
> Yes, I got yours point about wrapping panel into the bridge. But I don't
> think that it's worth the effort right now because each Tegra output has
> it's own implantation of the connector and it should be cleaner not to
> touch that code.
> 
> Secondly, I don't have hardware to test all available panel output types
> on Tegra and the benefits of messing with all that code are a bit dim to me.
> 
> I can make a patch to wrap the RGB panel into a bridge, but this should
> make code a bit inconsistent in regards to not having a common code path
> for the "legacy" nvidia,panel. So perhaps it's better to leave it all
> as-is for now.

I had a brief look at the code, converting the different output types
one by one would be a better way forward than not doing anything at all
in my opinion :-) Once you convert the first output it will also serve
as an example on how to do it, and hopefully other developers with
access to hardware could then do more conversions.

-- 
Regards,

Laurent Pinchart
