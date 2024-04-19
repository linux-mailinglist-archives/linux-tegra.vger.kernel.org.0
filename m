Return-Path: <linux-tegra+bounces-1773-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814BB8AABFB
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 11:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377FB2832D7
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D012B82D62;
	Fri, 19 Apr 2024 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eS6jaE3S"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC280618
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520172; cv=none; b=t+6781nWf7795oyVT/UbuN/VQUYWL/7ZSeatyGnfpyUYb3YpT8z4Al5U1zSZzzKK/Z0HFKog8vmys3Iq4BgHVRHLaKDFJHLFYmJWA93QZvfMqFgwisG3PIR47YZ4QW5Aq+R1QrG138g/nbZVIEfnmiYs57Dylq9rwJSsoHmVu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520172; c=relaxed/simple;
	bh=gV1i+WLU4fCANNV2YgqfOpEz5J1mXWIBo29pdtjhlBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2LmrfnkicVTxsdyVdnVwktAwDIDnb1NZRnY5TRA9w7oEtMMSAW3HJLxhGUoV7Gal8OCcekl2bZw1wGmEA93jS6m+1OKcKg3EAnvqzhkNEFqwU+3iXyRKofEZE3Pu65PEbp9+5iK7U/OXmI581MD7xLXNkJ6+ATUrIKkhKAiSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eS6jaE3S; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6eb797e10ceso1172355a34.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520169; x=1714124969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=eS6jaE3SmOQH4aB/fXpaIMj2ZOecuBS+ZEh+n9lLHZHHRMa+nyEleXoKLFRY3RaUo1
         +a4s5KZDbpt8rc1JvhMcW1xoSmVQLfgUcY5fm6x9RYnxD5cZ/JHCbN2QT2Ubyt3EDs8b
         FxWiEGafumkVHO3039sY8tdcNg9P8RW+VCCmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520169; x=1714124969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=sVv7WOoOz5dPfxgoVP0x5CKRTTPdCUVOZAU2vOm0x50HaF1PLCfyC5mXsN1OPgIbPH
         YRHGbFqqeD49PSILdQt6h4RrKe84fi4M+s9Y6FhwPf2Sxik30R7wTgY2tmISkg/RRd+z
         Kifwkp/YfgliuMKeQmCiIahrLBNXr/TcGPQyzdG5EN7zz45+f9Ho2LPpyd9MfqhK1lN5
         /nw1nWIxzPILPji2qIh0bnUM24HNjQUVs5BtUtoQkuQ8J03ZAxS6imiR9VDrEOTRbN88
         PbUXJMlOTlDuxoCDs+CZw/AVaQVmEGXv9pAjK174vn8m6hxFd5WrH7NrHY+xGRYNoXeV
         DiZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFPDxphvFCtqydI7nqywAOXXXuuIyD3ROgfSnoeHyjWiTMLFB3mvQOaf0tIejk9gaZ2lSseAX/+67tl24/Q0SMaIQ05v7Nmm+3DQ8=
X-Gm-Message-State: AOJu0Yx2aCT1lN1j85DZ2hbM00ItGqpxTyTzxEKe395DfvQHgVS9tdZH
	bXNqPq5ZTSVT3kdtWe1wTdQ9hKGZ6uIuXpukXoy5X6iED/OhquS/AR6a6X0S9A==
X-Google-Smtp-Source: AGHT+IEoa3EBjJC9669xc6mPVpvtJwhrzrmUgput3DoBfmRttNa6KJF0gCcMfSkwX6iyc+U8a8TeQg==
X-Received: by 2002:a05:6830:1d48:b0:6eb:7a07:8746 with SMTP id p8-20020a0568301d4800b006eb7a078746mr1521944oth.31.1713520169041;
        Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:54 +0000
Subject: [PATCH v2 08/26] media: dvb-frontends: tda18271c2dd: Remove
 casting during div
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-8-2119e692309c@chromium.org>
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

do_div() divides 64 bits by 32. We were adding a casting to the divider
to 64 bits, for a number that fits perfectly in 32 bits. Remove it.

Found by cocci:
drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda18271c2dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index a34834487943..fd928787207e 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -328,7 +328,7 @@ static int CalcMainPLL(struct tda_state *state, u32 freq)
 
 	OscFreq = (u64) freq * (u64) Div;
 	OscFreq *= (u64) 16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	MainDiv = OscFreq;
 
 	state->m_Regs[MPD] = PostDiv & 0x77;
@@ -352,7 +352,7 @@ static int CalcCalPLL(struct tda_state *state, u32 freq)
 	OscFreq = (u64)freq * (u64)Div;
 	/* CalDiv = u32( OscFreq * 16384 / 16000000 ); */
 	OscFreq *= (u64)16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	CalDiv = OscFreq;
 
 	state->m_Regs[CPD] = PostDiv;

-- 
2.44.0.769.g3c40516874-goog


