Return-Path: <linux-tegra+bounces-7351-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C578AD8737
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Jun 2025 11:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B99D189DB5D
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Jun 2025 09:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E8D280CE5;
	Fri, 13 Jun 2025 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QE7fkLNJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GPaOUVZA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QE7fkLNJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GPaOUVZA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F322C1581
	for <linux-tegra@vger.kernel.org>; Fri, 13 Jun 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805569; cv=none; b=a1e56w6QGJ5aIvcRX3oKJmowN6ocpXbF39UBKg+nb16osCuTDQdfHsa2JbTTTTew2PpwNJ8OgbO4EBk2ea+JVtL1nMoSkF6q3YAa63P3n6DbV3+71vcNYUDI6rDLrQ9qD1xD/DadIe73s9ugtOkUAcoq+JmW3bggtoxyvU4ubx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805569; c=relaxed/simple;
	bh=g1dZMYiQ75ic4iRGisKtFioZlxQnhVhWZyIurZsL0yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsJZMQCFiarS/9w+dpXaJgwM7nThP3+gifPtLxJvmCdo/TbYwPutZFK1OSxNJcJYwYyZi/H6QUo5c1Bttg06IyvHCM2SOAX+TNHjt0NbZHgRXBnbHxbNiS4BmTyPFddfLtFuNSQdZfKnvq2+24iDW6QqDkfr+LX4MFNshoybMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QE7fkLNJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GPaOUVZA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QE7fkLNJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GPaOUVZA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BED271F8A4;
	Fri, 13 Jun 2025 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqVzMC64hvC+7n4s+zagscNMG8z49p/xDo5yj6299ic=;
	b=QE7fkLNJpZZ5Y/enRElmqFiN996t6m9WB8szSbq+sahlNNtoLWRISRt+d7wK99MsDkgQ9k
	YK7+JZM1PPGB2uf3anr8fKHW7PzyOUZ+ZNA2O7t7F+3FfCtBfuy6lMtYABw69JQqMS9hWn
	XKypS5eVxU0H3mD62sGg2mxMNxmXYP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqVzMC64hvC+7n4s+zagscNMG8z49p/xDo5yj6299ic=;
	b=GPaOUVZAJNwfFGBBl2PSl5SXv3KO3/KOBxkB+LpOn1Q/Le3tMxaHpE9QGXglu9CpTeGDFp
	JFEIMvyGQsZlI4DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqVzMC64hvC+7n4s+zagscNMG8z49p/xDo5yj6299ic=;
	b=QE7fkLNJpZZ5Y/enRElmqFiN996t6m9WB8szSbq+sahlNNtoLWRISRt+d7wK99MsDkgQ9k
	YK7+JZM1PPGB2uf3anr8fKHW7PzyOUZ+ZNA2O7t7F+3FfCtBfuy6lMtYABw69JQqMS9hWn
	XKypS5eVxU0H3mD62sGg2mxMNxmXYP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqVzMC64hvC+7n4s+zagscNMG8z49p/xDo5yj6299ic=;
	b=GPaOUVZAJNwfFGBBl2PSl5SXv3KO3/KOBxkB+LpOn1Q/Le3tMxaHpE9QGXglu9CpTeGDFp
	JFEIMvyGQsZlI4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23BA713A9C;
	Fri, 13 Jun 2025 09:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6KJ3B7LpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:50 +0000
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
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v5 21/25] drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:40 +0200
Message-ID: <20250613090431.127087-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,redhat.com,chromium.org,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 4.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 90c99d83c4cf..7e515d6e781d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -23,6 +23,7 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 
@@ -66,15 +67,14 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	struct virtio_gpu_object_params params = { 0 };
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
-	uint32_t pitch;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_4, 0);
+	if (ret)
+		return ret;
 
 	if (args->bpp != 32)
 		return -EINVAL;
 
-	pitch = args->width * 4;
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
-
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
 	params.width = args->width;
 	params.height = args->height;
@@ -92,7 +92,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		goto fail;
 
-	args->pitch = pitch;
 	return ret;
 
 fail:
-- 
2.49.0


