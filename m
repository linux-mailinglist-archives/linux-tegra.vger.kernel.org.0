Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7134B81BB4
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 15:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfHENQl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 09:16:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41044 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfHENQh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 09:16:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so81158899wrm.8;
        Mon, 05 Aug 2019 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aboHDvQ6ED+izD2UcWUy5SYRhwe6k8n3aFGpiqq6F94=;
        b=HJrPdg5vi2acXiTXn2D4z0i7Hr8w9XxLP/M4z2UnD9KSie//GRJr+D7i+HBERo0EyL
         E5xRuusW/sVxMjetijNBd1r+m4y7aPO+7292NQ5ydJqR2IJKF77JAsI54CE17Ta/cdZg
         QrG3JXUa8RWfSFu9Yj8ueDmPzGjfRvEczwrUzyAF6NXpZFHS1fbblvXfUprPBAeDuSVs
         G7kkZpSxO2LtflLSGMe98WVsft4eKAhlMb+AWUwtjg4FVC3SvA0PDrhI7UFd5lX9acGL
         rtGWgEtJiIGVcoJsqWbo5ZVbH0otl6VcYaaYQhB+ovNxMBCVQULGfy9jPcC4aONgj/Ka
         qTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aboHDvQ6ED+izD2UcWUy5SYRhwe6k8n3aFGpiqq6F94=;
        b=VN2rh6m6sW+rk+zxYae9wOe30/SMKHlHfY1CQbwNet6YRQWH50dCsWlgx9nLntBT0C
         lRBjps3M6uIw/LrT4CEDlFthWw9yY2kmjOHm+EXP2zwiwXL7J2M64QH+A4n3y0cgJAnz
         c8/9pVGc2VXEnMySPuDJgUUDiM006rvzVgwPhgxYeOLd5XIqEobivh/2doN48LgxMpQF
         0YOflc3fn6e/88NUGY/cJoJfjchhoAJfy6H94akxXQkw1Rc+Lxp3iX+kEnkohfchuxeo
         JK6SmjUR0HiKd78zHgb7uZfVr0OqWwlAnBCVYEg0c3K86bapS2KpcSTUmr6/srGOQoYn
         VD7Q==
X-Gm-Message-State: APjAAAVRKA7ZhEekEt+KBGlUlCcIwT5y6dty3plMogFaqoanGiEmwUCO
        376yyl6Q8APcBqEDVDfDhAU=
X-Google-Smtp-Source: APXvYqzjHltu287XVkm0ryMGRX0Isuk446ECENvX2h1IZhSqC098PAq939JkQVreUtJBofYhKAusxA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr74740880wrt.253.1565010995650;
        Mon, 05 Aug 2019 06:16:35 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id m7sm71200354wrx.65.2019.08.05.06.16.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 06:16:34 -0700 (PDT)
Date:   Mon, 5 Aug 2019 14:15:55 +0100
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
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
        Enrico Weigelt <info@metux.net>
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20190805131555.GA5005@arch-x1c3>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
 <20190805105928.GI29747@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805105928.GI29747@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2019/08/05, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
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
> 
Fully agreed. Mistakes happen - hiding them, by returning "success" does
not sound like a wise approach.

HTH
Emil
