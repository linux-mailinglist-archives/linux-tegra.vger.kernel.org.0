Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C1082316
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 18:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfHEQv2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 12:51:28 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:34584 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfHEQv2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 12:51:28 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C267B20043;
        Mon,  5 Aug 2019 18:51:18 +0200 (CEST)
Date:   Mon, 5 Aug 2019 18:51:17 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20190805165117.GA23301@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
 <20190805105928.GI29747@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805105928.GI29747@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=PSbSiqWQeDyjEjQUClkA:9
        a=rmExfkhgAZTdbKwS:21 a=hj9UMnod6qK2XUPH:21 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=d3PnA9EDa4IxuAV0gXij:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Laurent.

> 
> On Sun, Aug 04, 2019 at 10:16:35PM +0200, Sam Ravnborg wrote:
> > Many panel drivers duplicate logic to prevent prepare to be called
> > for a panel that is already prepared.
> > Likewise for enable.
> > 
> > Implement this logic in drm_panel so the individual drivers
> > no longer needs this.
> > A panel is considered prepared/enabled only if the prepare/enable call
> > succeeds.
> > For disable/unprepare it is unconditionally considered
> > disabled/unprepared.
> > 
> > This allows calls to prepare/enable again, even if there were
> > some issue disabling a regulator or similar during disable/unprepare.
> 
> Is this the right place to handle this ? Shouldn't the upper layers
> ensure than enable/disable and prepare/unprepare are correcty balanced,
> and not called multiple times ? Adding enabled and prepared state to
> drm_panel not only doesn't align well with atomic state handling, but
> also would hide issues in upper layers that should really be fixed
> there.

The main rationale behind starting on this was that ~15 panel drivers
already implements logic to prevent the prepare/enable/disable/unprepare
functions to be called out of order.
$ cd drivers/gpu/drm/panel/; git grep enabled | grep bool | wc -l

Several of the panel drivers also implements a
mipi_dsi_driver.shutdown() or platform_driver.shutdown().
To the best of my knowledge we cannot guarantee that the upper layers
have done the proper disable()/unprepare() dance before a shutdown.
So the flags exists to allow the driver to unconditionally call
disable() / unprepare() in the shutdown methods.
Same goes for *_driver.remove()

One improvement could be to detect if the panel is prepare() when
upper layers call enable() and warn/error in this situation.
With the current implementation this is not checked at all.
Likewise for unprepare() (require it was never enabled or disable() was
caled first)

I claim the check exists for the benefit of .remove and .shutdown,
so we could also check if prepare() or enable() is called twice.

Adding logic to call prepare() automagically would hide probems in upper
layers and this was only briefly considered - and discarded as hiding
bugs.

So to sum up:
- Moving the checks from drivers to the core is a good thing
- The core shall check that a panel is prepared when enable is called
  and error out if not (or warn).
- The core shall check that a panel is disabled when unprepare is called
  and error out if not (or warn).
  The core shall check if prepare() and enable() is called out of order.

The patch needs to be extended to cover the last three points.

Laurent / Emil / Thierry - agree/comments?

Note: Did a quick round to see if could spot any wrong use of
drm_panel_* functions.
Most looked good, but then I did not do a throughly check.

bridge/analogix/analogix_dp_core.c looks fishy.
Looks like analogix_dp_prepare_panel() is a nop the way it is called.
I did not look too much on this, maybe I am wrong.

	Sam

> 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 66 ++++++++++++++++++++++++++++++-------
> >  include/drm/drm_panel.h     | 21 ++++++++++++
> >  2 files changed, 75 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index da19d5b4a2f4..0853764040de 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -66,10 +66,21 @@ EXPORT_SYMBOL(drm_panel_init);
> >   */
> >  int drm_panel_prepare(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->prepare)
> > -		return panel->funcs->prepare(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (panel->prepared)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->prepare)
> > +		ret = panel->funcs->prepare(panel);
> > +
> > +	if (ret >= 0)
> > +		panel->prepared = true;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_prepare);
> >  
> > @@ -85,10 +96,21 @@ EXPORT_SYMBOL(drm_panel_prepare);
> >   */
> >  int drm_panel_enable(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->enable)
> > -		return panel->funcs->enable(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (panel->enabled)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->enable)
> > +		ret = panel->funcs->enable(panel);
> > +
> > +	if (ret >= 0)
> > +		panel->enabled = true;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_enable);
> >  
> > @@ -104,10 +126,20 @@ EXPORT_SYMBOL(drm_panel_enable);
> >   */
> >  int drm_panel_disable(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->disable)
> > -		return panel->funcs->disable(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (!panel->enabled)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->disable)
> > +		ret = panel->funcs->disable(panel);
> > +
> > +	panel->enabled = false;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_disable);
> >  
> > @@ -124,10 +156,20 @@ EXPORT_SYMBOL(drm_panel_disable);
> >   */
> >  int drm_panel_unprepare(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->unprepare)
> > -		return panel->funcs->unprepare(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (!panel->prepared)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->unprepare)
> > +		ret = panel->funcs->unprepare(panel);
> > +
> > +	panel->prepared = false;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_unprepare);
> >  
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index 624bd15ecfab..7493500fc9bd 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -65,6 +65,9 @@ struct drm_panel_funcs {
> >  	 * @prepare:
> >  	 *
> >  	 * Turn on panel and perform set up.
> > +	 * When the panel is successfully prepared the prepare() function
> > +	 * will not be called again until the panel has been unprepared.
> > +	 *
> >  	 */
> >  	int (*prepare)(struct drm_panel *panel);
> >  
> > @@ -72,6 +75,8 @@ struct drm_panel_funcs {
> >  	 * @enable:
> >  	 *
> >  	 * Enable panel (turn on back light, etc.).
> > +	 * When the panel is successfully enabled the enable() function
> > +	 * will not be called again until the panel has been disabled.
> >  	 */
> >  	int (*enable)(struct drm_panel *panel);
> >  
> > @@ -79,6 +84,7 @@ struct drm_panel_funcs {
> >  	 * @disable:
> >  	 *
> >  	 * Disable panel (turn off back light, etc.).
> > +	 * If the panel is already disabled the disable() function is not called.
> >  	 */
> >  	int (*disable)(struct drm_panel *panel);
> >  
> > @@ -86,6 +92,7 @@ struct drm_panel_funcs {
> >  	 * @unprepare:
> >  	 *
> >  	 * Turn off panel.
> > +	 * If the panel is already unprepared the unprepare() function is not called.
> >  	 */
> >  	int (*unprepare)(struct drm_panel *panel);
> >  
> > @@ -145,6 +152,20 @@ struct drm_panel {
> >  	 * Panel entry in registry.
> >  	 */
> >  	struct list_head list;
> > +
> > +	/**
> > +	 * @prepared:
> > +	 *
> > +	 * Set to true when the panel is successfully prepared.
> > +	 */
> > +	bool prepared;
> > +
> > +	/**
> > +	 * @enabled:
> > +	 *
> > +	 * Set to true when the panel is successfully enabled.
> > +	 */
> > +	bool enabled;
> >  };
> >  
> >  void drm_panel_init(struct drm_panel *panel);
> 
> -- 
> Regards,
> 
> Laurent Pinchart
