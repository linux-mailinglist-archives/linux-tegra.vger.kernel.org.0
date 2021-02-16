Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2408831CC7C
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Feb 2021 15:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhBPOzo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Feb 2021 09:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBPOzm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Feb 2021 09:55:42 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2200EC061574
        for <linux-tegra@vger.kernel.org>; Tue, 16 Feb 2021 06:55:03 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id p15so8482913ilq.8
        for <linux-tegra@vger.kernel.org>; Tue, 16 Feb 2021 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0L3LUUd4CN2tocODr+9FJOieK/FWdEsnDt1BTgQNXTw=;
        b=Iufza7OCXAe9UVW0oYI17XE7VpPSXowcoZafTUF02MMumA7XJp0ZoetVtQ3PsYCWWe
         Zr1G4+kCX4mc8LI6YmNgY+RUQAYwnFVmOC0dHr8pxlcpfqr64GyKSfiERsxQoLqNyDJD
         WTZe+0OcPC4dsMztfh+85nt4N6c0nmgcFfPbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0L3LUUd4CN2tocODr+9FJOieK/FWdEsnDt1BTgQNXTw=;
        b=ji9xBmvKurTVjMf63jaQhYIxHCROMo9coywmv9bNuJs0YuQqRUBvF3JJt5+uqQmXS+
         /Fe5fk8xyI+zs9qRZ7chx8Jgf2ki2mQFZNLHRZKC9B/ZGviPZuXsw7wbNMvk+Zc+V19l
         bzOYdR7rkbHzWBZVzvaBfP8p9VNYMd3BlWTTm38QmvbuUrXJ87MAeHbzfe0STJZnw4QO
         V4BnQdkuIsOqTjTtrVWKHjWdtwicT5cvLm74QXdIEB6ZhIJZVkA0Ztf1YQ29MYfQvRXf
         PjQscN/+mQQAmOPrBfRFeDRPUDvGCiFiDBBH5dfVDSqycqqpHnt+4mcXbAkuqRgytxih
         /YUA==
X-Gm-Message-State: AOAM531zqsYIatqorRoxT/Ovu2Di5+0ZguW7jjEmgdRNSROaDDGU9CHq
        QJ3Jxurf0fZDqW5IhwS3Vn/K/A==
X-Google-Smtp-Source: ABdhPJzt5Yfzzw7DoFwQ768GJoYdE5YZWKfKbrolE9kxw0DKXKKgAyl+O5kXJCVCjLWqfVLjJfLRUQ==
X-Received: by 2002:a05:6e02:164c:: with SMTP id v12mr16847550ilu.49.1613487301947;
        Tue, 16 Feb 2021 06:55:01 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id g11sm874048iom.23.2021.02.16.06.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 06:55:01 -0800 (PST)
Subject: Re: [PATCH 02/13] staging: greybus: Switch from strlcpy to strscpy
To:     Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Cc:     Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Ioana Radulescu <ruxandra.radulescu@nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Vaibhav Agarwal <vaibhav.sr@gmail.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Marc Dietrich <marvin24@gmx.de>,
        Jens Frederich <jfrederich@gmail.com>,
        Daniel Drake <dsd@laptop.org>,
        Jon Nettleton <jon.nettleton@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        William Cohen <wcohen@redhat.com>,
        Mike Rapoport <rppt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Robert Richter <rric@kernel.org>, greybus-dev@lists.linaro.org,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20210131172838.146706-1-memxor@gmail.com>
 <20210131172838.146706-3-memxor@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
Date:   Tue, 16 Feb 2021 08:54:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210131172838.146706-3-memxor@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/31/21 11:28 AM, Kumar Kartikeya Dwivedi wrote:
> strlcpy is marked as deprecated in Documentation/process/deprecated.rst,
> and there is no functional difference when the caller expects truncation
> (when not checking the return value). strscpy is relatively better as it
> also avoids scanning the whole source string.
> 
> This silences the related checkpatch warnings from:
> 5dbdb2d87c29 ("checkpatch: prefer strscpy to strlcpy")
> 
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

This is a good change.  But while you're at it, I would
appreciate if you would convert a few spots to use
sizeof(dest) rather than a fixed constant.  I will
point them out below.

If this is the *only* request for a change on your
series, please tell me that and I can sign off on
this without you implementing my suggestion.  But
if you post a version 2, please do what I describe.

Thanks.

					-Alex

> ---
>   drivers/staging/greybus/audio_helper.c   | 2 +-
>   drivers/staging/greybus/audio_module.c   | 2 +-
>   drivers/staging/greybus/audio_topology.c | 6 +++---
>   drivers/staging/greybus/power_supply.c   | 2 +-
>   drivers/staging/greybus/spilib.c         | 4 ++--
>   5 files changed, 8 insertions(+), 8 deletions(-)

. . .


> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index a243d60f0..0f9fdc077 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -342,7 +342,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>   	/* inform above layer for uevent */
>   	dev_dbg(dev, "Inform set_event:%d to above layer\n", 1);
>   	/* prepare for the audio manager */
> -	strlcpy(desc.name, gbmodule->name, GB_AUDIO_MANAGER_MODULE_NAME_LEN);
> +	strscpy(desc.name, gbmodule->name, GB_AUDIO_MANAGER_MODULE_NAME_LEN);

Please use this here instead:

	strscpy(desc.name, gbmodule->name, sizeof(desc.name));

>   	desc.vid = 2; /* todo */
>   	desc.pid = 3; /* todo */
>   	desc.intf_id = gbmodule->dev_id;
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 662e3e8b4..e816e4db5 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -200,7 +200,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
>   			return -EINVAL;
>   		name = gbaudio_map_controlid(module, data->ctl_id,
>   					     uinfo->value.enumerated.item);
> -		strlcpy(uinfo->value.enumerated.name, name, NAME_SIZE);
> +		strscpy(uinfo->value.enumerated.name, name, NAME_SIZE);

Please use this here instead:

		strscpy(uinfo->value.enumerated.name, name,
			sizeof(uinfo->valiue.enumerated.name));

(I know NAME_SIZE is used throughout this file, and
could also be converted in this way, but we can save
that for another patch.)

>   		break;
>   	default:
>   		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
> @@ -1047,7 +1047,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>   	}
>   
>   	/* Prefix dev_id to widget control_name */
> -	strlcpy(temp_name, w->name, NAME_SIZE);
> +	strscpy(temp_name, w->name, NAME_SIZE);

Please use this here instead:

	strscpy(temp_name, w->name, sizeof(temp_name));

>   	snprintf(w->name, NAME_SIZE, "GB %d %s", module->dev_id, temp_name);
>   
>   	switch (w->type) {
> @@ -1169,7 +1169,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>   		}
>   		control->id = curr->id;
>   		/* Prefix dev_id to widget_name */
> -		strlcpy(temp_name, curr->name, NAME_SIZE);
> +		strscpy(temp_name, curr->name, NAME_SIZE);


Please use this here instead:

		strscpy(temp_name, curr->name, sizeof(temp_name));

>   		snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
>   			 temp_name);
>   		control->name = curr->name;

. . .
