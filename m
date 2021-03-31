Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8320C34687C
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 20:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbhCWTFm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 15:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhCWTF0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 15:05:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EC2C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 12:05:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o126so18751446lfa.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fd4nuYgAaVbYEZoND2eJf184kvi4RgKD7hJ3TDmQcPM=;
        b=hT1Ejjq6A2J0XCUZAk3Vabu44kQWxgId5jai2ZyA9cbXbZksfeRkcetzaZSIP2/4NZ
         3j6E0e4CCOdS7N6sMrbtzUCaGMBxuj7JK4RwEeMTDGmCKLLUsA5prVWI2Pf153idiLOI
         9aaZkfC5nN0wJgERtnEJ3wNVFfKVoUihb0L6vqizTE7IvIw8PW4MykMTRb3eTqONQqC6
         dSdTKkUzH5X7q4GkL+eatDKSSKT2gaAKQ8+SMHDPBPJbYrQu8o/io2SHELKj5AUFGiJY
         Jz9m+MZIiCEv1wrxbtYyLwREg7/pWARPedceVEOZxR4QEWUhW07btMwVAPDvrK57LXxj
         rM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fd4nuYgAaVbYEZoND2eJf184kvi4RgKD7hJ3TDmQcPM=;
        b=a//q34j20qYXeZWiM0QTQt4Wxv6S+tj4rV4Y3NFOeqVzwEklLqOehRVqq0Fpqr+061
         wZsGn9FH8bGCi5jdaIeFMJiHW4ndJAgEYi7EMY76i9AKQPKmZ6Gz1Vq2qm2oO8poEu1t
         bWzbL5TTWlGU01ViBMl9J44KZNC6+R31t4FFl44HwM7zUBiTGSZFgivnMVJFvlCMPs7/
         0yWlmZyAO/wca+simTn3HBcwnYo0XylSxetPHWwnGxasPii3P2wf4zzytITdOOdQFgAV
         eaxnaULQF7mUv9BKbWYQvUiBJsLsAZ45fnFNbOGE/HZe8ORrm/FomHnXVnB3XhbZAZuo
         OHAw==
X-Gm-Message-State: AOAM530ZkznzoRGOwuz4uK7u9NML8dlGCtUmi/3BOJaLkmb8mDHrdfTF
        adMhQGEEGCn0OHyZTaQZSKEBOns8APg=
X-Google-Smtp-Source: ABdhPJylnQ3Sr2QV0cFqAMxby2zDHSlfGcoSMVDpk7QUeSXnBsj2ad98sNodXW8Xi6iQrFqJYHHQtg==
X-Received: by 2002:a05:6512:3d20:: with SMTP id d32mr3511758lfv.9.1616526324273;
        Tue, 23 Mar 2021 12:05:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id y23sm2451175ljm.53.2021.03.23.12.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:05:23 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
 <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
 <YFoyc5mdYe/5/Cjn@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <487b94d0-a52b-824b-c29d-f88b4605b117@gmail.com>
Date:   Tue, 23 Mar 2021 22:05:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFoyc5mdYe/5/Cjn@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 21:24, Thierry Reding пишет:
> On Tue, Mar 23, 2021 at 08:57:42PM +0300, Dmitry Osipenko wrote:
>> 23.03.2021 18:54, Thierry Reding пишет:
>>> @@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
>>>  	value = tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
>>>  	value &= ~CURSOR_DST_BLEND_MASK;
>>>  	value &= ~CURSOR_SRC_BLEND_MASK;
>>> -	value |= CURSOR_MODE_NORMAL;
>>> +
>>> +	if (dc->soc->has_nvdisplay)
>>> +		value &= ~CURSOR_COMPOSITION_MODE_XOR;
>>> +	else
>>> +		value |= CURSOR_MODE_NORMAL;
>>> +
>>>  	value |= CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
>>>  	value |= CURSOR_SRC_BLEND_K1_TIMES_SRC;
>>>  	value |= CURSOR_ALPHA;
>>>  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
>>>  
>>> +	/* nvdisplay relies on software for clipping */
>>> +	if (dc->soc->has_nvdisplay) {
>>
>> But coordinates already should be clipped by
>> drm_atomic_helper_check_plane_state().
> 
> Yes, and the driver goes on to use the clipped coordinates later on in
> this function.

I see now what it does, looks okay.

Minor nit: the i/j aren't very expressive names, something like sx/sy
sw/sh should be a bit more appropriate naming.

You could also make use of drm_rect_width/height helpers.

But this doesn't deserve a v2 if there is nothing more important to improve.
