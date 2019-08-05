Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07B98187E
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 13:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHELy5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 07:54:57 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51780 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHELy5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 07:54:57 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id F12E320039;
        Mon,  5 Aug 2019 13:54:51 +0200 (CEST)
Date:   Mon, 5 Aug 2019 13:54:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Stefan Agner <stefan@agner.ch>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alison Wang <alison.wang@nxp.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Allison Randal <allison@lohutok.net>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sam Ravnborg <sam.ravnborg@gmail.com>,
        Enrico Weigelt <info@metux.net>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Message-ID: <20190805115450.GB16513@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
 <8567eb4c916a0b1d134bd62112a11903@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=8AirrxEcAAAA:8 a=PwaXosQhBBzGxnEnWWMA:9 a=AW-sozriLiJjIiio:21
        a=XmQ5ioN8wHDAHHl3:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=ST-jHhOKWsTCqRlWije3:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Stefan.

Thanks for the feedback.

On Mon, Aug 05, 2019 at 11:16:26AM +0200, Stefan Agner wrote:
> On 2019-08-04 22:16, Sam Ravnborg wrote:
> > Use drm_panel_get_modes() to access modes.
> > This has a nice side effect to simplify the code.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Alison Wang <alison.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +---------
> >  1 file changed, 1 insertion(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > index 279d83eaffc0..a92fd6c70b09 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > @@ -65,17 +65,9 @@ static const struct drm_connector_funcs
> > fsl_dcu_drm_connector_funcs = {
> >  static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
> >  {
> >  	struct fsl_dcu_drm_connector *fsl_connector;
> > -	int (*get_modes)(struct drm_panel *panel);
> > -	int num_modes = 0;
> >  
> >  	fsl_connector = to_fsl_dcu_connector(connector);
> > -	if (fsl_connector->panel && fsl_connector->panel->funcs &&
> > -	    fsl_connector->panel->funcs->get_modes) {
> > -		get_modes = fsl_connector->panel->funcs->get_modes;
> > -		num_modes = get_modes(fsl_connector->panel);
> > -	}
> > -
> > -	return num_modes;
> > +	return drm_panel_get_modes(fsl_connector->panel);
> 
> Oh, that old code looks rather messy. Thanks for the simplification!
> 
> This behaves slightly different since it now returns -EINVAL or -ENOSYS,
> but that is what we want.

You are right, and I will add this to the changelog when I apply.

	Sam
