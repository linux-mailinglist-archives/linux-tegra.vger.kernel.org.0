Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F07D0EB9
	for <lists+linux-tegra@lfdr.de>; Wed,  9 Oct 2019 14:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbfJIMaI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 9 Oct 2019 08:30:08 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46355 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfJIMaI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Oct 2019 08:30:08 -0400
Received: by mail-qt1-f193.google.com with SMTP id u22so3045946qtq.13
        for <linux-tegra@vger.kernel.org>; Wed, 09 Oct 2019 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ptJPXDbOtB2j75VGw7EtHyP493Bs8EAI5F9gZzQPmG4=;
        b=byD6ZXJWChHRfsOPJkA6S8cB+E5MjO5XkGSC2ne+Ja25WKMIj0FuD7ebd0aaA0OTse
         Rp8VP7WCZKvSGs18WkHZPQRAhMK8QRFq8NbvnsGrrduHBIVGeFnTvHXnKADH2Vf7lw6+
         EYuHOVmlCGRr71sxEJXBChzyPR3cGJF10KWvwe+IORW0TkmMaOhfD7I63vZy3cQJYn/n
         e5zfhNZhNA6pQA84L3YUg2stdSDiHhxYLkm5QQfzsT1KBqZGvBin3Gsz/wvBCuBZQkyn
         A3cR+ohLFLld2ELj7gpuyiMeepghyjvPXc+qsBgIFOJU9EyWVw29rGNEHp4LhtkcJDXZ
         Ylag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ptJPXDbOtB2j75VGw7EtHyP493Bs8EAI5F9gZzQPmG4=;
        b=KDUviT+hFvYK5eG5dtsi5m+59XPGzyrVeKsez8jl/eOuNCVxpyrMzzoB/1LPslHAPM
         iTsHd5D7YbBJ/1Bqo8VEDOE4rhqlvYCX9WLJXKUovXDh3v21c3bt59FOHfgCPnG3nSIb
         yIu7ealCsEzspFS61KVA6qou9qYSbC7KWDJcufOUVEFhJTfRXJeI60X56vHIVcOWsCWS
         xtc9W322RZMEss/f5raJSK7W3fx9qECnx7gL87d20HIsRzDL+DDkI+I560KWBor8MxD2
         1oni9M1Vnl4vHkmg0UqYWdCH0tv74kkRL6KN7Hci0iEc7NQn75as5DSJaG0wvvPgeAQB
         wmnA==
X-Gm-Message-State: APjAAAVr3hD4c1Nph0Rig7w2JuiP2HCTA/ZH6kwGxyj5nstQUiCkMr/V
        zABJ/wmdF/2NzL/ZYhjSY8vw9n13go2k7ba3597rz8eD
X-Google-Smtp-Source: APXvYqz8CfUTnDVZNqNRkHECpHvKO4fwssBLQTIkG7NrssxRvEzJv0NuzixMzZVUMVjp1wY+66qdzoW0SfA0Gji7Q98=
X-Received: by 2002:ac8:5203:: with SMTP id r3mr3371813qtn.16.1570624207358;
 Wed, 09 Oct 2019 05:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014153.29831-1-pgwipeout@gmail.com> <20191008062523.GC5670@b29397-desktop>
 <b9f3e295-761a-ed40-75c5-5d8ad69b16a2@gmail.com>
In-Reply-To: <b9f3e295-761a-ed40-75c5-5d8ad69b16a2@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 9 Oct 2019 08:29:47 -0400
Message-ID: <CAMdYzYp7Jit47wcorzN_pGdC56WjtZJz09viL6ZHnnHdcyAHgA@mail.gmail.com>
Subject: Re: [RFC] [PATCH 0/5] enable tegra-udc host mode
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 9, 2019 at 5:16 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 08.10.2019 09:25, Peter Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 19-10-01 21:41:48, Peter Geis wrote:
> >> This patch set enables the tegra-udc driver to take the place of
> >> tegra-ehci as the usb host driver.
> >> It fixes up some checks in the tegra-udc driver.
> >> It pulls the tegra specific bits from the tegra-ehci driver.
> >>
> >> It would be better to have generic helpers in the dma core that can
> >> handle alignment, instead of using tegra specific helpers, but that is
> >> well above my skillset.
> >>
> >> I haven't checked OTG functionality, mostly because I don't have any
> >> devices with working OTG yet.
> >
> > I am not sure what the OTG mean here, the OTG Compliance (OTG FSM in
> > code) are almost dead, so you don't need to consider support it.
> > Usually, people considers dual-role switch as OTG.
>
> Yes, I assume we're talking about the dual-role switch.

Correct, unfortunately the devicetree bindings do not differentiate
between the two.
You have given me a few ideas to work around this though.
