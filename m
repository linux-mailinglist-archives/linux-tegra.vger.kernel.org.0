Return-Path: <linux-tegra+bounces-1788-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4248AAC36
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01E64283015
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CEA12FF86;
	Fri, 19 Apr 2024 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vw2XJPuH"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD092130A4D
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520188; cv=none; b=pnxXnmueGbM4A3besJ2repHRgPjIcoAEivStSfzkG+Vd5+gKapZK3bUA07J15m1ptik4YVcacab1Nag8V6ryEkLYEWGFtUZ8L9a0FGdcYUePiZRgiMG103aLwbbV+bk309KnEtOx7j4we/imWZGh4w9sYYHK1H+c17L8pSdLadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520188; c=relaxed/simple;
	bh=kVHfPXf+aJiHcuvBXYKvN9J4cRi3k9vjohaInvrzoF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jY07psmOQS8AysNmau9CTmrc86pRTNc8bus9XY8kkYdb/eI9Dr4pf38YRUJIPyhPWDOFbgMHMkEL8ftEfzpH+W1vZAVIPtuil96ZCHj96Lo9mU2XXGywm4fyGSmHCmhGT8hERhLTzuLOsY0xiFyp9VeU92YPJ5nBwAqdT2F5sw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vw2XJPuH; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78edc49861aso124952385a.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520186; x=1714124986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=Vw2XJPuHWCVTRB0iEXZ53SnOAN4jpYhdj1wIWOcRqY5hGxKRv656AdWslYB8uX88tP
         EQoS69p92Mhox0z8LIcDMq2zXNmb4Xys+ypmny73pBc9eXkdxEe836/PEXBIsU9YI3dz
         mRPnexaltu7mZlFdvPCslsXezgWOSBnfLHH1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520186; x=1714124986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=BBFERxxt5BGZ2vVL0NCdM8xdWYN4xDgszId0/9J27DHY1kynoJp6dLOu/QC7fdse5d
         bndXBErOGFj0uEmXttyyfuoKleUYTAIfqE2SxEjhCzp3X2xzBUadJF5hU/rNuEA3was5
         dc9iihZJj9dL+X4Zak0pBeJpUdebuZ4gO6hStScXR87HJWau6hCdTtT+UZwcKWmMnDz9
         b0hMSDDDwTKC2+JAsRDYzGWGWsa9r8cYRuKydptu1bR6HgjK935auima68aMZcKyOzan
         OrpzikebqiNrXyM8ejdcIxLGdrPZxKNU7WH6JGDu+M8LkPd/vx03cm0pX29iHUJIg84v
         Qi+A==
X-Forwarded-Encrypted: i=1; AJvYcCX5Ajt9q0s/PswsCEVVjsMvvdocKPjDCpsdQLY8CkuGV6zP+tAdPvEf8UNpL0e42CUaImhmkZhMmkcUHKp7kuHdBkgUajfF0/x1RnU=
X-Gm-Message-State: AOJu0Yxm9ANlNLdkVx7dFrr2ndzOeYtb9eOpBS4YitCXNbUR1DDwfi+y
	3W8jGAGNp5xKXhUpqW2azac074j8mO9FOfYGfAVao3VOcmN4DTC5PCQwdpMeBA==
X-Google-Smtp-Source: AGHT+IGmrMUnhFDPACSHoV4O9y/blrNx/1c6IZqAeqIu8A58TfBv2t0AZdePdmIMfSq3rhn78LSShA==
X-Received: by 2002:a05:620a:8116:b0:78d:7036:fbda with SMTP id os22-20020a05620a811600b0078d7036fbdamr1727540qkn.75.1713520185768;
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:09 +0000
Subject: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
 us_per_frame
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..2b2874aedb2d 100644
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
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog


