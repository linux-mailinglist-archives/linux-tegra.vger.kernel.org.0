Return-Path: <linux-tegra+bounces-3011-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA2930E08
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Jul 2024 08:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBC9C1F2122B
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Jul 2024 06:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237021836F2;
	Mon, 15 Jul 2024 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSmvU2fG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E713B7AE
	for <linux-tegra@vger.kernel.org>; Mon, 15 Jul 2024 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721025199; cv=none; b=olq4GfW753QTS/saeQGiNVhHLtKcYYl+TVoce5yf5NRC+g4vdsH+Jt2WpeMZBQjGtQyqXLqQIJakUZw76JyxgUqU2Ytl5OZ0VJGiZzRCV8zZVjPayik85c6edRUpX5JNZuZxL47nTVUKskEUA7j/JA7KVzM55paxBgP1Afy7Ml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721025199; c=relaxed/simple;
	bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2p8mNCC+slaGk6nPiiFvRV4EqonTux1p0qoB4ukiQ9RDRZXKkuU47xigBZdpDZZ3WS/YmskIttW1f/HDUCtw4kMyFBKSFiGLwojtAhPbHdlEhkLVClc0J7IiIh50bJPLmSSCnmxSPFV/RGADVwvFaqGKZ091JM3BeLwjOweTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSmvU2fG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e9fe05354so5401365e87.1
        for <linux-tegra@vger.kernel.org>; Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025195; x=1721629995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=sSmvU2fGovHWpRBTxXACCoYBikjEHP9MSyyV1OY3mqC2n5YQ/fbPs5pYkDza+79WN9
         dpPDkUs7sVSJ1ryPHafi1BdnocDZyYUFmrqSCFEF5QfC6l+TV8KdMQSsNvT3hMoThEyt
         z/WuP2fww+nmIDevqTqCH6ait2hDbA0LooOy+CbAeH/HbW0ovBgZsntP/km3E0QcRioR
         97xbR75TZiNVtDJeUgdXH1R6kUgj0lhnZteJ9CaM9CLHAxTTehUONMiRbhZNREppwfrm
         DL+mdpFzd8czrM1ELTQysaMx4tY5GM6YG682e0Nbju856xPlJkRlqQ5xk67GAefknddd
         lTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025195; x=1721629995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=IgHQGiKyZjPGr78eDT+bW2net7foxhPK3WHnHUI6cf30jhRz+42nfRZwDNMWjfcxjo
         hZtt4O+7rpD+7RR4+AFlfNK4ERJVi6qtiWRaKfkzLaaOo5wq8gdUzByvsmD9l8xkZwCm
         1YZHDCde+p2KFSulxZZfjso413oaNA8qXtVq7LeS6ikQUVW8iLnias/Y6B5ELLaCisp9
         +/s10wS1F53QNfD48amhgaL8Em853HzPVofJpbGZx0CUeFdXcMMDCOHovNdd7J1g9+kh
         0/NyRhr8j4hqPsliElWBSR2AhjEWcZJf/CsLmtoLOBfHsBZUBlgR9pIjbyppeXXZsF/K
         sYAg==
X-Forwarded-Encrypted: i=1; AJvYcCU2PVtRkFE+OuKjqi82RZhXS2lzg+GbIz3sA+rJMX8gtloBNOu3iQww3KqdjI45sxU6HRcWE6vXDKedYpM8W9X63sN/etzm2zCtV9E=
X-Gm-Message-State: AOJu0YyoIDPo9tDtJVZfAlHBqCTP9hKebFJmEVKO3+IBdoFBG+ENbnNt
	P53b6vPZkn76e/3i456Uu3ptXWgMjfxbswZ/VRMdoSud4e5sYsi3YxaBMh0JtOo=
X-Google-Smtp-Source: AGHT+IHT4xz2WdhLKgSzBOFGajWmbSWMHs5k5m2atVJlXqSvlJsy3hyS+kPlM6QSPNXfSrtWv1LNGg==
X-Received: by 2002:ac2:41da:0:b0:52c:90b6:170f with SMTP id 2adb3069b0e04-52eb99a0e7emr11020892e87.29.1721025195187;
        Sun, 14 Jul 2024 23:33:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:01 +0300
Subject: [PATCH v4 1/5] drm/display: stop depending on DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-1-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKouj4z7T/shiz6BaAt6p7GIaGUsCT7QSQ3+
 htjgKfZW+aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1fbaB/9HucxwZ9XXPDZRoDro66r9wo860mrSEB1fXkutEFrGC+zz13rgdDbGHIAnd9uv8iJQ+eZ
 FnHusEklODaV6JVOBxry88xtNubs2YKCDCryw4tsCNUJYHXtqBVrqFKiiEgV1fVPr24ZnOES7Px
 Ef31DsPrCnhXzvJAcgn+EE6UnjT0qx1Dz+nQGStxm+6YqKFaq65IMQDATwngmZiTJO6wMQzT85Y
 E0pyIkvXXAP2khDqrLtpUkroiEy+rITOfqGW43AggLIZgaaB3hI8mzpqjQor1sFYzMyqCtn11OD
 0TKL0KUECMJb2hfkYtMQg3IX8xjnSc79S3gqxbWQwws7xLIS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Kconfig symbols should not declare dependency on DRM_DISPLAY_HELPER.
Move all parts of DRM_DISPLAY_HELPER to an if DRM_DISPLAY_HELPER block.

It is not possible to make those symbols select DRM_DISPLAY_HELPER
because of the link issues when a part of the helper is selected to be
built-in, while other part is selected to be as module. In such a case
the modular part doesn't get built at all, leading to undefined symbols.

The only viable alternative is to split drm_display_helper.ko into
several small modules, each of them having their own dependencies.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index a2e42014ffe0..9c2da1e48b75 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,19 +1,20 @@
 # SPDX-License-Identifier: MIT
 
+config DRM_DISPLAY_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF || COMPILE_TEST
+
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
-config DRM_DISPLAY_DP_AUX_BUS
-	tristate
-	depends on DRM
-	depends on OF || COMPILE_TEST
+if DRM_DISPLAY_HELPER
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
@@ -25,7 +26,6 @@ config DRM_DISPLAY_DP_AUX_CEC
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
@@ -34,7 +34,6 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 
 config DRM_DISPLAY_DP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
@@ -61,25 +60,23 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 config DRM_DISPLAY_DSC_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
 
 config DRM_DISPLAY_HDCP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
+
+endif # DRM_DISPLAY_HELPER

-- 
2.39.2


