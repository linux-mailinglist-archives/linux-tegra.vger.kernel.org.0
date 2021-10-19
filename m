Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B5843419C
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Oct 2021 00:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhJSWwV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Oct 2021 18:52:21 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:34928 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhJSWwV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 18:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634683799; bh=B8LQmlRdF9ncKQSpnP77MkDRJmIEn4moaxcLLUFH4W4=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=DIcymrRArUVV4ghrssaHMWO42DOrRosYIfwShkRGMlKMDWJLH9UZLyMuEHqVEZ1EV
         MxixJFR/yHiAPxUVvES8T9bUUTUXy803y91aDHGu6LfG0qZ5xYPzeI2gFv5dTKg332
         jaYQZ/jrf3YtyBurz/eP7u36f1eUEnHm1vd9WHYo=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 20 Oct 2021 00:49:59 +0200 (CEST)
X-EA-Auth: Gqmelh1z59r5Y/teXUuGjwLkTdFO4P1lStrknWdQCUl83L+iKO5FB4qUvKx2giDZRV6Y3kTGKgikHtys/cxDXS+S/2OAaVRI
Date:   Wed, 20 Oct 2021 00:49:56 +0200
From:   Claudio Suarez <cssk@net-c.es>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 01/13] gpu/drm: make drm_add_edid_modes() consistent
 when updating connector->display_info
Message-ID: <YW9LlBHoOaSOeVjk@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-2-cssk@net-c.es>
 <YW8P3GPGezUhoBcW@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW8P3GPGezUhoBcW@intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


According to the documentation, drm_add_edid_modes
"... Also fills out the &drm_display_info structure and ELD in @connector
with any information which can be derived from the edid."

drm_add_edid_modes accepts a struct edid *edid parameter which may have a
value or may be null. When it is not null, connector->display_info and
connector->eld are updated according to the edid. When edid=NULL, only
connector->eld is reset. Reset connector->display_info to be consistent
and accurate.

Since drm_edid_is_valid() considers NULL as an invalid EDID, simplify the
code to avoid duplicating code in the case of NULL/error.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..a019a26ede7a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5356,14 +5356,14 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 	int num_modes = 0;
 	u32 quirks;
 
-	if (edid == NULL) {
-		clear_eld(connector);
-		return 0;
-	}
 	if (!drm_edid_is_valid(edid)) {
+		/* edid == NULL or invalid here */
 		clear_eld(connector);
-		drm_warn(connector->dev, "%s: EDID invalid.\n",
-			 connector->name);
+		drm_reset_display_info(connector);
+		if (edid)
+			drm_warn(connector->dev,
+				 "[CONNECTOR:%d:%s] EDID invalid.\n",
+				 connector->base.id, connector->name);
 		return 0;
 	}
 
-- 
2.33.0



