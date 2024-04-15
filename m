Return-Path: <linux-tegra+bounces-1661-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248F8A5AD1
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 21:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88417B23299
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 19:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC8715AD80;
	Mon, 15 Apr 2024 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O8z0ldQ5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C715A4A1
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209677; cv=none; b=pCEtv2Gt4jHuqqBg2uhW11nZwadNcxvebk/HXOru3ZzV8Cw7gWuqjMDbUanijNBY1C1MIriyx7cjxvBmhgL/76FT7wjzex1oNZ5QDevDtpeuP8P1VXKYA/MnuvrSlF4HIU5IZu8G7N/BnK/RqAL53Muh/1fOs7NdfsoJM1lWT9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209677; c=relaxed/simple;
	bh=MDmosbXICkX9bO71/PJtanzfOgiN7bkwjkKDajARszU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBtjqBo94PRzydWslbJzqZuKkMaBHS2y3uQXERTDqkWU/XyOEvL9j2eAhOdw8kxpia2RcyT02zg+umC75ObhAwVk2jfWR+RnNLLbsLa1/Rgp+Yan94MXTnunDDNaCr0hicIlqysn2nbjDC+raA83Y3M5SYNqL2TERe+h5+c8XQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O8z0ldQ5; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78d61a716ddso251504785a.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209674; x=1713814474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm8YRFoKsGw65QxzcHtGCuYCsdcn5gIPOa2id9cD3ac=;
        b=O8z0ldQ5QYnBjoKoDhIh5Qh/8gkskjSS3bwhjAt+tl+eK6IhSe1vqtbt+GIFuxb+/U
         jRJEFYmz6OOh/a7X5OzVybIoN/qdfidEjUMoA7gKACKJ/TPLOmQ/3tZ64oTZ028bL48w
         ZCoaBZq0gBdILFOLgpnVGU/H/EpfeE4Nomcsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209674; x=1713814474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm8YRFoKsGw65QxzcHtGCuYCsdcn5gIPOa2id9cD3ac=;
        b=FvDxrOBoyN6DaH6oAM6CN8SJU7PxIKYj9AtzfapgetCNfFMIzHduHXLFtpCqF2CT2F
         HTRmtZ0dpsmB5afqjvdOWbSxqeooUJ1uknYaDjhMHFxFPMxOPhPneOqA36dL9ZIkbZQ3
         g9PaoeN9xBh1x0B3AP9zZCmZjM7X/5wDPsMAxBCKHHFwh6oWfeY6S+wxAX+lhVmB9RPT
         KnltEdxmBeYhWpD/T3B6/WCoFk90GNI+HdSisU11lGcSi1CShe9TcKyyanIH1tAN2+Bl
         oueRkUTypRpJ4riHBmulyCzy46MoOdfdY3sKd/+OXDouibhnAahM0gxNb/QoG5gU4BRf
         6+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEu3+UpDXtFJXb3LmAKM4zKRBYFr5XfuCJKmagNFCLiy55ugs1kO1LqkWNp9gxydzxS+MMgPeio/QNxSGlD7nZNIN7fHGT74hqmeY=
X-Gm-Message-State: AOJu0YzcNVlTOVzIT8NWCNGYZHvypSCcPPcK4zbn8aEaSe46z0s8Zdyb
	ELIdAyHgrR4Zxc9zNsIAxuLGo1b5eR58yvr01qRamrKdtbiCh+08+V8CP89ENw==
X-Google-Smtp-Source: AGHT+IE9q0KgLtAucdxZbWyn6MqzUt/EZtQ+H412AW7kKWoV5ItTNsK0gfo742OJilnTZ7BcAn728w==
X-Received: by 2002:a05:620a:2116:b0:78d:61e8:2f12 with SMTP id l22-20020a05620a211600b0078d61e82f12mr12082197qkl.57.1713209674381;
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:24 +0000
Subject: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..a6424fe7023b 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
 		ret = -ENXIO;
 		goto error_clock_rate_exclusive;
 	}

-- 
2.44.0.683.g7961c838ac-goog


