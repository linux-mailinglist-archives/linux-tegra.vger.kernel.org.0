Return-Path: <linux-tegra+bounces-2005-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45D8B5CD7
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 17:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF2428214E
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2024 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BEF12D775;
	Mon, 29 Apr 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cs/Z3XNn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2412BF11
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403123; cv=none; b=Pn+GfUGsVBYAPlSHOttK/qX6dcM5ZMd1wl2QtbqaTYkc7g1GprzKBLKR5m9rRiRW2vcc3Ld9gbxYZhm1nM2Ynr0bg0NgfYIXaiDzOI0OLetdjlu/f/nLyK4wh9Deuose4FQ6xvdK2wsDwf6mD05fEcZdr4iyq8nI6JIMj2HjQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403123; c=relaxed/simple;
	bh=17e3seaVPIolCVRnz9dvrXMTILwJmsuH1BK6VcvWdM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0m5zHnakfL97G6DCfXFX2Nnv3IgxTHMwkNeAlpFX9nGkZ7/NVkL/7HuHfg6I52rKJD/KOdMsVsTtSscC3hpR0lhrKA9twmCtMjgG2jfayDgseUdEJZEbaHWFKMJOzRUb5oWfkRTAcKfX9gPANtQHCuGTbWp0DKaeJlyVQdYiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cs/Z3XNn; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78f049fefd5so305447985a.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403111; x=1715007911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=cs/Z3XNnHKQx1vr6EMlWwKFDUVk+wBR22JAaohZkk/k3TKtqbsfKePvDSqEa6SOO2O
         r20oF1/L/C4ljsjF5+o1uIoiXJsiVNRWNMXvQgf6J+Icu248tynLoEiMDP77WvTKyGd7
         CvXvXriOxlgYpIGgAgxhsMEwehNZfeTk7IejQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403111; x=1715007911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=DMRLE+O7vquMW0nNY9BgixRT+nj1mzR+hAur74/TtnTBNA3Mfku7u6VwZO5njLtN/8
         7iAjRp2LF4ZbvjVhqclKlnxINQzsDjNWt+jrzb//VWYlpiYPvLh1x2qs4vF5CKFnUfKF
         IZp17/VawDv7qbROGp5LMYPnRleZaPk6RwHiSahN7y7/d0O3wUXbjfFTFvM3SXgTm1hb
         5aWPY+hwodulp03y4grIPXotjolIPmxqJG49UM4IdV4Mh+9z6qAgNE4yRNry0rjqKCDO
         /i5t0RIXGOZTFUKOkS2vMiNj3gEzKRI1iRbWcuVeYfG6uMlYD93U47Wnd6pIcwqnDpyj
         snoA==
X-Forwarded-Encrypted: i=1; AJvYcCX1f3nsKoCe6QUZ5XuXvd7ngqOYRysS6jfB+SYORX9CQc8EZ6ACWZQS9FAK1D8me6ZW9kt28MuRJWGxVUAs1zwqr0Pxre8GNPoIuxc=
X-Gm-Message-State: AOJu0YwizJTDZz82hg+mIc+BuKY9X8aQsNX0oQLfdf6OgbUPWDQW6uu0
	RaydFWqZkuEdU1NIJkvUwNaMIKkNbsUxOHv1XRMj7IX/Vc2SlpQLmXDxoLrR6Q==
X-Google-Smtp-Source: AGHT+IHvPitwm/34xW/kQUa8TA8n6UCg3fwO9ex2lf7MaH+MC5XxlTHiUGq0Riy9QnEe78dxXREmpg==
X-Received: by 2002:a05:620a:5e48:b0:790:c81e:7840 with SMTP id ya8-20020a05620a5e4800b00790c81e7840mr6919928qkn.12.1714403111405;
        Mon, 29 Apr 2024 08:05:11 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:05 +0000
Subject: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range of
 z explicit.
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
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

We do not expect the sample_freq to be over 613MHz.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.44.0.769.g3c40516874-goog


