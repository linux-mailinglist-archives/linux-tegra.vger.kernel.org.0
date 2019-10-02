Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2B7C926B
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 21:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfJBTe0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 15:34:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46654 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBTe0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 15:34:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so13561882lfc.13
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p8uHkNQrb6y7ng1u8Gvwe97h6kwRzjGMg/3GVF8QbMs=;
        b=LaYWdI2mPq8pow1oYEuFnc3FxVdqmTneS6126N1koPZ9IIiLR4I8THhJXoLNWp67Zx
         TPLAkKTd+GWmryp4zGr/yLDuvQl4Qle/a7SL8oxd0A90eMiJ46Ti7JPOP38jl4ptZ56C
         ACSfE4ATO+nPRMhDkgtEFa7MKuzlmtwtBpnHT6nZ+u+2Z+/RFP/Ps7Zl4uQtAJqmveN8
         4YZ/IMr5lz3UU3a+MQMvz5RDjA15KOTj1smpnjKMx4WBCBZLlRKnVheN4TqoXgeszr0k
         YseJkxulOZ57vIsgcPT3VAbecTlh3LeZ1qFAZkvP/MM8N92hW9ifEO+iHF52d3pY6883
         2NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p8uHkNQrb6y7ng1u8Gvwe97h6kwRzjGMg/3GVF8QbMs=;
        b=jCXnXYN8yb78aK4JpuwgGAq38bRYjMZqchRUY6JsKS6NTBdkfA+GNz8NUkGFuwdFC/
         4F5qu9LOD91ah78AyFrTsILddjBIgLDvgUpGNRdGrg3Y5KEK6bf3aOMKsPRLIDfDwoL3
         w32ZJcvbhTyclqFOM8WddzPAdcTPDRKx7Fz+SYQg+mtXaikPR/VsxHWPLDXmbvshDK00
         v3P536PJu8bfflD7GVuzcb+t8EcHwkEdYzToUmj5J3WezHOk1nAN8mCYRHTTqC1pwSYb
         ditUuyM/TmuqBIPupBzHub3/1BlrYVa+vCzw6U+bz49jN9jUUk65JUP3uL/5lAoprEEA
         znPQ==
X-Gm-Message-State: APjAAAXv8G51mx756YBWFgJmvtBDUfKzw5Ot3zDlHzD/1dHmgl3FOEi9
        7hQkrefgsYGhy2QJJRKiMQV8XrfI
X-Google-Smtp-Source: APXvYqw/bFy8SLfnHsYgKJbRODebKea0DGnVvIbUTD/pHQ30A6VWIAuMFGCFDm+xlOhzPqgB4hj6Dw==
X-Received: by 2002:ac2:44b9:: with SMTP id c25mr3509473lfm.112.1570044863388;
        Wed, 02 Oct 2019 12:34:23 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id h5sm74985ljf.83.2019.10.02.12.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2019 12:34:22 -0700 (PDT)
Subject: Re: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
To:     Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-6-pgwipeout@gmail.com> <20191002113543.GO3716706@ulmo>
 <CAMdYzYoh9E+BuA_WY+eN3rL9KrBXD3p_otNL-=pYzpxAAWw=4w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9faafaf7-16fd-4989-5614-1bedd9681fdc@gmail.com>
Date:   Wed, 2 Oct 2019 22:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYoh9E+BuA_WY+eN3rL9KrBXD3p_otNL-=pYzpxAAWw=4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2019 15:15, Peter Geis пишет:
> On Wed, Oct 2, 2019 at 7:35 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Tue, Oct 01, 2019 at 09:41:53PM -0400, Peter Geis wrote:
>>> Add the functions to the chipidea host driver to enable tegra specific
>>> dma alignment and reset handlers.
>>>
>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> ---
>>>  drivers/usb/chipidea/ci_hdrc_tegra.c |  7 +++++++
>>>  drivers/usb/chipidea/host.c          | 13 +++++++++++++
>>>  2 files changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>> index 29415c3a2f48..2f7d542d2273 100644
>>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>> @@ -118,6 +118,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
>>>       udc->data.usb_phy = udc->phy;
>>>       udc->data.capoffset = DEF_CAPOFFSET;
>>>
>>> +     /* check the double reset flag */
>>> +     if (of_property_read_bool(pdev->dev.of_node,
>>> +                             "nvidia,needs-double-reset")) {
>>> +             dev_dbg(&pdev->dev, "setting double reset flag\n");
>>> +             udc->data.flags |= CI_HDRC_TEGRA_DOUBLE_RESET;
>>> +     }
>>
>> Like I said, I think it'd be better to put this into the same patch that
>> adds the flag.
>>
>>> +
>>>       udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
>>>                                     pdev->num_resources, &udc->data);
>>>       if (IS_ERR(udc->dev)) {
>>> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
>>> index b45ceb91c735..e95b7cb8c54d 100644
>>> --- a/drivers/usb/chipidea/host.c
>>> +++ b/drivers/usb/chipidea/host.c
>>> @@ -20,6 +20,7 @@
>>>  #include "ci.h"
>>>  #include "bits.h"
>>>  #include "host.h"
>>> +#include "tegra.h"
>>>
>>>  static struct hc_driver __read_mostly ci_ehci_hc_driver;
>>>  static int (*orig_bus_suspend)(struct usb_hcd *hcd);
>>> @@ -275,6 +276,13 @@ static int ci_ehci_hub_control(
>>>               goto done;
>>>       }
>>>
>>> +     /* For Tegra USB1 port we need to issue Port Reset twice internally */
>>> +     if (ci->platdata->flags & CI_HDRC_TEGRA_DOUBLE_RESET &&
>>> +     (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET)) {
>>> +             spin_unlock_irqrestore(&ehci->lock, flags);
>>> +             return tegra_ehci_internal_port_reset(ehci, status_reg);
>>> +     }
>>> +
>>>       /*
>>>        * After resume has finished, it needs do some post resume
>>>        * operation for some SoCs.
>>> @@ -364,6 +372,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
>>>       rdrv->name      = "host";
>>>       ci->roles[CI_ROLE_HOST] = rdrv;
>>>
>>> +     if (ci->platdata->flags & CI_HDRC_TEGRA_HOST) {
>>> +             ci_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
>>> +             ci_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
>>> +     }
>>
>> Same here.
>>
>> That said, there are a few other bits in ehci-tegra.c that we may need.
>> For example, the tegra_ehci_reset() function sets different values for
>> the TX FIFO threshold, which we don't do for ChipIdea as far as I can
>> tell. We also differentiate between Tegra20 and later generations with
>> respect to whether or not they have the HOSTPC registers.
>>
>> tegra_ehci_hub_control() also seems to have a number of other work-
>> arounds that are not yet ported as part of this series. And then there
>> is the matter of tegra_reset_usb_controller(). I recall that this has
>> caused severe headaches in the past, so we need to be very careful when
>> changing to the ChipIdea driver that we don't reintroduce old bugs
>> again.
>>
>> Thierry
> 
> I saw the patch around Tegra20's FIFO pipeline, I have a Tegra20
> device to test on so I'll look if that's still necessary.
> The tegra_ehci driver appeared to implement only what was necessary to
> make the controller work, as there's a lot of overlap with the
> chipidea driver.
> Since the tegra-udc driver worked with very little code, I figured the
> chipidea driver handled most everything correctly already.
> 
> As such I looked mostly at the workarounds that were tegra specific.
> 
> This is also why I requested multiple eyes, as I don't have the
> benefit of historical context beyond the commit messages.

Ha! Host port works on my Tegra20 using CI driver and this series! At least mouse,
keyboard and WiFi dongle are working fine. Well done, looking forward to v2 :) We are
getting closer to fold tegra-ehci and move to the CI driver uniformly.
