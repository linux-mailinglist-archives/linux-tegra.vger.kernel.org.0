Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FDA1AD17F
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 22:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbgDPUua (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 16:50:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35012 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgDPUu3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 16:50:29 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577CA97D;
        Thu, 16 Apr 2020 22:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587070224;
        bh=+3HruF7BWI3dgo7B6OhbPOuvAroBWE8pf/TumbaPCNE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GOwCpuEhOVC5GevTvJXEoi/Qk7P1KlX897QfWZMYhfj4ComYApD7KvhqkllmU19mP
         QldRhosz0iZgv73AxKq3hbxz4Q1RDTJXLXX0uV0Pc3hFo4bxYuDTfakUEaiF0aWeID
         T94H6CCO0JaBNJsP6wmSzCTC6+UjjieK9mSOxKwQ=
Date:   Thu, 16 Apr 2020 23:50:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Message-ID: <20200416205012.GA28162@pendragon.ideasonboard.com>
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
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

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

The DRM panel bridge helper creates a bridge from a panel (with
devm_drm_panel_bridge_add()). You can then attach that bridge to the
chain, like any other bridge, and the enable/disable operations will be
called automatically without any need to call the panel enable/disable
manually as done currently.

> Still it's not apparent to me how to get panel out of the bridge. It
> looks like there is no such "panel helper" for the bridge API or I just
> can't find it.

You don't need to get a panel out of the bridge. You should get the
bridge as done today, and wrap it in a bridge with
devm_drm_panel_bridge_add().

-- 
Regards,

Laurent Pinchart
