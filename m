Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E405A119064
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2019 20:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfLJTOm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Dec 2019 14:14:42 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34021 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfLJTOl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Dec 2019 14:14:41 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so21193416ljc.1;
        Tue, 10 Dec 2019 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LcYgJRK6vlbBQMpbrP+SqK4lY6q3a7Fw5wUZ+G9FXbo=;
        b=d8hhUnjcdimq2SQPfSxVSXGQqsPBwiEbOzHuiR1DZtXlFnmgUvB6d9yaSU+KNgnTlC
         IuA6yrYtRQjzMCkIZFkxSwhnptYhTm5uNAoHb/UAIL61jTB3YRSnOW5chDzabt2msVjY
         L1xBVb7iZUnO3KA43qV9/yoKHXsNMWkkvmKOdYlBmOADyhRXVY2F00ZUj0IFhFszJbNo
         InW9TTWYsn+zDJc2zAn4aQZZENU+AHAPDfUTzNIKF+eD2vSDOFzy+uoal4YIMCATK6Zr
         qC63q7Jzd6rXsCc7zmzD5yi/RZjn9j5YJFmyTm5UfIWI04/qUUg5fgJFWP5kJjRh16C2
         rLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LcYgJRK6vlbBQMpbrP+SqK4lY6q3a7Fw5wUZ+G9FXbo=;
        b=jlD2PJfUs74s5Pwl2AchwqCwDMFCg7e3bCZKdbFL0A6EVoZmOWaFaD+UHMJPzW8wFN
         /g83DIOv7z6JZ+CpB27/eINWymkP3EFDpMgA6tlLAEPZEy+3uS8cIusgtFOzMNZekyuC
         0xvis2qcfj0JFxvrXNKu6CzeGIDqhU/QhIRtt5dvakfOWCFEYgGPoE+ZgTB/73hiR/U8
         H0YMfPW5CAkBq5FM11LQqflQXLUvItKGdEYcFQh4xzh0ptPTVBOpgmfcvoXLHX1S4QZ8
         J8URBgnE9Gi3E7sdOynTEXHAlOXK3U6u6igYXvTD/urMgAcV1jxgUK5QiNlnv2K8wo1O
         6qvw==
X-Gm-Message-State: APjAAAXS/XzCFrWGRkKSPHM2Z2SxPrsxsktpFn2TwXxMX+vm0bBDgpZB
        c6ZqM5vC8B1awHTU9HtfzuXfsRSa
X-Google-Smtp-Source: APXvYqxyfIgRCtl6qrmay6GM4Hya3QOH2pvkEBCILHhtZ6Qq6eglBtkEf4V57KMW7MMT38pOaDSHEA==
X-Received: by 2002:a2e:81a:: with SMTP id 26mr7172118lji.118.1576005276578;
        Tue, 10 Dec 2019 11:14:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m21sm2098655lfh.53.2019.12.10.11.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 11:14:35 -0800 (PST)
Subject: Re: [PATCH v5 2/4] Revert "drm/tegra: Move drm_dp_link helpers to
 Tegra DRM"
To:     allen <allen.chen@ite.com.tw>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>
References: <1575957299-12977-1-git-send-email-allen.chen@ite.com.tw>
 <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a16e5e64-5f69-e160-571c-492860cbbc45@gmail.com>
Date:   Tue, 10 Dec 2019 22:14:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2019 08:53, allen пишет:
> This reverts commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292.

Commit messsage must explain reason of the changes made in the patch.

> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 128 ++++++
>  drivers/gpu/drm/tegra/Makefile  |   1 -
>  drivers/gpu/drm/tegra/dp.c      | 876 ----------------------------------------
>  drivers/gpu/drm/tegra/dp.h      | 177 --------
>  drivers/gpu/drm/tegra/dpaux.c   |   1 -
>  drivers/gpu/drm/tegra/sor.c     |   1 -
>  include/drm/drm_dp_helper.h     |  16 +
>  7 files changed, 144 insertions(+), 1056 deletions(-)
>  delete mode 100644 drivers/gpu/drm/tegra/dp.c
>  delete mode 100644 drivers/gpu/drm/tegra/dp.h
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 2c7870a..f567141 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -352,6 +352,134 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
>  
>  /**
> + * drm_dp_link_probe() - probe a DisplayPort link for capabilities
> + * @aux: DisplayPort AUX channel
> + * @link: pointer to structure in which to return link capabilities
> + *
> + * The structure filled in by this function can usually be passed directly
> + * into drm_dp_link_power_up() and drm_dp_link_configure() to power up and
> + * configure the link based on the link's capabilities.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
> +{
> +	u8 values[3];
> +	int err;
> +
> +	memset(link, 0, sizeof(*link));
> +
> +	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
> +	if (err < 0)
> +		return err;
> +
> +	link->revision = values[0];
> +	link->rate = drm_dp_bw_code_to_link_rate(values[1]);
> +	link->num_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
> +
> +	if (values[2] & DP_ENHANCED_FRAME_CAP)
> +		link->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_link_probe);
> +
> +/**
> + * drm_dp_link_power_up() - power up a DisplayPort link
> + * @aux: DisplayPort AUX channel
> + * @link: pointer to a structure containing the link configuration
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
> +{
> +	u8 value;
> +	int err;
> +
> +	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
> +	if (link->revision < 0x11)
> +		return 0;
> +
> +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> +	if (err < 0)
> +		return err;
> +
> +	value &= ~DP_SET_POWER_MASK;
> +	value |= DP_SET_POWER_D0;
> +
> +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * According to the DP 1.1 specification, a "Sink Device must exit the
> +	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
> +	 * Control Field" (register 0x600).
> +	 */
> +	usleep_range(1000, 2000);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_link_power_up);
> +
> +/**
> + * drm_dp_link_power_down() - power down a DisplayPort link
> + * @aux: DisplayPort AUX channel
> + * @link: pointer to a structure containing the link configuration
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
> +{
> +	u8 value;
> +	int err;
> +
> +	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
> +	if (link->revision < 0x11)
> +		return 0;
> +
> +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> +	if (err < 0)
> +		return err;
> +
> +	value &= ~DP_SET_POWER_MASK;
> +	value |= DP_SET_POWER_D3;
> +
> +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_link_power_down);
> +
> +/**
> + * drm_dp_link_configure() - configure a DisplayPort link
> + * @aux: DisplayPort AUX channel
> + * @link: pointer to a structure containing the link configuration
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
> +{
> +	u8 values[2];
> +	int err;
> +
> +	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
> +	values[1] = link->num_lanes;
> +
> +	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
> +		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +
> +	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_link_configure);
> +
> +/**
>   * drm_dp_downstream_max_clock() - extract branch device max
>   *                                 pixel rate for legacy VGA
>   *                                 converter or max TMDS clock
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
> index d6cf202..33c463e 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -5,7 +5,6 @@ tegra-drm-y := \
>  	drm.o \
>  	gem.o \
>  	fb.o \
> -	dp.o \
>  	hub.o \
>  	plane.o \
>  	dc.o \
> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
> deleted file mode 100644
> index 70dfb7d..00000000
> --- a/drivers/gpu/drm/tegra/dp.c
> +++ /dev/null
> @@ -1,876 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright (C) 2013-2019 NVIDIA Corporation
> - * Copyright (C) 2015 Rob Clark
> - */
> -
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_dp_helper.h>
> -#include <drm/drm_print.h>
> -
> -#include "dp.h"
> -
> -static const u8 drm_dp_edp_revisions[] = { 0x11, 0x12, 0x13, 0x14 };
> -
> -static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
> -{
> -	caps->enhanced_framing = false;
> -	caps->tps3_supported = false;
> -	caps->fast_training = false;
> -	caps->channel_coding = false;
> -	caps->alternate_scrambler_reset = false;
> -}
> -
> -void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
> -			   const struct drm_dp_link_caps *src)
> -{
> -	dest->enhanced_framing = src->enhanced_framing;
> -	dest->tps3_supported = src->tps3_supported;
> -	dest->fast_training = src->fast_training;
> -	dest->channel_coding = src->channel_coding;
> -	dest->alternate_scrambler_reset = src->alternate_scrambler_reset;
> -}
> -
> -static void drm_dp_link_reset(struct drm_dp_link *link)
> -{
> -	unsigned int i;
> -
> -	if (!link)
> -		return;
> -
> -	link->revision = 0;
> -	link->max_rate = 0;
> -	link->max_lanes = 0;
> -
> -	drm_dp_link_caps_reset(&link->caps);
> -	link->aux_rd_interval.cr = 0;
> -	link->aux_rd_interval.ce = 0;
> -	link->edp = 0;
> -
> -	link->rate = 0;
> -	link->lanes = 0;
> -
> -	for (i = 0; i < DP_MAX_SUPPORTED_RATES; i++)
> -		link->rates[i] = 0;
> -
> -	link->num_rates = 0;
> -}
> -
> -/**
> - * drm_dp_link_add_rate() - add a rate to the list of supported rates
> - * @link: the link to add the rate to
> - * @rate: the rate to add
> - *
> - * Add a link rate to the list of supported link rates.
> - *
> - * Returns:
> - * 0 on success or one of the following negative error codes on failure:
> - * - ENOSPC if the maximum number of supported rates has been reached
> - * - EEXISTS if the link already supports this rate
> - *
> - * See also:
> - * drm_dp_link_remove_rate()
> - */
> -int drm_dp_link_add_rate(struct drm_dp_link *link, unsigned long rate)
> -{
> -	unsigned int i, pivot;
> -
> -	if (link->num_rates == DP_MAX_SUPPORTED_RATES)
> -		return -ENOSPC;
> -
> -	for (pivot = 0; pivot < link->num_rates; pivot++)
> -		if (rate <= link->rates[pivot])
> -			break;
> -
> -	if (pivot != link->num_rates && rate == link->rates[pivot])
> -		return -EEXIST;
> -
> -	for (i = link->num_rates; i > pivot; i--)
> -		link->rates[i] = link->rates[i - 1];
> -
> -	link->rates[pivot] = rate;
> -	link->num_rates++;
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_remove_rate() - remove a rate from the list of supported rates
> - * @link: the link from which to remove the rate
> - * @rate: the rate to remove
> - *
> - * Removes a link rate from the list of supported link rates.
> - *
> - * Returns:
> - * 0 on success or one of the following negative error codes on failure:
> - * - EINVAL if the specified rate is not among the supported rates
> - *
> - * See also:
> - * drm_dp_link_add_rate()
> - */
> -int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < link->num_rates; i++)
> -		if (rate == link->rates[i])
> -			break;
> -
> -	if (i == link->num_rates)
> -		return -EINVAL;
> -
> -	link->num_rates--;
> -
> -	while (i < link->num_rates) {
> -		link->rates[i] = link->rates[i + 1];
> -		i++;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_update_rates() - normalize the supported link rates array
> - * @link: the link for which to normalize the supported link rates
> - *
> - * Users should call this function after they've manually modified the array
> - * of supported link rates. This function removes any stale entries, compacts
> - * the array and updates the supported link rate count. Note that calling the
> - * drm_dp_link_remove_rate() function already does this janitorial work.
> - *
> - * See also:
> - * drm_dp_link_add_rate(), drm_dp_link_remove_rate()
> - */
> -void drm_dp_link_update_rates(struct drm_dp_link *link)
> -{
> -	unsigned int i, count = 0;
> -
> -	for (i = 0; i < link->num_rates; i++) {
> -		if (link->rates[i] != 0)
> -			link->rates[count++] = link->rates[i];
> -	}
> -
> -	for (i = count; i < link->num_rates; i++)
> -		link->rates[i] = 0;
> -
> -	link->num_rates = count;
> -}
> -
> -/**
> - * drm_dp_link_probe() - probe a DisplayPort link for capabilities
> - * @aux: DisplayPort AUX channel
> - * @link: pointer to structure in which to return link capabilities
> - *
> - * The structure filled in by this function can usually be passed directly
> - * into drm_dp_link_power_up() and drm_dp_link_configure() to power up and
> - * configure the link based on the link's capabilities.
> - *
> - * Returns 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
> -{
> -	u8 dpcd[DP_RECEIVER_CAP_SIZE], value;
> -	unsigned int rd_interval;
> -	int err;
> -
> -	drm_dp_link_reset(link);
> -
> -	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, sizeof(dpcd));
> -	if (err < 0)
> -		return err;
> -
> -	link->revision = dpcd[DP_DPCD_REV];
> -	link->max_rate = drm_dp_max_link_rate(dpcd);
> -	link->max_lanes = drm_dp_max_lane_count(dpcd);
> -
> -	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(dpcd);
> -	link->caps.tps3_supported = drm_dp_tps3_supported(dpcd);
> -	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
> -	link->caps.channel_coding = drm_dp_channel_coding_supported(dpcd);
> -
> -	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
> -		link->caps.alternate_scrambler_reset = true;
> -
> -		err = drm_dp_dpcd_readb(aux, DP_EDP_DPCD_REV, &value);
> -		if (err < 0)
> -			return err;
> -
> -		if (value >= ARRAY_SIZE(drm_dp_edp_revisions))
> -			DRM_ERROR("unsupported eDP version: %02x\n", value);
> -		else
> -			link->edp = drm_dp_edp_revisions[value];
> -	}
> -
> -	/*
> -	 * The DPCD stores the AUX read interval in units of 4 ms. There are
> -	 * two special cases:
> -	 *
> -	 *   1) if the TRAINING_AUX_RD_INTERVAL field is 0, the clock recovery
> -	 *      and channel equalization should use 100 us or 400 us AUX read
> -	 *      intervals, respectively
> -	 *
> -	 *   2) for DP v1.4 and above, clock recovery should always use 100 us
> -	 *      AUX read intervals
> -	 */
> -	rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> -			   DP_TRAINING_AUX_RD_MASK;
> -
> -	if (rd_interval > 4) {
> -		DRM_DEBUG_KMS("AUX interval %u out of range (max. 4)\n",
> -			      rd_interval);
> -		rd_interval = 4;
> -	}
> -
> -	rd_interval *= 4 * USEC_PER_MSEC;
> -
> -	if (rd_interval == 0 || link->revision >= DP_DPCD_REV_14)
> -		link->aux_rd_interval.cr = 100;
> -
> -	if (rd_interval == 0)
> -		link->aux_rd_interval.ce = 400;
> -
> -	link->rate = link->max_rate;
> -	link->lanes = link->max_lanes;
> -
> -	/* Parse SUPPORTED_LINK_RATES from eDP 1.4 */
> -	if (link->edp >= 0x14) {
> -		u8 supported_rates[DP_MAX_SUPPORTED_RATES * 2];
> -		unsigned int i;
> -		u16 rate;
> -
> -		err = drm_dp_dpcd_read(aux, DP_SUPPORTED_LINK_RATES,
> -				       supported_rates,
> -				       sizeof(supported_rates));
> -		if (err < 0)
> -			return err;
> -
> -		for (i = 0; i < DP_MAX_SUPPORTED_RATES; i++) {
> -			rate = supported_rates[i * 2 + 1] << 8 |
> -			       supported_rates[i * 2 + 0];
> -
> -			drm_dp_link_add_rate(link, rate * 200);
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_power_up() - power up a DisplayPort link
> - * @aux: DisplayPort AUX channel
> - * @link: pointer to a structure containing the link configuration
> - *
> - * Returns 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
> -{
> -	u8 value;
> -	int err;
> -
> -	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
> -	if (link->revision < 0x11)
> -		return 0;
> -
> -	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> -	if (err < 0)
> -		return err;
> -
> -	value &= ~DP_SET_POWER_MASK;
> -	value |= DP_SET_POWER_D0;
> -
> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -	if (err < 0)
> -		return err;
> -
> -	/*
> -	 * According to the DP 1.1 specification, a "Sink Device must exit the
> -	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
> -	 * Control Field" (register 0x600).
> -	 */
> -	usleep_range(1000, 2000);
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_power_down() - power down a DisplayPort link
> - * @aux: DisplayPort AUX channel
> - * @link: pointer to a structure containing the link configuration
> - *
> - * Returns 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
> -{
> -	u8 value;
> -	int err;
> -
> -	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
> -	if (link->revision < 0x11)
> -		return 0;
> -
> -	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> -	if (err < 0)
> -		return err;
> -
> -	value &= ~DP_SET_POWER_MASK;
> -	value |= DP_SET_POWER_D3;
> -
> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -	if (err < 0)
> -		return err;
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_configure() - configure a DisplayPort link
> - * @aux: DisplayPort AUX channel
> - * @link: pointer to a structure containing the link configuration
> - *
> - * Returns 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
> -{
> -	u8 values[2], value;
> -	int err;
> -
> -	if (link->ops && link->ops->configure) {
> -		err = link->ops->configure(link);
> -		if (err < 0) {
> -			DRM_ERROR("failed to configure DP link: %d\n", err);
> -			return err;
> -		}
> -	}
> -
> -	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
> -	values[1] = link->lanes;
> -
> -	if (link->caps.enhanced_framing)
> -		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> -
> -	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
> -	if (err < 0)
> -		return err;
> -
> -	if (link->caps.channel_coding)
> -		value = DP_SET_ANSI_8B10B;
> -	else
> -		value = 0;
> -
> -	err = drm_dp_dpcd_writeb(aux, DP_MAIN_LINK_CHANNEL_CODING_SET, value);
> -	if (err < 0)
> -		return err;
> -
> -	if (link->caps.alternate_scrambler_reset) {
> -		err = drm_dp_dpcd_writeb(aux, DP_EDP_CONFIGURATION_SET,
> -					 DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_dp_link_choose() - choose the lowest possible configuration for a mode
> - * @link: DRM DP link object
> - * @mode: DRM display mode
> - * @info: DRM display information
> - *
> - * According to the eDP specification, a source should select a configuration
> - * with the lowest number of lanes and the lowest possible link rate that can
> - * match the bitrate requirements of a video mode. However it must ensure not
> - * to exceed the capabilities of the sink.
> - *
> - * Returns: 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_choose(struct drm_dp_link *link,
> -		       const struct drm_display_mode *mode,
> -		       const struct drm_display_info *info)
> -{
> -	/* available link symbol clock rates */
> -	static const unsigned int rates[3] = { 162000, 270000, 540000 };
> -	/* available number of lanes */
> -	static const unsigned int lanes[3] = { 1, 2, 4 };
> -	unsigned long requirement, capacity;
> -	unsigned int rate = link->max_rate;
> -	unsigned int i, j;
> -
> -	/* bandwidth requirement */
> -	requirement = mode->clock * info->bpc * 3;
> -
> -	for (i = 0; i < ARRAY_SIZE(lanes) && lanes[i] <= link->max_lanes; i++) {
> -		for (j = 0; j < ARRAY_SIZE(rates) && rates[j] <= rate; j++) {
> -			/*
> -			 * Capacity for this combination of lanes and rate,
> -			 * factoring in the ANSI 8B/10B encoding.
> -			 *
> -			 * Link rates in the DRM DP helpers are really link
> -			 * symbol frequencies, so a tenth of the actual rate
> -			 * of the link.
> -			 */
> -			capacity = lanes[i] * (rates[j] * 10) * 8 / 10;
> -
> -			if (capacity >= requirement) {
> -				DRM_DEBUG_KMS("using %u lanes at %u kHz (%lu/%lu kbps)\n",
> -					      lanes[i], rates[j], requirement,
> -					      capacity);
> -				link->lanes = lanes[i];
> -				link->rate = rates[j];
> -				return 0;
> -			}
> -		}
> -	}
> -
> -	return -ERANGE;
> -}
> -
> -/**
> - * DOC: Link training
> - *
> - * These functions contain common logic and helpers to implement DisplayPort
> - * link training.
> - */
> -
> -/**
> - * drm_dp_link_train_init() - initialize DisplayPort link training state
> - * @train: DisplayPort link training state
> - */
> -void drm_dp_link_train_init(struct drm_dp_link_train *train)
> -{
> -	struct drm_dp_link_train_set *request = &train->request;
> -	struct drm_dp_link_train_set *adjust = &train->adjust;
> -	unsigned int i;
> -
> -	for (i = 0; i < 4; i++) {
> -		request->voltage_swing[i] = 0;
> -		adjust->voltage_swing[i] = 0;
> -
> -		request->pre_emphasis[i] = 0;
> -		adjust->pre_emphasis[i] = 0;
> -
> -		request->post_cursor[i] = 0;
> -		adjust->post_cursor[i] = 0;
> -	}
> -
> -	train->pattern = DP_TRAINING_PATTERN_DISABLE;
> -	train->clock_recovered = false;
> -	train->channel_equalized = false;
> -}
> -
> -static bool drm_dp_link_train_valid(const struct drm_dp_link_train *train)
> -{
> -	return train->clock_recovered && train->channel_equalized;
> -}
> -
> -static int drm_dp_link_apply_training(struct drm_dp_link *link)
> -{
> -	struct drm_dp_link_train_set *request = &link->train.request;
> -	unsigned int lanes = link->lanes, *vs, *pe, *pc, i;
> -	struct drm_dp_aux *aux = link->aux;
> -	u8 values[4], pattern = 0;
> -	int err;
> -
> -	err = link->ops->apply_training(link);
> -	if (err < 0) {
> -		DRM_ERROR("failed to apply link training: %d\n", err);
> -		return err;
> -	}
> -
> -	vs = request->voltage_swing;
> -	pe = request->pre_emphasis;
> -	pc = request->post_cursor;
> -
> -	/* write currently selected voltage-swing and pre-emphasis levels */
> -	for (i = 0; i < lanes; i++)
> -		values[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL(vs[i]) |
> -			    DP_TRAIN_PRE_EMPHASIS_LEVEL(pe[i]);
> -
> -	err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, values, lanes);
> -	if (err < 0) {
> -		DRM_ERROR("failed to set training parameters: %d\n", err);
> -		return err;
> -	}
> -
> -	/* write currently selected post-cursor level (if supported) */
> -	if (link->revision >= 0x12 && link->rate == 540000) {
> -		values[0] = values[1] = 0;
> -
> -		for (i = 0; i < lanes; i++)
> -			values[i / 2] |= DP_LANE_POST_CURSOR(i, pc[i]);
> -
> -		err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_1_SET2, values,
> -					DIV_ROUND_UP(lanes, 2));
> -		if (err < 0) {
> -			DRM_ERROR("failed to set post-cursor: %d\n", err);
> -			return err;
> -		}
> -	}
> -
> -	/* write link pattern */
> -	if (link->train.pattern != DP_TRAINING_PATTERN_DISABLE)
> -		pattern |= DP_LINK_SCRAMBLING_DISABLE;
> -
> -	pattern |= link->train.pattern;
> -
> -	err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET, pattern);
> -	if (err < 0) {
> -		DRM_ERROR("failed to set training pattern: %d\n", err);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
> -static void drm_dp_link_train_wait(struct drm_dp_link *link)
> -{
> -	unsigned long min = 0;
> -
> -	switch (link->train.pattern) {
> -	case DP_TRAINING_PATTERN_1:
> -		min = link->aux_rd_interval.cr;
> -		break;
> -
> -	case DP_TRAINING_PATTERN_2:
> -	case DP_TRAINING_PATTERN_3:
> -		min = link->aux_rd_interval.ce;
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	if (min > 0)
> -		usleep_range(min, 2 * min);
> -}
> -
> -static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
> -					u8 status[DP_LINK_STATUS_SIZE])
> -{
> -	struct drm_dp_link_train_set *adjust = &link->train.adjust;
> -	unsigned int i;
> -
> -	for (i = 0; i < link->lanes; i++) {
> -		adjust->voltage_swing[i] =
> -			drm_dp_get_adjust_request_voltage(status, i) >>
> -				DP_TRAIN_VOLTAGE_SWING_SHIFT;
> -
> -		adjust->pre_emphasis[i] =
> -			drm_dp_get_adjust_request_pre_emphasis(status, i) >>
> -				DP_TRAIN_PRE_EMPHASIS_SHIFT;
> -
> -		adjust->post_cursor[i] =
> -			drm_dp_get_adjust_request_post_cursor(status, i);
> -	}
> -}
> -
> -static void drm_dp_link_train_adjust(struct drm_dp_link_train *train)
> -{
> -	struct drm_dp_link_train_set *request = &train->request;
> -	struct drm_dp_link_train_set *adjust = &train->adjust;
> -	unsigned int i;
> -
> -	for (i = 0; i < 4; i++)
> -		if (request->voltage_swing[i] != adjust->voltage_swing[i])
> -			request->voltage_swing[i] = adjust->voltage_swing[i];
> -
> -	for (i = 0; i < 4; i++)
> -		if (request->pre_emphasis[i] != adjust->pre_emphasis[i])
> -			request->pre_emphasis[i] = adjust->pre_emphasis[i];
> -
> -	for (i = 0; i < 4; i++)
> -		if (request->post_cursor[i] != adjust->post_cursor[i])
> -			request->post_cursor[i] = adjust->post_cursor[i];
> -}
> -
> -static int drm_dp_link_recover_clock(struct drm_dp_link *link)
> -{
> -	u8 status[DP_LINK_STATUS_SIZE];
> -	int err;
> -
> -	err = drm_dp_link_apply_training(link);
> -	if (err < 0)
> -		return err;
> -
> -	drm_dp_link_train_wait(link);
> -
> -	err = drm_dp_dpcd_read_link_status(link->aux, status);
> -	if (err < 0) {
> -		DRM_ERROR("failed to read link status: %d\n", err);
> -		return err;
> -	}
> -
> -	if (!drm_dp_clock_recovery_ok(status, link->lanes))
> -		drm_dp_link_get_adjustments(link, status);
> -	else
> -		link->train.clock_recovered = true;
> -
> -	return 0;
> -}
> -
> -static int drm_dp_link_clock_recovery(struct drm_dp_link *link)
> -{
> -	unsigned int repeat;
> -	int err;
> -
> -	/* start clock recovery using training pattern 1 */
> -	link->train.pattern = DP_TRAINING_PATTERN_1;
> -
> -	for (repeat = 1; repeat < 5; repeat++) {
> -		err = drm_dp_link_recover_clock(link);
> -		if (err < 0) {
> -			DRM_ERROR("failed to recover clock: %d\n", err);
> -			return err;
> -		}
> -
> -		if (link->train.clock_recovered)
> -			break;
> -
> -		drm_dp_link_train_adjust(&link->train);
> -	}
> -
> -	return 0;
> -}
> -
> -static int drm_dp_link_equalize_channel(struct drm_dp_link *link)
> -{
> -	struct drm_dp_aux *aux = link->aux;
> -	u8 status[DP_LINK_STATUS_SIZE];
> -	int err;
> -
> -	err = drm_dp_link_apply_training(link);
> -	if (err < 0)
> -		return err;
> -
> -	drm_dp_link_train_wait(link);
> -
> -	err = drm_dp_dpcd_read_link_status(aux, status);
> -	if (err < 0) {
> -		DRM_ERROR("failed to read link status: %d\n", err);
> -		return err;
> -	}
> -
> -	if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
> -		DRM_ERROR("clock recovery lost while equalizing channel\n");
> -		link->train.clock_recovered = false;
> -		return 0;
> -	}
> -
> -	if (!drm_dp_channel_eq_ok(status, link->lanes))
> -		drm_dp_link_get_adjustments(link, status);
> -	else
> -		link->train.channel_equalized = true;
> -
> -	return 0;
> -}
> -
> -static int drm_dp_link_channel_equalization(struct drm_dp_link *link)
> -{
> -	unsigned int repeat;
> -	int err;
> -
> -	/* start channel equalization using pattern 2 or 3 */
> -	if (link->caps.tps3_supported)
> -		link->train.pattern = DP_TRAINING_PATTERN_3;
> -	else
> -		link->train.pattern = DP_TRAINING_PATTERN_2;
> -
> -	for (repeat = 1; repeat < 5; repeat++) {
> -		err = drm_dp_link_equalize_channel(link);
> -		if (err < 0) {
> -			DRM_ERROR("failed to equalize channel: %d\n", err);
> -			return err;
> -		}
> -
> -		if (link->train.channel_equalized)
> -			break;
> -
> -		drm_dp_link_train_adjust(&link->train);
> -	}
> -
> -	return 0;
> -}
> -
> -static int drm_dp_link_downgrade(struct drm_dp_link *link)
> -{
> -	switch (link->rate) {
> -	case 162000:
> -		return -EINVAL;
> -
> -	case 270000:
> -		link->rate = 162000;
> -		break;
> -
> -	case 540000:
> -		link->rate = 270000;
> -		return 0;
> -	}
> -
> -	return 0;
> -}
> -
> -static void drm_dp_link_train_disable(struct drm_dp_link *link)
> -{
> -	int err;
> -
> -	link->train.pattern = DP_TRAINING_PATTERN_DISABLE;
> -
> -	err = drm_dp_link_apply_training(link);
> -	if (err < 0)
> -		DRM_ERROR("failed to disable link training: %d\n", err);
> -}
> -
> -static int drm_dp_link_train_full(struct drm_dp_link *link)
> -{
> -	int err;
> -
> -retry:
> -	DRM_DEBUG_KMS("full-training link: %u lane%s at %u MHz\n",
> -		      link->lanes, (link->lanes > 1) ? "s" : "",
> -		      link->rate / 100);
> -
> -	err = drm_dp_link_configure(link->aux, link);
> -	if (err < 0) {
> -		DRM_ERROR("failed to configure DP link: %d\n", err);
> -		return err;
> -	}
> -
> -	err = drm_dp_link_clock_recovery(link);
> -	if (err < 0) {
> -		DRM_ERROR("clock recovery failed: %d\n", err);
> -		goto out;
> -	}
> -
> -	if (!link->train.clock_recovered) {
> -		DRM_ERROR("clock recovery failed, downgrading link\n");
> -
> -		err = drm_dp_link_downgrade(link);
> -		if (err < 0)
> -			goto out;
> -
> -		goto retry;
> -	}
> -
> -	DRM_DEBUG_KMS("clock recovery succeeded\n");
> -
> -	err = drm_dp_link_channel_equalization(link);
> -	if (err < 0) {
> -		DRM_ERROR("channel equalization failed: %d\n", err);
> -		goto out;
> -	}
> -
> -	if (!link->train.channel_equalized) {
> -		DRM_ERROR("channel equalization failed, downgrading link\n");
> -
> -		err = drm_dp_link_downgrade(link);
> -		if (err < 0)
> -			goto out;
> -
> -		goto retry;
> -	}
> -
> -	DRM_DEBUG_KMS("channel equalization succeeded\n");
> -
> -out:
> -	drm_dp_link_train_disable(link);
> -	return err;
> -}
> -
> -static int drm_dp_link_train_fast(struct drm_dp_link *link)
> -{
> -	u8 status[DP_LINK_STATUS_SIZE];
> -	int err;
> -
> -	DRM_DEBUG_KMS("fast-training link: %u lane%s at %u MHz\n",
> -		      link->lanes, (link->lanes > 1) ? "s" : "",
> -		      link->rate / 100);
> -
> -	err = drm_dp_link_configure(link->aux, link);
> -	if (err < 0) {
> -		DRM_ERROR("failed to configure DP link: %d\n", err);
> -		return err;
> -	}
> -
> -	/* transmit training pattern 1 for 500 microseconds */
> -	link->train.pattern = DP_TRAINING_PATTERN_1;
> -
> -	err = drm_dp_link_apply_training(link);
> -	if (err < 0)
> -		goto out;
> -
> -	usleep_range(500, 1000);
> -
> -	/* transmit training pattern 2 or 3 for 500 microseconds */
> -	if (link->caps.tps3_supported)
> -		link->train.pattern = DP_TRAINING_PATTERN_3;
> -	else
> -		link->train.pattern = DP_TRAINING_PATTERN_2;
> -
> -	err = drm_dp_link_apply_training(link);
> -	if (err < 0)
> -		goto out;
> -
> -	usleep_range(500, 1000);
> -
> -	err = drm_dp_dpcd_read_link_status(link->aux, status);
> -	if (err < 0) {
> -		DRM_ERROR("failed to read link status: %d\n", err);
> -		goto out;
> -	}
> -
> -	if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
> -		DRM_ERROR("clock recovery failed\n");
> -		err = -EIO;
> -	}
> -
> -	if (!drm_dp_channel_eq_ok(status, link->lanes)) {
> -		DRM_ERROR("channel equalization failed\n");
> -		err = -EIO;
> -	}
> -
> -out:
> -	drm_dp_link_train_disable(link);
> -	return err;
> -}
> -
> -/**
> - * drm_dp_link_train() - perform DisplayPort link training
> - * @link: a DP link object
> - *
> - * Uses the context stored in the DP link object to perform link training. It
> - * is expected that drivers will call drm_dp_link_probe() to obtain the link
> - * capabilities before performing link training.
> - *
> - * If the sink supports fast link training (no AUX CH handshake) and valid
> - * training settings are available, this function will try to perform fast
> - * link training and fall back to full link training on failure.
> - *
> - * Returns: 0 on success or a negative error code on failure.
> - */
> -int drm_dp_link_train(struct drm_dp_link *link)
> -{
> -	int err;
> -
> -	drm_dp_link_train_init(&link->train);
> -
> -	if (link->caps.fast_training) {
> -		if (drm_dp_link_train_valid(&link->train)) {
> -			err = drm_dp_link_train_fast(link);
> -			if (err < 0)
> -				DRM_ERROR("fast link training failed: %d\n",
> -					  err);
> -			else
> -				return 0;
> -		} else {
> -			DRM_DEBUG_KMS("training parameters not available\n");
> -		}
> -	} else {
> -		DRM_DEBUG_KMS("fast link training not supported\n");
> -	}
> -
> -	err = drm_dp_link_train_full(link);
> -	if (err < 0)
> -		DRM_ERROR("full link training failed: %d\n", err);
> -
> -	return err;
> -}
> diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
> deleted file mode 100644
> index cb12ed0..00000000
> --- a/drivers/gpu/drm/tegra/dp.h
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright (C) 2013-2019 NVIDIA Corporation.
> - * Copyright (C) 2015 Rob Clark
> - */
> -
> -#ifndef DRM_TEGRA_DP_H
> -#define DRM_TEGRA_DP_H 1
> -
> -#include <linux/types.h>
> -
> -struct drm_display_info;
> -struct drm_display_mode;
> -struct drm_dp_aux;
> -struct drm_dp_link;
> -
> -/**
> - * struct drm_dp_link_caps - DP link capabilities
> - */
> -struct drm_dp_link_caps {
> -	/**
> -	 * @enhanced_framing:
> -	 *
> -	 * enhanced framing capability (mandatory as of DP 1.2)
> -	 */
> -	bool enhanced_framing;
> -
> -	/**
> -	 * tps3_supported:
> -	 *
> -	 * training pattern sequence 3 supported for equalization
> -	 */
> -	bool tps3_supported;
> -
> -	/**
> -	 * @fast_training:
> -	 *
> -	 * AUX CH handshake not required for link training
> -	 */
> -	bool fast_training;
> -
> -	/**
> -	 * @channel_coding:
> -	 *
> -	 * ANSI 8B/10B channel coding capability
> -	 */
> -	bool channel_coding;
> -
> -	/**
> -	 * @alternate_scrambler_reset:
> -	 *
> -	 * eDP alternate scrambler reset capability
> -	 */
> -	bool alternate_scrambler_reset;
> -};
> -
> -void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
> -			   const struct drm_dp_link_caps *src);
> -
> -/**
> - * struct drm_dp_link_ops - DP link operations
> - */
> -struct drm_dp_link_ops {
> -	/**
> -	 * @apply_training:
> -	 */
> -	int (*apply_training)(struct drm_dp_link *link);
> -
> -	/**
> -	 * @configure:
> -	 */
> -	int (*configure)(struct drm_dp_link *link);
> -};
> -
> -#define DP_TRAIN_VOLTAGE_SWING_LEVEL(x) ((x) << 0)
> -#define DP_TRAIN_PRE_EMPHASIS_LEVEL(x) ((x) << 3)
> -#define DP_LANE_POST_CURSOR(i, x) (((x) & 0x3) << (((i) & 1) << 2))
> -
> -/**
> - * struct drm_dp_link_train_set - link training settings
> - * @voltage_swing: per-lane voltage swing
> - * @pre_emphasis: per-lane pre-emphasis
> - * @post_cursor: per-lane post-cursor
> - */
> -struct drm_dp_link_train_set {
> -	unsigned int voltage_swing[4];
> -	unsigned int pre_emphasis[4];
> -	unsigned int post_cursor[4];
> -};
> -
> -/**
> - * struct drm_dp_link_train - link training state information
> - * @request: currently requested settings
> - * @adjust: adjustments requested by sink
> - * @pattern: currently requested training pattern
> - * @clock_recovered: flag to track if clock recovery has completed
> - * @channel_equalized: flag to track if channel equalization has completed
> - */
> -struct drm_dp_link_train {
> -	struct drm_dp_link_train_set request;
> -	struct drm_dp_link_train_set adjust;
> -
> -	unsigned int pattern;
> -
> -	bool clock_recovered;
> -	bool channel_equalized;
> -};
> -
> -/**
> - * struct drm_dp_link - DP link capabilities and configuration
> - * @revision: DP specification revision supported on the link
> - * @max_rate: maximum clock rate supported on the link
> - * @max_lanes: maximum number of lanes supported on the link
> - * @caps: capabilities supported on the link (see &drm_dp_link_caps)
> - * @aux_rd_interval: AUX read interval to use for training (in microseconds)
> - * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
> - * @rate: currently configured link rate
> - * @lanes: currently configured number of lanes
> - * @rates: additional supported link rates in kHz (eDP 1.4)
> - * @num_rates: number of additional supported link rates (eDP 1.4)
> - */
> -struct drm_dp_link {
> -	unsigned char revision;
> -	unsigned int max_rate;
> -	unsigned int max_lanes;
> -
> -	struct drm_dp_link_caps caps;
> -
> -	/**
> -	 * @cr: clock recovery read interval
> -	 * @ce: channel equalization read interval
> -	 */
> -	struct {
> -		unsigned int cr;
> -		unsigned int ce;
> -	} aux_rd_interval;
> -
> -	unsigned char edp;
> -
> -	unsigned int rate;
> -	unsigned int lanes;
> -
> -	unsigned long rates[DP_MAX_SUPPORTED_RATES];
> -	unsigned int num_rates;
> -
> -	/**
> -	 * @ops: DP link operations
> -	 */
> -	const struct drm_dp_link_ops *ops;
> -
> -	/**
> -	 * @aux: DP AUX channel
> -	 */
> -	struct drm_dp_aux *aux;
> -
> -	/**
> -	 * @train: DP link training state
> -	 */
> -	struct drm_dp_link_train train;
> -};
> -
> -int drm_dp_link_add_rate(struct drm_dp_link *link, unsigned long rate);
> -int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate);
> -void drm_dp_link_update_rates(struct drm_dp_link *link);
> -
> -int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
> -int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
> -int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
> -int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
> -int drm_dp_link_choose(struct drm_dp_link *link,
> -		       const struct drm_display_mode *mode,
> -		       const struct drm_display_info *info);
> -
> -void drm_dp_link_train_init(struct drm_dp_link_train *train);
> -int drm_dp_link_train(struct drm_dp_link *link);
> -
> -#endif
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 622cdf1..066177a 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -23,7 +23,6 @@
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>  
> -#include "dp.h"
>  #include "dpaux.h"
>  #include "drm.h"
>  #include "trace.h"
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 615cb31..29c3ae8 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -25,7 +25,6 @@
>  #include <drm/drm_scdc_helper.h>
>  
>  #include "dc.h"
> -#include "dp.h"
>  #include "drm.h"
>  #include "hda.h"
>  #include "sor.h"
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 51ecb51..04f6c0b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1455,6 +1455,22 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
>  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  				 u8 status[DP_LINK_STATUS_SIZE]);
>  
> +/*
> + * DisplayPort link
> + */
> +#define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
> +
> +struct drm_dp_link {
> +	unsigned char revision;
> +	unsigned int rate;
> +	unsigned int num_lanes;
> +	unsigned long capabilities;
> +};
> +
> +int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
> +int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
> +int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
> +int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4]);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> 

