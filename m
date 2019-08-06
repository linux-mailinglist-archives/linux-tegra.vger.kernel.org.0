Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3CD82DE1
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Aug 2019 10:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732296AbfHFIhI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Aug 2019 04:37:08 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58234 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728998AbfHFIhI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Aug 2019 04:37:08 -0400
Received: from wf0413.dip.tu-dresden.de ([141.76.181.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1huuxd-0003Rg-64; Tue, 06 Aug 2019 10:36:49 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sean Paul <sean@poorly.run>, Sam Ravnborg <sam@ravnborg.org>,
        amd-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] drm: rockchip: Provide ddc symlink in rk3066_hdmi sysfs directory
Date:   Tue, 06 Aug 2019 10:36:48 +0200
Message-ID: <2234467.HdXYNSqS9h@phil>
In-Reply-To: <e3058e1973c9c7649a0818450188b5c3db442b3e.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com> <cover.1564591626.git.andrzej.p@collabora.com> <e3058e1973c9c7649a0818450188b5c3db442b3e.1564591626.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am Mittwoch, 31. Juli 2019, 18:58:13 CEST schrieb Andrzej Pietrasiewicz:
> Use the ddc pointer provided by the generic connector.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



