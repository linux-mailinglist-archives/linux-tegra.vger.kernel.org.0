Return-Path: <linux-tegra+bounces-8574-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133BB2F210
	for <lists+linux-tegra@lfdr.de>; Thu, 21 Aug 2025 10:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6BB75A3332
	for <lists+linux-tegra@lfdr.de>; Thu, 21 Aug 2025 08:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BE92FDC2C;
	Thu, 21 Aug 2025 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YfYAQaIf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xj7wK/JS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YfYAQaIf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xj7wK/JS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7482FDC58
	for <linux-tegra@vger.kernel.org>; Thu, 21 Aug 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764584; cv=none; b=tFZVgb+GsGPe1z/zb58DEbupyM/TuoQSyuTyj3sZMEGWyyqinZLWr3hob91rrI68Kk3s4w8fL0+6J//Ps3id2sV0hq3K+G8aO4T8R50r9jnQMbs361rFHdi2KV+M4QNnyHOWOQ0GWZ8x2SUzgXk2g4zWwc923DDeafjFK0P73rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764584; c=relaxed/simple;
	bh=vNc/d5Hrths8MoM163tcSaqqwooMUPOQI4YMPNa6wZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcUQzsdYG35uN0Uv4k4ha6LolJVNzab1rATNTjCDpj2EKj6rP7XOU/bTx4ZdngpcxTvCn1um+HnY/hNJ/Bn7PMi7rFYXsA0KPJJ4m1FEj6bzyX6207qWFuAkZbrAXo5P0XYOzcNKn5sKKjb63oO+fPnvF+/Lm6Vek8X4AjOzjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YfYAQaIf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xj7wK/JS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YfYAQaIf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xj7wK/JS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 729EE1F7EE;
	Thu, 21 Aug 2025 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98wiGs2+EnErfdkGDAxUiBR4iD/UWra2StCl2zMlfWQ=;
	b=YfYAQaIfa3irYZmzA0AMdQCruI4KXV+TQ6UP9yGC/tY25ZKEOEp6Q7V9rz381vEhLcs1/8
	lq/ENNP8LqbL4v95DGMwb6fpOj2lwJ7aQVSW23cOF6dj5kksFigYjYE5NbESInJ9+ytpZZ
	s6u+MdfYFznr9SkM8C9MZ/opQXwJt1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98wiGs2+EnErfdkGDAxUiBR4iD/UWra2StCl2zMlfWQ=;
	b=xj7wK/JSo8Xl36/yZTRk5/0NbjDslKeJly48F7fFVxuPisgQjM8itRqereqVK4butrPzV8
	UglzAStAY3zYXzBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98wiGs2+EnErfdkGDAxUiBR4iD/UWra2StCl2zMlfWQ=;
	b=YfYAQaIfa3irYZmzA0AMdQCruI4KXV+TQ6UP9yGC/tY25ZKEOEp6Q7V9rz381vEhLcs1/8
	lq/ENNP8LqbL4v95DGMwb6fpOj2lwJ7aQVSW23cOF6dj5kksFigYjYE5NbESInJ9+ytpZZ
	s6u+MdfYFznr9SkM8C9MZ/opQXwJt1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98wiGs2+EnErfdkGDAxUiBR4iD/UWra2StCl2zMlfWQ=;
	b=xj7wK/JSo8Xl36/yZTRk5/0NbjDslKeJly48F7fFVxuPisgQjM8itRqereqVK4butrPzV8
	UglzAStAY3zYXzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D505913867;
	Thu, 21 Aug 2025 08:22:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WO6QMjvXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
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
	Lyude Paul <lyude@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 14/25] drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:21 +0200
Message-ID: <20250821081918.79786-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 256.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 805d0a87aa54..54aed3656a4c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -30,6 +30,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -807,9 +808,9 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	uint32_t domain;
 	int ret;
 
-	args->pitch = roundup(args->width * (args->bpp / 8), 256);
-	args->size = args->pitch * args->height;
-	args->size = roundup(args->size, PAGE_SIZE);
+	ret = drm_mode_size_dumb(dev, args, SZ_256, 0);
+	if (ret)
+		return ret;
 
 	/* Use VRAM if there is any ; otherwise fallback to system memory */
 	if (nouveau_drm(dev)->client.device.info.ram_size != 0)
-- 
2.50.1


