Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2F44304A1
	for <lists+linux-tegra@lfdr.de>; Sat, 16 Oct 2021 21:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240904AbhJPTUe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 16 Oct 2021 15:20:34 -0400
Received: from ip-16.mailobj.net ([213.182.54.16]:43482 "EHLO msg-6.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhJPTUe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Oct 2021 15:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634409871; bh=1/OydcnVwUBndNkWR/YOnashKy6VPirsEbA4L+EOJZ4=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=B+raApksCV4XRqSp/CLYivelmjavkNwNTYU3glC0Wkh/vSU/vSsj1/9suEmuxRRNT
         gAyLMUD8ZKXgVUVE8NYDSHJ9eFo5ZxRyZmI2zQEc2G+5NiCQYeA7rzLA2pjNhxwetc
         PxLfzkekLTPDpFCscTAhBTojzRJaLFUIrzG6d5hE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 16 Oct 2021 20:44:05 +0200 (CEST)
X-EA-Auth: H/qsRidbIT3KyEA1EBIFm5A01FGasDKWzj1hSWYlxZfFW7bFlONyivG9ZdF8Eyke822OO7m3noOUPyoxCYBst0C4EfHo4iWT
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
Subject: [PATCH v2 13/13] drm/i915: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Sat, 16 Oct 2021 20:42:26 +0200
Message-Id: <20211016184226.3862-14-cssk@net-c.es>
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
drm_display_info.is_hdmi where possible.

This is a TODO task in Documentation/gpu/todo.rst

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b04685bb6439..008e5b0ba408 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	to_intel_connector(connector)->detect_edid = edid;
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
-		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
+		intel_hdmi->has_hdmi_sink = connector->display_info.is_hdmi;
 
 		connected = true;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 6cb27599ea03..b4065e4df644 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			if (intel_sdvo_connector->is_hdmi) {
-				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
+				intel_sdvo->has_hdmi_monitor =
+							    connector->display_info.is_hdmi;
 			}
 		} else
 			status = connector_status_disconnected;
-- 
2.33.0


