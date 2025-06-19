Return-Path: <linux-tegra+bounces-7484-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C86AE0D76
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Jun 2025 21:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72EDA17BD02
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Jun 2025 19:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F8224501D;
	Thu, 19 Jun 2025 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQOIV2Ba"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F65221F2D
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360701; cv=none; b=KxHzhGvgMwqoTS2kQInq7UJrZOCNXUhQQRf2FhI8JunVV+73tXepKw8lAmG1ElTn08Q5AE+jUPIZtoxoOyY2vrhWwAuDADMPeJW/lYJYKt0IuhYJ6kPjTZfgClZ7jKuUDQ7rvGo6AHYMNHw/o8fW5EupsuJ7k2hwTkBQDR219rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360701; c=relaxed/simple;
	bh=vwDL0e/kpo3IfQsCqGi/us3Z8zaxOzAuP+sQe4GqNv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyXsv8pbU8qye+tfmrjj4IGjVtELH16yO+02+S/kY/1QFbotIonEoEv0TNiiKTUJxvA9jBVKHBiNH85800SeglHRfElS/mDhNlJwi1IuS1iSyPERbbVdNX2eaivi8l6zmn+KoQ7tfiVKHZYDJAw3IKj9HyvbG68PeyDiLcJlvBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQOIV2Ba; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uj5bq15NBziJEiGW1nt+d5vwRWbeeBx1df0xo6lfNU=;
	b=bQOIV2BaypvmnwWo3txckScb8jkSeutnfWHoOtjCdvZZ0UJYLqxYVFrmdHkFSLobx2UDfW
	iroNtUnD18/7nGWheg8eRjii5BNo5i7Lg/w2gv6C8Oleu3L3znNpPAGGRVRPbx6bz/paWl
	KO6t01aEK2CHYAV+fPfDGU+wfwsEzQ4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-NlCAE8VIN0ew9ASJW0oK_A-1; Thu,
 19 Jun 2025 15:18:13 -0400
X-MC-Unique: NlCAE8VIN0ew9ASJW0oK_A-1
X-Mimecast-MFC-AGG-ID: NlCAE8VIN0ew9ASJW0oK_A_1750360689
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1940618002EC;
	Thu, 19 Jun 2025 19:18:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAC5819560A3;
	Thu, 19 Jun 2025 19:17:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:56 -0500
Subject: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=704;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=vwDL0e/kpo3IfQsCqGi/us3Z8zaxOzAuP+sQe4GqNv4=;
 b=g7khlqVnumIsHfCfSyg1woKg7b+yPfwhEzUFo3QOoMq0IPTiWV2rTpeFC7PVXfC46T3XRxrJF
 fI+al3sbj0kDgQkGEBOUB30evTAaic6E/aBtVIm4pMDxX40daFlJ1F0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b7397c6e38dde45824bd49fdf099..36d47d7cedde1e1e3e83eb670520664100bd0a25 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -990,6 +990,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 
 	drm_kms_helper_hotplug_event(dsi->drm);
 
+	drm_panel_put(dsi->panel);
+
 	return 0;
 }
 

-- 
2.48.1


