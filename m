Return-Path: <linux-tegra+bounces-3458-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D095E38E
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Aug 2024 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494321C2095F
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Aug 2024 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD1B155727;
	Sun, 25 Aug 2024 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2Ha1XfY"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488713D25E
	for <linux-tegra@vger.kernel.org>; Sun, 25 Aug 2024 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591587; cv=none; b=d/klkV5Fg87mcx7V0CXso9OK9l+m/ZerLnnZjdBSGzcNARWul/j8HXb5K6FmObxyZ8UB2psFWYziWTaaxPupQPo9sSjlWMBtAtsW7l6Zs5bhK+8yYTy8hJ1wFW8iAiIz9me40eOqh+k9V5Gf6LkAKQbO5pmndbAzsuTsBudzacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591587; c=relaxed/simple;
	bh=TgKYnPZPyDTOZ3L65cfrHkuK/skuYvE26k2QLr8XRJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTIo0NM8ViKKxSdgcfQAWuA+qAZthCGcRj95ngqGZPomX7/JRPMtQruto7+JE8/Ibip8Un8M6TVwFfaNO2wNG710ZYBipsKaQfE3rYJSyYMThFPT9Slm8amgwJ6xX5yrLqPdYzouBVASdx9PtWQElPC9Qo6ni3kdM8LxbjgIT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2Ha1XfY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724591583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjT76MGllL0Qcry+tUV4L4dLGaCMJhJzvO4cnqx+Y6g=;
	b=M2Ha1XfYZMKativ1+EOZh2gWVWX2zXCA8PZyO5mx2ndaOaUjviI1/2Xgy0w8SCcJ26CJk6
	P+WSf81mvPvbXT05T9bXpZBHssUo2SFlyVg6MOHodlJw15qyEMfDTWQiK19cJ3qOmV9iX2
	r+zhG0bX2jAejrFKB7yF4HVimSELvFA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-BvQJvMFBP92FqX0ZJOskCQ-1; Sun, 25 Aug 2024 09:13:00 -0400
X-MC-Unique: BvQJvMFBP92FqX0ZJOskCQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2f5086e692cso6693511fa.2
        for <linux-tegra@vger.kernel.org>; Sun, 25 Aug 2024 06:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724591579; x=1725196379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjT76MGllL0Qcry+tUV4L4dLGaCMJhJzvO4cnqx+Y6g=;
        b=bVD3hLbIlOjPTFOJtf4lPKkEoUdra3kkBwH4QmVc0rwL2Pl1YoMPHg6nF67d+pEeRg
         sD1IZjTVrHGUYh1zrvo1FpD+HiwOSRl0GQijc6pVaeuW4IZUrqvwUgTli/s0kJE7OGyb
         UgXBt8oSx1gOqL4UfvlY5D64UC9lb0Bl+WUWm2duuMfu3ThGAKSha5+eEmi+WIQ6Mu/t
         vNvYeP/vxSJ6POZ7bATSJTOyplCqjCXBXta+3A629U60/aDiCsAS4qpqa/eYUGIosbad
         n4Q+gbW7LShuKA0QIuQVC1Aia6PI4sTWpfCwlrRurPeI751f3TBd/ViX7hBgtpdI0h/p
         a59Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRRo1S3triCAzy575VdtmUoLWHHr03SwMMO7fn7gnzPKXyGC8fPuK5Kk4tTIQLkzgXIdn/ouWnE5J5hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVu5hdjbjdk4D1wojIiaTyL8qrsTAbTqHd7L6t0XlCtc0PCRP
	S6uyg3JfOgvBJYYTP8TTIjtYml4GjUNLFVUFvBdNo5orshyDonbemD9D15g7vCkBrfUSmbnK3z3
	T29NvAhAbfO5p9psu5e1Y1RyJC5sHupYqvDPuPwdUKLN1rcHHePHwxs7FqJ+P
X-Received: by 2002:a2e:5119:0:b0:2f1:922f:874a with SMTP id 38308e7fff4ca-2f4f48eeda8mr42665841fa.14.1724591579160;
        Sun, 25 Aug 2024 06:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGedG8Qc1ocP0F7rBDO7Du9zOdeBSFMEWGKGSF2JNS3V7HesaJGbrGKKVPU6aQQc17mUbUsw==
X-Received: by 2002:a2e:5119:0:b0:2f1:922f:874a with SMTP id 38308e7fff4ca-2f4f48eeda8mr42665631fa.14.1724591578503;
        Sun, 25 Aug 2024 06:12:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3cc25bsm4404438a12.38.2024.08.25.06.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 06:12:58 -0700 (PDT)
Message-ID: <c32467c6-fe3d-4ac9-85cb-15f37d4728a2@redhat.com>
Date: Sun, 25 Aug 2024 15:12:57 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] Input: atkbd - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-4-dmitry.torokhov@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240825051627.2848495-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/25/24 7:16 AM, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that mutexes are released in all code paths when control
> leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/keyboard/atkbd.c | 37 ++++++++++++++--------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index f4f2078cf501..5855d4fc6e6a 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -639,7 +639,7 @@ static void atkbd_event_work(struct work_struct *work)
>  {
>  	struct atkbd *atkbd = container_of(work, struct atkbd, event_work.work);
>  
> -	mutex_lock(&atkbd->mutex);
> +	guard(mutex)(&atkbd->mutex);
>  
>  	if (!atkbd->enabled) {
>  		/*
> @@ -657,8 +657,6 @@ static void atkbd_event_work(struct work_struct *work)
>  		if (test_and_clear_bit(ATKBD_REP_EVENT_BIT, &atkbd->event_mask))
>  			atkbd_set_repeat_rate(atkbd);
>  	}
> -
> -	mutex_unlock(&atkbd->mutex);
>  }
>  
>  /*
> @@ -1361,7 +1359,7 @@ static int atkbd_reconnect(struct serio *serio)
>  {
>  	struct atkbd *atkbd = atkbd_from_serio(serio);
>  	struct serio_driver *drv = serio->drv;
> -	int retval = -1;
> +	int error;
>  
>  	if (!atkbd || !drv) {
>  		dev_dbg(&serio->dev,
> @@ -1369,16 +1367,17 @@ static int atkbd_reconnect(struct serio *serio)
>  		return -1;
>  	}
>  
> -	mutex_lock(&atkbd->mutex);
> +	guard(mutex)(&atkbd->mutex);
>  
>  	atkbd_disable(atkbd);
>  
>  	if (atkbd->write) {
> -		if (atkbd_probe(atkbd))
> -			goto out;
> +		error = atkbd_probe(atkbd);
> +		if (error)
> +			return error;
>  
>  		if (atkbd->set != atkbd_select_set(atkbd, atkbd->set, atkbd->extra))
> -			goto out;
> +			return -EIO;
>  
>  		/*
>  		 * Restore LED state and repeat rate. While input core
> @@ -1404,11 +1403,7 @@ static int atkbd_reconnect(struct serio *serio)
>  	if (atkbd->write)
>  		atkbd_activate(atkbd);
>  
> -	retval = 0;
> -
> - out:
> -	mutex_unlock(&atkbd->mutex);
> -	return retval;
> +	return 0;
>  }
>  
>  static const struct serio_device_id atkbd_serio_ids[] = {
> @@ -1465,17 +1460,15 @@ static ssize_t atkbd_attr_set_helper(struct device *dev, const char *buf, size_t
>  	struct atkbd *atkbd = atkbd_from_serio(serio);
>  	int retval;
>  
> -	retval = mutex_lock_interruptible(&atkbd->mutex);
> -	if (retval)
> -		return retval;
> +	scoped_guard(mutex_intr, &atkbd->mutex) {
> +		atkbd_disable(atkbd);
> +		retval = handler(atkbd, buf, count);
> +		atkbd_enable(atkbd);
>  
> -	atkbd_disable(atkbd);
> -	retval = handler(atkbd, buf, count);
> -	atkbd_enable(atkbd);
> -
> -	mutex_unlock(&atkbd->mutex);
> +		return retval;
> +	}
>  
> -	return retval;
> +	return -EINTR;
>  }
>  
>  static ssize_t atkbd_show_extra(struct atkbd *atkbd, char *buf)


