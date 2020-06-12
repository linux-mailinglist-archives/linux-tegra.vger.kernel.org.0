Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EF91F7BA6
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 18:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgFLQci (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 12:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgFLQch (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 12:32:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3157C03E96F;
        Fri, 12 Jun 2020 09:32:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c17so11750887lji.11;
        Fri, 12 Jun 2020 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h9/hD+5cr+kQsdI9njfbrV+8m68DT/RHAyph11Pyn1Q=;
        b=olJfsyXkiyvlLDR7lSo1KdmY4DZdXJE7J/mW0weHajgKJxOAjRApOVlkbPFmjSCtm0
         Ufdb0JxuLgMClwlxM91aHd4i+w+wqXL7iq2fZkMOXyPJRbPlk8INeEUXpPy2v+stgdW9
         vEJE8kVQvNQ0MKOfMWc3V01Unx/AJP6qy5g2+tQtJImaiipysuvGBR3Y3ILr+hOJ0jnq
         zncaH18PUZRs1nhTob0OMYzc8C1PMXyVNoqHqNgvw3dnrm2iQFIb235Xa5DgMbYEnj6l
         mRdzYTTduYp3yE8BfLDCm0gM4VrUXL97cT77nUkNiiYOFptO1rTOEGq0SyZDhLnO8tKp
         me8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h9/hD+5cr+kQsdI9njfbrV+8m68DT/RHAyph11Pyn1Q=;
        b=LylZ57TunUdlaxdmPR2BVyqzZk2jNIYzXShV1Ib7uQlyecA7QMae0+2a17haxMh6eo
         sVpimSiqA0lgvzip+iclKdBdJdgUz7cELQ3xzCecAUKP53eXkfEVX9HZfKgIeCaP+u2W
         0TWsDOLb81YLjgna3qMINkLo+cyRLvZiyiona2DqhUneXwVh4ZemDNvpFrG1ZCSfAWiF
         Vl9AWgw38t6hZBea6RpIrmDJPPw2Y9ic3zzkC3fDxEf2C6RY9Pgfq5EwpANsnaJd/KUH
         w4wHymbdykAMLEW/NKYwpaFyPRPzsApQb08j49wbqd1FztZI562L/BFEJHGuetAot0wT
         EU1w==
X-Gm-Message-State: AOAM530PsbEQnAS1tauU0jfMv6xuspE/5pdnT2Xi3fci2dn3jVyt2MUz
        bOC5dd6ITRPzJOc0/irjYVNV/TFC
X-Google-Smtp-Source: ABdhPJw9NmR9vxMcwTecHWidsvl8CKA5zjxXH1L93pZrVmPeuI/wK9rkSyMZEqFzOC4GurWwS0l0pA==
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr7594005ljl.130.1591979554907;
        Fri, 12 Jun 2020 09:32:34 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id y21sm1793100ljy.74.2020.06.12.09.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 09:32:34 -0700 (PDT)
Subject: Re: [PATCH v10 0/2] Panel rotation patches
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sean Paul <sean@poorly.run>,
        "dbasehore ." <dbasehore@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
 <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
 <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
 <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
 <736ad1d2-4a28-87e8-62f7-28a5582c9fcf@gmail.com>
 <CAMavQKJtbha_o==X+MX6GmjfAMYvdLyubvCFg48Tbn1mdgo40w@mail.gmail.com>
 <fa443308-7610-9060-68eb-e14e446dd4bf@gmail.com>
Message-ID: <cbfbe9dd-3340-2f90-c505-66a57031e620@gmail.com>
Date:   Fri, 12 Jun 2020 19:32:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa443308-7610-9060-68eb-e14e446dd4bf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.05.2020 10:36, Dmitry Osipenko пишет:
> 12.05.2020 23:59, Sean Paul пишет:
>> On Thu, Apr 16, 2020 at 7:03 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> 15.04.2020 00:32, dbasehore . пишет:
>>>> On Tue, Apr 14, 2020 at 2:18 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>>
>>>>> 14.04.2020 22:32, dbasehore . пишет:
>>>>>> Hi Dmitry, sorry for the late reply.
>>>>>>
>>>>>> On Sun, Mar 8, 2020 at 12:25 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>>>>
>>>>>>> 06.03.2020 03:21, Derek Basehore пишет:
>>>>>>>> This adds the plumbing for reading panel rotation from the devicetree
>>>>>>>> and sets up adding a panel property for the panel orientation on
>>>>>>>> Mediatek SoCs when a rotation is present.
>>>>>>>
>>>>>>> Hello Derek and everyone,
>>>>>>>
>>>>>>> I'm looking at adding display rotation support to NVIDIA Tegra DRM
>>>>>>> driver because some devices have display panel physically mounted
>>>>>>> upside-down, and thus, display controller's scan-out needs to be rotated
>>>>>>> by 180° in this case.
>>>>>>>
>>>>>>> Derek, yours panel-rotation patches add support for assigning panel's
>>>>>>> orientation to the connector, but then only primary display plane
>>>>>>> receives rotation value in [1], while rotation needs to be applied to
>>>>>>> all available overlay/cursor planes and this should happen in other
>>>>>>> places than [1] as well.
>>>>>>
>>>>>> This is intended. We don't correct the output in the kernel. We
>>>>>> instead rely on notifying userspace that the panel is rotated, then we
>>>>>> handle it there.
>>>>>>
>>>>>>>
>>>>>>> [1] drm_client_modeset_commit_atomic()
>>>>>>>
>>>>>>> Please also note that in a case of the scan-out rotation, plane's
>>>>>>> coordinates need to be changed in accordance to the display's rotation.
>>>>>>>
>>>>>>> I looked briefly through the DRM code and my understanding that the DRM
>>>>>>> core currently doesn't support use-case where scan-out needs to rotated
>>>>>>> based on a panel's orientation, correct? Is it the use-case you're
>>>>>>> working on for the Mediatek driver?
>>>>>>
>>>>>> Yes, we rely on userspace to rotate the output. The major reason for
>>>>>> this is because there may not be a "free" hardware rotation that can
>>>>>> be applied to the overlay. Sean Paul and others also preferred that
>>>>>> userspace control what is output to the screen instead of the kernel
>>>>>> taking care of it. This code just adds the drm property to the panel.
>>>>>>
>>>>>
>>>>> Could you please explain what that userspace is?
>>>>
>>>> This was added for Chrome OS, which uses its own graphics stack,
>>>> Ozone, instead of Xorg.
>>>>
>>>
>>> Thank you very much for the clarification.
>>>
>>> It's probably not a big problem for something monolithic and customized
>>> like ChromeOS to issue a software update in order to take into account
>>> all specifics of a particular device, but this doesn't work nicely for a
>>> generic software, like a usual Linux distro.
>>>
>>>>> AFAIK, things like Xorg modesetting don't support that orientation property.
>>>
>>> In my case it's not only the display panel which is upside-down, but
>>> also the touchscreen. Hence both display output and touchscreen input
>>> need to be rotated at once, otherwise you'll end up with either display
>>> or input being upside-down.
>>>
>>> The 180° rotation should be free on NVIDIA Tegra. There are no known
>>> limitations for the planes and BSP kernel video driver handles the
>>> plane's coordinates/framebuffer rotation within the driver.
>>>
>>> The kernel's input subsystem allows us to transparently (for userspace)
>>> remap the touchscreen input (by specifying generic touchscreen
>>> device-tree properties), while this is not the case for the DRM subsystem.
>>>
>>> @Thierry, @Sean, @Daniel, could you please help me to understand how a
>>> coordinated display / input rotation could be implemented, making the
>>> rotation transparent to the user (i.e. avoiding xorg.conf hacking and
>>> etc)? It should be nice if display's output could be flipped within the
>>> DRM driver, hiding this fact from userspace.
>>
>> I think the right thing to do is to fix userspace to respect this
>> property, since that has the most communal benefit.
> 
> Hello Sean,
> 
> This will be ideal, but it's difficult to achieve in a loosely
> controlled userspace environment.
> 
>> However(!!) if you don't want to do that, how about inspecting the
>> info->panel_orientation value after drm_panel_attach in tegra driver
>> and then adjusting rotation values in the driver. Of course, you
>> wouldn't want to expose the panel orientation property since you don't
>> want userspaces to be double-rotating on you, but it's optional so
>> you'd be fine.
> 
> Thank you very much for the suggestion, I'll be trying it out soon.
> 
>>>
>>> Will it be okay if we'll add a transparent-rotation support specifically
>>> to the Tegra DRM driver? For example if device-tree contains
>>> nvidia,display-flip-y property, then the Tegra DRM driver will take care
>>> of rotating coordinates/framebuffer of the display planes.
>>
>> I don't think this is necessary, but it also wouldn't really be
>> appropriate to put software attributes into devicetree anyways.
> 
> Yes, I'm also not feeling very excited about this variant.
> 

After some consideration, I decided that it will be better to start easy
by supporting the minimum needed for the rotation property to work on
Tegra, i.e. having userspace to take care of the rotation. It will be
possible to change it later on if will be necessary.

@dbasehore, I'll prepare Tegra DRM patchset around Monday and will
include yours two patches that add DT reading helper and set the display
info, since these patches haven't been applied yet.
