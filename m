Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA2E42F095
	for <lists+linux-tegra@lfdr.de>; Fri, 15 Oct 2021 14:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbhJOMYI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 Oct 2021 08:24:08 -0400
Received: from ip-8.mailobj.net ([213.182.54.8]:43800 "EHLO msg-3.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238730AbhJOMYH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Oct 2021 08:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634297909; bh=elbQ/Rfa9XPzohbQeT5mZjhN0nLEuIl5gnGjqEs1gGI=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=uhQhLYcExiNlDlHMmi2fXqvIXIdT9Zsx177AWWe8lBnJwiintXzX/ujeyxEXR+On7
         2wIInhwG+MuP+dGrumWHNLbDl5SnrksHRvz0CfdiYEk5iZxfadz0zCYqgweFZEoMTn
         lBHsxXLB3In8AG0xTzRo8fWAwXnP7PczDI8aTMnA=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 15 Oct 2021 13:38:26 +0200 (CEST)
X-EA-Auth: m+yuPqoVfZfKJvzhs4WwYWS6mMZQLuB1wXfYQyDkgGVWy09v7/iqIciNYT8F/CkgK5SECL4YhfCcPlve7qthz5S1NaR1VBAr
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
        Chen-Yu Tsai <wens@csie.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc:     Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 08/15] drm/msm: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Fri, 15 Oct 2021 13:37:06 +0200
Message-Id: <20211015113713.630119-9-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
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
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 58707a1f3878..07585092f919 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -364,8 +364,8 @@ static int msm_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
 	drm_connector_update_edid_property(connector, edid);
+	hdmi->hdmi_mode = connector->display_info.is_hdmi;
 
 	if (edid) {
 		ret = drm_add_edid_modes(connector, edid);
-- 
2.33.0


