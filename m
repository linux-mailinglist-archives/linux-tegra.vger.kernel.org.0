Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3BA3CAAC3
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Jul 2021 21:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244061AbhGOTPd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 15 Jul 2021 15:15:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244763AbhGOTPO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Jul 2021 15:15:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 019D66141C;
        Thu, 15 Jul 2021 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626376278;
        bh=Pi3SmP6rNxgRgWzCKdrqpUvK9hb/g61I4pJGz9oPqgs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gVU5XToCAhIq4sARu6KWNV9xRr7DFrQuQ1cAxtGh7n3jqiiT9lgPDgAnvOM82fooZ
         CxPv0/3YeJSBiBxLgG2JsdXGs7pbUCEKmOWJ16YqHpRCrLu8VPirriXy52HYv3J/Fg
         MWa7jf99KVDLUecFMWed6eithsi3BQ5YSEPhjuao=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Thierry Reding <treding@nvidia.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 5.13 201/266] drm/tegra: Dont set allow_fb_modifiers explicitly
Date:   Thu, 15 Jul 2021 20:39:16 +0200
Message-Id: <20210715182645.713987940@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715182613.933608881@linuxfoundation.org>
References: <20210715182613.933608881@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit be4306ad928fcf736cbe2616b6dd19d91f1bc083 upstream.

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

It was slightly inconsistently though, since planes with only linear
modifier support haven't listed that explicitly. Fix that, and cc:
stable to allow userspace to rely on this. Again don't backport
further than where Paul's patch got added.

Cc: stable@vger.kernel.org # v5.1 +
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Link: https://patchwork.freedesktop.org/patch/msgid/20210413094904.3736372-10-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/tegra/dc.c  |   10 ++++++++--
 drivers/gpu/drm/tegra/drm.c |    2 --
 2 files changed, 8 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -999,6 +999,11 @@ static const struct drm_plane_helper_fun
 	.atomic_disable = tegra_cursor_atomic_disable,
 };
 
+static const uint64_t linear_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 						      struct tegra_dc *dc)
 {
@@ -1032,7 +1037,7 @@ static struct drm_plane *tegra_dc_cursor
 
 	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
 				       &tegra_plane_funcs, formats,
-				       num_formats, NULL,
+				       num_formats, linear_modifiers,
 				       DRM_PLANE_TYPE_CURSOR, NULL);
 	if (err < 0) {
 		kfree(plane);
@@ -1151,7 +1156,8 @@ static struct drm_plane *tegra_dc_overla
 
 	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
 				       &tegra_plane_funcs, formats,
-				       num_formats, NULL, type, NULL);
+				       num_formats, linear_modifiers,
+				       type, NULL);
 	if (err < 0) {
 		kfree(plane);
 		return ERR_PTR(err);
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1124,8 +1124,6 @@ static int host1x_drm_probe(struct host1
 	drm->mode_config.max_width = 0;
 	drm->mode_config.max_height = 0;
 
-	drm->mode_config.allow_fb_modifiers = true;
-
 	drm->mode_config.normalize_zpos = true;
 
 	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;


