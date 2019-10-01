Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528DBC3E2E
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 19:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfJARIH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 13:08:07 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:32909 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfJARIH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 13:08:07 -0400
Received: by mail-qk1-f174.google.com with SMTP id x134so11993278qkb.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cqJH+v7uzQVSa6NgSDrouKSll6kt3lw48cd3ZUWx22U=;
        b=i/TFqRYiCi6hZ3KC2v9NlkS2s0WvgzUTBdgGn2j16TLznZ7Z3VKH78KRfLSnXbfJsp
         1jCVH1IhWgwzR5SfcLeiQ3EkwC6WsfY/JnHkUL97N0qSrloSfXl7DXb/thW89/oo0EeQ
         84d5SDODRE54wHt9TOBiNX/9J6govDfQVfxGrQHAANNs6HD9W8vfRgKm7DiikXwpgZZP
         2aEIYqydeYyMyaW9Hbf0w4rwwCK0v9QGc5Quw7Y3jK5wZRIZ8mfBOwvfRpMpqDSKwIdU
         Vk2on9+VDyzKofoeYj//q2jau2l4OPN+EDdGSgjzXEXFqJxzrXdMR0ondogia/XGGqcL
         yu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cqJH+v7uzQVSa6NgSDrouKSll6kt3lw48cd3ZUWx22U=;
        b=PV5kWMH3Ur2rDLIB4Y5uZNBVrUrGp7xvOitViVY53zsrC7Wp8yg8pIkjr3tRcXf9Bs
         hq31qDbHrjo5XWYDZF7vjKxmY9WxNLff0l966q93/NMcNGhmFyYhc/ONfsSNQ94uoSYy
         aANmMRNhYbqBLjTMc5v2XfNw2JjE5AOkc8YDAb6NB3+tPZxIwymDNSry8DqbpNHow4Y7
         q72GlWwNNckq7TGS8/fHPn1M2VopZyMIHDQdoWQ7P1lxZ9S9pViQyR8lbcN5S5IUyscp
         lq9A+zcf/YV9o7JJJs/5BrqMuR79XzyX7tRL5Jz8BZiHLMXmq7xtplP/HavfUuDETeCy
         sI4Q==
X-Gm-Message-State: APjAAAXtWfGsdDshIULhZtXQTZ/BkwWqQQveTsNQMhFdaYouEkjAz37Y
        XGxeMpEemWuqH1BKO1OGjnzpRfsCHcHHfp4PTLQ=
X-Google-Smtp-Source: APXvYqzMFRzD8XDUpfSuyyriT3W9X3PZSmHRMBOXjVhDheFHpNZ9Z6e78yq+wS+3sUHJwTO66Gmc5NCj+JMPvwdOsGU=
X-Received: by 2002:a37:515:: with SMTP id 21mr7161010qkf.87.1569949686267;
 Tue, 01 Oct 2019 10:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com> <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com> <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com> <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
 <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com> <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
 <CAMdYzYr7irO-qLKws2cFZm6y1iuBj7RQRmUA4Zzx7vO-QoEKVw@mail.gmail.com> <980e7e6e-97e4-4b44-f273-677cbd777cf7@gmail.com>
In-Reply-To: <980e7e6e-97e4-4b44-f273-677cbd777cf7@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Tue, 1 Oct 2019 13:07:54 -0400
Message-ID: <CAMdYzYptUQHcTRjxj0SC5M13E2jTPUcZnnq7GC9sCTcUyHqxrQ@mail.gmail.com>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 1, 2019 at 12:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.10.2019 15:49, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Sep 30, 2019 at 5:27 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> 30.09.2019 23:55, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 30.09.2019 23:05, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> Good Afternoon,
> >>>>
> >>>> I have prepped the patch for the tegra-udc driver to fail out in hos=
t
> >>>> mode and load as a peripheral in otg mode.
> >>
> >> Just to be clear, this part is good to me. Although, doesn't CI driver
> >> operates by default in a peripheral mode when drm_mode=3Dotg?
> >>
> > The code sets OTG mode in the case of mode is unknown.
> > Based off the code path and behavior on my devices, I'm pretty sure it
> > defaults to host unless something intervenes in the process, such as
> > extcon.
>
> Okay! It definitely defaults to the peripheral mode in my case, sounds
> like sensing is working for the OTG mode in yours case.

>
> > I'll see if I can get host mode working, as I'd really like to see
> > your Tegra30 cpufreq drivers land.
> >
>
> Please let us know if you'll have any progress, I'll also try to look at
> it sometime soon.

I got host mode working, it's the same issue with dma alignment that
was killing gadget mode.
I did it by literally ripping the dma alignment code out of the
tegra-ehci driver and it's hideous right now.
Need to figure out a better way to accomplish that.

>
> It will be very nice if all of the pending patches could get into next
> release. You could also help with that by testing the patches, usually
> it helps to get some more attention from maintainers.

I'm currently testing the cpuidle driver on both the Xoom and the
Ouya, but I haven't seen the cpufreq drivers recently.
Any other patch sets you'd like tested?
