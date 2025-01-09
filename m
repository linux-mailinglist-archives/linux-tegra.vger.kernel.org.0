Return-Path: <linux-tegra+bounces-4508-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DAA07B0A
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2025 16:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7020116958A
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2025 15:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E5B221D8F;
	Thu,  9 Jan 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2FBrSVfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nFY2Y+gq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2FBrSVfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nFY2Y+gq"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE721CA01;
	Thu,  9 Jan 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435012; cv=none; b=c9ETdK31K1Z/8I0bgPfwpmrxz098Y6dMjClYGzObF6JiSAhNL9S+BUEmhPvxOY4BiyigbGKxl+hJgcXZal1+votcnZTWR141Cobze3R0VnRF0y2PFEjLVy0Q6RQ+5IbHzQGJyNTLS6cUztzNdB2242PYUBBTBRdUzGs9hTatRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435012; c=relaxed/simple;
	bh=Dwn/jnMjrrVqDn70k8AF67gzSIL8PVFci2XzIFirdZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ME+ufdrWgK1aFu2Cw8sO5p4hV9jEAFZpG0QD5durkENGMwaOAlRfGnv0jlsVzi7/K/yK7DhmbevmDsRg/ae2geMxkyIqAuG85FkgKtXWRqjq3gU4hjJ1P3LGu0qiv302FU8b9e2meg5PlrNY73gEnT4KOgchi1I2G2I5mkGz4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2FBrSVfz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nFY2Y+gq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2FBrSVfz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nFY2Y+gq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 159631F394;
	Thu,  9 Jan 2025 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6bJ5PrU9Ov2p7iX5J2NO4bVvOCLiJfa9aMPiWlnp7E=;
	b=2FBrSVfz1w+KP4I3u2gtjDD/MtYOx10aHYP/LL4/WsL1NbmD7aChz9t9GsCjwTPrzUywXL
	YLUrswaNhkQ+mf7kpSSRU4ubGefcEk+XNQYTQzS6g9qNntPm9eYMCpwWYtSOQr4QlsroFD
	HefHAQZto0zHeRu8eDV+wlFtE6iSkGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6bJ5PrU9Ov2p7iX5J2NO4bVvOCLiJfa9aMPiWlnp7E=;
	b=nFY2Y+gqJVhTL9teBXFqe+a7/Xk+sWWQ7xUOoRyEJnHS3VXE14PBgZlrH+GYD1Qs9Ia+KX
	9kWLL1DmCv/I8rDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2FBrSVfz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nFY2Y+gq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6bJ5PrU9Ov2p7iX5J2NO4bVvOCLiJfa9aMPiWlnp7E=;
	b=2FBrSVfz1w+KP4I3u2gtjDD/MtYOx10aHYP/LL4/WsL1NbmD7aChz9t9GsCjwTPrzUywXL
	YLUrswaNhkQ+mf7kpSSRU4ubGefcEk+XNQYTQzS6g9qNntPm9eYMCpwWYtSOQr4QlsroFD
	HefHAQZto0zHeRu8eDV+wlFtE6iSkGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6bJ5PrU9Ov2p7iX5J2NO4bVvOCLiJfa9aMPiWlnp7E=;
	b=nFY2Y+gqJVhTL9teBXFqe+a7/Xk+sWWQ7xUOoRyEJnHS3VXE14PBgZlrH+GYD1Qs9Ia+KX
	9kWLL1DmCv/I8rDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86A3213AA7;
	Thu,  9 Jan 2025 15:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2P5jH0Dlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:19 +0100
Message-ID: <20250109150310.219442-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 159631F394
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index b47463473472..7ea0cd4f71d3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
 				    struct drm_mode_create_dumb *args)
 {
 	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
-	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
 	/* Enforce the alignment constraints of the DMA engine. */
-	args->pitch = ALIGN(pitch, dpsub->dma_align);
+	ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
-- 
2.47.1


