Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D972C1F8A4A
	for <lists+linux-tegra@lfdr.de>; Sun, 14 Jun 2020 21:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgFNTEZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 14 Jun 2020 15:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbgFNTEH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Jun 2020 15:04:07 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629A4C08C5C4;
        Sun, 14 Jun 2020 12:04:07 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c12so8212763lfc.10;
        Sun, 14 Jun 2020 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uf8zIpYQk6KPBTmw2T9hHkd8Lw+t/UJ+qTlgdHhWoBk=;
        b=JSKo+AQD/wnWM9r9qfNTqUfAg59MFyFM9IX0DGecmEWEI2dIyWaqjGuPe0qpaUINfG
         RiemcG9UV0J4yu9CjG3/hBQWsdzGPTXxROVLlJAz4+rB/NtD//k7jPh8/4JUXFkm3YxQ
         goq8H6zvW6yxBg764f5UnaI3mQ6kusB97ucVARx0tV0gxk0C0P8CDQmi4904gHweFN0s
         gUpeBo2zAjdqHkiHC29AUbFF46A38sRq6rAcgWMF+CuKh14wEXoQ45HwyPX396sBcGb9
         lVChyNpnwPWMch4kmYbyJfG7CV1z8D9RTgYFtWU9DPPVcYrX7tuEDpkGK1JpA9vrytH3
         fNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uf8zIpYQk6KPBTmw2T9hHkd8Lw+t/UJ+qTlgdHhWoBk=;
        b=DJu4aBtLVYygna5UK6olRLnjF3Yt2HS/uCN4/FQBsxaZAEIAWxAZhFrUBoQZNEfAGm
         FwrEoIaMXq52eU9tyVa+uXD+EhLZb1YcwYTJEVnnHguCQmLaFfr+GVN9YfYAgcY9PmVi
         RGzBDJmR7oCN6qZGisFhmvUiGAY/cwAx6O8xAovtLpciNVFtp1fiNOqSymMCb3bec8dX
         DlSq/M62n/8gL2OB9uGQ/JFDhEsSm34Vdh5yxRap6gG10gvrj/fJ73iAFcF/DWR9VjwG
         mZdpzPLKR4rjs7Un+MYKop+O3CKgSjj/c12FKS24tPI+Asy8gJvhn/mpMob1CJqx4K6W
         b4Ww==
X-Gm-Message-State: AOAM530YcbNIYfyE4TnIfHJ9oRFUyg9atzrJdpGvKxivoDO8cKuGTbr4
        +ypWxArxUYXNqaUCdqO3+cQ=
X-Google-Smtp-Source: ABdhPJzXALOkf+KtpKcHwrvfp97TmMlYrYZAJ9iaS0lOVua0wtnMBmER+SrdQOz85eR78w/RqAZx+w==
X-Received: by 2002:a19:8253:: with SMTP id e80mr3203832lfd.199.1592161445925;
        Sun, 14 Jun 2020 12:04:05 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 12:04:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Derek Basehore <dbasehore@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] drm/panel: Set display info in panel attach
Date:   Sun, 14 Jun 2020 22:03:44 +0300
Message-Id: <20200614190348.12193-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614190348.12193-1-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Derek Basehore <dbasehore@chromium.org>

Devicetree systems can set panel orientation via a panel binding, but
there's no way, as is, to propagate this setting to the connector,
where the property need to be added.
To address this, this patch sets orientation, as well as other fixed
values for the panel, in the drm_panel_attach function. These values
are stored from probe in the drm_panel struct.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_panel.c | 13 ++++++++++
 include/drm/drm_panel.h     | 50 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5557c75301f1..9748972f2e7c 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,6 +114,19 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
 {
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = panel->width_mm;
+	info->height_mm = panel->height_mm;
+	info->bpc = panel->bpc;
+	info->panel_orientation = panel->orientation;
+	info->bus_flags = panel->bus_flags;
+	if (panel->bus_formats)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 panel->bus_formats,
+						 panel->num_bus_formats);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_attach);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 781c735f0f9b..97ac5f12a07c 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -165,6 +165,56 @@ struct drm_panel {
 	 */
 	int connector_type;
 
+	/**
+	 * @width_mm:
+	 *
+	 * Physical width in mm.
+	 */
+	unsigned int width_mm;
+
+	/**
+	 * @height_mm:
+	 *
+	 * Physical height in mm.
+	 */
+	unsigned int height_mm;
+
+	/**
+	 * @bpc:
+	 *
+	 * Maximum bits per color channel. Used by HDMI and DP outputs.
+	 */
+	unsigned int bpc;
+
+	/**
+	 * @orientation
+	 *
+	 * Installation orientation of the panel with respect to the chassis.
+	 */
+	int orientation;
+
+	/**
+	 * @bus_formats
+	 *
+	 * Pixel data format on the wire.
+	 */
+	const u32 *bus_formats;
+
+	/**
+	 * @num_bus_formats:
+	 *
+	 * Number of elements pointed to by @bus_formats
+	 */
+	unsigned int num_bus_formats;
+
+	/**
+	 * @bus_flags:
+	 *
+	 * Additional information (like pixel signal polarity) for the pixel
+	 * data on the bus.
+	 */
+	u32 bus_flags;
+
 	/**
 	 * @list:
 	 *
-- 
2.26.0

