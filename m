Return-Path: <linux-tegra+bounces-7474-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D32AE03E9
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Jun 2025 13:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA085A42EA
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Jun 2025 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAE1241674;
	Thu, 19 Jun 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2o4O6yP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GCKvnFDR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2o4O6yP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GCKvnFDR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2417132103
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332890; cv=none; b=BsHp4uhz0nsiLagH2N4B3jnQSTtcvnu3r427EQo3bWs51Wsuh+nnB9vHX8jqwyTocdk4qvXPhcG+Ep/eE614EkMHElFufqey9VIiBXq3ZU2dGAhixk6Z2KWbAZTKr5xp8syCVHHS5HYVTgzk+wJY/jhXfVQX4T9VPI6zER1fb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332890; c=relaxed/simple;
	bh=ZXKBeOTXPuz4l9GHjs9fxpPy5jFinBrnYQ+zH76YY/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upaySxfoX97LBMuxMLQfh+Xo4LzZOsqXoF7jj0aWm1ADnA0S8gN5NrHMlheKn68QQuXXRLrXcEzOERq8zcFHPIcZDCMyEtcoZ8WnfysSgzgjDjegySZtmUR865KHTkjOkLPs45zs2xYANfIh2iWszA4S1u1FL0Ce77BWXUysW80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2o4O6yP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GCKvnFDR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2o4O6yP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GCKvnFDR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FEE3210EF;
	Thu, 19 Jun 2025 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmHPmzvjxvxdwtRekcFFqaEjoma0O1C3ctN6GutQTfg=;
	b=N2o4O6yPdboc+oTOve3nTyScFKDhk+iK4DS7lXoDxkiBPxvUinuHdlZyaC6jEuGj0lMQj6
	vlYFHvnoi0xSI9bgTtyI28U+I6wRqYp77shXv6TEP28lLD/Y7l56yC4vrYyfH55A2TOAuY
	UtEenMx+R5aTE5/M9C20WRQgSvbwi9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332881;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmHPmzvjxvxdwtRekcFFqaEjoma0O1C3ctN6GutQTfg=;
	b=GCKvnFDRwRdSh8Fqr6+8GsUoV2o8rpZi3H3vcmvnCPMZ8QeR3ghC9fDJKxOEA11NYo/DCS
	Ogw2gnq/MyFzQgDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmHPmzvjxvxdwtRekcFFqaEjoma0O1C3ctN6GutQTfg=;
	b=N2o4O6yPdboc+oTOve3nTyScFKDhk+iK4DS7lXoDxkiBPxvUinuHdlZyaC6jEuGj0lMQj6
	vlYFHvnoi0xSI9bgTtyI28U+I6wRqYp77shXv6TEP28lLD/Y7l56yC4vrYyfH55A2TOAuY
	UtEenMx+R5aTE5/M9C20WRQgSvbwi9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332881;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmHPmzvjxvxdwtRekcFFqaEjoma0O1C3ctN6GutQTfg=;
	b=GCKvnFDRwRdSh8Fqr6+8GsUoV2o8rpZi3H3vcmvnCPMZ8QeR3ghC9fDJKxOEA11NYo/DCS
	Ogw2gnq/MyFzQgDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB023139CE;
	Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iAvtM9D1U2hKbQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 11:34:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/tegra: Use dma_buf from GEM object instance
Date: Thu, 19 Jun 2025 13:27:01 +0200
Message-ID: <20250619113100.70292-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619113100.70292-1-tzimmermann@suse.de>
References: <20250619113100.70292-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,linaro.org,amd.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach an implementation
detail of PRIME.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 8ede07fb7a21..41a285ec889f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -526,7 +526,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		if (drm_gem_is_imported(gem)) {
 			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 							  DMA_TO_DEVICE);
-			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
+			dma_buf_detach(gem->dma_buf, gem->import_attach);
 		}
 	}
 
-- 
2.49.0


