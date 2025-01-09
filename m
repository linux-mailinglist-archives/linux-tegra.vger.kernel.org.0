Return-Path: <linux-tegra+bounces-4502-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D53A07AED
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2025 16:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189E83A8AA3
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jan 2025 15:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADDE221DB7;
	Thu,  9 Jan 2025 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E4mF2b88";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9u9EqMnm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E4mF2b88";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9u9EqMnm"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6A221D83;
	Thu,  9 Jan 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435009; cv=none; b=bhTz4RI7bF7sxoRId306cJsGJ4Fyh0WLgk5jNueMFEAPsiZrxz+fjpelDE/90jEnPwOhiTp1K6AN78qu16ufAy+Akty8+h3RRnTr0iusDi3DVIovgRXODrZAgY1s9qv3YOvmb1Yx66d4NTu2b6Xb28MgBRKs2s6VkOglbTypR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435009; c=relaxed/simple;
	bh=m8vaIgzjHJDvfPkRuFQEC4t3LALMRHv6dWznrUsADFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfpFO1b32ACohfrOz5bP8WrcqGdC9HRIZVN5Af0ZJ8cdKN3VsmidIgX8+oMY/vROFh1WtUiuugieeT9oace/AWUMazUn4DI7ijGE5r3wSRs2jCWuLbi259IcBcVxgdKim+Iw7CSfThus0SI+8sKPZWok01rX46yhWF0LR2Dy/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E4mF2b88; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9u9EqMnm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E4mF2b88; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9u9EqMnm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD45321179;
	Thu,  9 Jan 2025 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsAkbiCNZPJa7lykZ0W2Im8Rz/K3j/qzEnWutqrkaP4=;
	b=E4mF2b88i1q4slUZ4/qBReEFeEySjrRCGbf46VXhRkeuBDsS3oRAr7S1dwAWoN+RNHdUrR
	QGfX1hOzEe3shzqAh6YiiEvhuZoq2HaHzYlkEma9t0LUUZJJLb817iwjAzjY1m9QElwTPo
	48QFcdXjRRihKWB0/DwbMvs8G8jvh8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsAkbiCNZPJa7lykZ0W2Im8Rz/K3j/qzEnWutqrkaP4=;
	b=9u9EqMnmcjuHU/fMQsou9BFxU5rQWtneJVUfCwbMCcurwzt4zWtUqTuxEeOlq8Hp/79+cI
	/ZQ0Mcq4UXLjbKCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsAkbiCNZPJa7lykZ0W2Im8Rz/K3j/qzEnWutqrkaP4=;
	b=E4mF2b88i1q4slUZ4/qBReEFeEySjrRCGbf46VXhRkeuBDsS3oRAr7S1dwAWoN+RNHdUrR
	QGfX1hOzEe3shzqAh6YiiEvhuZoq2HaHzYlkEma9t0LUUZJJLb817iwjAzjY1m9QElwTPo
	48QFcdXjRRihKWB0/DwbMvs8G8jvh8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsAkbiCNZPJa7lykZ0W2Im8Rz/K3j/qzEnWutqrkaP4=;
	b=9u9EqMnmcjuHU/fMQsou9BFxU5rQWtneJVUfCwbMCcurwzt4zWtUqTuxEeOlq8Hp/79+cI
	/ZQ0Mcq4UXLjbKCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26A0C13A8B;
	Thu,  9 Jan 2025 15:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GFw9CD3lf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:25 +0000
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
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 19/25] drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:13 +0100
Message-ID: <20250109150310.219442-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 64.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 6330b883efc3..3bd06202e232 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 			     struct drm_mode_create_dumb *args)
 {
 	struct rockchip_gem_object *rk_obj;
-	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	/*
-	 * align to 64 bytes since Mali requires it.
-	 */
-	args->pitch = ALIGN(min_pitch, 64);
-	args->size = args->pitch * args->height;
+	/* 64-byte alignment required by Mali */
+	ret = drm_mode_size_dumb(dev, args, SZ_64, 0);
+	if (ret)
+		return ret;
 
 	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
 						 &args->handle);
-- 
2.47.1


