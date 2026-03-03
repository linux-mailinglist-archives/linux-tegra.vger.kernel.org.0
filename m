Return-Path: <linux-tegra+bounces-12389-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cALWEamfpmlqRwAAu9opvQ
	(envelope-from <linux-tegra+bounces-12389-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:45:29 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE81EB018
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3DEA30E97E7
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541C0388E79;
	Tue,  3 Mar 2026 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRx9hkyS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958EE388362
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527380; cv=none; b=VNdo0Yc2/0qsnJumfrRAMULFjxEBFbPFMOlZkxIoGzJZ3CpeJedMEQx0chN5LTCUR4bfMO0rAQroQ758MPKgGIK8VRu6GUUwjLYlnHCkY8Tp0HqiNs4vZ3NhwN4K8haNH4xEnH8kh+okRY6SmN6GPtn3JRDmxk3AKNNGZ8YfhDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527380; c=relaxed/simple;
	bh=MfI5zeRl0pyQjV4WKNqmsKtJ3wxSTwwt/NrFXusc/w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzH6T+NNvOvVei0EtOsDtdDUnWMsQ6SpAqoQ1rTa7m0gCdXelS4jnLsK8s/1WXvtJ2dUBpHl1cTJgFVA3cYMofkA9llQKci1RXancXUYmAt40PlzHRSR35Zsluq2yTY0YtbJidf5jAB+APzgWkWuyBJO7x2F5SuRo9MBsqjpONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRx9hkyS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-387090ae5b1so89221091fa.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527376; x=1773132176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=cRx9hkyShcQs+n0ALDSczbUN2a3BCfpLP1ZWn+ijgqQUWiZ85gRVOB8UnJmWlxNEaA
         SgPfbtnouuH03yZaFfo/sLf570dheK207cERwDWYmBmNyOtix0qNxw8JjFBI0UM0Uj/O
         JE81UfYW4TOzQDGKcAEdVd/yXOfUCF6rRGQ4ryZoq7BBC+XdtP8u9rsPYCTLOV/V9ZBA
         5rY+RM0FF60LRFdrv/inZGmNu/3zwyjLsCqJwxK8BsAoTP1WTJ8x4tD9DMag7uwtm7gE
         ANUsgNTL8hDZqPxyML8W+xFWvle1aKvM4YYKHQO5c2bxXua7KrldTJFQqNEDJsOU/gzc
         udQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527376; x=1773132176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=S7YwIcgLvU83IHnO1RgEwOOWTZ/kqq/xHIZVqhk6bs8XU5XSh/z9s9/40oq5mw56b6
         rQDHmb4WTMInhv9RGfRtZf0xQFmJdF6bSk5ypvF/VfnqEzZ50AllM25GRI4vaPLDyYji
         7fTzJCGCgVh0/JDAWDBdKAQkqdm5BDh/6bKBdGK+oiIbMwzOUXJPcMzH/llAWx6wA7Qx
         shlnf+NQtXRcPDm2yOPhaW0IzVSQFJEHhzKQTSduDMv74/06XrfS6SdrOlnb/dSum19N
         IqN7qAtZEtRCd/aN18gEZA78ZGlRn5B9vj/OXm2GGM90kd6/Kj6pjY0B3xRYrWROftbQ
         G5gA==
X-Forwarded-Encrypted: i=1; AJvYcCV//cpXf1xQHdpCdJ2VPOfsgZMCh5YXDe58kpezVDDk46tj5fZvLu/ZZOQ88LWBRMLB3PvycxnJ7ZqGMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcPexPE/EzRAvUzJ3HFF6idGzdf050t/a/RE7UEgdx1Vh6Iev
	nbGBT2i+u4b2Xr9qyJY9kgQFqAPfhxziBJqmQqHvg4r8F479uU6s7KHw
X-Gm-Gg: ATEYQzz2uj0tGVkxZSdszxPGz+kc3HoZneWij1++mrJQw3iuC2+frEOMpnaVQMsfqrD
	rtiWggSWreHsq3trBDbCHovhv83uBT5Kya8Gdn6FY1D8oLnXGoFvApUXfuC/yiAAWcQD1+Qfc0A
	fo8rWGqsgjMNt4KeTKX0S1YXMU6+zsAwOrFRbjJ/bTYd/UKcQ6m14poDA83j4SFRCex2UzUTZyH
	ON0ofredfQTxbxrIjAcuWlaKwsuasdNHPiUX1t2LY5dsiwxfp37cc4pliINolChjy6F39Mw0ZjQ
	MvyXUkEZKMB7wCADM/bwJ8gbAn+YK6RDsZ693HLgboSKltIP7fK0xdSi0QIiIBwWylkh/xNKitV
	3I7D7WDaHtr3rRbr7YQ3gJAyu3JOqvtUWZOm6gPZMqXbkvsqcuPDbUGOZ4W0263Yv2bdR5mtO+t
	pWsK0aINiWzXej
X-Received: by 2002:a2e:be23:0:b0:387:1836:e7a3 with SMTP id 38308e7fff4ca-389ff105659mr100636351fa.5.1772527375546;
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 04/15] staging: media: tegra-video: csi: move CSI helpers to header
Date: Tue,  3 Mar 2026 10:42:27 +0200
Message-ID: <20260303084239.15007-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AFEE81EB018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12389-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..f858c05ce6c9 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0


