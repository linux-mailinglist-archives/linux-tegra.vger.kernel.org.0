Return-Path: <linux-tegra+bounces-743-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FA850E83
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Feb 2024 09:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B737A1C216AB
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Feb 2024 08:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62FC79F1;
	Mon, 12 Feb 2024 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qT+G88uV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3210A1D
	for <linux-tegra@vger.kernel.org>; Mon, 12 Feb 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707724987; cv=none; b=X887Ctslpi/2TOxDiB55NmlnqZm89zS3AC920NVngUBtkCB57tXiPgk4/PijiwXsvP4sDzj9Aj+bwqADF/80TH2E3EBCbUbyHoBFERb8haz6u641jRrl/J+9hq0D5gzP1P8Q+4Uy20ml9nkOVS5iB4PUmvfBoeDMd7p0XuKDu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707724987; c=relaxed/simple;
	bh=kAxovZmLWfvjF3vG0GsqpWyXSczmtUn+7agLC31UIHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tyNNUhV/beJnyut22ARLgBDAXKKI4qNOdprkLQkRdEBpt5uY8LnsYK7xMMqnCdk1icN+koTk1Itb3Qbp+cRdJs3IoPr7ThB16IVGnLPH7m6AZCkv/DBLTjfJ3CKaGdIyQ3myfYwrNWEmT/+7DpRW8jU9X2TVCL/4tdv79P/7i6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qT+G88uV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41097f9a9a4so10983335e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 12 Feb 2024 00:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707724984; x=1708329784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsHPp54eQHCGJh7ByCTccxA+V3kHGibCozRWtPwoGAA=;
        b=qT+G88uVP1zL8rKL9ceSGVWNKogPwj4RGFS1M9wo/ibboDioGclrVI7zCYNIhZmXqz
         UrElpgUjb7uIGvVEWe0NY6nwmvHHaf+xWvmG2GzCtTfttwi/VotyAjx5qdFTi++a4V6u
         pHlIPFCJIjq3Qk5jLB2AQnPzDyupdcmraU78CnlYNh8tHxNTW9D4tBXDp4xKwXuPTLc2
         MFYBFk6t4otHrJo+p6JIYwll6D97NEFj5FJJ2cHigGjBfRfVqCGwuLqfn0hRV574bYmA
         qPtBxziKeNdlNMQp3VrDeM4FlDYBZOY9/WPDRmLbWD1oLVlDekavK5mnaiRW90mdQRa9
         djCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707724984; x=1708329784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsHPp54eQHCGJh7ByCTccxA+V3kHGibCozRWtPwoGAA=;
        b=He/8c+c62QDy10rJV/nBSKJiB5RO+uUIB3K7k8BhyLRqgN1qnY8ZJ9uHQ8m/JfAEn1
         6LzjaxFnWHDjndnOQVqa+vFQUldOc6+lPp4/vqWKxFhGZ2KRGgtHwd4ZHCiKH9dST+rS
         C1JaXWD5k3JT31B4ZYiz9SxkAX49QuzLc6uqZEGP24Z0Gc/33Zv9oIuwsZn+92bWSYRj
         LfEvAXueIYj0sNlMJcsZHdUvjKAoQ3LpeJUbsUGg5uYHwWNqQheuwRxROnpTMw3/8YmS
         RRMgwpcF9WKeL/N5H/dBNOPyKloBnI+14NHKGr5UbmKrqF5+HFIIf8e4JpvOKmPU8G0I
         sebg==
X-Forwarded-Encrypted: i=1; AJvYcCU48tTeUeF4RCRvE+1nQQcAGOdRnqZWixaJp3AQYfcsLBqLbAirF90tqIObjF2B7nJGDFtILkEGobblRt8kILedX2Iauzu98UnCfK8=
X-Gm-Message-State: AOJu0YxywQpBNtC1vImn8XTEKcRX5ViZ7AhIGs2K9TnmhK/lp4qOBmWQ
	9fbhCVIT0n4h7VAf/rzo6B8qwf1qun6rY3u72iVyuTEZ0I1OUkJi4730AjSWfis=
X-Google-Smtp-Source: AGHT+IEcy4UIH6uwlU1XMh6MIT0AttHglLZLbuwTmKFJwKzSdxez8rZ15kJNy1K+ZmINvhsYhQ6O7w==
X-Received: by 2002:a05:600c:4e8f:b0:40f:b01d:61a8 with SMTP id f15-20020a05600c4e8f00b0040fb01d61a8mr5206246wmq.38.1707724984338;
        Mon, 12 Feb 2024 00:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBQCuj8aTBYujTPMAaGEHT4kQD0FyWUTQDx+++6e6vaITxEfOyEAv+OJ69ICFBq8Po8tUuuUxfG1ugsPetrGKzGxS6FgjoPnBCdq2lzsvHSiLXZtwqPT03qJEOfSmng8C5Dl9myedQf4wx+mjSo4E67d5/q0ygDf7hABYGlde2YTUZOgm7UOfe1O0TViVWfXW2TACxo306g5ibogLvebTdgMW4rAA/IocC/XixxVjhvx6RElJkjWHCWtThP/NIvpI7E3zQiYFQTW6ZGUYkqkaDagHVzuh8tUeko4wK944/cfQrCQyOuavFynA1ZbymFh11HEZlWEWZ9X/en3ZOpchuw9T0Nb8ltmzENOPD5zlVp2QnJuCFKEdtW7aZfDyQVNFhdXMUkWs7UcsKuEz3/iTUxoJgkcGA2BMlHQNXgYXxYPB9/IY2oXfoR+Vhx25ksrOj/cy45hOrKL/NauN42H/8LuX3U5H5Ta4HX8CmJ8mWWyfDEqxeLkmTk2dEuvQ/Bzl4FUIE7KCoWd1BgIL95w==
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm980417wmq.34.2024.02.12.00.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 00:03:03 -0800 (PST)
Message-ID: <7b265eef-a521-43c0-bdac-aa25562b968c@linaro.org>
Date: Mon, 12 Feb 2024 09:03:01 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] dt-bindings: tegra: pmc: Update scratch as an
 optional aperture
Content-Language: en-US
To: Petlozu Pravareshwar <petlozup@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, dmitry.osipenko@collabora.com,
 ulf.hansson@linaro.org, kkartik@nvidia.com, cai.huoqing@linux.dev,
 spatra@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240211171727.914595-1-petlozup@nvidia.com>
 <20240211171727.914595-2-petlozup@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240211171727.914595-2-petlozup@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2024 18:17, Petlozu Pravareshwar wrote:
> Scratch address space register is used to store reboot reason. For
> some Tegra234 systems, the scratch space is not available to store
> the reboot reason. This is because scratch region on these systems
> is not accessible by the kernel as restricted by the Hypervisor.
> Such systems would delist scratch aperture from PMC DT node.
> 
> Accordingly, this change makes "scratch" as an optional aperture for
> Tegra234 in PMC dt-binding document.
> 
> Signed-off-by: Petlozu Pravareshwar <petlozup@nvidia.com>
> ---
> Changes in v3:
> - Update 'reg-names' property items as per the review comments.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


