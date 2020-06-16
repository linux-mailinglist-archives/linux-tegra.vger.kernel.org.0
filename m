Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5909D1FBBE1
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 18:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgFPQip (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 12:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbgFPQio (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 12:38:44 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF765C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 09:38:43 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c11so1772947lfh.8
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=goTjruJDxLjz4AJd/syAHegMRf5NuYWgRb49fm6LsE0=;
        b=vHepsuqmzRFE/eoj9fB/+OVEMXjR1MyCFDI5crng09VxEJLwAFfUIHMp5o0K9qT4rt
         L1Yh51cGsH3Jy53L05nHILmYaqmKz44ieslnmH84OOhIvslnV8zH+HzpO6DUCnIiUd1d
         5nn5rmwXUK52TGX3UTkXqxav5GAajxYhUw5a4KJcnY7Ulb3IJVDsYhL/bXeiFEDYWjIG
         875oWxRwZl4i5mGm9tVo2L5GAb5V5+NmAJP6dIzpl21fOeYBgOqANXiD1WljVcmBwX9i
         jNT59Z0hMcmbnYwTPl5O7VZ8K6f1V5LYumAUk3w3OHi+PaZg9h1uy6+e3V5U5FCDF6Nh
         8Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=goTjruJDxLjz4AJd/syAHegMRf5NuYWgRb49fm6LsE0=;
        b=AUvdbpOOq7LXu1y0MqCNIkNBP6AvNc2oh/ZJC6QFuclcUXbfIHjbGGdrcMy5/+SqVn
         vHeNl3nSXmuyV9XZo7Mef+einozsRIo9R3N6VDr5X2l8I3SyAaNiSfzbHGnc3d76988W
         qf81LChKr85aNyVZNAFy/ZSDxg4mh8uN+UiZiYb29qXsOA/54RtZ0G2xM7U4T0pF5He8
         JQW9c7VBhn8qRvh+PkEbo3RXpMJO/5pk9UCmng5iBkrBSEnT/MHmpvX2PAcoXljcJeZT
         3hcF4fFuX7TM2fsl92PHQ1f+uDCpYIBMUoy3H53QMVp1k8TE9rw1aeh1n3/kmeMX0DdG
         GOhg==
X-Gm-Message-State: AOAM5304h9Cl7O/pNHXhUwZnVHpD9zFuH7UKaiQiBCGJiNF1tFZXn8LF
        CjJeuSgAuZE90zEaHU/HIp78NhfQ
X-Google-Smtp-Source: ABdhPJwjGtdQRc29lKLhwd+XFnY0aTIdP/fKM26BJVc2NCs6StmmoDyRYP4CLesmh6GLfsD7U7kehA==
X-Received: by 2002:a19:cb92:: with SMTP id b140mr2239964lfg.63.1592325522081;
        Tue, 16 Jun 2020 09:38:42 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id w26sm4463879ljj.114.2020.06.16.09.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 09:38:41 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
 <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
 <20200616161341.GA3009091@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <515daee1-464f-31ab-53c4-ec01fbf42c2d@gmail.com>
Date:   Tue, 16 Jun 2020 19:38:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616161341.GA3009091@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.06.2020 19:13, Thierry Reding пишет:
> On Tue, Jun 16, 2020 at 06:54:35PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 15:17, Thierry Reding пишет:
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
>>> Changes in v2:
>>> - hardcode cursor plane zpos to 255 instead of 0 (Ville)
>>>
>>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
>>>  drivers/gpu/drm/tegra/hub.c | 2 +-
>>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>> index 83f31c6e891c..85408eed4685 100644
>>> --- a/drivers/gpu/drm/tegra/dc.c
>>> +++ b/drivers/gpu/drm/tegra/dc.c
>>> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>>>  	}
>>>  
>>>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
>>> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
>>> +	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
>>>  
>>>  	err = drm_plane_create_rotation_property(&plane->base,
>>>  						 DRM_MODE_ROTATE_0,
>>> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>>>  	}
>>>  
>>>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
>>> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>>>  
>>>  	return &plane->base;
>>>  }
>>> @@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>>>  	}
>>>  
>>>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
>>> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
>>> +
>>> +	if (!cursor)
>>> +		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
>>> +	else
>>> +		drm_plane_create_zpos_immutable_property(&plane->base, 255);
>>
>> On T20/30 we're are setting the plane's type to CURSOR because we want
>> to use one overlay plane for the mouse cursor. Nevertheless, it's still
>> a generic overlay plane that can change its z-position, and thus, it's
>> wrong to make zpos immutable here.
> 
> But it doesn't really make sense for the cursor plane to change z-
> position, even if it's technically possible. We do want it to always be
> on top anyway. Doing it this way makes the cursor behave the same way
> irrespective of the Tegra generation that we're running on.
> 
> Yes, that may not fully expose the capabilities of the hardware, but we
> are already restricting the hardware capabilities by exposing the
> overlay plane as a cursor plane in the first place.

Userspace is free to reuse cursor's plane for different purposes. For
example, cursor may be not needed at all and then cursor plane could be
used as a regular overlay plane.

The patch's title and commit's description says "*Add* zpos property for
cursor planes", but in this case zpos property already existed before
this patch, hence you're changing the old behavior here.
