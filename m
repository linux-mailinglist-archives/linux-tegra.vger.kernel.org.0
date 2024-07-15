Return-Path: <linux-tegra+bounces-3014-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44223930E18
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Jul 2024 08:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD0BCB20FA7
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Jul 2024 06:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1737184121;
	Mon, 15 Jul 2024 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYsu9ouG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F01836EB
	for <linux-tegra@vger.kernel.org>; Mon, 15 Jul 2024 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721025200; cv=none; b=ul76sSXlO4tpZnntkpiwIcSKbTKZyILeS+7HkRBG9r7ccosLJegZSCp3wS203aaqEYDUaQMZIxTYkL1ZREBShL8ilRUUIFTEmks9fqljH9sK0q5L8Oo2iCHUtoIvJxyJr4zqFSGmJ9Vh6gDfvM5Y55aV9hPk98ug5iG5OXBpYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721025200; c=relaxed/simple;
	bh=Ogj1qgSBFy5LiaMGrph8HSRVcootU6FeEO747BTFj9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8WqO+Oj1S4FSeqJeIwhKj7F8WBz6mB6tWQ3lt0+CcA6I4pKPYk1dkVs9m8gv5cad9FroCId5+n4nHH+0nhwEVWHYs03WuYTMn7HGASqxmxJmVoHD6tplC3yD1hE+GBfKLpOWbqTV1hmq0OxxhGYqaV0TtSA7QC/SyqH9XnkXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYsu9ouG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea1a69624so4027986e87.1
        for <linux-tegra@vger.kernel.org>; Sun, 14 Jul 2024 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025197; x=1721629997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
        b=CYsu9ouGp/Ws+ikvSCe3Sl7IjS42dcIy1gcMJ27Ly/vcfvaZjSvli8f9N4kpYHpBPc
         wKhh+sL7wJKlvpuku2liBJob2Z7lAQONG900n5h3fMxg+Wrt+6wUsEieYXBLU2Qdeeoc
         hcLVdD+u4yGLopDRJk14gvqNDAj94Hqc3Og5qy8BrChSsW79yp62o4dYUq6hz9JX2MbN
         POxgf18id/jbuMl9VD3zuM+CXVHKCvmRGi4dOdfFinIPNIb5VCqheIiYuor+CVlTw0Xd
         H7c9oeiRFEuh5KFknfIGmNIgWAVVNPTaPNm56dWQ9gOsFXkrEgrpc2/Zoce36eCEC6lZ
         np3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025197; x=1721629997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
        b=f9asldex6bayRHwi4RlUg2FRJdPI4SQxiyYQsPcQq+Adby8OFHEsSxUZLhUTkJchrw
         8H2KSxpSeNn8UlrgPgJmh62T0hB/oPMHXAKa2rYcIWWMXDozsJfUfSMOJSHcEYUSlJgj
         /IlyeQCIP1+NknILVeJjORegElbwTqEWD9s8PxnD6dU3f3AjWJvTgJS3/Dmbfc3fv7l/
         3VtWhJWDeLoFB14a6IcFShgYAWgHo4GnEhn2wBv7v+RtI8EMLNLXkqJPEnZf93TIR06T
         mGbNvwFw5kw7OE8KTjphr+0qejOco/uOWYlAYSL49sipL7cw02oBDPIfFE0gGiT12TYG
         1XRw==
X-Forwarded-Encrypted: i=1; AJvYcCUv8dR88GLbieWldFIh+TaSb3vQG2nCL4ecHCiatwdePTwAMVJFcEOERpUXL4kuORLmqs/aVPOh5Ci+gk9sdeoQ1s6FJhgOGlhM9Ig=
X-Gm-Message-State: AOJu0Yxvv3OtQLhx6vZ1gia/rK8h5C3QoXtM5Oo6yBhw6n9bA11ejmvf
	nFB/B5u519UTO4bEgoeCzVfmeAwP//63z7hIJqEWgcAZZU92cMFmkqD3GYkEtso=
X-Google-Smtp-Source: AGHT+IF+V86J6/2ZIQK/CmixClQVdJF7hjnWLmCjjdRBB6FFYX5j0s7A+kP4jnSIFrfgBCt8vnJuQA==
X-Received: by 2002:a19:f706:0:b0:52c:c9d3:a30c with SMTP id 2adb3069b0e04-52eb99a0639mr9397218e87.29.1721025197267;
        Sun, 14 Jul 2024 23:33:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:03 +0300
Subject: [PATCH v4 3/5] drm/connector: automatically set immutable flag for
 max_bpc property
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ogj1qgSBFy5LiaMGrph8HSRVcootU6FeEO747BTFj9E=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9qUQysu/J/Xl5n/9o/EfmHLmdY1x3fJXa8q/t5631Izp
 6VP4f30TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMRPg8B8NKPS4j53+nGRhP
 VBcpNN70edCVY/lnJcPcZSbfTc/NZDjqy6J4IKKOJ5lRyqf+pLljwNWcn8dbq5ta/jC3fL5Surt
 8VnHwiZ8ube0uSdOfHZtUofj4yj2FJZ909eR959nxx9g9rdtcmORwy69fzvGuf/mlJ9ITLxRdKU
 /VyNt9e8HWnyJSNaJvsvvjVOZ/8xJcrea+Le6pdpiL04no7ZG5l+apXb1wf90jpyWPt1z035Z38
 UmCspiUQ5HjJzXNXLbKp8oVKQ0yzQwbTWba5eanp9nPFBKUKtof79uV/nmO00QFK+krh9kFBW1Z
 lM+2PipLcPhrUlgXZKBucDBt5ZLW8y+WpX08IzaNs3cFAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

With the introduction of the HDMI Connector framework the driver might
end up creating the max_bpc property with min = max = 8. IGT insists
that such properties carry the 'immutable' flag. Automatically set the
flag if the driver asks for the max_bpc property with min == max.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..33847fd63628 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2610,7 +2610,12 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 
 	prop = connector->max_bpc_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
+		u32 flags = 0;
+
+		if (min == max)
+			flags |= DRM_MODE_PROP_IMMUTABLE;
+
+		prop = drm_property_create_range(dev, flags, "max bpc", min, max);
 		if (!prop)
 			return -ENOMEM;
 

-- 
2.39.2


