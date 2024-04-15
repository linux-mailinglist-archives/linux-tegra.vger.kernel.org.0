Return-Path: <linux-tegra+bounces-1675-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B46068A5B0C
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 21:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A70EB23DA9
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 19:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CB415FD0D;
	Mon, 15 Apr 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lIyai6wr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30215F300
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209695; cv=none; b=dafpo/dyfLgLBAHOjGPORRX5rQ8E1L+LJMhMl12zdPY8sFCEBzCboPx54FYRkjDJ/dI1exhpKZuSIXFZj9ds+5Ys1/mLEZsbYv9ecodby+MEI4V+2b3en6TvCfQuAPF/Na+9WRd0Y2Sy1Rbn4tUk5uo4/WzL5Pr5QMj2z5IGMTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209695; c=relaxed/simple;
	bh=3+1Bl8mh/8+eBa7Eij9anNi89S/ycWDT7MhZBO0qMzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4HM1j2c+Wdz9dXyHlC7EUUpIwtITjN99KAVHSpRmVwR5Yvx60xrm070LPejkovdHaDNBrvPEOkFy7kJ10dN6i5D1ISR5h7ip0XE2LxS/BAmVOzAo5xu44zEGipHRh4i6Ybl53EQjQNFJKH4sg44yYZ22tj5UZYc+lK1s/f572E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lIyai6wr; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so2194156b6e.2
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209692; x=1713814492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=lIyai6wrhkTq1KgJXWND6e7iZcGU3W5PDuicQ9o3kOu9cam4Q//AywMviobqx66UJW
         FY9tN8SVI1UeRsOuMQM2+tJVjWi8wjNJ3LW6NqTuUjqZ45YuMa7pgDv5WAkj1QTS2JYE
         KKskNvykMkRm58jLJoC6w9FB3YaP2y6n8ugSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209692; x=1713814492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=tXforxbSGRijT4PWekOzuBXWkd23u/Q3mt2TX5jDtXf7KkgjMSrLtd7lYRl4NryTpz
         9qshwxGAv4HFDnC5qadT/Sg/K0kTk/mfM3TzLAkNzDIxktzAjfd4+lDxsUwYjPqOk6zT
         w1sEH8wQ7spenkl6YvkGa/AaTjYjq/vkYBeA23CXkg96iVPDCVyvlPj8+4E2iLQFUaw4
         9AYfRfuiA4T39Dj4N+TjqvLew7v7hyCsK7unjrJz7hgRbTMImDrKUp54SuwMv6rjwmjb
         pDoLmsFcGXIbOPY1qowgcML7T3lYlgj9X8x6LjJa95j/f5a83YFxrgY8vd34toUQJUmz
         wIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPgE3Dzss/5WQoBBpOlZsY0EMPfz7w0I7VvScpMj+dlWbRI58Xxt9SwFInznnR+fCDIi1v61Eb1zlj5FbUZiBO1X4A6aYbM5sta4E=
X-Gm-Message-State: AOJu0YzIKwM7UcrBlyrULP0MAzgh3MJT+1DxmADYfg+UZFrfAGxmcY4x
	W1jYvQ3JrX05Y8JDiHH995JHMxQJISO5q+LSX1JH3b4ybPSbJLAODSRAp9uAIA==
X-Google-Smtp-Source: AGHT+IGZ58NMkpObXyXFmK/dlwdDRAXnKMQeVrLnGqtYNcTRA6TD/q28Ror56VZ2t4DiW7soUyKUtg==
X-Received: by 2002:a05:6808:128c:b0:3c5:fe95:2371 with SMTP id a12-20020a056808128c00b003c5fe952371mr14036703oiw.29.1713209692296;
        Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:38 +0000
Subject: [PATCH 21/35] media: venus: Use div64_u64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

us_per_frame does not fit in 32 bits. Use the appropriate div function.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..1dffeb7de76e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog


