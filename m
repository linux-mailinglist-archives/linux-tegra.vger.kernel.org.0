Return-Path: <linux-tegra+bounces-12228-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGzlHhHCoGlqmQQAu9opvQ
	(envelope-from <linux-tegra+bounces-12228-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 22:58:41 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E90D21B01D9
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 22:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0B7130396A4
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 21:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193653B52F1;
	Thu, 26 Feb 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TLOugngg"
X-Original-To: linux-tegra@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FF332909
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143118; cv=none; b=cEhcyUoCTOtqg8/Gzq1flqOo/krb0G2Z7HyJjMc/XiD9Frs6aYGUf6/cqyZCztPUGHKThXgyRsiYu2UeKHeBaBrijjWoKPSQ+6H8TXj6gNqJ92yhRHN3NPtP6ich0yzjpytPw+9RG4NNqg6dy9UR/+nkjoiXBj21vRqm9oz2jDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143118; c=relaxed/simple;
	bh=qZJLjjBAD7plWq9M1o4qPhf0LWqJOLrZBKxxiqMW5dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhKJn3sky3BIVvAkumur3hTtW0D1P1vPGd5nYOaC8PrdxxSt/Gyu6ooQTchtxuK5uo1J2QFWqLmf5qkBmbAURY93QkeBH4py5jV22Lygd+/yKD8zCYNhmRTHgLf7YDOGtbk8xST+t0iusYedGEiouV3yeJ5Yt5xhX5XLCxcnTDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TLOugngg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YWXdveS3W5uaJq5mYGYCeLHABpearsvRw8je8B2ojz8=; b=TLOugngg9sHXvUxXfwmpy0Ua72
	EkCFQJgd9kDFZoujO/ulKE4j5ydMppGQHAkmKObbUEWFxPwRVSkCDbuzpy6sdFW7h4az04dWf4c2K
	qPd+wP2tMMU3iv/Tyyyj/QzAA+VgmOFNgK+mfiPPO/COdBzJhG2jcHwgd9+6W3NgqiaaZlE+r6ZpZ
	brkLk5jdHMz0hl7kvzDqvpn5OZrgHckzZUbvXHNc0mBxc5V7OqHJxj4w8iRtzy2XECXASSCCxrOFb
	PGCgMmKGwUuJCatOCVPAT3P988PIpgGdYOafV2Wn/5AO9OZ5vjOjvFl5bFeg/6VuRcZJfNPEaeFVy
	PRLpV5sg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjNT-00000007HHz-0MGG;
	Thu, 26 Feb 2026 21:58:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tegra: tegra_drm.h: fix all uapi kernel-doc warnings
Date: Thu, 26 Feb 2026 13:58:33 -0800
Message-ID: <20260226215833.989397-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12228-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ffwll.ch:email,infradead.org:mid,infradead.org:dkim,infradead.org:email,nvidia.com:email,intel.com:email]
X-Rspamd-Queue-Id: E90D21B01D9
X-Rspamd-Action: no action

Add 2 struct member descriptions and demote several comments from
"/**" kernel-doc comments to plain C "/*" comments to eliminate all
kernel-doc warnings:

Warning: include/uapi/drm/tegra_drm.h:353 struct member 'cmdbuf' not
 described in 'drm_tegra_reloc'
Warning: include/uapi/drm/tegra_drm.h:353 struct member 'target' not
 described in 'drm_tegra_reloc'

Warning: include/uapi/drm/tegra_drm.h:780 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Specify that bit 39 of the patched-in address should be set to switch
Warning: include/uapi/drm/tegra_drm.h:832 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Execute `words` words of Host1x opcodes specified in the
 `gather_data_ptr`
Warning: include/uapi/drm/tegra_drm.h:837 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further
Warning: include/uapi/drm/tegra_drm.h:842 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

 include/uapi/drm/tegra_drm.h |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20260226.orig/include/uapi/drm/tegra_drm.h
+++ linux-next-20260226/include/uapi/drm/tegra_drm.h
@@ -304,6 +304,7 @@ struct drm_tegra_cmdbuf {
  * struct drm_tegra_reloc - GEM object relocation structure
  */
 struct drm_tegra_reloc {
+	/** @cmdbuf: cmd information */
 	struct {
 		/**
 		 * @cmdbuf.handle:
@@ -321,6 +322,7 @@ struct drm_tegra_reloc {
 		 */
 		__u32 offset;
 	} cmdbuf;
+	/** @target: relocate target information */
 	struct {
 		/**
 		 * @target.handle:
@@ -777,7 +779,7 @@ struct drm_tegra_channel_unmap {
 
 /* Submission */
 
-/**
+/*
  * Specify that bit 39 of the patched-in address should be set to switch
  * swizzling between Tegra and non-Tegra sector layout on systems that store
  * surfaces in system memory in non-Tegra sector layout.
@@ -829,17 +831,17 @@ struct drm_tegra_submit_buf {
 	} reloc;
 };
 
-/**
+/*
  * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
  * buffer. Each GATHER_UPTR command uses successive words from the buffer.
  */
 #define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
-/**
+/*
  * Wait for a syncpoint to reach a value before continuing with further
  * commands.
  */
 #define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
-/**
+/*
  * Wait for a syncpoint to reach a value before continuing with further
  * commands. The threshold is calculated relative to the start of the job.
  */

