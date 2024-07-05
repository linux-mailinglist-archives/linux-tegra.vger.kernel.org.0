Return-Path: <linux-tegra+bounces-2945-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5E928BED
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 17:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB631C23763
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2024 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A32116CD35;
	Fri,  5 Jul 2024 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKoskVbb"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918D16C685
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720194013; cv=none; b=Bxi20XAQrMFbEagiXf1XlOzRtA4s7uJXvGKe8PDh2emaRDktJWuEzHOOqMYG11uHYMC9L7qA9CkqnNB/FW+Fe4UKrCvS3FHrfge4xASnjVDo+Ey+J7B1OozSwjQYaJAU0p7fMqsBxGHw1PN9s1NTxmjSx5bbWlDzpOa3as55czk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720194013; c=relaxed/simple;
	bh=lvk3fb6EH5rw6dp1DOnJCL3dq9tQI3MOZD7gcFF+qDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGq2HMzud9SU7/Gk5BWJVXt8GhO6KxGgpgODsPw9Ua8qdBiR4wfW/z5rk1TT7hplgaPPsXlUL2r+jUDrzB6gAzyuEV8+B6N2xjitEmGyx3PE3aZF7Q8Ydp/y5DodmqDb2lSntxFpGw6/aAMQeU4p1JhrQ5VjUJ3/4Jy8I44gUTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKoskVbb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367ac08f80fso389308f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720194010; x=1720798810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=NKoskVbboCs15opK/u8G0ePgBYosmRGjKGCHS/WSYb5wNVrWjJ4EX2lGolUGCOPdB9
         0uQaIWeVLcyyqRkl0aDLiC0M22BQfSsWudXssBVXP3pxhsgp2pHVNeCJJ6pFb0ysOvku
         csxvRFZtHVu2Riz/jqwBzAfHZ5pM4k4APkaTzbOevLhvQsW6500bwwj0ndhPXjErmehh
         +i751M0SzL+icns0EEBvjcXD6QpV1PfdYxsBePfojkYHuOO8lnW0oE7zvqH7TvCPxW5U
         dkeyRnYpatAZTpYE+qHY+vGIlRIQn6i3NQk7nUNyPXFA2dJHiPpf6KfsSmBx3SHxxs5u
         bJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720194010; x=1720798810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=QHm5KJH2PSGqmdrM5DO1uMBHOrmj4JIye3orrpIk5rbmFFxbwEFciVXAAraVuWCdJT
         M5f3BbsnNDrMYmoGmi5vF92zYOCIWIqJSo0QhM2IyXd0Tnc9tSaY6NvF4nnbvkDr8Kre
         MMjdGymlgcIuwF7qdx+0WHqiWC/GAhcSnpkbIU1ZSnnjExUM32Y8SOZ6z0vdluNlNErs
         J68bssKF3vtpv9vhZRMFm4r9aBDkp4/L3wcbpFBKTf68RLl66KGGljXr3puo+F9gK5pi
         Tk5N2chCEOjsyAZvM+tOtdBctWyoiOOzmEQ6jYLA1LrGvlvQXhYcjJxAWWHz9Wv8azHz
         O8gw==
X-Forwarded-Encrypted: i=1; AJvYcCVGJr246wObZabto9lmejqnUEuEIvqD8Ej59ww66YVVdBJxV4S7okpP4fulYtnpOKS/kY6Sjmk6U4tnqlXh9J40nj1Eoh71TlHGr9A=
X-Gm-Message-State: AOJu0Yw6CtPwDuonzh3IPupTYN22W+7Al3SovYpmgKQP7uG7yliLR5Bz
	gz1nw1w9e3F3Z4Ll5X/OCzIvn+F6edOzpnqN6C/XXIvIv3IJ4MdqYv+6AtqfZrI=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828;
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


