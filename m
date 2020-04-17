Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA571AE6FC
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 22:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDQUvO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 16:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgDQUvO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 16:51:14 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D08C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:51:13 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so2460848lfj.13
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=axXdNYI8P7fcgsZxQpUhrRij1OkOPLBrxua8Qhy3eLw=;
        b=vJabpKV6ndKO7Wg3lhxcSe/im8PMhvmt7TXrJAoL3htKwBnynd+5QAFEC8v6ORPabV
         V4NKkBGB6BdR9/NQZyakDO6cOsHK2wQrTk/IKi09jFzxiK58tLh2i/BCD0ksoH9jaWgt
         ZdOTikyzPsJ5eNon1JIYegfLOwG9gvdWvsPK+b+373vC+6q0nRUW1uP2Mi/OTKbAv42Q
         75/k9aJiK0aAK3OfSt05jXixppnSOmmGsKutIiEd5KLWXz9PLnS4pfk7fjYknEes7GVr
         VdW4/V9XeouNxI3TY/HELvJOLh2FLbd7GRFBT3ip8CS3VvIrGZicet7BJa/YEyEsjdPL
         qjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=axXdNYI8P7fcgsZxQpUhrRij1OkOPLBrxua8Qhy3eLw=;
        b=K9FrAVObLryreYO6m/oLsDULvvCDYoa+aVP2SjPJf+CTes2cXCTTxJVspHQVNtEg/k
         KGiBxTsthIl/AZXXUkJvgzGmfKedeWqe2pnmRmYZhw/gB63ndM5hLB8acc74dQm1ej1V
         xVHklU4HEDsFcA94Knxmew5SVsLMJLhUYJyYaSEqcYjnEo40nhIjn+yOi0kULQx+zSmi
         cuAUI+GTsyuyOATHwrNA7tAELxt//VuK4S8smxC5TWW4sczZmzU29rxn8+ZQ0AZSWYbz
         IdXr6NdgEUfl2s0QIhEs5/pCDyWSnyupy4f+pz9sycWzQKLKSRHXkEpsHcy9AR6Gjnnv
         /HBg==
X-Gm-Message-State: AGi0PuaBOoZmOW31ElgkQFAUIxBjpgcfSemvCZuqOqGDxmHfV/MtjVxS
        EhZnwueG0VHnMT29ZhXxGo4NbpDV
X-Google-Smtp-Source: APiQypIE81U5du+v+R7KFRY55XpJylnWzIN0VolI+ugHrPtsMAUHAgTK0KjImAal98DLTvW0E3vefQ==
X-Received: by 2002:ac2:4853:: with SMTP id 19mr3175195lfy.171.1587156672077;
        Fri, 17 Apr 2020 13:51:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h14sm19415139lfm.60.2020.04.17.13.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 13:51:11 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
 <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
 <20200417203435.GL5861@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <23afcbc1-729c-c125-4d94-508c8edc57c9@gmail.com>
Date:   Fri, 17 Apr 2020 23:51:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417203435.GL5861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.04.2020 23:34, Laurent Pinchart пишет:
> On Fri, Apr 17, 2020 at 11:11:06PM +0300, Dmitry Osipenko wrote:
>> 17.04.2020 22:24, Laurent Pinchart пишет:
>> ...
>>> As I tried to explain before, if you wrap the panel in a bridge with
>>> drm_panel_bridge_add() (or the devm_ variant), you will always have a
>>> bridge associated with the output, and will be able to remove your
>>> custom connector implementation. I thus recommend converting to
>>> drm_panel_bridge_add() either as part of this patch series, or just
>>> after it, to get full benefits.
>>>
>>> With the assumption that this will be handled,
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thanks you very much!
>>
>> Yes, I got yours point about wrapping panel into the bridge. But I don't
>> think that it's worth the effort right now because each Tegra output has
>> it's own implantation of the connector and it should be cleaner not to
>> touch that code.
>>
>> Secondly, I don't have hardware to test all available panel output types
>> on Tegra and the benefits of messing with all that code are a bit dim to me.
>>
>> I can make a patch to wrap the RGB panel into a bridge, but this should
>> make code a bit inconsistent in regards to not having a common code path
>> for the "legacy" nvidia,panel. So perhaps it's better to leave it all
>> as-is for now.
> 
> I had a brief look at the code, converting the different output types
> one by one would be a better way forward than not doing anything at all
> in my opinion :-) Once you convert the first output it will also serve
> as an example on how to do it, and hopefully other developers with
> access to hardware could then do more conversions.
> 

Thierry, would you want to have RGB panel converted into a bridge? If
yes, I'll make a v5 with that change.
