Return-Path: <linux-tegra+bounces-3917-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6E998EF0
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 19:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF4E1F2334A
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Oct 2024 17:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5051CDFDB;
	Thu, 10 Oct 2024 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIDutW1v"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7191CCEC5
	for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582829; cv=none; b=Jes+ygmR9rSdBFKr4nMqzkIyfIs2BqzYj4VcpRkdl0qQwq8QLxtBQOluFso+LK4drIh+mN3meGQ2wSoqnXvT9LvHJhz0gMFCvC5PZ592AjvNmYyhMoqdR7Q4YRoTUgDRZvkG68NG7SKmN2T0mBGLmhBNpUHODBQlWJjND5deEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582829; c=relaxed/simple;
	bh=YzXifwgJSJSNIXlwxWyYUhBYj6pGIAoVtfeOgQdv62U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILEbaxnTLfGVnuZNXlhWkIunRUzo6lSJYjwr/2OUJGiCx3bl0SeOYITBS/jePb/LovpWwBjHObanyiVpb69eY9I+rp13b7SwfveSYimkArjvrk0YZmnVpRrLh13pQ+azkh4HZXJpKXDx1Hj3pkcAHxPOZVvpeWS93r+RgMP7B/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIDutW1v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4305493bc6dso1709455e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728582824; x=1729187624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ucUNq6DfZ6kzJNCh9EH0qZzNvjV7pwLl5byFikfNic=;
        b=rIDutW1vUQjbRtF5pcNVXlHz0pbS/L1aqVFhjNGvNPrED63ubMQGDpsvSvnIskHOjO
         4h1QnkSBkBx2TfVDTAIoFUqk9TvyQEHqdA5Od7e2mz+0+dZlwBxv+KQn9MBNet9eUsd+
         pFy2UWd0vrDXn5OPAPZbvGMzq88ycPAPdqEEhoxIG27634ckQB6lc8ZY2qNMz8k4GuGo
         ySxANFDMBmxvq7OjW8cEr55Zvv6ZM5RjO6xzmZsMHlDFNfHUdMB1i7wqPwoMSH2TdsQU
         zRJeZItwyF/dcP7xadg/tOaARLqXOq4lVbIQhgSnVMPqwx6MH7wG1/ktlt+pM71Io1r2
         0XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728582824; x=1729187624;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ucUNq6DfZ6kzJNCh9EH0qZzNvjV7pwLl5byFikfNic=;
        b=d+ykJRM2a6z5BD5NGa4MjqLPv3l3MwxrcOMeM80v/dpJ/8c0ZYp6eoia/85WvFUTmt
         PAqOPwnd3pevZ/jGySQvNTw3ruObN7QZa7h/eOUeKec4mP5WNPf6IMZ1cYXdxMjMrw8w
         9nAUJD6TVxxHIbb8G7Cc/0lGmgTh3d7cZdQ5BmnH3uZ24EijW2BvRq/8E/YPSH2AZMkD
         VHAwUlQDgCI0I90ZUHIMTv+MSYmL0wYJ1tg1MuTJhWUrXpxP7h3pwJKkLdTmSV2vjXz+
         GeCdCpCzoRteM4FjnpGSTNpU6cpptVgPeNnDGz3pCGWuHC4PLAtfGFvO8QaEvUXqLLYO
         4nHw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mbrue2qS0BInN6FwAtT1NzcBaKyEcKK0oT0W4s+oXhD2nVimSkaxS3PJyZbb8rivOPpDQlB9SVQ8Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJgw3qfpA5MptR1uEIF6JvyoMtqfkUQ9dy2UwwyVKyArcCEck
	il1AId+cZiP1qDCozbFxmd3RrXm/SYzInpdOfD9mMncBxbfQKHnx9UkomgCGQOw=
X-Google-Smtp-Source: AGHT+IEOz5fz6+YBFURACCn40ez7P5s2JRlWE8GFt6DmtuCLL3Y0WMRAtwBtrntBNBUm05KKykiu/A==
X-Received: by 2002:a05:600c:5250:b0:42c:c0d8:bf34 with SMTP id 5b1f17b1804b1-430c3a9fb52mr30099115e9.0.1728582824024;
        Thu, 10 Oct 2024 10:53:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183061a4sm22333165e9.23.2024.10.10.10.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 10:53:42 -0700 (PDT)
Message-ID: <3403afd2-20ee-436a-9d3a-22e1c38f78ea@linaro.org>
Date: Thu, 10 Oct 2024 19:53:39 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
 <20241008-b4-cleanup-h-of-node-put-thermal-v3-2-825122398f71@linaro.org>
 <20241008123209.00005cee@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241008123209.00005cee@Huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2024 13:32, Jonathan Cameron wrote:
>>  	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
>> -	if (!tt) {
>> -		ret = -ENOMEM;
>> -		goto out_of_node_put;
>> -	}
>> +	if (!tt)
>> +		return ERR_PTR(-ENOMEM);
>>  
>>  	*ntrips = count;
>>  
>> @@ -127,15 +123,11 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>>  			goto out_kfree;
>>  	}
>>  
>> -	of_node_put(trips);
>> -
>>  	return tt;
>>  
>>  out_kfree:
>>  	kfree(tt);
> May be worth a follow up to do __free(kfree) on this + a steal for the return.
> Then push the ntrips set until after the populate so it doesn't need resetting to 0.

That's good idea, I'll send v4 with a revised patch (dropping your RB here).

Best regards,
Krzysztof


