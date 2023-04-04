Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A976D56A7
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Apr 2023 04:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbjDDCVX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Apr 2023 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDDCVW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 22:21:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6822F1BEA
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 19:21:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 043247F8;
        Tue,  4 Apr 2023 04:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680574878;
        bh=co7C8OHo7qjDYFifvepzDVKH4rzL3E7SZ1+BOZjM3I8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OMr+iM0JRysXq7faovH+ve1EiPFeg6zIXqopvU/p2RgPdhayW0girxbPjrm7PDqoR
         smbbuz8FtSp/AwPAzrZTrBjPBopJsbldPfnwIMeI8FEf0Z3FZQDiiCUHvR1Ny+krwd
         cHyjZERTYSM1QKNoB3oYPgrWwdec5NdZSephZx3Y=
Date:   Tue, 4 Apr 2023 05:21:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <20230404022125.GA16648@pendragon.ideasonboard.com>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230403223652.18848-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403223652.18848-1-ville.syrjala@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Ville,

Thank you for the patch.

On Tue, Apr 04, 2023 at 01:36:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Include the device and connector information in the SCDC
> debugs. Makes it easier to figure out who did what.
> 
> v2: Rely on connector->ddc (Maxime)
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  8 ++--
>  drivers/gpu/drm/display/drm_scdc_helper.c | 46 +++++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_ddi.c  |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +---
>  drivers/gpu/drm/tegra/sor.c               | 15 +++-----
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 21 ++++++-----
>  include/drm/display/drm_scdc_helper.h     |  7 ++--
>  7 files changed, 59 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index aa51c61a78c7..603bb3c51027 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1426,9 +1426,9 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
>  	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
>  	if (dw_hdmi_support_scdc(hdmi, display)) {
>  		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
> -			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
> +			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 1);
>  		else
> -			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 0);
> +			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 0);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_set_high_tmds_clock_ratio);
> @@ -2116,7 +2116,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  				min_t(u8, bytes, SCDC_MIN_SOURCE_VERSION));
>  
>  			/* Enabled Scrambling in the Sink */
> -			drm_scdc_set_scrambling(hdmi->ddc, 1);
> +			drm_scdc_set_scrambling(&hdmi->connector, 1);
>  
>  			/*
>  			 * To activate the scrambler feature, you must ensure
> @@ -2132,7 +2132,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
>  			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
>  				    HDMI_MC_SWRSTZ);
> -			drm_scdc_set_scrambling(hdmi->ddc, 0);
> +			drm_scdc_set_scrambling(&hdmi->connector, 0);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> index c3ad4ab2b456..6d2f244e5830 100644
> --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
> @@ -26,6 +26,8 @@
>  #include <linux/delay.h>
>  
>  #include <drm/display/drm_scdc_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_print.h>
>  
>  /**
> @@ -140,7 +142,7 @@ EXPORT_SYMBOL(drm_scdc_write);
>  
>  /**
>   * drm_scdc_get_scrambling_status - what is status of scrambling?
> - * @adapter: I2C adapter for DDC channel
> + * @connector: connector
>   *
>   * Reads the scrambler status over SCDC, and checks the
>   * scrambling status.
> @@ -148,14 +150,16 @@ EXPORT_SYMBOL(drm_scdc_write);
>   * Returns:
>   * True if the scrambling is enabled, false otherwise.
>   */
> -bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
> +bool drm_scdc_get_scrambling_status(struct drm_connector *connector)
>  {
>  	u8 status;
>  	int ret;
>  
> -	ret = drm_scdc_readb(adapter, SCDC_SCRAMBLER_STATUS, &status);
> +	ret = drm_scdc_readb(connector->ddc, SCDC_SCRAMBLER_STATUS, &status);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to read scrambling status: %d\n", ret);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Failed to read scrambling status: %d\n",
> +			    connector->base.id, connector->name, ret);
>  		return false;
>  	}
>  
> @@ -165,7 +169,7 @@ EXPORT_SYMBOL(drm_scdc_get_scrambling_status);
>  
>  /**
>   * drm_scdc_set_scrambling - enable scrambling
> - * @adapter: I2C adapter for DDC channel
> + * @connector: connector
>   * @enable: bool to indicate if scrambling is to be enabled/disabled
>   *
>   * Writes the TMDS config register over SCDC channel, and:
> @@ -175,14 +179,17 @@ EXPORT_SYMBOL(drm_scdc_get_scrambling_status);
>   * Returns:
>   * True if scrambling is set/reset successfully, false otherwise.
>   */
> -bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable)
> +bool drm_scdc_set_scrambling(struct drm_connector *connector,
> +			     bool enable)
>  {
>  	u8 config;
>  	int ret;
>  
> -	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
> +	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to read TMDS config: %d\n", ret);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
> +			    connector->base.id, connector->name, ret);
>  		return false;
>  	}
>  
> @@ -191,9 +198,11 @@ bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable)
>  	else
>  		config &= ~SCDC_SCRAMBLING_ENABLE;
>  
> -	ret = drm_scdc_writeb(adapter, SCDC_TMDS_CONFIG, config);
> +	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to enable scrambling: %d\n", ret);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Failed to enable scrambling: %d\n",
> +			    connector->base.id, connector->name, ret);
>  		return false;
>  	}
>  
> @@ -203,7 +212,7 @@ EXPORT_SYMBOL(drm_scdc_set_scrambling);
>  
>  /**
>   * drm_scdc_set_high_tmds_clock_ratio - set TMDS clock ratio
> - * @adapter: I2C adapter for DDC channel
> + * @connector: connector
>   * @set: ret or reset the high clock ratio
>   *
>   *
> @@ -230,14 +239,17 @@ EXPORT_SYMBOL(drm_scdc_set_scrambling);
>   * Returns:
>   * True if write is successful, false otherwise.
>   */
> -bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set)
> +bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
> +					bool set)
>  {
>  	u8 config;
>  	int ret;
>  
> -	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
> +	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to read TMDS config: %d\n", ret);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
> +			    connector->base.id, connector->name, ret);
>  		return false;
>  	}
>  
> @@ -246,9 +258,11 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set)
>  	else
>  		config &= ~SCDC_TMDS_BIT_CLOCK_RATIO_BY_40;
>  
> -	ret = drm_scdc_writeb(adapter, SCDC_TMDS_CONFIG, config);
> +	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to set TMDS clock ratio: %d\n", ret);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Failed to set TMDS clock ratio: %d\n",
> +			    connector->base.id, connector->name, ret);
>  		return false;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index dc294717bcdf..d0bb3a52ae5c 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3974,8 +3974,8 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
>  
>  	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
>  	if (ret < 0) {
> -		drm_err(&dev_priv->drm, "Failed to read TMDS config: %d\n",
> -			ret);
> +		drm_err(&dev_priv->drm, "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
> +			connector->base.base.id, connector->base.name, ret);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index c7e9e1fbed37..a690a5616506 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2646,11 +2646,8 @@ bool intel_hdmi_handle_sink_scrambling(struct intel_encoder *encoder,
>  				       bool scrambling)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> -	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
>  	struct drm_scrambling *sink_scrambling =
>  		&connector->display_info.hdmi.scdc.scrambling;
> -	struct i2c_adapter *adapter =
> -		intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
>  
>  	if (!sink_scrambling->supported)
>  		return true;
> @@ -2661,9 +2658,8 @@ bool intel_hdmi_handle_sink_scrambling(struct intel_encoder *encoder,
>  		    str_yes_no(scrambling), high_tmds_clock_ratio ? 40 : 10);
>  
>  	/* Set TMDS bit clock ratio to 1/40 or 1/10, and enable/disable scrambling */
> -	return drm_scdc_set_high_tmds_clock_ratio(adapter,
> -						  high_tmds_clock_ratio) &&
> -		drm_scdc_set_scrambling(adapter, scrambling);
> +	return drm_scdc_set_high_tmds_clock_ratio(connector, high_tmds_clock_ratio) &&
> +		drm_scdc_set_scrambling(connector, scrambling);
>  }
>  
>  static u8 chv_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 8af632740673..34af6724914f 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -2140,10 +2140,8 @@ static void tegra_sor_hdmi_disable_scrambling(struct tegra_sor *sor)
>  
>  static void tegra_sor_hdmi_scdc_disable(struct tegra_sor *sor)
>  {
> -	struct i2c_adapter *ddc = sor->output.ddc;
> -
> -	drm_scdc_set_high_tmds_clock_ratio(ddc, false);
> -	drm_scdc_set_scrambling(ddc, false);
> +	drm_scdc_set_high_tmds_clock_ratio(&sor->output.connector, false);
> +	drm_scdc_set_scrambling(&sor->output.connector, false);
>  
>  	tegra_sor_hdmi_disable_scrambling(sor);
>  }
> @@ -2168,10 +2166,8 @@ static void tegra_sor_hdmi_enable_scrambling(struct tegra_sor *sor)
>  
>  static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
>  {
> -	struct i2c_adapter *ddc = sor->output.ddc;
> -
> -	drm_scdc_set_high_tmds_clock_ratio(ddc, true);
> -	drm_scdc_set_scrambling(ddc, true);
> +	drm_scdc_set_high_tmds_clock_ratio(&sor->output.connector, true);
> +	drm_scdc_set_scrambling(&sor->output.connector, true);
>  
>  	tegra_sor_hdmi_enable_scrambling(sor);
>  }
> @@ -2179,9 +2175,8 @@ static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
>  static void tegra_sor_hdmi_scdc_work(struct work_struct *work)
>  {
>  	struct tegra_sor *sor = container_of(work, struct tegra_sor, scdc.work);
> -	struct i2c_adapter *ddc = sor->output.ddc;
>  
> -	if (!drm_scdc_get_scrambling_status(ddc)) {
> +	if (!drm_scdc_get_scrambling_status(&sor->output.connector)) {
>  		DRM_DEBUG_KMS("SCDC not scrambled\n");
>  		tegra_sor_hdmi_scdc_enable(sor);
>  	}
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 464c3cc8e6fb..06713d8b82b5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -885,7 +885,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
>  static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>  {
>  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -	struct drm_device *drm = vc4_hdmi->connector.dev;
> +	struct drm_connector *connector = &vc4_hdmi->connector;
> +	struct drm_device *drm = connector->dev;
>  	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
>  	unsigned long flags;
>  	int idx;
> @@ -903,8 +904,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> -	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
> -	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
> +	drm_scdc_set_high_tmds_clock_ratio(connector, true);
> +	drm_scdc_set_scrambling(connector, true);
>  
>  	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
>  	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
> @@ -922,7 +923,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>  static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>  {
>  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -	struct drm_device *drm = vc4_hdmi->connector.dev;
> +	struct drm_connector *connector = &vc4_hdmi->connector;
> +	struct drm_device *drm = connector->dev;
>  	unsigned long flags;
>  	int idx;
>  
> @@ -944,8 +946,8 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>  		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
>  	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
>  
> -	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
> -	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
> +	drm_scdc_set_scrambling(connector, false);
> +	drm_scdc_set_high_tmds_clock_ratio(connector, false);
>  
>  	drm_dev_exit(idx);
>  }
> @@ -955,12 +957,13 @@ static void vc4_hdmi_scrambling_wq(struct work_struct *work)
>  	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
>  						 struct vc4_hdmi,
>  						 scrambling_work);
> +	struct drm_connector *connector = &vc4_hdmi->connector;
>  
> -	if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
> +	if (drm_scdc_get_scrambling_status(connector))
>  		return;
>  
> -	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
> -	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
> +	drm_scdc_set_high_tmds_clock_ratio(connector, true);
> +	drm_scdc_set_scrambling(connector, true);
>  
>  	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
>  			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
> diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
> index ded01fd948b4..34600476a1b9 100644
> --- a/include/drm/display/drm_scdc_helper.h
> +++ b/include/drm/display/drm_scdc_helper.h
> @@ -28,6 +28,7 @@
>  
>  #include <drm/display/drm_scdc.h>
>  
> +struct drm_connector;
>  struct i2c_adapter;
>  
>  ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
> @@ -71,9 +72,9 @@ static inline int drm_scdc_writeb(struct i2c_adapter *adapter, u8 offset,
>  	return drm_scdc_write(adapter, offset, &value, sizeof(value));
>  }
>  
> -bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter);
> +bool drm_scdc_get_scrambling_status(struct drm_connector *connector);
>  
> -bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable);
> -bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set);
> +bool drm_scdc_set_scrambling(struct drm_connector *connector, bool enable);
> +bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector, bool set);
>  
>  #endif

-- 
Regards,

Laurent Pinchart
