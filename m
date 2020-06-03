Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321ED1ED517
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 19:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgFCRiO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 13:38:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60847 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726159AbgFCRiN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 13:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591205891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g4JdSAXlLTFOykR3a704n7KRgSRjVj4aOucsElPOq3c=;
        b=FpOBrKgkftREUgd0U/XK7F3/pFaJqwqdIuzEafs9OdKSSsmxFoAIhdAiYFG+5YH8JhKD+y
        Ks1Oe2ORN4jD0eb1CCzqOtlbVlJh6HrBVRtnL81cij+yh2BlnD5JMVq2zoHSSs5UDByUse
        1/zp5qJAv2brF7bES8GakpV9lqSdTKo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-FnFnlmSgML250BoiYfAL8A-1; Wed, 03 Jun 2020 13:38:09 -0400
X-MC-Unique: FnFnlmSgML250BoiYfAL8A-1
Received: by mail-wm1-f72.google.com with SMTP id 18so1022741wmu.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2020 10:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g4JdSAXlLTFOykR3a704n7KRgSRjVj4aOucsElPOq3c=;
        b=iJ6JIrFeweTfFYxIgSWQBpPzq5mc3tnSJcOzam+LxYZxTdDTRMLkw88TFkbiulr+jw
         DAnZtuxSGnScxxYj+FATydUxB5A1q9NVYS86qsMGvZQW7pglWPNIt2CqV6oxy+RArU+h
         dtfMmxCmDyQqqa54sbPTuPF9hQM1CNAsQ88MiveT8h+RQWhqBaIy0VlK2sNEPEnyhGm6
         Q6/0LvXaLAxApNFei3738Lx2WQFZDjj0zwiOIx+0+fIXH+Djg05CCx6MhckmHti8/Pdj
         +g/kSIgVhYwnHuLF0TD8ignnmy/PLThK57q/HkVdyjrPm7oUmcNEXt2xcpbQMmPSzvs3
         j44w==
X-Gm-Message-State: AOAM530yReAfQedGRnCUogIHtQx9OPHcWk8lFmHdZRvfBqoPrPEX6gLV
        4AOFz8ApZPApsa7TOondljFZZ64RwmaRaKesnOObo4V8/Cjhm402ltTWC49MS9qPGkP5uipzdaN
        Ia0C7+wRzhgNO9MNB+sEtYqs=
X-Received: by 2002:a7b:c385:: with SMTP id s5mr261300wmj.121.1591205885429;
        Wed, 03 Jun 2020 10:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLjq4IDRdqkukHBckHKOOOLiGmG+r2akHBeeZCOhLw2fV6SQWj3VXyhtQLJX0YNKizL01l8A==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr261254wmj.121.1591205885130;
        Wed, 03 Jun 2020 10:38:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f11sm4390115wrj.2.2020.06.03.10.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 10:38:04 -0700 (PDT)
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Barry Song <baohua@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nick Dyer <nick@shmanahar.org>,
        Ferruh Yigit <fery@cypress.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        kernel@collabora.com, Peter Hutterer <peter.hutterer@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
 <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
 <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
 <f674ba4f-bd83-0877-c730-5dc6ea09ae4b@redhat.com>
 <2d224833-3a7e-bc7c-af15-1f803f466697@collabora.com>
 <aa2ce2ab-e5bc-9cb4-8b53-c1ef9348b646@redhat.com>
 <20200527063430.GJ89269@dtor-ws>
 <88f939cd-1518-d516-59f2-8f627a6a70d2@collabora.com>
 <20200602175241.GO89269@dtor-ws>
 <82e9f2ab-a16e-51ee-1413-bedf0122026a@collabora.com>
 <8f97d2e1-497a-495d-bc82-f46dbeba440c@redhat.com>
 <fb5bee72-6a75-88aa-8157-75f07c491eeb@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <681abc14-ef0f-ff15-68ed-944b2f96bdaf@redhat.com>
Date:   Wed, 3 Jun 2020 19:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fb5bee72-6a75-88aa-8157-75f07c491eeb@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 6/3/20 3:07 PM, Andrzej Pietrasiewicz wrote:
> Hi Hans, hi Dmitry,

<snip>

> I'm taking one step back and looking at the ->open() and ->close()
> driver callbacks. They are called from input_open_device() and
> input_close_device(), respectively:
> 
> input_open_device():
> "This function should be called by input handlers when they
> want to start receive events from given input device."
> 
> ->open() callback:
> "this method is called when the very first user calls
> input_open_device(). The driver must prepare the device to start
> generating events (start polling thread, request an IRQ, submit
> URB, etc.)"
> 
> input_close_device():
> "This function should be called by input handlers when they
> want to stop receive events from given input device."
> 
> ->close() callback:
> "this method is called when the very last user calls
> input_close_device()"
> 
> It seems to me that the callback names do not reflect their
> purpose: their meaning is not to "open" or to "close" but to
> give drivers a chance to control when they start or stop
> providing events to the input core.
> 
> What would you say about changing the callbacks' names?
> I'd envsion: ->provide_events() instead of ->open() and
> ->stop_events() instead of ->close(). Of course drivers can
> exploit the fact of knowing that nobody wants any events
> from them and do whatever they consider appropriate, for
> example go into a low power mode - but the latter is beyond
> the scope of the input subsystem and is driver-specific.

I don't have much of an opinion on changing the names,
to me open/close have always means start/stop receiving
events. This follows the everything is a file philosophy,
e.g. you can also not really "open" a serial port,
yet opening /dev/ttyS0 will activate the receive IRQ
of the UART, etc. So maybe we just need to make the
docs clearer rather then do the rename?  Doing the
rename is certainly going to cause a lot of churn.

Anyways as said, I don't have much of an opinion,
so I'll leave commenting (more) on this to Dmitry.

> With such a naming change in mind let's consider inhibiting.
> We want to be able to control when to disregard events from
> a given device. It makes sense to do it at device level, otherwise
> such an operation would have to be invoked in all associated
> handlers (those that have an open handle associating them with
> the device in question). But of course we can do better than
> merely ignoring the events received: we can tell the drivers
> that we don't want any events from them, and later, at uninhibit
> time, tell them to start providing the events again. Conceptually,
> the two operations (provide or don't provide envents) are exactly
> the same thing we want to be happening at input_open_device() and
> input_close_device() time. To me, changing the names of
> ->open() and ->close() exposes this fact very well.
> 
> Consequently, ->inhibit() and ->uninhibit() won't be needed,
> and drivers which already implement ->provide_events() (formerly
> ->open()) and ->stop_events() (formerly ->close()) will receive
> full inhibit/uninhibit support for free (subject to how well they
> implement ->provide_events()/->stop_events()). Unless we can come
> up with what the drivers might be doing on top of ->stop_events()
> and ->provide_events() when inhibiting/uninhibiting, but it seems
> to me we can't. Can we?

Right. I'm happy that you've come to see that both on open/close
and on inhibit/uninhibit we want to "start receiving events" and
"stop receiving events", so that we only need one set of callbacks.

> Optionally ->close() (only the callback, not input_close_device())
> can be made return a value, just as Hans suggests. The value
> can be ignored in input_close_device() but used in input_inhibit().
> No strong opinion here, though. (btw it seems to me that
> input_inhibit() should be renamed to input_inhibit_device()).

Ack.

Regards,

Hans

