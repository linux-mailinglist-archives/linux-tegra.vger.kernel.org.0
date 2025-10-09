Return-Path: <linux-tegra+bounces-9740-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3CBC9492
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Oct 2025 15:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7FB13518F5
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Oct 2025 13:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837642E8894;
	Thu,  9 Oct 2025 13:23:20 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A162E8B60
	for <linux-tegra@vger.kernel.org>; Thu,  9 Oct 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016200; cv=none; b=mv6i5mJ7hoPbA4XMgugf85n4seM3DL8svIFTqKeFEmSBRf3IGlGAfB1Ixy5KCjtAUjB+Pdh755WajBx4h7sY0za27YXoTv3aWptnHuZ+sAm57SExprM8tmPd7fW+r4ouoX5cGs7nkajRw+CSxqmioq/9F3nSPCwFCuQ0fEd0Qi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016200; c=relaxed/simple;
	bh=dg8LwCfF/s8VbBOeA9ufiEvPZz154P6AOijDNNy9pAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gd8B61avPtsA+vbFhgS5+kedtNsSVlaetMtOepT38lNHcVlsOAKQ4yV87a1q7kGr7vgJ/A4yle+dweczrUAX1oHm90QwVlRDvSuZKE9Fy02PZ76Zc0rYqfnEVnBHysCEdUFQzd39bHI/XTAQ+3MGcuziPxuwCkvmrJZ/Fy5UB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D16C51F7E1;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7916313AA6;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGdeHC+352iECAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/log: Add free callback
Date: Thu,  9 Oct 2025 15:16:30 +0200
Message-ID: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009132006.45834-1-tzimmermann@suse.de>
References: <20251009132006.45834-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: D16C51F7E1
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

Free the client memory in the client free callback. Also move the
debugging output into the free callback: drm_client_release() puts
the reference on the DRM device, so pointers to the device should
be considered dangling afterwards.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 116e0ef9ae5d..470df4148e96 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
 	}
 }
 
-static void drm_log_client_unregister(struct drm_client_dev *client)
+static void drm_log_client_free(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
 	struct drm_device *dev = client->dev;
 
+	kfree(dlog);
+
+	drm_dbg(dev, "Unregistered with drm log\n");
+}
+
+static void drm_log_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_log *dlog = client_to_drm_log(client);
+
 	unregister_console(&dlog->con);
 
 	mutex_lock(&dlog->lock);
 	drm_log_free_scanout(client);
 	mutex_unlock(&dlog->lock);
 	drm_client_release(client);
-	kfree(dlog);
-	drm_dbg(dev, "Unregistered with drm log\n");
 }
 
 static int drm_log_client_hotplug(struct drm_client_dev *client)
@@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
 
 static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
+	.free		= drm_log_client_free,
 	.unregister	= drm_log_client_unregister,
 	.hotplug	= drm_log_client_hotplug,
 	.suspend	= drm_log_client_suspend,
-- 
2.51.0


