Return-Path: <linux-tegra+bounces-7738-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB42AF9036
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Jul 2025 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76981CA5EAE
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Jul 2025 10:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B22F548E;
	Fri,  4 Jul 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="D5eSV8tD"
X-Original-To: linux-tegra@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FC2F533A;
	Fri,  4 Jul 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624763; cv=none; b=jtg1fy/qFRYlPbY28B3DgET+MRgb5u6fIxuiTJv3MRik4C7ekX3Dp9wYedQttPsj6OccYy71hBrEKj+kw5BXHHk4NMpPPStGHzuMjWMybJ3CKIk5VMSK/XmI2IXUhXdpA+6FY1EBj7Fa4fjqzjE727nJ2fDUJzo4rZK13b/bcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624763; c=relaxed/simple;
	bh=s1yOooabGEhfLrwLG8Gkq0tF2jy2NbMTKO3iM7iaLlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzxFVtUO7RN5koZsEeDfTT4wQmyQgmJw9y3j3PmwW/p9rolTmNnz/Ns1BbNsmHVKKu+qbDNUJRFzVzJrvinR1DCEMu58Vh9OkA0Kve78UUE2ciIpY+wkGp2P0No4eENBcxAVawdwEPdcLMN14QO+LERJhvfq6DnEIiwfdePPxec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=D5eSV8tD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eDkIk/2D8dgafpo6mhXDy8h1DOSaJXXyI6mZYy1xav0=; b=D5eSV8tD66CAy1FlAKXzsOthF3
	ySHf+dVSbKnEPwoznpwq/Bv9ZWzDp1jgP/hTDaI3bXxzNC5hN2zW8M4+wvHLn9Z2kw4r30723LdMe
	F3sjvG86+xaMKncJ2m0gB2DdQwhlBoB4X/AIKi1e5utpP/6iFrdLLbF0a+5KT3/nw/r2YiOH5PGHi
	/OuCGlBh1RIuiHRrOoHAXn1tWdlTq40GOg4B724Eqr+gokQozt7SdUZZtYtMYGJrsksRitMD0y7rH
	30D0Yk2itjP24Pl19KU7IwgknhukKoYB5HrbQZTqbK1iZKWMmvH+WTEcH5hh2Jc7yRhkWSYEceoiQ
	v1TELLxw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uXdbN-00CNw6-Gr; Fri, 04 Jul 2025 12:25:05 +0200
Message-ID: <68b4d53f-a185-4e11-af1e-532fc45cb8b2@igalia.com>
Date: Fri, 4 Jul 2025 07:24:46 -0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Damon Ding <damon.ding@rock-chips.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, lima@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

On 04/07/25 04:54, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index bb09df5000bd..11ec7e913974 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -153,7 +153,6 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
>   
>   	mutex_lock(&vc4->power_lock);
>   	if (--vc4->power_refcount == 0) {
> -		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
>   		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
>   	}

Nit: please, drop the curly braces.

>   	mutex_unlock(&vc4->power_lock);

For vc4,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

