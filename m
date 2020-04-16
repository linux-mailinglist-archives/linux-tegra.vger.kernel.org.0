Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82E81AD13F
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 22:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731185AbgDPUh7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 16:37:59 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:58894 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgDPUh7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 16:37:59 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B65CA2002B;
        Thu, 16 Apr 2020 22:37:55 +0200 (CEST)
Date:   Thu, 16 Apr 2020 22:37:49 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Message-ID: <20200416203749.GA7104@ravnborg.org>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
        a=nEArpEn2Zqm_PZ96XV0A:9 a=QEXdDO2ut3YA:10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dimitry.

On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
> 16.04.2020 21:52, Dmitry Osipenko пишет:
> ...
> >> May I also recommend switching to the DRM panel bridge helper ? It will
> >> simplify the code.
> > 
> > Could you please clarify what is the "DRM panel bridge helper"?
> > 
> > I think we won't need any additional helpers after switching to the
> > bridge connector helper, no?
> 
> Actually, I now see that the panel needs to be manually attached to the
> connector.
> 
> Still it's not apparent to me how to get panel out of the bridge. It
> looks like there is no such "panel helper" for the bridge API or I just
> can't find it.

Take a look in bridge/panel.c
I think devm_drm_panel_bridge_add() is what you are after.

	Sam

