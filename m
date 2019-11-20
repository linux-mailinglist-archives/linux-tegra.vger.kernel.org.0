Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5146710342F
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Nov 2019 07:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfKTGLZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 Nov 2019 01:11:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53020 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726044AbfKTGLZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Nov 2019 01:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574230283;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MHQgPT52W5BFw9nmU9WAz3e2f1ymk2wUifEnHSUCrRo=;
        b=cqJthc/cAZvlw4A+hnUZ/B5dBP/LPyCeWgW3CGr2rQ32cVRzEQD9bRll2bGlZ3Is6gat5A
        300lL10vSRyjg/JzaTqKokrR5UMqQfOBjr/bUTpUPMahA2/mBadolwWfur/z9kwu1DMA7d
        E8ljE3IIYJSPyT792M4dyrtWcdfdz0A=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-j1jKTiahPlOe4bgYQusOtg-1; Wed, 20 Nov 2019 01:11:22 -0500
Received: by mail-ot1-f72.google.com with SMTP id m15so13389109otq.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Nov 2019 22:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpJGfZx3Cj0lDz0Nl34BnLGPHmNtsdaIhy7QBlSYdNA=;
        b=JlIkNaEOz7Y7f/KN2tBu7aIHWYqrUDsCg9E7drOEdXF/WIwowV+GB4Dnhh++7ZEib+
         T40Ka7QGcnUHKjYb85KLCj1W/Nq3lxqzGBJAKAVvIpXz7bknkOw3Mk53HVhQxEIue81V
         BbcDlE1LEif6ximzibabJ5XJkODBcxcw12RkqA7u15LVbpnAMS9po4pNhZXyc/pEU4mj
         69a1PiudhvJheooUZ/ecqkbpwmrfu7b9/h2nLOh3bLpH+c/EiHbzJHBQedXgsE4B13PJ
         m1pV/fbYx/s1DgGKWl4cZLJGr9hNIk5xvEP5R8qazWMIamdrWoMedezEau8aD2Ht/7HU
         ZT9A==
X-Gm-Message-State: APjAAAWVt0nvAbGuD2wXlIpo0u5DgeE1+vhfvpD/V1fnDaABqxSLZuBI
        xzRtAYe4sJGY6PTx5xU6nyR4lw5gth35zwqFJ/9tCagGezJya7Mp8AgPLJF/fzgdSvlUXwBVu8d
        XKrkyeRf5v/FwLDIC5+a0tGUMY4AiNTg1Cl6YiR4=
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325399oib.152.1574230281886;
        Tue, 19 Nov 2019 22:11:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq+wH+KgxAVK0czEL+ebk7GljLn6+LLUP630iCkchv5lxYAyJQL9dIazj41yNNSbugAaDCvWwJ12nCjy+zSd0=
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325389oib.152.1574230281642;
 Tue, 19 Nov 2019 22:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20191102175637.3065-1-thierry.reding@gmail.com> <20191118134449.GG2246533@ulmo>
In-Reply-To: <20191118134449.GG2246533@ulmo>
From:   Ben Skeggs <bskeggs@redhat.com>
Date:   Wed, 20 Nov 2019 16:11:10 +1000
Message-ID: <CABDvA==b3g0S1i1xG_Ycjs15LbGUAgKmrLm6pqf+QFdv_qQk9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>,
        nouveau <nouveau@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org
X-MC-Unique: j1jKTiahPlOe4bgYQusOtg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 18, 2019 at 11:45 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Sat, Nov 02, 2019 at 06:56:28PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hi Ben,
> >
> > here's a revised subset of the patches I had sent out a couple of weeks
> > ago. I've reworked the BAR2 accesses in the way that you had suggested,
> > which at least for GP10B turned out to be fairly trivial to do. I have
> > not looked in detail at this for GV11B yet, but a cursory look showed
> > that BAR2 is accessed in more places, so the equivalent for GV11B might
> > be a bit more involved.
> >
> > Other than that, not a lot has changed since then. I've added a couple
> > of precursory patches to add IOMMU helper dummies for the case where
> > IOMMU is disabled (as suggested by Ben Dooks).
> >
> > Joerg, it'd be great if you could give an Acked-by on those two patches
> > so that Ben can pick them both up into the Nouveau tree. Alternatively =
I
> > can put them both into a stable branch and send a pull request to both
> > of you. Or yet another alternative would be for Joerg to apply them now
> > and Ben to wait for v5.5-rc1 until he picks up the rest. All of those
> > work for me.
>
> Hi Joerg, Ben,
>
> do you guys have any further comments on this series? I've got an
> updated patch to silence the warning that the kbuild robot flagged, so
> if there are no other comments I can send a final v3 of the series.
I'm on leave at the moment.  But the nouveau fixes look fine to me and
I'm happy to pick them up once you send a v3, and allow Jeorg to apply
the rest through his tree.

Thanks,
Ben.

>
> Thierry

