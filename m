Return-Path: <linux-tegra+bounces-12399-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EETxGXGfpmlqRwAAu9opvQ
	(envelope-from <linux-tegra+bounces-12399-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:44:33 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93E1EAFCA
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 09:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 327F930351C3
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 08:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894A1390C94;
	Tue,  3 Mar 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKkiCul"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4D39020E
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527395; cv=none; b=CCocrZnZqilg/4cts9mRKBaJ42NbgFi1xjfVqWBkOzgAs7dwQ7wqI7KUpUf4ulksi6S4KRR+UnkxdD1PPGe2DVN6c91lnYYuLMmEUFKUIt1ra9GZYIdHAIbuwNIPZhds+25RMJ0HXnEqPK+Xfx1+3YU8xxj7v7N3fzdhLnsOD8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527395; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m716yGzC1Lt05dWL78dQK4eQi8PpQHc7y5T/n8lGgRShbijTx3CtDTqvUhP2H23uX8M3Lifor4RKu9+/4eMbNM5U7vwnlETQqcsdYZEt48B2+miPC/rJETfJG5iah0p9SpKB74XXNo7ftDHEkMQUfQ7xo/6P7xI8oCEpBxzpDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKkiCul; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389f9895c81so26507691fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=BHKkiCulIAxlD5ZNxjNqNWGaWoouqKF32NnjEF5BHmw8KGAHgqScvQaFXxZvT+C09z
         hkVJ2HY49H4fkiS7f4XrhUy52AyJjlOtcWIjUEiVWWifSpJEnVEmC613RaDHfTh3Eo5k
         sz3HYW5IL50A/3yzpaBMC+mSZB/krlT+hwHHgizI14xRoLDX48ISHBAR/CtbMlXkwwqP
         filXkTN3IFuOT+mXVdzNUzTJEIqRfm6kUnBcyRdBvNVPn0CfWuWCjbgQ9rGOXPRxNZFK
         vqHqM5bpHXr2G9kmZn8vFqber+c1hP1fKf5W2AKvlzsb6zIkBjoSooucotdlH/X5McEt
         MJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=frQDfjJ2eArByqPSjwTpaN/4tLcRGFynbnbcCBfwwLVCEZ6Mhg4151qSaSCRgBYXeS
         12UFEoC2UBNGQNXWnXppjuaCX997RVqbQ/tDnhWthfV5MrEb0d1eapgf0sWNqcO/56Lq
         Kjcx5xztfy1hMQHwraPo4VU5GGFQLoKNA8VXrD8dWtZ4HdCHMYUNIrnogPvLK9Qb22FV
         CrIOFVx6EhoNzcOgPxDjdeHb8l7TIR7ZgS+YzpkEBmwj6y6lQRnMpG2WHvTbIjsPTBhr
         RYtMCpwWv9nK/dZunJjlP7DlauO4EINUGDx4U4boD3jIYiC7FX8dtu6fL+hCb3YKMpNf
         FBtg==
X-Forwarded-Encrypted: i=1; AJvYcCUdqJMnvl5CkU/JgEHk/tKiUIC50cF3R7WHeHJd4s0MCrVj2OJlp41ifu4Rmvux+XiUuKznfD7TTI4igQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEp/WbWgieM1xdErhVddIw614A1W7BbvK0tWOASMuPGbYp4Va3
	knCfuw3shyKm19Akxu9mP8Vel9P6ATpAUKJqkoRPgjzKtqUmFR1rRvwZ
X-Gm-Gg: ATEYQzx0ycey2jFlnVafk0I8sxgmi0jSCZWkFlA1v2nNeN42bIA60uWBeBywSdVRXEV
	Q6QjmIwCW+1WuMA5Ko6wmZ57PPeIcPBufHk0ATGneJhCRsCABv7wDhFf4R6bmoa979789Pm+03H
	MO4MYSIppXWAqBEkf6Q2JkPR7dOAnHbCiM4AiOAiDUXAxq35+QSMS07bO3dSoZyi6Ecwj3743L/
	hDOrnDUQ9Z46BNsd7gzaNKXrEFUaVa7lddwbkvwDwiosOXGZIPiGSCrN/7GLshuQHAd8cEpktf1
	eqZM5CsQbf3EU1W4zziQdUPvl47WgtRGNoAeprLrdh1AVxm6C85cupObbVkXj4SGYNacraN+dSp
	upq/fXPr//b3sq763JPEj1Kf2GHsas5s+K4ADq4X+WnRgyBPvQ2nSQYLLfqEX/gHcD067gJWdMn
	l9e/iRvkczkiII
X-Received: by 2002:a05:651c:4211:b0:382:f78d:a0c with SMTP id 38308e7fff4ca-389ff34dfa3mr115153421fa.21.1772527389114;
        Tue, 03 Mar 2026 00:43:09 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:08 -0800 (PST)
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
Subject: [PATCH v7 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Tue,  3 Mar 2026 10:42:37 +0200
Message-ID: <20260303084239.15007-15-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 0C93E1EAFCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12399-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0


