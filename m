Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697E01AE6FD
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 22:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgDQUwP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 16:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgDQUwO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 16:52:14 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8DBC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:52:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m2so2892152lfo.6
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=angJKiUFgdcQ+88Et9C+fMHi5ft5+9tP/OZmYzRrrXo=;
        b=jZS9WXFlNnN32otnqIem7vx9S7bz6RhmxmLzyibhwdfO4vHhtA3dGceYeSoeRxd6Rb
         LCQkriksVr4y5JtsI8fIN3DqtMFaa29u1GzjEA5kJF1VZye3nZdP6d2PBhc27YCmOQvB
         Y5D9z4a6cksFfHyhryCI6N0IeVKZs27B5pqNtoM7uQ1nX+DQuorsst4zkOm6rBZF5c+h
         qFrcxeLPSx+dBzQ8BEFZSfZ9E2OL8c3Ed3UnHM/C1oEnANunKeOqT3zPWHlzeoCnFRxL
         A5Y7meeOtqZtZKMX1X+t+kBCuJ3nm2QhPkUulGSrmCDQml1LI1vNk/4IKNTOP5+LjbvI
         P7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=angJKiUFgdcQ+88Et9C+fMHi5ft5+9tP/OZmYzRrrXo=;
        b=U4CKZwtm/LatX5rYg7Lj7utWFLsVs1uWGZLR6N6CYdaC7Qloi2dfZ/l3qMsIrXg6jy
         VfrBT5gBEwOk3CWcsJ54sM2x/EvA603uclpPJz7oJOysyff9tSQ0M5ngZY1LzBzaKipd
         DyKmc/vg/Y7IxBEexu0hRwgbJG4v2bzl697vl3DjcrwSLRxSL6XcSK4rEXorY7LXDfzL
         G4T3FQy/aHlod4KYksyZ/56t8Vdm2ToFAjGGRMXaStw9d9zMsryajEABtyalHz4UWuvs
         po7boIoaEJNi6l6x65Fnl6G8VYrlFC32GvZB8/4ImX/UoIEkW9PI1VsQ2eos3T/cUqp7
         5gQw==
X-Gm-Message-State: AGi0PuaUanBG5QlwKOKH2MVWOXNiGgvbLFGl7bGtIZlK4PHUptcAK/Vd
        TSozt++oSfUsPeIcYJ+RKo9454s+
X-Google-Smtp-Source: APiQypKhcqsOTYer7LYr9ZS5kJQGhvpqqszRY8WB+b1F9c1Pd/hjB0KmqQAFP+wxkozfbigyHB1Clw==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr3347084lfc.29.1587156732240;
        Fri, 17 Apr 2020 13:52:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z7sm16973540ljc.17.2020.04.17.13.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 13:52:11 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
Date:   Fri, 17 Apr 2020 23:52:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417203154.GK5861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.04.2020 23:31, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> On Fri, Apr 17, 2020 at 10:41:59PM +0300, Dmitry Osipenko wrote:
>> 17.04.2020 22:30, Laurent Pinchart пишет:
>> ...
>>>>  #include <drm/drm_atomic.h>
>>>> +#include <drm/drm_bridge.h>
>>>
>>> You could add a forward declaration of struct drm_bridge instead, that
>>> can lower the compilation time a little bit.
>>
>> This include is not only for the struct, but also for the
>> drm_bridge_attach(). It looks to me that it should be nicer to keep the
>> include here.
> 
> drm_bridge_attach() is called from .c files. In the .h file you can use
> a forward declaration. It's entirely up to you, but as a general rule, I
> personally try to use forward structure declarations in .h files as much
> as possible.

The current Tegra DRM code is a bit inconsistent in regards to having
forward declarations, it doesn't have them more than have.

I'll add a forward declaration if there will be need to make a v5, ok?

>> ...
>>>> +	port = of_get_child_by_name(output->of_node, "port");
>>>
>>> Do you need to check for the presence of a port node first ? Can you
>>> just check the return value of drm_of_find_panel_or_bridge(), and fall
>>> back to "nvidia,panel" if it returns -ENODEV ?
>>
>> Without the check, the drm_of_find_panel_or_bridge() prints a very noisy
>> error message about missing port node for every output that doesn't have
>> a graph specified in a device-tree (HDMI, DSI and etc).
>>
>> https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/of/property.c#L621
> 
> Ah yes indeed. That's not very nice.
> 

Please let me know if you'll have a better idea about how this could be
handled.
