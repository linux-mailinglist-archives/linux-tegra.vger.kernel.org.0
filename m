Return-Path: <linux-tegra+bounces-5541-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62248A5C949
	for <lists+linux-tegra@lfdr.de>; Tue, 11 Mar 2025 16:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 876FD1709AC
	for <lists+linux-tegra@lfdr.de>; Tue, 11 Mar 2025 15:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4425225FA0F;
	Tue, 11 Mar 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c5QgyUMR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fqCLHjQJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c5QgyUMR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fqCLHjQJ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01B25F7A9
	for <linux-tegra@vger.kernel.org>; Tue, 11 Mar 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708504; cv=none; b=L2OtV0K9tpzjQ63NITphXhfGoA/LWshNWoaJBZ93NfNgy25jK8Q/XM84JFPobKreMsWYPGEHL48KqJuPqW/IA5ZitqAzEE6jnZJqunCpV/C/XUHspgaRNHsYYZH47xRaWAn1vACxMhVjv2TKAQ3fRhCKQs6z1N1nLCj7v8VRhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708504; c=relaxed/simple;
	bh=AfDSFAjEXLDEwfqLIVHaYsCz+T6Zyjpp1Z8dctpREFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZdIF5C/xYrbCKmwm9earDRhBb/RjhVQHNay/gJYWcNXHxbepqb1O9e/1grXMfCH3s3BNAHgHiM6SQcw3R7O8VvC5lyN18Qoebj0s8dVs7FMIqIoBLknAX+XDemQq8SbM/OFijkXozO4xZj/iFynAOJjRkRv5gyHJCFLENkz7ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c5QgyUMR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fqCLHjQJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c5QgyUMR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fqCLHjQJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02CA821182;
	Tue, 11 Mar 2025 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/ul14IrM0uo8R4Fn9Yzk2D5pnGb4X/CD2s89jDy53c=;
	b=c5QgyUMR/5N9VZDSoO8HIzx7SJQIOYyD1kff3Qoy0l+0rW36oZ4Ip9cpufRtNDfx4Cd309
	F0RCrh5IrM8CZ5i/tYbae8T5ned9eWg77T9nuJEVtEcEL95wWFiRvtfCyGRWrG11qkF4wk
	XQ+s0D0RcDG2/JXd+E1vWqWkknTGiEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/ul14IrM0uo8R4Fn9Yzk2D5pnGb4X/CD2s89jDy53c=;
	b=fqCLHjQJeaE2Lph8JpwHNy9hLwoDx2rxzp5Ah3GTFPJzanwOI2U64iFi9Fdicg1oKrCgJr
	LNa5XXuVcxwe6WBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/ul14IrM0uo8R4Fn9Yzk2D5pnGb4X/CD2s89jDy53c=;
	b=c5QgyUMR/5N9VZDSoO8HIzx7SJQIOYyD1kff3Qoy0l+0rW36oZ4Ip9cpufRtNDfx4Cd309
	F0RCrh5IrM8CZ5i/tYbae8T5ned9eWg77T9nuJEVtEcEL95wWFiRvtfCyGRWrG11qkF4wk
	XQ+s0D0RcDG2/JXd+E1vWqWkknTGiEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/ul14IrM0uo8R4Fn9Yzk2D5pnGb4X/CD2s89jDy53c=;
	b=fqCLHjQJeaE2Lph8JpwHNy9hLwoDx2rxzp5Ah3GTFPJzanwOI2U64iFi9Fdicg1oKrCgJr
	LNa5XXuVcxwe6WBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72B74134A0;
	Tue, 11 Mar 2025 15:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GOVMGslc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:49 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/25] drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:08 +0100
Message-ID: <20250311155120.442633-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d99dee67353a..849ee2cde990 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -18,6 +18,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -514,18 +515,11 @@ EXPORT_SYMBOL(drm_gem_shmem_purge);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args)
 {
-	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	if (!args->pitch || !args->size) {
-		args->pitch = min_pitch;
-		args->size = PAGE_ALIGN(args->pitch * args->height);
-	} else {
-		/* ensure sane minimum values */
-		if (args->pitch < min_pitch)
-			args->pitch = min_pitch;
-		if (args->size < args->pitch * args->height)
-			args->size = PAGE_ALIGN(args->pitch * args->height);
-	}
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
 }
-- 
2.48.1


