Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B52DC237C
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 16:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731190AbfI3Oix (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 10:38:53 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39769 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfI3Oix (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 10:38:53 -0400
Received: by mail-lf1-f68.google.com with SMTP id 72so7224167lfh.6
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uhHrjx9junMUq7y6J3IOW1duaw0jqeUR6DZNg+Qrffc=;
        b=j0LdItw68ehBIg/Qnd2zHAgWCfxfsP3g3MshtoM+9O6Envwi+R+xTTZel7MWCMrFIp
         aR6GsrEbJmcMLaPmghMRnv6Mejg4Yq+aVTHK8ZsfP3hkZoLBYs2u9P3UiSGMAcLyrszJ
         l5A94h8oq6zFUQQUp15n6IOMqNwg7fln1RGB/rSpb19mQImEtSgNYWqzXTsIALmzmboU
         vkANDf2a+EbxwB7x/cOClM+xgbdIFou6BS9lVbXO+CQSyw6rDeQtQZ8e98OxQU1gu9Ir
         S8nuxY/NrwDASfvGAfO3amKnTLs4rZEpjOBh5LHSw2kxzrg2ceDO781KeIcLaC9F56s5
         tazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uhHrjx9junMUq7y6J3IOW1duaw0jqeUR6DZNg+Qrffc=;
        b=k3BdvsI3v/udjploRC2TeiDJ8j6JDfhnmypZG/aw7SJqr3jQN1CTm8dGRW/1YH9qIf
         K6gDIE4Yl9+RhXYsf0zBsEVVkHIFh3dWBikq/Ar89pjMmYICAF+Alj0FIZRAToq07zw6
         FogXX9aCgqKEtP4ib5lrWCBE1YDN7O5eB6GMIeXhkvwhYAhAVKeylNskl2CJf6QzLInz
         5l+/7IVXCtOUMKOsNuU4eXYXw4S1zhHF4IesXRAxDqYQz2+VjlzbaX5XwZDa8SgG7jC5
         SlSLz2Eic1pSw34q+gdwBPzL+v4ZLRLE/3NojU7cp/8yo+94HfvUt3Y0ubFirA67yEu0
         v+jg==
X-Gm-Message-State: APjAAAXuJUdmIThItn8vnC4cTf26K0FRix+uivi0gYoTeFN3EBdyz4Ey
        PjA2Ye+VZxTjfjhjJJDLokTTXY/v
X-Google-Smtp-Source: APXvYqxxZZeroTccZr1LIJRdmHMjRI44cTKx2BUZC5+UjRzC6ZsHjOmjeWLv6+D53ysig9luoLLnWQ==
X-Received: by 2002:a19:6748:: with SMTP id e8mr11960312lfj.136.1569854331096;
        Mon, 30 Sep 2019 07:38:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id t10sm3495553ljt.68.2019.09.30.07.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 07:38:50 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Geis <pgwipeout@gmail.com>, Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3588c90-b0c9-5881-bd99-b27eaefdf894@gmail.com>
Date:   Mon, 30 Sep 2019 17:38:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2019 01:15, Peter Geis пишет:
> Good Afternoon,
> 
> So I have dug a bit further into it.
> The tegra-udc driver defaults to host mode when set to otg.
> If the tegra-udc driver is in host mode while plugged into another
> host, the kernel will hard lock.
> If the tegra-udc driver is in host mode with a device attached the
> device enumerates correctly.
> In this state, if you change the state to gadget, the driver goes into
> a broken state.
> The gadget side is in gadget mode, but the host does not enumerate the device.
> 
> As it stands the code path for the tegra-udc driver is broken in OTG mode.
> Without proper extcon support we can't support dynamic switching
> correctly anyways.
> My hack around method of retaining the phy in peripheral mode and
> switching drivers to change modes only works because both code paths
> are incomplete as well, and should not be relied upon.
> 
> I think for the time being, the tegra-udc driver should check for
> host, peripheral, or otg mode.
> If it detects the device is set to otg mode, it should print an error
> message describing the current situation and fail out.
> 
> If I had a device to test against with an extcon capable port, I'd try
> some more experimenting with the chipidea drivers to see if I can get
> it to work.
> 
> What do you think?
> 
> Dmitry,
> Do you have any devices to experiment with this?

Hello Peter,

I had Nexus 7 v2013 that supported OTG (IIRC), unfortunately it broke
about a year ago. I also have Nexus 7 v2012, but it doesn't support OTG
(AFAIK). So no, I don't have hardware to test OTG.

> On Sat, Sep 28, 2019 at 11:36 PM Peter Chen <peter.chen@nxp.com> wrote:
>>
>>
>>>
>>> I've encountered an odd situation where the CI Dual Role driver hard locks the
>>> kernel on the Ouya (Tegra 3).
>>> I was attempting to set up manual mode switching in the kernel, as the Ouya lacks
>>> hardware support for the ID pin and no voltage output on that port.
>>> I found that the kernel was hard locking whenever I had the dr_mode = "otg" set in
>>> the devicetree.
>>
>> It seems Tegra doesn't support host mode using chipidea driver. The ci_hdrc_tegra.c
>> only supports device mode. Thierry, could you confirm that?
>>
>> Peter
>>
>>> No further output was seen on the console, and sysreq does not respond.
>>> It occurs both in module and builtin mode.
>>>
>>> I have however found a workaround.
>>> By setting the dual role usb device to:
>>> compatible = "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and setting the assigned
>>> phy to:
>>> dr_mode = "peripheral";
>>> I can achieve rudimentary live switching of roles.
>>> The device defaults to host mode, as the ehci driver enumerates first.
>>> By unbinding the tegra-ehci driver and binding the tegra-udc driver, I can switch to
>>> gadget mode.
>>> The reverse also works.
>>> The PHY driver does not appear to care if it is always in peripheral mode.
>>>
>>> Thank you for your time,
>>> Peter Geis

