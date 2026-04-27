Return-Path: <linux-tegra+bounces-13995-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KyUAlsX72kQ6AAAu9opvQ
	(envelope-from <linux-tegra+bounces-13995-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 09:59:23 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC046EAC9
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 09:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1E630036D3
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7FC3988E5;
	Mon, 27 Apr 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2D7s+Cr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73331E5B63
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276760; cv=none; b=H8qI7k0X1vYk67g5JyyRdkLtaOnvadR7ntG1DiAypwxi8Kl9WETRxTVPWpTLObisUDpmNJ9FvZfDWwoPWQNlZB8R+FxvZ7YQ9DQjfE3CJtXNxXCpR0l106ac+2lKQ7mi3z9hmOgN0X1ApfNyTM8LO2wzr57EBkrJgioHob1otZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276760; c=relaxed/simple;
	bh=wdsdYsqqVf8L58eOXUPPjq5oaVFj/MsILGZQA+ryEdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOlBBpx0+xqY1/9O5wwvIubN+t1P48bVx+eC7OEtj5BIq4IcoUhE9UGLYjTndhbAL1/BL80tVtK+uOPNMRSjyxuw+UUJb9/pIOdEWkWQ8cxEuHFDL37VB7phP32TJH8FraA9tepDmYOHF3igelkrAIyX8R5390USmMmy1iTbDB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2D7s+Cr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d74086e5bso9496655f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777276757; x=1777881557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcBXRILgB7ySlKIgu1NiwSsUgu6C/OB+9EO2Yb/lKmI=;
        b=D2D7s+CrsTJ8V7F2PVuxLbTLBAGGJDPP4k+RXrhXmOMIL3a9x0/Peh3dwy37QS/iPg
         ZGkibeuIkNQxvMlHU4MyuwjctjMib3V3RKHG7OwKx9LOokH1xOZLWy5puHsZ9B6grtTl
         ix9jrBYcrh3crvNb5rx+hAzGOmey5Q7Tt6nTkACdX0VBHGeH6Hths/sUo5hUKYnxlK4K
         QrgoWDA8rlYiw0DKYgKrercvdqheUhOvFakaAlYbjDEXFcfpTITZzyrYZf53ALGF14Sv
         j18K+rZ+69XGAfP/xz+2Y89YCqqXSUwFfHugWFAKBVHSULuQEu+6Jn5wZtIBOSfKvNnv
         mrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276757; x=1777881557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcBXRILgB7ySlKIgu1NiwSsUgu6C/OB+9EO2Yb/lKmI=;
        b=CSlpfiBgp8lEDRwgfr/Src2Hc0jBmRuZJUernxYGJCi6OV2pS2KnsveP8TnIn0NC/d
         Q3SHu2TF8OsLFYMGUFb5EV5tisOLwpxlxrkHdJFROZidAD/BoWd4qBc/Y1b+Aw7ev/Dp
         Xhb/Ao40MRpJwUvHCYNqn/liIkvgQn8t1dZ7tp8fTIrn+/GDt/JSywySC8fwNxjz3/AI
         rwzXygBIH6Pw+XK3owuYYDlcfwd6iqPb06fiO8QVYSsZAdIvUpXtr0KJrckphmsiTpAi
         ogkgQTWAoD0wnADB2g8kg644JfjCrWL2H6aH4XuNojcYds7QA/qMO0+uYxVEPpoIXSna
         nHBg==
X-Forwarded-Encrypted: i=1; AFNElJ8sA5XlmJHN4+3Y5EovgOJCWgv7NQ/oLROjfLq8G2pVvleGiecL3qCNC1ay2CKoZpImVp5wbYQKzecN1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBgVwRaEq0rDs6C1ZIL6x/LRrqF2FokT2Q1p85npMxKOQ9YTL
	3Jxd0+fx/2bTDdemRyuCGPqxZDbLFZMttzO6mljLBqusyvJ1ewy5OUTOkKeXw3uQ
X-Gm-Gg: AeBDiev93NWELKiRf3E5E2DMdHkg4xbNbFThOttImClvRs3yrBY0yaqswXisu/QvlqN
	9xlwbwt7M8blY8VrxtCUCXASkQ0mLA3y/ype0dhTbw0FABJ5eMT6pHIdLbLAkz4Ypxlj1UwOKWf
	1V9gOYrq/Lp5zGf96FZhOY11XLQ2kOS1u4foF8c8/Bpdk5xgr/4CdD4ZZ73oQ3JBLD5gSVL6Y6G
	L8IZOLKBlY7g198KD3nwGl/nRpUPt1fqtH2hTqIbCGdlJuuu7KC5D6ZA9fAUcU/hcWc91kwk/aH
	k+f2dYizlUVtmUJZUGXPlxnKRPKDY/PXYZs5dm54kQGJiVRmL7w+CEKb3tR1llXgeimLn3eHmat
	3Q6ji1Pgc+GgDMnRq2KmjnGXWvxU0I401g4RuyUlm/14aL8toVCqe5PAg1hn1DXZMKMOTkuD+qR
	GSDlWRsF0FgOmCjYjafYDXTwuuDzdmBqQGww==
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr62576337f8f.29.1777276757142;
        Mon, 27 Apr 2026 00:59:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm79918386f8f.2.2026.04.27.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:59:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
Date: Mon, 27 Apr 2026 10:58:55 +0300
Message-ID: <20260427075856.85208-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 70BC046EAC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-13995-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,agorria.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The gr*d_remove() has pm_runtime_disable, this indicates it should be
paired with pm_runtime_enable in the probe instead of being inside
gr*d_runtime_resume().

Ion Agorria (1):
  drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe

 drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
 drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.51.0


