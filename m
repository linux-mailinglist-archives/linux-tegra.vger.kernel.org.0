Return-Path: <linux-tegra+bounces-12388-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHSuN1OfpmlqRwAAu9opvQ
	(envelope-from <linux-tegra+bounces-12388-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:44:03 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618D1EAF9E
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72AB3086A78
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F42388397;
	Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC27k3DP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723B388E57
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527377; cv=none; b=iuFhUsIYr59b2NSBLNHQp+0jHnOGJb8n6SLHRm4DiSb2kZs6j9ZG4SqtkocyfjkI6iOz5kKarSlGFhrZ/DuWaLbPscgwtC+Ev4OQvMal76CqDCmIg2jesKsZa4zny/rP4bmXDLSMRz/UM5xpf48ubjDjk8hdZZHA2tHFW8sfTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527377; c=relaxed/simple;
	bh=UKEDgSoNiWITE5rlNAFBVxpTjkZzbRTCWfb1BLNAxdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF6aGbv3aI8u3W5Cv6hBacvG9bA/lWBm6AXq61zvFh4NJX2hcQww7c1C74QgWotRUNymINBJixuvVhbI/QV9weFsIHFmuakHdhfUDGKVb1GVDpZntrHTklOIi4agH4pWrwWqrL00TpB6vTMRXNZWli0kekT7Jla1hMX24Tn8rHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC27k3DP; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38706b10b3bso98972011fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527374; x=1773132174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=bC27k3DPJXmP7l2zDb8woXq8pYwGxoItoBWPFYGR2Q8EhaA6uixePRayudhFz/Vnpe
         g7i9+lohA1Yay4cNGW2t2H8Q7a5pSarasfzdMWyO0yHEUX2Qb+xbUMSwHyVdlEUrIaqj
         NuTtBMfsibsWeKPltFS0SwllithcH05inndP5UJwgXXRPjeMinKcChYFxH43ycJw98lW
         D9wV3yck+kdrAA2x81FFO+Tlmn0qx8/AuKaE4jn+rpx2NxRR9qEGYbBrqaYgdJ1Hxbz0
         GppmAePG9JnZI6B9RJcjK2JWB7rGVmo4IDo08qtL+FCSdKLb5z/ArRE0khOi1jcMfGTa
         Oh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527374; x=1773132174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tq2yeiELH2O2leNzpOSOy0DgLmB+c4y6g32iEDIZZWE=;
        b=iPGSh86hBeJbuUUoSih1hh70iIXsDMvsMq2PxWVeLKpIaba86toRdOknHeKhTTx7N0
         UQwzQM96srWmEjFpwbeUFJZg2zm6xA7CSSjavSaNQucqgsuUucNd3Nl1BMrJ0Wqch8Xo
         6tZqOTQOYRLYbNdW2ku44zBUKeB3gfqepaqdle36Q2Q/eTOWhtP+A7HmqMNs2SJGa3hj
         8dNwE6snb9YwOJ0OOMuLxBzEWFkUg+hSLmb69jmJiMOrvcg+DK0bdlrEGRaFKFcLvuaG
         3vfvI7TIrWQAvqRZLlD1Wi89QV5uJu6vJHQxWH0ssUdPlWkJuGcc6eqH9lsDdnZtjdxq
         fNaA==
X-Forwarded-Encrypted: i=1; AJvYcCUbs72aZvZdE4i+u0nZC3PdHVDy+EgMmkDNrhfQ030Iq979gJgo70dSDkkCdG2Kpxrp9e0JO6cdO5Rjtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3Fe9FQ8GpRkoqreAhnYHT0Kql6pB3dBURA2rTd4H9ZijhUN+
	yzx0XWf5zH7irVjH0YRbgXMKikXFxSL02VCJpL+vMCc3TaoMRZENFf/q
X-Gm-Gg: ATEYQzyU9HPjA1HWlQISSXoB6EfCVGY38C+Bk9H6KjCXj/crbU2BdwW9Uq13eZP2w4s
	mO1dY6RownmUGbk1qTiO0YGmYeVc6s+7LHFalS4dPvOt6UTfnk/TymSeC+10SRQmvlyyPPlOduu
	G1vDFCf71vt5yPoiWEu3H3adUYp3qPwjn+kixF6yHZmKXk0REVr7lSFE2bWYei2Eq/sw4rQl2JO
	loJ/OCC9aMoG6/lvnrZchhahkz9YikfOYI32cNSX+/7DYRyNrRx1rMkqEcDo0DtPxl7PtGX+vYx
	92Kup7HQcewWlxtHms8eZXZWttb7QFjXun9FQvdXb2JuhsclaRzAeRWy4RRcioXPq6AW8fyptEn
	gmrNSGZjfrdjZ9sUcz9K+6916CSnwTd0RHDe+NQ2AV1a1keB4rUhu27VSkHjsN4CfVjmAF3+h+Q
	5BuB8I9VFSiXdX
X-Received: by 2002:a05:651c:2120:b0:383:26ac:4fd8 with SMTP id 38308e7fff4ca-389ff07fd9amr102630141fa.0.1772527374144;
        Tue, 03 Mar 2026 00:42:54 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
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
Subject: [PATCH v7 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Tue,  3 Mar 2026 10:42:26 +0200
Message-ID: <20260303084239.15007-4-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 8618D1EAF9E
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
	TAGGED_FROM(0.00)[bounces-12388-lists,linux-tegra=lfdr.de];
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e0961bc0a017..19eebfdae221 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.51.0


