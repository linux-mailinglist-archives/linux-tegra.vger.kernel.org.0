Return-Path: <linux-tegra+bounces-4875-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E11A29AE4
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 21:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B109169CFF
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2025 20:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEAF214A9A;
	Wed,  5 Feb 2025 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJ7WvBYE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A68214A81
	for <linux-tegra@vger.kernel.org>; Wed,  5 Feb 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786243; cv=none; b=rjkEVzyUMOnH2dqPwz+q2tsBrN/Bbap7aqHNpfirEBM9V42kaYRFk/ktukGriLrG/nuU33r4tD4rO/BFa9l2iUJ3TyVk3Xl+4iJG58YXCSSA6ElCetZP018SiaDO1DE1qaBjpIDYiJBjhLAvn3//GW+hLXKZNt8ht8Qb6zKClQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786243; c=relaxed/simple;
	bh=yFglEma1B1UrYHHlLaqVTTuVZsUxBAtaYu9Jp8rfq1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4i24NFGgI5ZT8wXTN/GKywzL1z8zHbkxSlaBl7rStwpvo56RRHnxcq2rKo+/4BKUjvbTaW5QgLbio/poO9sAXNkn1WIrWj5LTDxC9nejzBOqcLy+WSP2ghzohMSNeYWSz6uKBFiPf4UO6/dFouyLFspE1iOPxzyl5pxK54rnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJ7WvBYE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rXNc9RF+BTw1D+Lqt4cYonydXBV4cosBEfjWZVPn/Q=;
	b=cJ7WvBYEezlZaayTd4NQOGNQ5lJ8//gE6pBA3yfD8tlQbiW742M9mKHLjMIxuZuENudH6/
	/jzjyVDogUlpuzWCyruYr4VbV3pbzNnD6tqyZXciWgZVL+k6ZRhYpab9n89HMASZAvctyV
	S1Nn+KzZAYI3YgKW9jT9j7EsuFnklWQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-vmZibAKROxyKgLz1ZatC1A-1; Wed,
 05 Feb 2025 15:10:36 -0500
X-MC-Unique: vmZibAKROxyKgLz1ZatC1A-1
X-Mimecast-MFC-AGG-ID: vmZibAKROxyKgLz1ZatC1A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A843180087E;
	Wed,  5 Feb 2025 20:10:35 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C0CB19560A3;
	Wed,  5 Feb 2025 20:10:25 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:03 -0500
Subject: [PATCH 07/12] drm/sti: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=8138;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yFglEma1B1UrYHHlLaqVTTuVZsUxBAtaYu9Jp8rfq1E=;
 b=mAr/l77+MAM0Lk/wltquMSsQ+bAoBfxv2/A9dI4DccZHjP/taolYJP+a25CTaReWEHo2kZvFi
 CcKo9WqNUGJBrY3/6HPiO1DG3zjUFVNcaw9QNZGyybGqrtBiz9H9SEI
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Replace platform_get_resource/_byname + devm_ioremap
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:

@rule@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);

and
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

v2: Fix compilation error.

Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
 drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
 drivers/gpu/drm/sti/sti_hda.c        |  9 +--------
 drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
 drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
 drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
 drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
 7 files changed, 7 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b9812edecf06f 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *vtg_np;
 	struct sti_compositor *compo;
-	struct resource *res;
 	unsigned int i;
 
 	compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
@@ -194,14 +193,7 @@ static int sti_compositor_probe(struct platform_device *pdev)
 
 	memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
 	       sizeof(struct sti_compositor_data));
-
-	/* Get Memory ressources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENXIO;
-	}
-	compo->regs = devm_ioremap(dev, res->start, resource_size(res));
+	compo->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (compo->regs == NULL) {
 		DRM_ERROR("Register mapping failed\n");
 		return -ENXIO;
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index c6c2abaa1891cd3ea025805b50d275ec314512c3..660588f01f90950a9b2c180ab230188c19901f26 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sti_dvo *dvo;
-	struct resource *res;
 	struct device_node *np = dev->of_node;
 
 	DRM_INFO("%s\n", __func__);
@@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device *pdev)
 	}
 
 	dvo->dev = pdev->dev;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvo-reg");
-	if (!res) {
-		DRM_ERROR("Invalid dvo resource\n");
-		return -ENOMEM;
-	}
-	dvo->regs = devm_ioremap(dev, res->start,
-			resource_size(res));
+	dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
 	if (!dvo->regs)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index b12863bea95559c4f874eb94cea8938609d435d4..0b5dbaf4d5305989846e25a1cab6f82d191aa9a5 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hda->dev = pdev->dev;
-
-	/* Get resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hda-reg");
-	if (!res) {
-		DRM_ERROR("Invalid hda resource\n");
-		return -ENOMEM;
-	}
-	hda->regs = devm_ioremap(dev, res->start, resource_size(res));
+	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
 	if (!hda->regs)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e..666143c48b0d0f2c20cd26323ddbc8e69d966622 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sti_hdmi *hdmi;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	struct device_node *ddc;
 	int ret;
 
@@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->dev = pdev->dev;
-
-	/* Get resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi-reg");
-	if (!res) {
-		DRM_ERROR("Invalid hdmi resource\n");
-		ret = -ENOMEM;
-		goto release_adapter;
-	}
-	hdmi->regs = devm_ioremap(dev, res->start, resource_size(res));
+	hdmi->regs = devm_platform_ioremap_resource_byname(pdev, "hdmi-reg");
 	if (!hdmi->regs) {
 		ret = -ENOMEM;
 		goto release_adapter;
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e6005d6a2bd59 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *vtg_np;
 	struct sti_hqvdp *hqvdp;
-	struct resource *res;
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 	}
 
 	hqvdp->dev = dev;
-
-	/* Get Memory resources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENXIO;
-	}
-	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
+	hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (!hqvdp->regs) {
 		DRM_ERROR("Register mapping failed\n");
 		return -ENXIO;
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6fa7d2cc7a2 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sti_tvout *tvout;
-	struct resource *res;
 
 	DRM_INFO("%s\n", __func__);
 
@@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	tvout->dev = dev;
-
-	/* get memory resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
-	if (!res) {
-		DRM_ERROR("Invalid glue resource\n");
-		return -ENOMEM;
-	}
-	tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
+	tvout->regs = devm_platform_ioremap_resource_byname(pdev, "tvout-reg");
 	if (!tvout->regs)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d2817ca8617f 100644
--- a/drivers/gpu/drm/sti/sti_vtg.c
+++ b/drivers/gpu/drm/sti/sti_vtg.c
@@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sti_vtg *vtg;
-	struct resource *res;
 	int ret;
 
 	vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
 	if (!vtg)
 		return -ENOMEM;
-
-	/* Get Memory ressources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENOMEM;
-	}
-	vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
+	vtg->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (!vtg->regs) {
 		DRM_ERROR("failed to remap I/O memory\n");
 		return -ENOMEM;

-- 
2.47.0


