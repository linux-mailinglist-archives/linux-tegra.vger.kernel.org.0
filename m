Return-Path: <linux-tegra+bounces-1787-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D58AAC33
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 11:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D6D283470
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFD1130AEB;
	Fri, 19 Apr 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgYpMSDD"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995BC12FB14
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520187; cv=none; b=InYhX/SvSFAyaRnvAHghn79JBoLQAMR14OzZ9dKij1+Scpb+8rVSqN0FpW1K6KsxL6/Y5D02AwrpfgyArpYW/7eovL3FUClhY+U/OANznrGDvBnnKI8WuJfACAB8jbyq5rWJAak9xFr8fXW93s+1ZlmJCLv82+e4RKomx0fMspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520187; c=relaxed/simple;
	bh=jFHnju+ZdbBnojvlGLEr3gz0wIbcoBJYXFqf+F/VYB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RISGzebZTRIfo/JbsjO6BGZmLun/w0dhuHGVr7RRIlzx6CbQIhEPCWeUzt9xjytTSrhW6BD44gd+9l1ZH8E8+1UpkhiJcgzSwNZAIlepixHrAeoo0LmSRYP36sDRM1PORJHx1M35Yae22Vve1OmTssYQ1qNfkUniGO2rO7W03dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgYpMSDD; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ea2f95ec67so906790a34.2
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520184; x=1714124984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=;
        b=WgYpMSDDXpDii8zmer7+HldjnDrF7NN8f0zMweQAaxH6rqerHSTRoPUL8lOjVJAgX9
         5j4+qyotpPtLMW0lbsQUQCkEATtngK7kJezpLUUYSI3qWd3JGDuRGnmJkv1Na/euGFfW
         GFUst8h0+ZdlIlNFt+yrA2nZMaarHwVFsDnsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520184; x=1714124984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=;
        b=OSHf5MVtqMeIC1/RpCz3HfDB1VpZir1uSzVgonxZhe1r19S671vIJCIe8npDO+K/v9
         h4J2IkdKYhPjTMmko+Nedjmksv3QhGhug1FduGd1OgE/lgAksKeTsSaeB2vV42ZAR3ME
         ARzLtwGpx1CoAxEag+NCDswqON66hiW+slDWcNqWysQF19qubGhbiU+lwUWrgB2Vxg+M
         rZ2NA5RqpjAgD17qQ/QuYKdo60V5WdAEik3WmaClPsNvjOUatHr7Ar0l+ctyvONj3BpM
         yrlmWagSfCzR8nl7bGA65wIxphK4Y0NDQaINfNH2WNz0D6oTD2hXj2Gr0aZmUxBbVaXQ
         i6VA==
X-Forwarded-Encrypted: i=1; AJvYcCWpgsj6mMA+XQJ8CaNd6ckAgqaGhhoxXoijP2ot2b6FpDtKp1IoSnklnCe9TJWpBKlurQH3NpCBzGPU7xoyGp2jLDEZdw1GTnklGPE=
X-Gm-Message-State: AOJu0Yz2wYWrFk6AsmoRVtCXhK2w9YdjvK++WegSnY/cBtBQpQ1Jqyk4
	gGEr1B5j9UW3+UzMhWcRMBs3FE8KgTNvSQBVJPSbhBLgaz0on786Xn4tuggpWw==
X-Google-Smtp-Source: AGHT+IEYwOxlb1WugYE4t9h28+AXEwcDjQAa28XJBDFMEfi87sd7BKKPg6Joa8eH6oaaPvD2ajlMkw==
X-Received: by 2002:a9d:7f03:0:b0:6ea:1dc5:514c with SMTP id j3-20020a9d7f03000000b006ea1dc5514cmr1695945otq.11.1713520183703;
        Fri, 19 Apr 2024 02:49:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:07 +0000
Subject: [PATCH v2 21/26] media: i2c: st-mipid02: Use the correct div
 function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-21-2119e692309c@chromium.org>
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

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..93a40bfda1af 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_s64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog


