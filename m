Return-Path: <linux-tegra+bounces-5177-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C5A39F7E
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Feb 2025 15:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7AD3A3E75
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Feb 2025 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D054A26AABC;
	Tue, 18 Feb 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E8lNW69u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EEoo2tOX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E8lNW69u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EEoo2tOX"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819F26A0D6
	for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888783; cv=none; b=Oo/H8xsAB5vbcLM/RgQmRiOdOn7rHeeBlTKubif8Yc7t7Fqg8ahwb/Fm0j4Q0x4KRO15bPtQHDbYjtcQ1Jh6bbE1legWaHjY8GNi0xaPqJMDj6TsqlclPIIWx9lCFonTqWEF8GpXNNE92x6h2PKpFvL57oiqhY3FxcOEEOmjUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888783; c=relaxed/simple;
	bh=IniEil9/tPMBJFDHQ/IDVMwFvMX8bqWBWE9BndlFGeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3gYxRQipMDAMjj8s80U0e/tlCFKwyLB5oG7/VFaIKy5bzAnx+CqBrdiUWbyJ/BoK+zBFccjDAFGhq1DRjMiXjZz7isF5lHGmud/wm7PBy3N/i5EsXDVv/WaibHYPKNfgDOvUybqkix6544c2h/z0VHz+jInrDHfi5+CJe0yWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E8lNW69u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EEoo2tOX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E8lNW69u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EEoo2tOX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 304BE1F444;
	Tue, 18 Feb 2025 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXXkVioggw/YUY11tuN2xCTCYAkYaOHKcba3KQo1Ubw=;
	b=E8lNW69uvGAv8iUpqRcZSqymkHgSCKkgGybPuRo0si6QaP4kyMIqvOuKSITjN0sN871F2t
	wdTaQCum72PJZLVWshB3JHnl2lkVST6r2u8hmkL8gFct8blSwUiTimIOOol7Szxj0s/x0F
	p6mVk5gGd+Jh8UPeYyqRsS1QChMZqrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXXkVioggw/YUY11tuN2xCTCYAkYaOHKcba3KQo1Ubw=;
	b=EEoo2tOXtY0YqpR/dXqfrhoPUUjqwuOmQUhSaZYfiIm8STt5llE3zx+ParmsTiJCkgZddZ
	AhBCmGC1ei4UR3Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E8lNW69u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EEoo2tOX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXXkVioggw/YUY11tuN2xCTCYAkYaOHKcba3KQo1Ubw=;
	b=E8lNW69uvGAv8iUpqRcZSqymkHgSCKkgGybPuRo0si6QaP4kyMIqvOuKSITjN0sN871F2t
	wdTaQCum72PJZLVWshB3JHnl2lkVST6r2u8hmkL8gFct8blSwUiTimIOOol7Szxj0s/x0F
	p6mVk5gGd+Jh8UPeYyqRsS1QChMZqrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXXkVioggw/YUY11tuN2xCTCYAkYaOHKcba3KQo1Ubw=;
	b=EEoo2tOXtY0YqpR/dXqfrhoPUUjqwuOmQUhSaZYfiIm8STt5llE3zx+ParmsTiJCkgZddZ
	AhBCmGC1ei4UR3Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C832132C7;
	Tue, 18 Feb 2025 14:25:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4H7lJHKYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:54 +0000
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
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 14/25] drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:37 +0100
Message-ID: <20250218142542.438557-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 304BE1F444
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 256.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..daa2528f9c9a 100644
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
@@ -808,9 +809,9 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
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
2.48.1


