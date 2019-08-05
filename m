Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3D781C04
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbfHENTc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 09:19:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36520 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbfHENTb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 09:19:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so68876851wme.1;
        Mon, 05 Aug 2019 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wZEl8RSr4zALt6HddkMAzZ6K0ziDRyO7RsNxOehkOiE=;
        b=V8q6yIyItLRstyanR2xSd1hs5HNdY6xTpt01gxfk74f35YvVIYsURM8Sf4v0pRqCS0
         FtjGfKUlwJhtZrhIcLxxL8lQA5s2eG85dXDzb+lShA+GBozmrSw6NCpqBCyNaO4LTA/t
         MWleThgwXCDjqV1w8rYSqMlVpIm4jLzZAOSCD3H+EDt3mUaez+JXfQp734Y9F2sAvKwe
         lZzebNEk3ENrf33vty7LYwLhwu2pJhCVHwfhBdYd7btGPRVNVTbchr4M26Mir3MndSpr
         fqVAkor4XbugBI8g9vzZBe1KCojrYtJu2nKbLrP4A/vcqvUir0yzbfiwv+x8CwAvm8k8
         17YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wZEl8RSr4zALt6HddkMAzZ6K0ziDRyO7RsNxOehkOiE=;
        b=p2Cjf8tnYgMVwTD/JcaCoD5+rgW8NtzDDE4UBQv+w4Xz5JAvTYfGOjtnLZTX0b6vFI
         9YoPkxCiCcMrmg7fpQ4cttr+WIZqnx9SbAIMB3+GILv5sq8HGqe+vmTyDXVINSnvxSoY
         f+O0xgvLV4P4sHhcjUlvBBypuR+yUoLvi+MXvtSxdd+taA+D/OjXrViIYEQ1hSLS4rpK
         Kbb4avFGBbjel0wb7RvcIEm9dctADAIM1E3kSXaSVVXFmAG3u40y/ejLivvdPxq201bc
         lCALRelGEd8m3ODgkt2iZvSORsGz1QyC7aGRcMnZAku59KATPlOIQhmMHBmApulGq0th
         nY2w==
X-Gm-Message-State: APjAAAUDjuPU9WoLwunJLsc/t52QdjLbYr8Ee7BvEK+gp0+Jjx1yZps1
        eNu4iRACayB5bmwc+MmdPxw=
X-Google-Smtp-Source: APXvYqz0P/wJNV1ZR/CdjYZA1JlXDnZhL8I26T1UonnCxIy55h0flNA3Au+YawBd5h4PH/RoOAm9rg==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr18774070wmf.166.1565011169278;
        Mon, 05 Aug 2019 06:19:29 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id f12sm92043233wrg.5.2019.08.05.06.19.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 06:19:28 -0700 (PDT)
Date:   Mon, 5 Aug 2019 14:18:50 +0100
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Kukjin Kim <kgene@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alison Wang <alison.wang@nxp.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Enrico Weigelt <info@metux.net>
Subject: Re: [PATCH v1 0/16] drm: panel related updates
Message-ID: <20190805131850.GB5005@arch-x1c3>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2019/08/04, Sam Ravnborg wrote:
> The first 9 patches replaces direct use of the drm_panel
> function pointers with their drm_panel_* counterparts.
> The function pointers are only supposed to be used by
> the drm_panel infrastructure and direct use are discouraged.
> 
> ili9322 is updated to handle bus_flags in get_modes like everyone else.
> This is in preparation for a later patch series where controller
> becomes an arugument to get_modes() and not like today where drm_panel
> is attached to a controller.
> 
> The remaining patches move functionality to the drm_panel core that
> today are repeated in many drivers.
> As preparation for this the inline functions are moved to drm_panel.c
> and kernel-doc is made inline.
> panel-simple is updated to benefit from the additional infrastructure
> and is an example for the simplifications that can be done.
> 
> The patchset has been tested on my embedded target,
> and build tested.
> 
> Feedback welcome!
> 
> The "fix opencoded" patches are all independent and can be applied
> out of order. They were kept here to keep panel related patches in one series.
> 
> 	Sam
> 
Thanks for working on this Sam.

Patches 1-13 are:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
