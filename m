Return-Path: <linux-tegra+bounces-1868-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF978AF47D
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Apr 2024 18:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB53A1C23CC2
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Apr 2024 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F9C13D51B;
	Tue, 23 Apr 2024 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwUhLz8l"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF313D254
	for <linux-tegra@vger.kernel.org>; Tue, 23 Apr 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890579; cv=none; b=dnZ4v2UHRiSP0J7G6eLSw+wGbGTHJChzHX5CHvdJCveTvXuHqaf/fmiNS8ZsEwRVsNkNbWF+pg3wkNEM2Q8v3Nvb4yO8AUfFBC717angvXn1uA/yh3RB5kKtavgkd652FknZN2B5WOPHXPzExt2A1HJWJF2xZIW44fBHnNRqFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890579; c=relaxed/simple;
	bh=GpHmjh1oP5OnIlmRru0FaAZCq+BYGXsln5CRJl5tfWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkWjxmcE3qu6lDqg9uf/m/SI6UqJvw1voARpsk3WNqowEcNvYC4SO9LWiMMDqnXoLBSvPPjFbdj7kVNsSNVwSRFhFPGIvnSSuoflLlfQ5k1ms8b4tGFBl0b4IKehbwXfugPEF4lxrvo/f0fis308T8E/HGBfM5vtcRX1B7JxOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwUhLz8l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a5b68eceeso17865905e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 23 Apr 2024 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890575; x=1714495375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=JwUhLz8lVoFZQUFCRcq8K8NccepSm/rRQ8Sgt+/v9El0ePkAaju0n1zNRy0Xx0vgNd
         xT3d58K1jS5TniX6TujKFu93xPGrVqjZmQsnmh6lgEZS1GhV1LYZQvVzCZIctfi8NrQr
         qMVxzL6GHPpamW++IUFXWkH+NI954J4jcql8w+09KKlV4lAISbNDz24PrxFvdEHrMyF1
         /Rb0AKUiYWJA4WyfYDGQ6SIOiTCclM0er3uJuQzkp8+Mile9ozYQ4iLGVCFwQBBu7Jwy
         x6v50NysGyS0oiL7cI30FEaCDA3TDrraCuqbKAdgqPhYcYbbeYU3ZUO9cK5YPx1fIcNn
         lnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890575; x=1714495375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=VALd33HLC7fMQ4uHckKBH1I11KKrqivJfjrb0JTRtKceUHKYM/qRYKCuUGw8HTD81F
         jcI/qaareeuvbDkIR07Y9NWowbjqZg9i7ROVEo0id/EJsvXoYZOVPWs+9Sht81FrCefU
         n/ny6mexZsvrNgK3xa1Vu32YQb0sin9RMN8tdhu/8LXcxUsgAyQYutye44pfIf82fu0L
         1bt7qjex1v8rFmkxlTevwhKXA+plqnv4ScuBzS4pZGphI5+zcTW1trzgv0AniA16AHxX
         /1aUxSBxln3C9jWYosVdwxDGlxgqJJPwSVnVNqR3EUMj8I6WyRt0cejZ4Y5Nyzsd/8O+
         NXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGoM1tJCU8N3V9v0tDzyH1Xfypd8F1/rsUy8VJzfVZzD/gQ9ayD8L7DJtwiM/FKn2rhTK0THaRL+5dRzBvBkpQcaI5TndQUaJpRts=
X-Gm-Message-State: AOJu0YyaCFMWhSc/nolhFPAf5dHaa5caPRPQ/c1j1NqGvxorIRps4XW0
	Aw6H/3rywZeBW17ltbEtYjU+TWkhgKDtmjvpBXqhWIGoldguSZ58P/eeiXz4FoE=
X-Google-Smtp-Source: AGHT+IFrxYPbNd0JIn8yeAWouLUX4KO2HR4fWg0b0VJjkA0zy4qA+fxtUoj+497CZ/NN5m4uB+meNA==
X-Received: by 2002:a05:600c:1c9e:b0:418:a5fc:5a5b with SMTP id k30-20020a05600c1c9e00b00418a5fc5a5bmr10146720wms.36.1713890575406;
        Tue, 23 Apr 2024 09:42:55 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b004183e983d97sm20619705wmb.39.2024.04.23.09.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:42:54 -0700 (PDT)
Message-ID: <3f5c46bc-6fe8-45a4-8929-7b93b276478f@linaro.org>
Date: Tue, 23 Apr 2024 17:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/35] media: stk1160: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code.
> 
> Found by cocci:
> drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
> drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Show the commit log some love, then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For patches 16 through 19.

---
bod


