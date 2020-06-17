Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA451FCF5C
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jun 2020 16:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgFQOUU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 10:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgFQOUT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 10:20:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55721C06174E
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 07:20:18 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c17so3051471lji.11
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V4JLMz2DyNc9DZlCXfygme3vyorMs8d0BwMT8g/PCDM=;
        b=ED+yIktKhA0fqclBgysqcqOeWWNof0cSIFSi8rQEq55yH64CoqoXNp/x03pSQs9xpK
         zMVzbcH5tNcj2DhO0XujNbVQFA86xg9OPAq/gGFNfkQm8e1bnhRmMWuY/ZuoJZK4uQNG
         55z4eJvSNHuUWXC1RkAPfX3RaHsz7pYNdMMWnUgHhZMZasWiTnDnLD3Vmr3hLns38RGe
         eiJ+X/om3Ar8AoX2ly2vaWFqCtl0EXbD1xa6rFIlSH5kg+t5y4Y0K25r8qCdl+oJaJRB
         CW44eU00qXoE8UkUfqBmuhpgiJPYfqCXYnm0SK4AEzvk/5c+t45oCaaf896dZMUS4yrr
         TEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V4JLMz2DyNc9DZlCXfygme3vyorMs8d0BwMT8g/PCDM=;
        b=M8i6Mu/7hbO102JHyyt8q5FMDn+Kd0LmWGwDPUV1xf+3l5PH6iF5NLqQ+r1hOpw6U/
         tq9C2tkwrdWmDX0dI5ojzMRbGMatXxM0fowPKQsKUQsUFuY/mhGB0uGkfmJm095JVbzR
         KEccv9yNbPAGXW3vaMB2GacxLcJOkcWY6TxaGTri1Bm5RUKbMiBD5of+OtppTdqjyBec
         MP0w3QpyTe9PybKIPIvHZL9ziwEEkictEYZXtBMHiTTL9BcssTEZlwyvz+GCQzj378Iz
         o3aZs0aIrgF8YrVuCG7neUeoa3j9D7H7vG20YHmUcwvfp8BA9yK+fGmgqLlTjxHm0wgy
         BN1Q==
X-Gm-Message-State: AOAM532e8HqG7D9Szk115jqYiM1TmZBx/lDAHbfBVREQkJdBxVs/sJHR
        8imQT5wELdE1fmMMeim6NY4Og+SY
X-Google-Smtp-Source: ABdhPJwG66NISXRY5Ia3T+p6a2YHiNyQj6rHxAo8mP76P7n6hnrx1CL++kCOeMz4RC4DyI0W4y4LLA==
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr3961755ljg.372.1592403616226;
        Wed, 17 Jun 2020 07:20:16 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id s20sm13366ljs.36.2020.06.17.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 07:20:15 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
Date:   Wed, 17 Jun 2020 17:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617141015.GB3536291@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.06.2020 17:10, Thierry Reding пишет:
> On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 21:14, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
>>> have a zpos property") a warning is emitted if there's a mix of planes
>>> with and without a zpos property.
>>>
>>> On Tegra, cursor planes are always composited on top of all other
>>> planes, which is why they never had a zpos property attached to them.
>>> However, since the composition order is fixed, this is trivial to
>>> remedy by simply attaching an immutable zpos property to them.
>>>
>>> v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
>>> v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
>>>
>>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>> index 83f31c6e891c..04d6848d19fc 100644
>>> --- a/drivers/gpu/drm/tegra/dc.c
>>> +++ b/drivers/gpu/drm/tegra/dc.c
>>> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>>>  	}
>>>  
>>>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
>>> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>>>  
>>>  	return &plane->base;
>>>  }
>>>
>>
>> Looks nice, thanks! Since you dropped all other zpos changes for other
>> planes and given that the other planes have 255 for the max zpos, what
>> about to set the cursor's zpos to 256?
> 
> I'd prefer to have all of the planes' zpos within the same range. By
> default the other planes will be on the very bottom end of that range
> and the atomic core will normalize the zpos for all planes anyway, so
> the cursor plane will end up with a very small normalized zpos in the
> end.
> 
> The zpos documentation already mentions that the behaviour is undefined
> if two planes have the same zpos value, so I think userspace is going to
> know how to set these anyway.
> 
> It might be worth to do a follow-up patch that is smarter about setting
> the range of valid values. 0-255 is true on later chips where we
> actually have a proper "layer depth" register field and I wanted this to
> be uniform across all generations. Other drivers seem to set the upper
> limit on the zpos range to be equal to the number of planes available,
> so that there aren't potentially big gaps in the numbering. That said,
> since the core already normalizes the zpos for us, I don't see a big
> benefit in explicitly clipping the range.

But the cursor plane doesn't use the "layer depth" register, doesn't it?
So the zpos over 255 shouldn't matter in this case.

I know that DRM should normalizes the given zpos, but still it makes me
a bit uncomfortable knowing that there are the ranges overlap visible to
userspace :)
