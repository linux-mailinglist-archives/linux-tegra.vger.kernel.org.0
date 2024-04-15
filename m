Return-Path: <linux-tegra+bounces-1670-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85F8A5AF6
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 21:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26149280E39
	for <lists+linux-tegra@lfdr.de>; Mon, 15 Apr 2024 19:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F6E15E7E7;
	Mon, 15 Apr 2024 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aw8PVAeS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6096C15E5CA
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209690; cv=none; b=NbaACECEUXOOqlrkk1aw4xqPK2RN3eCGpHybGADKHtQuqxKv2YPdTXgNcp68FE8o2sLm+eje417T31CPpmYURS+hhY4f6WHvOXIPAyLcSS7UbMkToYSqRZ5LKxIttlbHFQyJgRH3A1u3dHPMqt8s5sVEb/uIIypgLzcPV6tHmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209690; c=relaxed/simple;
	bh=QMsjv+wettsGw23pqby6M5jpWOg9Tw4lhss0lX66IJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrxRFGboC0bpV1sa93a/hZAjVP+2JQhzpTLYFBg9auAAF2NkHLM2qyT1YLxvYoj9M2zBtJlJney/eWuFKIGrFCGRCPd8lAJF1+4YfbJfyL7Wo7Iq74bwogTIguh23ExNc7ibce7CX2Z1CefDO4tE+eKxY2+JyyQe2TaV8g9Cn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aw8PVAeS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78ebc7e1586so472921885a.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209687; x=1713814487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
        b=Aw8PVAeShZ4GKhUDYCsi2PsqSye237i9HPTPm5MU6c/HPaFPfsyJtQd89eZHNpm34a
         383SVnae4OoILq4kG05YEdXY9ArcAK+nX+5Ku2mIY+EiO3aJDpQuTbjmNjkWlMwyTPQJ
         6JDOEM/aiAPq5mgjy4d/Q3LEkvJKRx0KgKrMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209687; x=1713814487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
        b=h6QodI7kOKhGp5XjtYJgHQZi142nyRas5bHuRsBCFqsAoDszKdoUpU7nBq9FpQhH9t
         vC3MllIX70ZhwYYzBb5HyYbVvRHKnxxrLi9vdWSRvW2b+dnsxyRo1+GkUFENPgCLQCTN
         C8TSYXjAKfvE18dySzE/y3TY/KpM22g2i9qcuXQt2jBPCRXJw0ALiFXOc5mX05ucI1GT
         WDx9Hy2/mhHMG7oZ4XzLKzBILVcwy15iMWSDxlzniH7nnevImZJoxREBakPiFGUJgby7
         OGq3JohZfGP4hDnBqr3+KjWs5lfabBHcWO54oqCo4I4r9Hrxm8PKu9IL259uXG6spu0U
         eFPA==
X-Forwarded-Encrypted: i=1; AJvYcCUpBdQ70NURXZ7aelgB7RkpP+G1rR12XAUjeV6W+9At+gufO4OpupvhSRFWn+Br+2EVNZbmTvcWWzOTKx6KZewTcvOrxpLm9z7yTrc=
X-Gm-Message-State: AOJu0YwcOICHFC1sE9zDK42RA5r78LzAA9yLh1grbIqsePSeZwOgDMXP
	WmGrKsrFTJFY8xmWcV2WAQjFhEW1uJgcISp76i2HKjTuRDF9Gc00SY3YrRhWpQ==
X-Google-Smtp-Source: AGHT+IFZZwBtLZMDNfJayMBU/PaT+EdKNrIoBaFoYxfd58lYWJrbZu6cOvIxZ8QNIWMRuOhipLdFVA==
X-Received: by 2002:a05:620a:2953:b0:78d:61fe:77c6 with SMTP id n19-20020a05620a295300b0078d61fe77c6mr1118634qkp.2.1713209687511;
        Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:34 +0000
Subject: [PATCH 17/35] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-17-477afb23728b@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 790787f0eba8..3ba6a5ed7167 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.683.g7961c838ac-goog


