Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AD81AD2CA
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 00:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbgDPWXC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 18:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728842AbgDPWXB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 18:23:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61003C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 15:23:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r17so127768lff.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 15:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4xY56Og7CtQVBrHOGKhkCb7oz9KM5IaKu7x+R3qPWt4=;
        b=SOHaXPX5VjkytmczvkPZvJNsViulqzWRt9GQZBqZcqNm3RUEX9oNOcywbg3Vm1VqkO
         qi+G3I5U06Ps8JxIEVDUDN49A+m/tgeF49zNtGBOvUAuLw/8DALMzj/dWbUJV2F3PlrW
         6seuE77SOUzgUi105x/F12Apw+agK+TLX1tBfpd8uiU2ex5Z7FlHGn+ArwXjHBQJLXSo
         +oqz1a5aLyTP03PzRIHG5Ykm2dGM2H5be9onaQaO8S371DiTdWPDBvA2KQE9dtk21NWz
         d2f7kTyiM9ODfKTfv22vgJRsNYNlcdDZSMN0nu2zaFbEYK3I2RrkK0UGxJoWWW1fvIAu
         lLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4xY56Og7CtQVBrHOGKhkCb7oz9KM5IaKu7x+R3qPWt4=;
        b=PZ5XjSkY+LANtuxHddeudhvcbMaxjsbLh3kVsv8K87e4JKnvWYr/KM/rJ0lYZrz9AL
         jdc0G8l8WkShxHJtiy7lkqoJfE5Yah4yw9sCyw2mIlKD4IaB2UQda2Haqhg4QSA/Yo/T
         u/sgwecFFBFkgyUmAyXGyS8KK6Pold4PCRxPiOZ/AstpqebfXrBjZp6CHU/YGE4+/GSS
         VeZBh/LJ41fS7SsEhSuWFDbLlY90OKWqtfwBlUV0ev318K5UzXaTWYB8Zkbv5UjgbQoL
         tqjUPiLJpupphBOgjJq87psuqufGIY+apYyH03vq+8Dt+9k+9hTPZ91o/M9vhAfKlT+U
         W5BA==
X-Gm-Message-State: AGi0PuZ00NnpvhdVYqC2OhnukuVe3BTH306UZr5kan8UU1chJNMxHauz
        s/yQGXcvVQ26wPEfBQzl7aGA1m/l
X-Google-Smtp-Source: APiQypKatJQozjLGbQ9+PS5rsH8YeHUguNUxb1chBgXi9ILl6zhND+1TjO2awm/Xst3u/m+wYqO1iQ==
X-Received: by 2002:a19:ae06:: with SMTP id f6mr30773lfc.97.1587075779508;
        Thu, 16 Apr 2020 15:22:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l7sm17170684lfg.79.2020.04.16.15.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 15:22:58 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
 <20200416205012.GA28162@pendragon.ideasonboard.com>
 <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
 <20200416213919.GB28162@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <481f003b-78d2-51b4-ce7a-b917abea8ac7@gmail.com>
Date:   Fri, 17 Apr 2020 01:22:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416213919.GB28162@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.04.2020 00:39, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> On Fri, Apr 17, 2020 at 12:15:33AM +0300, Dmitry Osipenko wrote:
>> 16.04.2020 23:50, Laurent Pinchart пишет:
>>> On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
>>>> 16.04.2020 21:52, Dmitry Osipenko пишет:
>>>> ...
>>>>>> May I also recommend switching to the DRM panel bridge helper ? It will
>>>>>> simplify the code.
>>>>>
>>>>> Could you please clarify what is the "DRM panel bridge helper"?
>>>>>
>>>>> I think we won't need any additional helpers after switching to the
>>>>> bridge connector helper, no?
>>>>
>>>> Actually, I now see that the panel needs to be manually attached to the
>>>> connector.
>>>
>>> The DRM panel bridge helper creates a bridge from a panel (with
>>> devm_drm_panel_bridge_add()). You can then attach that bridge to the
>>> chain, like any other bridge, and the enable/disable operations will be
>>> called automatically without any need to call the panel enable/disable
>>> manually as done currently.
>>>
>>>> Still it's not apparent to me how to get panel out of the bridge. It
>>>> looks like there is no such "panel helper" for the bridge API or I just
>>>> can't find it.
>>>
>>> You don't need to get a panel out of the bridge. You should get the
>>> bridge as done today,
>>
>> You mean "get the panel", correct?
> 
> Yes, sorry.
> 
>>> and wrap it in a bridge with
>>> devm_drm_panel_bridge_add().
>>>
>>
>> The lvds-codec already wraps panel into the bridge using
>> devm_drm_panel_bridge_add() and chains it for us, please see
>> lvds_codec_probe() / lvds_codec_attach().
>>
>> Does it mean that lvds-codec is not supporting the new model?
> 
> No, that *is* the new model :-) As I think I've commented during review,
> when you have an LVDS encoder and a panel, you don't need to handle the
> panel at all. When you have an RGB panel connected directly to the RGB
> output, you need to wrap it in a bridge, exactly the same way as
> lvds-codec does for its panel.
> 
>> Everything works nicely using the old model, where bridge creates
>> connector and attaches panel to it for us.
>>
>> [I'm still not sure what is the point to use the new model in a case of
>> a simple chain of bridges]
>>
>> Using the new model, the connector isn't created by the bridge, so I
>> need to duplicate that creation effort in the driver. Once the bridge
>> connector is manually created, I need to attach panel to this connector,
>> but panel is reachable only via the remote bridge (which wraps the panel).
>>
>> driver connector -> LVDS bridge -> panel bridge -> panel
> 
> With the new model,
> 
> 1. The display driver and the bridge drivers need to get hold of the
>    bridge directly connected to their output (for instance with
>    of_drm_find_panel()). If the output is connected to a panel, they
>    need to wrap that panel in a bridge (with
>    devm_drm_panel_bridge_add()). I plan, in the future, to make creation
>    of panel bridges automatic, so drivers won't have to care.
> 
> 2. The display driver needs to create a dummy drm_encoder for each of
>    its outputs (for instance with drm_simple_encoder_init()).
> 
> 3. The display driver needs to create a drm_connector for each of its
>    outputs, and implement connector operations by delegating them to the
>    bridges in the pipeline. Unless there's a good reason not to do so,
>    this should be done with drm_bridge_connector_init().
> 
> That's it. Every driver then focusses on its own needs, bridge drivers
> handle only the device they're associated with, and the DRM core and DRM
> bridge connector helper will handle all the rest.
> 

Thank you very much for the clarification again! :)

Now I realized what was the missing part.. in my case display panel is
mounted upside-down and display output needs to be rotated by 180°. I
have a local patch (hack) that adds orientation-property support to the
panel-lvds driver and previously the panel's orientation was assigned to
the connector using drm_panel_attach(), but now this attachment doesn't
happen and I found that panel_lvds_get_modes() missed
drm_connector_set_panel_orientation() in my patch. Everything is okay
once the panel_lvds_get_modes() is corrected. I'll prepare the v4.
