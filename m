Return-Path: <linux-tegra+bounces-1986-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AA8B5C89
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 17:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CDCF1C21775
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF80D85C76;
	Mon, 29 Apr 2024 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UaJ4pqxk"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEC84FB1
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403093; cv=none; b=tzr+3HQ/h9LkvDkE8DNHZXGYs3Lo5DFl/iXCh6EVXd+qo1MwVOo7Iar2CvwGgVXA2A8g1ExC/8pvNH+G9PMl3frmsgaJJYdjl9cFM20n0mBnnj+b6CsH/3d7IGhAOIEc6q0B7ZNl/oSc1MzxcmNLQM6FT44HUYOWHkjIhFLXPD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403093; c=relaxed/simple;
	bh=aO+3XsdBSRpzhoc7Fyjg5oVGDMNe8NmC+5ZKhCG0BJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2NxurmMpvQI3lkmh3938eczIiggjgbg073LE95upYjXB0to9C8lcRhi7cjnPrQrq9N3g6Ia02XIuPta/JDa0Fs18aC2BuMtTriiChHpMTmfPrJ1PmcDJXHmXpjHVCO/b2tq0z4fvtIhS6xZCCftqtHWhJvncpFaF4YQ1OlrJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UaJ4pqxk; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-790f4650f93so114834785a.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403090; x=1715007890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=UaJ4pqxkPFdxMm0RIrrlxERRMi+QSKmVSzXcRhZcU6qXGRFbmcJklf5qfAdt5PKDpC
         sTP/WTjp6hdC46GDAagmcKiP7VvUAmjtAlGdj1rf0GBNZht4M/j95WsCsKhzOUrtEj+P
         s84MtNuikPMhnVNXNEmsZQLEP2OA11tebysm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403090; x=1715007890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=BDpPOv84wjIJwq7B+cT4RsWd9AKcQWm7+nUvU2KNlUIojgzlnCLns3mSXxxGVkWDbq
         gTCNqZMbfAfXQV9dfvQz4kQjnWLfjfrhnlSVaRcCj+VfN0PpYq5amTzlzZAjNqQuQUwA
         YiPtxKB6FuN5A3PRss0QaEOhZYPdifgCvnmmN2Q8jbnF9yxGyeUVXshCMzN91QLYE5iy
         gfYcmpll38LfMqHi3HpcqltUODSEIVl4gRFlUWDTpLp0bQ5IFQ040pcQ2bj8QMNSFH1r
         gtuchHSqNDFWVf2Ee4GGua94zhIQL9BhQ5W+0tMWrLPiY4S8BytH5mmujH2DJLauuQoS
         HQOw==
X-Forwarded-Encrypted: i=1; AJvYcCVg3uDSZR47V1JhIAy9TZ96jyth7BvdyaJkijt5VYGSGRMqsurhR2FdMWZsCQ+aVRB4w1Kh3KMUV4qr9aBLzzgvPxLMu6phurCIWWU=
X-Gm-Message-State: AOJu0Yxt2Sqdxqfw+pn7cdG8EHiV9Th6uxutqPhnWBKwH5oLF+ZMOz+w
	Yxhp4bJ8OshRrjY8a7jI7dB8PulvWpB7ATcrYm7VyXntjvCY6BQasguDNrU3tQ==
X-Google-Smtp-Source: AGHT+IHHKi7cqnMpYwnQDIZ9akhXG6vV1AIqNbLdBOwmjaLKTCEqbKtGqVQAHlyIVFw/U88/GLAn3g==
X-Received: by 2002:a05:620a:4591:b0:790:fc14:60ac with SMTP id bp17-20020a05620a459100b00790fc1460acmr2298793qkb.0.1714403090344;
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:46 +0000
Subject: [PATCH v3 07/26] media: staging: sun6i-isp: Remove redundant
 printk
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-7-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog


