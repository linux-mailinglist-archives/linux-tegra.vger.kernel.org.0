Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59E71AE600
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 21:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbgDQTmE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 15:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbgDQTmD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 15:42:03 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AC3C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 12:42:03 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l19so723716lje.10
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RXOh96AVOAPazuvUQmiRvtER0gtvCQDTbuYPQcQSjB4=;
        b=N1s6cGo42QlUdpMqM+4wGChnTYjQOZbH/09K7c/dxFbwtaB4oun6e9nSbbJeHIUCvc
         yottN+C5hbykT0M7IWrWytKalCMwo+d4dck3V+bx/ZWAmxf4PHALhJvCxDrO5LrFqLce
         FysHWMTBqyr+njvV1pQH5fjL57w+qTKIvXzoFIvS/e32bdn6w9j73Cm7KexSUFi3VLmd
         02JH4Zf1OxPSLmE4Ihc51nElkvPPJmdskzq0cFdHTGVH1AhRNAoJv5+6bitIHRuPEL6P
         Tz1N4QV0/NaI1pK5f+XZWqLuPCDk9F45/MGmkHAEv0tMgbiyE2RCupCZEhVcKiDsRQ2L
         U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RXOh96AVOAPazuvUQmiRvtER0gtvCQDTbuYPQcQSjB4=;
        b=kOEVqOL418zY21OboRyVkIJtTsjc3q1d6b/J4vgbhgLZtJr1jYd/+DEAUWUqiV/yMK
         HvTDBwK9znVSxeSNgYvbU9/0XaupdMcY2ADw2QIJ/f9AU5Mh/uCUjox0Jr2Tc+ThYtIH
         tZL5ezx6iLNspw09qBUdDbN0JBCT+Z+gxKWkOCFDv3DH9sfhBDnhocIFmynZdgDBKjaT
         apf3gyCUE53eK+1+XJEeLXSeqnaTyganbN41Fw5wTR1A1RQW1WSiFpEWs7eQGBkMe/QU
         WfH/68ql12oJRItxutjLHGnqxZs7z8qdzqyGiYLY2scy6NbbsFKt8iUiSUlqLOLi/fah
         2XDg==
X-Gm-Message-State: AGi0PuYZvXk6B+upqLtOMtAZo335IE+SAm3JHqozAzdQvH6P7Y0TKHEn
        EyAlAZZm6nBpntOtZ2ihSzpjv4yw
X-Google-Smtp-Source: APiQypKOF+2sIB1XNm7KebOcSpdX71cMxesntX/rmNb19UXLDXxnpC7b1DbBVFGf8WGN554gj0HU+w==
X-Received: by 2002:a2e:914f:: with SMTP id q15mr3076739ljg.238.1587152521275;
        Fri, 17 Apr 2020 12:42:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id q21sm16934556ljh.38.2020.04.17.12.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 12:42:00 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
Date:   Fri, 17 Apr 2020 22:41:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417193018.GI5861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Laurent,

17.04.2020 22:30, Laurent Pinchart пишет:
...
>>  #include <drm/drm_atomic.h>
>> +#include <drm/drm_bridge.h>
> 
> You could add a forward declaration of struct drm_bridge instead, that
> can lower the compilation time a little bit.

This include is not only for the struct, but also for the
drm_bridge_attach(). It looks to me that it should be nicer to keep the
include here.

...
>> +	port = of_get_child_by_name(output->of_node, "port");
> 
> Do you need to check for the presence of a port node first ? Can you
> just check the return value of drm_of_find_panel_or_bridge(), and fall
> back to "nvidia,panel" if it returns -ENODEV ?

Without the check, the drm_of_find_panel_or_bridge() prints a very noisy
error message about missing port node for every output that doesn't have
a graph specified in a device-tree (HDMI, DSI and etc).

https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/of/property.c#L621
