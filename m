Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7FF65521A
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Dec 2022 16:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiLWPdr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Dec 2022 10:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiLWPdq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Dec 2022 10:33:46 -0500
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29B51DA4B;
        Fri, 23 Dec 2022 07:33:42 -0800 (PST)
Message-ID: <7aa53ccc-2942-e2d4-9c84-32f1bdf462ad@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1671809621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=twU6G82PQpwC8zwHWIz8F9rsWmIFJuTai19fmGz1yi4=;
        b=kZQK5SU633nXGkPHLpetzQeS8JCb20af5MuZlypG9fGZdTBDX3hOl36eva92rErmdrYDxb
        Sz6qEfzRAYZBOKtZptqcVIa4zkM5tBlxVErVfJbsyfEtTbd+JjV6Lyao1Zqq18xVbvwILD
        72kQymV7O/EjJzGvXY/kAZ3kktL7j+Q=
Date:   Fri, 23 Dec 2022 15:33:40 +0000
MIME-Version: 1.0
Subject: Re: [v2,3/4] drm/panel: Add driver for JDI LPM102A188A
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, sam@ravnborg.org
References: <20221025153746.101278-4-diogo.ivo@tecnico.ulisboa.pt>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <20221025153746.101278-4-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

On 25/10/2022 16:37, Diogo Ivo wrote:
> The JDI LPM102A188A is a 2560x1800 IPS panel found in the Google Pixel C.
> This driver is based on the downstream GPLv2 driver released by Google
> written by Sean Paul [1], which was then adapted to the newer kernel APIs.
> 
> [1]: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Changes in v2:
>   - tuned backlight delays
> 
>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 509 ++++++++++++++++++
>   3 files changed, 521 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a582ddd583c2..80eda8f6bee0 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -214,6 +214,17 @@ config DRM_PANEL_JDI_LT070ME05000
>   	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
>   	  24 bit per pixel.
>   
> +config DRM_PANEL_JDI_LPM102A188A
> +	tristate "JDI LPM102A188A DSI panel"
> +	depends on OF && GPIOLIB
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for JDI LPM102A188A DSI
> +	  control mode panel as found in Google Pixel C devices.
Shouldn't this be "command mode panel" instead of "control mode panel"?
> +	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
> +	  to the host.
> +
>   config DRM_PANEL_JDI_R63452
>   	tristate "JDI R63452 Full HD DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 34e717382dbb..2870cba96d14 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
>   obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
> +obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) += panel-jdi-lpm102a188a.o
>   obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
>   obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
>   obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> new file mode 100644
> index 000000000000..980af82ad6d6
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2014 Google, Inc.
> + *
> + * Copyright (C) 2022 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> + *
> + * Adapted from the downstream Pixel C driver written by Sean Paul
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +struct jdi_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *link1;
> +	struct mipi_dsi_device *link2;
> +
> +	struct regulator *supply;
> +	struct regulator *ddi_supply;
> +	struct backlight_device *backlight;
> +
> +	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *reset_gpio;
> +
> +	const struct drm_display_mode *mode;
> +
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct jdi_panel *to_panel_jdi(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct jdi_panel, base);
> +}
> +
> +static void jdi_wait_frames(struct jdi_panel *jdi, unsigned int frames)
> +{
> +	unsigned int refresh = drm_mode_vrefresh(jdi->mode);
> +
> +	if (WARN_ON(frames > refresh))
> +		return;
> +
> +	msleep(1000 / (refresh / frames));
> +}
> +
> +static int jdi_panel_disable(struct drm_panel *panel)
> +{
> +	struct jdi_panel *jdi = to_panel_jdi(panel);
> +
> +	if (!jdi->enabled)
> +		return 0;
> +
> +	backlight_disable(jdi->backlight);
> +
> +	jdi_wait_frames(jdi, 2);
> +
> +	jdi->enabled = false;
> +
> +	return 0;
> +}
> +
> +static int jdi_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct jdi_panel *jdi = to_panel_jdi(panel);
> +	int ret;
> +
> +	if (!jdi->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to set display off: %d\n", ret);
> +	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to set display off: %d\n", ret);
> +
> +	/* Specified by JDI @ 50ms, subject to change */
> +	msleep(50);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
> +	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
> +
> +	/* Specified by JDI @ 150ms, subject to change */
> +	msleep(150);
> +
> +	gpiod_set_value(jdi->reset_gpio, 1);
> +
> +	/* T4 = 1ms */
> +	usleep_range(1000, 3000);
> +
> +	gpiod_set_value(jdi->enable_gpio, 0);
> +
> +	/* T5 = 2ms */
> +	usleep_range(2000, 4000);
> +
> +	regulator_disable(jdi->ddi_supply);
> +
> +	/* T6 = 2ms */
> +	usleep_range(5000, 6000);
> +
> +	regulator_disable(jdi->supply);
> +
> +	jdi->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
> +				       struct mipi_dsi_device *right,
> +				       const struct drm_display_mode *mode)
> +{
> +	int err;
> +
> +	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
> +	if (err < 0) {
> +		dev_err(&left->dev, "failed to set column address: %d\n", err);
> +		return err;
> +	}
> +
> +	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
> +	if (err < 0) {
> +		dev_err(&right->dev, "failed to set column address: %d\n", err);
> +		return err;
> +	}
> +
> +	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
> +	if (err < 0) {
> +		dev_err(&left->dev, "failed to set page address: %d\n", err);
> +		return err;
> +	}
> +
> +	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
> +	if (err < 0) {
> +		dev_err(&right->dev, "failed to set page address: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jdi_panel_prepare(struct drm_panel *panel)
> +{
> +	struct jdi_panel *jdi = to_panel_jdi(panel);
> +	u8 format = MIPI_DCS_PIXEL_FMT_24BIT;
> +	int err;
> +
> +	if (jdi->prepared)
> +		return 0;
> +
> +	/* Disable backlight to avoid showing random pixels
> +	 * with a conservative delay for it to take effect.
> +	 */
> +	backlight_disable(jdi->backlight);
> +	msleep(100);
> +
> +	jdi->link1->mode_flags |= MIPI_DSI_MODE_LPM;
> +	jdi->link2->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	err = regulator_enable(jdi->supply);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to enable supply: %d\n", err);
> +		return err;
> +	}
> +	/* T1 = 2ms */
> +	usleep_range(2000, 4000);
> +
> +	err = regulator_enable(jdi->ddi_supply);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to enable ddi_supply: %d\n", err);
> +		return err;
> +	}
> +	/* T2 = 1ms */
> +	usleep_range(1000, 3000);
> +
> +	gpiod_set_value(jdi->enable_gpio, 1);
> +	/* T3 = 10ms */
> +	usleep_range(10000, 15000);
> +
> +	gpiod_set_value(jdi->reset_gpio, 0);
> +	/* Specified by JDI @ 3ms, subject to change */
> +	usleep_range(3000, 5000);
> +
> +	/*
> +	 * TODO: The device supports both left-right and even-odd split
> +	 * configurations, but this driver currently supports only the left-
> +	 * right split. To support a different mode a mechanism needs to be
> +	 * put in place to communicate the configuration back to the DSI host
> +	 * controller.
> +	 */
> +
> +	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
> +					    jdi->mode);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
> +			err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
> +					     jdi->mode->vdisplay - 16);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
> +
> +	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
> +					     jdi->mode->vdisplay - 16);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
> +
> +	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set tear on: %d\n", err);
> +
> +	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set tear on: %d\n", err);
> +
> +	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, format);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, format);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	/*
> +	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode() and
> +	 * mipi_dsi_dcs_set_display_on().
> +	 */
> +	msleep(150);
> +
> +	err = mipi_dsi_dcs_set_display_on(jdi->link1);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set display on: %d\n", err);
> +
> +
> +	err = mipi_dsi_dcs_set_display_on(jdi->link2);
> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set display on: %d\n", err);
> +
> +	jdi->prepared = true;
> +
> +	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +
> +poweroff:
> +	regulator_disable(jdi->ddi_supply);
> +
> +	/* T6 = 2ms */
> +	usleep_range(7000, 9000);
> +
> +	regulator_disable(jdi->supply);
> +
> +	return err;
> +}
> +
> +static int jdi_panel_enable(struct drm_panel *panel)
> +{
> +	struct jdi_panel *jdi = to_panel_jdi(panel);
> +
> +	if (jdi->enabled)
> +		return 0;
> +
> +	/*
> +	 * Ensure we send image data before turning the backlight on,
> +	 * to avoid the display showing random pixels (colored snow).
> +	 */
> +	jdi_wait_frames(jdi, 3);
> +
> +	backlight_enable(jdi->backlight);
> +
> +	jdi->enabled = true;
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode default_mode = {
> +	.clock = 331334,
> +	.hdisplay = 2560,
> +	.hsync_start = 2560 + 80,
> +	.hsync_end = 2560 + 80 + 80,
> +	.htotal = 2560 + 80 + 80 + 80,
> +	.vdisplay = 1800,
> +	.vsync_start = 1800 + 4,
> +	.vsync_end = 1800 + 4 + 4,
> +	.vtotal = 1800 + 4 + 4 + 4,
> +	.flags = 0,
> +};
> +
> +static int jdi_panel_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +	struct jdi_panel *jdi = to_panel_jdi(panel);
> +	struct device *dev = &jdi->link1->dev;
> +
> +	mode = drm_mode_duplicate(connector->dev, &default_mode);
> +	if (!mode) {
> +		dev_err(dev, "failed to add mode %ux%ux@%u\n",
> +			default_mode.hdisplay, default_mode.vdisplay,
> +			drm_mode_vrefresh(&default_mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = 211;
> +	connector->display_info.height_mm = 148;
> +	connector->display_info.bpc = 8;
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs jdi_panel_funcs = {
> +	.prepare = jdi_panel_prepare,
> +	.enable = jdi_panel_enable,
> +	.disable = jdi_panel_disable,
> +	.unprepare = jdi_panel_unprepare,
> +	.get_modes = jdi_panel_get_modes,
> +};
> +
> +static const struct of_device_id jdi_of_match[] = {
> +	{ .compatible = "jdi,lpm102a188a", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, jdi_of_match);
> +
> +static int jdi_panel_add(struct jdi_panel *jdi)
> +{
> +	struct device *dev = &jdi->link1->dev;
> +
> +	jdi->mode = &default_mode;
> +
> +	jdi->supply = devm_regulator_get(dev, "power");
> +	if (IS_ERR(jdi->supply))
> +		return dev_err_probe(dev, PTR_ERR(jdi->supply),
> +				     "failed to get power regulator\n");
> +
> +	jdi->ddi_supply = devm_regulator_get(dev, "ddi");
> +	if (IS_ERR(jdi->ddi_supply))
> +		return dev_err_probe(dev, PTR_ERR(jdi->ddi_supply),
> +				     "failed to get ddi regulator\n");
> +
> +	jdi->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(jdi->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(jdi->reset_gpio),
> +				     "failed to get reset gpio\n");
> +	usleep_range(1000, 3000);
> +
> +	jdi->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(jdi->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(jdi->enable_gpio),
> +				     "failed to get enable gpio\n");
> +	usleep_range(2000, 4000);
> +
> +	jdi->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(jdi->backlight))
> +		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
> +				     "failed to create backlight\n");
> +
> +	drm_panel_init(&jdi->base, &jdi->link1->dev, &jdi_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_panel_add(&jdi->base);
> +
> +	return 0;
> +}
> +
> +static void jdi_panel_del(struct jdi_panel *jdi)
> +{
> +	if (jdi->base.dev)
> +		drm_panel_remove(&jdi->base);
> +
> +	if (jdi->link2)
> +		put_device(&jdi->link2->dev);
> +}
> +
> +static int jdi_panel_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct mipi_dsi_device *secondary = NULL;
> +	struct jdi_panel *jdi;
> +	struct device_node *np;
> +	int err;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = 0;
> +
> +	/* Find DSI-LINK1 */
> +	np = of_parse_phandle(dsi->dev.of_node, "link2", 0);
> +	if (np) {
> +		secondary = of_find_mipi_dsi_device_by_node(np);
> +		of_node_put(np);
> +
> +		if (!secondary)
> +			return -EPROBE_DEFER;
> +	}
> +
> +	/* register a panel for only the DSI-LINK1 interface */
> +	if (secondary) {
> +		jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
> +		if (!jdi) {
> +			put_device(&secondary->dev);
> +			return -ENOMEM;
> +		}
> +
> +		mipi_dsi_set_drvdata(dsi, jdi);
> +
> +		jdi->link1 = dsi;
> +		jdi->link2 = secondary;
> +
> +		err = jdi_panel_add(jdi);
> +		if (err < 0) {
> +			put_device(&secondary->dev);
> +			return err;
> +		}
> +	}
> +
> +	err = mipi_dsi_attach(dsi);
> +	if (err < 0) {
> +		if (secondary)
> +			jdi_panel_del(jdi);
> +
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void jdi_panel_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
> +	int err;
> +
> +	/* only detach from host for the DSI-LINK2 interface */
> +	if (!jdi)
> +		mipi_dsi_detach(dsi);
> +
> +	err = jdi_panel_disable(&jdi->base);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
> +
> +	err = mipi_dsi_detach(dsi);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
> +
> +	jdi_panel_del(jdi);
> +}
> +
> +static void jdi_panel_dsi_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
> +
> +	if (!jdi)
> +		return;
> +
> +	jdi_panel_disable(&jdi->base);
> +}
> +
> +static struct mipi_dsi_driver jdi_panel_dsi_driver = {
> +	.driver = {
> +		.name = "panel-jdi-lpm102a188a-dsi",
Is the "-dsi" suffix needed here? Other panel drivers don't have this.
> +		.of_match_table = jdi_of_match,
> +	},
> +	.probe = jdi_panel_dsi_probe,
> +	.remove = jdi_panel_dsi_remove,
> +	.shutdown = jdi_panel_dsi_shutdown,
> +};
> +module_mipi_dsi_driver(jdi_panel_dsi_driver);
> +
> +MODULE_AUTHOR("Sean Paul <seanpaul@chromium.org>");
> +MODULE_AUTHOR("Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>");
> +MODULE_DESCRIPTION("DRM Driver for JDI LPM102A188A DSI panel, command mode");
> +MODULE_LICENSE("GPL");

-- 
Rayyan Ansari
https://ansari.sh

