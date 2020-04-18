Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08FC1AEEAA
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Apr 2020 16:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgDROQj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Apr 2020 10:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgDROQj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Apr 2020 10:16:39 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996E2C061A0C
        for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2020 07:16:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 131so4123367lfh.11
        for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2020 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CtYfK4CE3m9SojcTQ69RrpQQShVpfpzhUE+XBnEE8Ns=;
        b=kpS0y2qIcT97Y4zX+4GPyWoqZIQ0t9uTvPgVAF552Zrz1kyWsn9/JXEOjz0jAsLcyJ
         XLAiBoy0fONyRAjaTWtztkR+pSkPLHGZ6HKPaOdKTEtpUh40Q+adLmVYV+sd0vcoNL0P
         0Yg90yduiX9IKV/bOlglBzYbscblNd+qDt5G4gTvN5rIKedhSgdkSey9x3b/eKjMZlO4
         +eL8r9nMv09q4k2DtWANfz3VxTKN8Ev0cPLB529LTeb+6FGwvAr69xTy/0GL15OKQH3n
         BPuBE2ymuSE/RSYagqACkuLUI6orIh8lDohVgpQ38w+FylHNT/gxGgkAWkWwVoxAkv2z
         SgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CtYfK4CE3m9SojcTQ69RrpQQShVpfpzhUE+XBnEE8Ns=;
        b=N6ogNBgMhJNTPDpq/zgeC6ZV9CNh+CXQjkmZlfCgCADJykQUCQ+ALI7uLg51TZgvTJ
         S+17kYVTX6o7uDmAOhXXOZeRBUZ63W82RzXTPmo16v9F1HtD8HlOMt3KVqvyZcz0iSkx
         avliEVjiW1GavBu9/MuYC1vp4OBqfl1l/OYbsnPJv71urMbX30KZZUsl1L/MYmJSRfpK
         iy+dAtKxZ0Yq5Hz0rEGNatB+eYkYdrExfmGpyVjC6bu4vZKN7kXdVRV0ZB+1ovxm/1wP
         JXpyN9wsVzFQHZIZa2NTUluylDj0RqIaBUk1JCbrBeEa9wqiffUXuA/YWBHazPOJ6TAS
         m/UQ==
X-Gm-Message-State: AGi0PuaP6Fgm1v8N1iB9Mx/08j8djwkw40AdMJgMAXH8pT2zdeisVSks
        OZfaWGE86Rj3hHDz5XzVb/26QLYv
X-Google-Smtp-Source: APiQypI9nP1XkKZsUEHvhJZW9uMeP8C+TQ6ugh2nhU8vtD0YNWqu5zwhDUJXVZ8F8N+ampfzRRMcBw==
X-Received: by 2002:a19:88a:: with SMTP id 132mr5107417lfi.130.1587219396489;
        Sat, 18 Apr 2020 07:16:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z23sm19102435ljh.55.2020.04.18.07.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 07:16:35 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
 <20200417203154.GK5861@pendragon.ideasonboard.com>
 <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
 <20200417205828.GM5861@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7978ed3b-7dcc-2219-c42d-740e3ce64189@gmail.com>
Date:   Sat, 18 Apr 2020 17:16:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417205828.GM5861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.04.2020 23:58, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> On Fri, Apr 17, 2020 at 11:52:11PM +0300, Dmitry Osipenko wrote:
>> 17.04.2020 23:31, Laurent Pinchart пишет:
>>> On Fri, Apr 17, 2020 at 10:41:59PM +0300, Dmitry Osipenko wrote:
>>>> 17.04.2020 22:30, Laurent Pinchart пишет:
>>>> ...
>>>>>>  #include <drm/drm_atomic.h>
>>>>>> +#include <drm/drm_bridge.h>
>>>>>
>>>>> You could add a forward declaration of struct drm_bridge instead, that
>>>>> can lower the compilation time a little bit.
>>>>
>>>> This include is not only for the struct, but also for the
>>>> drm_bridge_attach(). It looks to me that it should be nicer to keep the
>>>> include here.
>>>
>>> drm_bridge_attach() is called from .c files. In the .h file you can use
>>> a forward declaration. It's entirely up to you, but as a general rule, I
>>> personally try to use forward structure declarations in .h files as much
>>> as possible.
>>
>> The current Tegra DRM code is a bit inconsistent in regards to having
>> forward declarations, it doesn't have them more than have.
>>
>> I'll add a forward declaration if there will be need to make a v5, ok?
> 
> It's up to you, you don't have to use a forward declaration if you don't
> want to, I was just pointing out what I think is a best practice rule
> :-)

Alright, then I'll leave the include as-is in this patch since it should
be better to keep the code consistent even if it's a bit less optimal
than it could be, IMO.

We may return to cleaning up of driver includes later on.

>>>> ...
>>>>>> +	port = of_get_child_by_name(output->of_node, "port");
>>>>>
>>>>> Do you need to check for the presence of a port node first ? Can you
>>>>> just check the return value of drm_of_find_panel_or_bridge(), and fall
>>>>> back to "nvidia,panel" if it returns -ENODEV ?
>>>>
>>>> Without the check, the drm_of_find_panel_or_bridge() prints a very noisy
>>>> error message about missing port node for every output that doesn't have
>>>> a graph specified in a device-tree (HDMI, DSI and etc).
>>>>
>>>> https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/of/property.c#L621
>>>
>>> Ah yes indeed. That's not very nice.
>>
>> Please let me know if you'll have a better idea about how this could be
>> handled.
> 
> It should be good enough as-is I think. You may however want to support
> both "port" and "ports", as even when there's a single port node, it
> could be put inside a ports node.
> 

I'll make a v5 that will have additional patches for making
drm_of_find_panel_or_bridge() to better handle that case.

While at it, I'll also add a patch that will wrap RGB panel into bridge.

Thank you very much for the reviews!
