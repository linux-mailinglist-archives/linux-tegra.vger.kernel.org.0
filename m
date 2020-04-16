Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300A71ACF08
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394052AbgDPRp1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:45:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52392 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405122AbgDPRp1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:45:27 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A9AC97D;
        Thu, 16 Apr 2020 19:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587059125;
        bh=Si+PzRRws6+4QDc7hynPy3aV2BYGQt/fRSsGgtq8sj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A3exe/dLkoRkW7lEsQ8BdExFrYDd58/ZG1h8n96EfHkx7BDjk+IrwtvIZezM2z5on
         5y5MAj37PUdA2af/qbeQzCtF7HD2GfTrxEy6vypLrXJ4jIPlNNeNY/Mfl0PxRmUYTp
         sp7agrePntewR5vh0XcIiIjWjIf+Bdq8KH4T6wzw=
Date:   Thu, 16 Apr 2020 20:45:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Message-ID: <20200416174513.GT4796@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
 <20200416172727.GN4796@pendragon.ideasonboard.com>
 <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Thu, Apr 16, 2020 at 08:30:24PM +0300, Dmitry Osipenko wrote:
> 16.04.2020 20:27, Laurent Pinchart пишет:
> > On Thu, Apr 16, 2020 at 08:24:04PM +0300, Dmitry Osipenko wrote:
> >> The OF node should be put before returning error in tegra_output_probe(),
> >> otherwise node's refcount will be leaked.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Hello Laurent,
> 
> That is the fastest kernel review I ever got, thank you :)

I think I'm also guilty for the slowest kernel reviews ever, so maybe in
the end it will even out :-)

-- 
Regards,

Laurent Pinchart
