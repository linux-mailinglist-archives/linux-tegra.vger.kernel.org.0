Return-Path: <linux-tegra+bounces-1302-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466388A8F6
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Mar 2024 17:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07FB03665BF
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Mar 2024 16:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A0A154C06;
	Mon, 25 Mar 2024 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RB5vHCsX"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48711131187
	for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376400; cv=none; b=PDXxlUG+07TwMjivNnC/iOZaO1hhcfVHYSEJ3IMdmdgyBYQ15VlY6FJ3T8o/dTn5LaZ21SCk2abinj9hW4ZqiUiPjRwkAuuSKNGt7YLv97+cNiwb9EE77Pg1gVuZoOr51g7SHAT20xQGWBg5ffUQrl6e6ZWYSokqnKewKSmIZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376400; c=relaxed/simple;
	bh=u7jspQ3Aev3XJQiTO8vdl6msbbnJu1QvF4iX1a51EjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmxZdGy081H0AF9uD4IxaONIiY6632gbNgYZo6VvhjT4FlT9dlp5bg19wlJz2LmqekJPSqnHz/5TjLFypeJ/Uew18kuo3ngoBLuwY/VM8jf8JJRwv3BgRDRu1rqAcPl0S00EVpvLIx3XjtBtRjUoYgjiciy/xDE0XoNUk2kbc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RB5vHCsX; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c3d404225dso232887b6e.3
        for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376398; x=1711981198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=RB5vHCsXeJQPDsX+7xtNvbzCW3xKQ555NM6Zy0cGCvBPID21EIiJ4z3pKU220Z+qO2
         9ioq1PxHXvQYTj9/+pyu2b3l3mI8W3VFRn7UzSkMR1RbdrAP6HzUHeOzfNJSQlQjoF6M
         s9qy8XEEochHe0t9LCq6Ww0AwjRwRrU8vnM8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376398; x=1711981198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=RIK+0MWCYSuNiHMXXfIoDcKgFzbsEwwTyKr1rFeV1Jw8N/YZuDbeyWQloXDYo/rwo0
         mgAlsoOYcTfslucTFettZ4/grVrm2McFzY8EXRvyXaZwvwJbR7iQbVMeR8Z4xyNyWmEn
         LbE2dND2NTf4/GW9CWodNApqngYkcbC/2k6kw/wPbcw4GmoLxKOQY6eZDt2mdzShN0Q3
         QUqzOdNBT9i1U3ktlV8tq8DYQIgJDaKBz0a6r8+tUJKvJfEvNfbbuLiY6YnnmMuEYal0
         6ZyAAECUwhhHF9qDdFQNOQVAKl3ehL/n1Mopa7vHW/bbzUtCr6AEageoZlLiHWBgRO3P
         4iDA==
X-Forwarded-Encrypted: i=1; AJvYcCUfxgrbepqRac2RaOfAy0Gv6FBQSaeAwmR+emcZe2LknOP/Joj2Gq74uUkc12+sTgcDD8DBIPtFydojIcQh7k/iWwv05VnXr21/MxU=
X-Gm-Message-State: AOJu0YzYwU2v5Z54U2tAhR8MKNoGgiH88mqNMfID4q3Lb8r7XcPMviRk
	dxFXbzYZ3nq1J93YnhAc0aUxaGDHcsCsJJYeYx2ZMh3ikgFFpbSwrQWvcqG5JXl41NEMsU2fi+m
	ZMw==
X-Google-Smtp-Source: AGHT+IFXDkHwTGNUZBxyMK2jzEutUrDBtNUTzl+YFRneAkQppTPw7jEE9XRF/qu3laG74FPOuty29Q==
X-Received: by 2002:a05:6808:15a0:b0:3c3:c923:4f03 with SMTP id t32-20020a05680815a000b003c3c9234f03mr6512221oiw.19.1711376398398;
        Mon, 25 Mar 2024 07:19:58 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:55 +0000
Subject: [PATCH v2 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-3-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Because the size passed to copy_from_user() cannot be known beforehand,
it needs to be checked during runtime with check_object_size. That makes
gcc believe that the content of sbuf can be used before init.

Fix:
./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 733d0bc4b4cc3..b43695bc51e75 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -956,7 +956,7 @@ int dvb_usercopy(struct file *file,
 		 int (*func)(struct file *file,
 			     unsigned int cmd, void *arg))
 {
-	char    sbuf[128];
+	char    sbuf[128] = {};
 	void    *mbuf = NULL;
 	void    *parg = NULL;
 	int     err  = -EINVAL;
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c39b52d0e4447..630e2ff987a37 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -164,6 +164,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	unsigned int input_mbus_code = chan->fmtinfo->code;
 
 	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+	(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
 
 	switch (input_mbus_code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -176,7 +177,6 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
-	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog


