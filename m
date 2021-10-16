Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741EB43048A
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Oct 2021 21:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbhJPTUL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Oct 2021 15:20:11 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:51938 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhJPTUK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Oct 2021 15:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409811; bh=QBcYM19WYIft9nyGf96kprXPvyWbRp1gWatVdt76c0U=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=ECnlWbHnAgiUWqXOSju4aaUSxeUtaOntQqVO+Bbn8vXn7Fz7N3jT/v7uL1lJWWKJD
         llWVZHcu/6x/ACeFMqGUxhJVd+elPn7h0rCXGxzLxQ5CqyRQt6M1Lb/93qd8zILozc
         +d9DInWf2ZeZhq0QooyukafTOTB1Acf/JSuOEInw=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:43:09 +0200 (CEST)
X-EA-Auth: EktwRpM9BYZ8qPTcr7FYisYWT/gaUG7pDHJf4hUEERNEPKglscAdivacLMtKzTOWon2weDNkueStZgZ/Nhod4Jc+aVZj3+jh
From:   Claudio Suarez <cssk@net-c.es>
To:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
        ville.syrjala@linux.intel.com
Cc:     Claudio Suarez <cssk@net-c.es>
Subject: [PATCH v2 06/13] drm/exynos: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:19 +0200
Message-Id: <20211016184226.3862-7-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016184226.3862-1-cssk@net-c.es>
References: <20211016184226.3862-1-cssk@net-c.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..a563d6386abe 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,12 +893,14 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
+	/* This updates connector->display_info */
+	drm_connector_update_edid_property(connector, edid);
+
+	hdata->dvi_mode = !connector->display_info.is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  edid->width_cm, edid->height_cm);
 
-	drm_connector_update_edid_property(connector, edid);
 	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
 
 	ret = drm_add_edid_modes(connector, edid);
-- 
2.33.0


